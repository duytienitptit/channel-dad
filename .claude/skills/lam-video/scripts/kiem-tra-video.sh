#!/bin/bash
# Kiểm tra nhanh một video: thông số, các đoạn im lặng, ảnh lưới khung hình (1 khung/giây).
# Dùng: kiem-tra-video.sh <file.mp4> [--stt]
# --stt: chuyển giọng nói thành chữ (tiếng Việt), cần có môi trường Python ở $STT_VENV
#        (mặc định ~/.cache/lam-video/venv có cài faster-whisper). Chưa có thì bỏ qua và in hướng dẫn.
set -euo pipefail

FILE="${1:-}"
[ -f "$FILE" ] || { echo "Không thấy file: $FILE"; exit 1; }
STT=0; [ "${2:-}" = "--stt" ] && STT=1

OUT_DIR="${TMPDIR:-/tmp}/kiem-tra-video"
mkdir -p "$OUT_DIR"
BASE="$(basename "${FILE%.*}")"
SHEET="$OUT_DIR/${BASE}_luoi.png"

echo "== Thông số"
ffprobe -v error -show_entries format=duration:stream=codec_type,width,height,r_frame_rate -of compact "$FILE"

DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$FILE")
N=$(python3 -c "import math;print(max(1,math.ceil(float('$DUR'))))")
COLS=$(( N < 10 ? N : 10 ))
ROWS=$(( (N + COLS - 1) / COLS ))

echo "== Đoạn im lặng (-40dB, ≥0,4s)"
ffmpeg -hide_banner -i "$FILE" -af "silencedetect=n=-40dB:d=0.4" -f null - 2>&1 | grep -E "silence_(start|end)" || echo "(không có đoạn im lặng: có thể có nhạc hoặc âm nền liên tục)"

echo "== Ảnh lưới (${N} khung, 1 khung/giây)"
ffmpeg -loglevel error -y -i "$FILE" -vf "fps=1,scale=180:-2,tile=${COLS}x${ROWS}" -frames:v 1 "$SHEET"
echo "$SHEET"

if [ "$STT" = "1" ]; then
  VENV="${STT_VENV:-$HOME/.cache/lam-video/venv}"
  if [ -x "$VENV/bin/python" ]; then
    WAV="$OUT_DIR/${BASE}.wav"
    ffmpeg -loglevel error -y -i "$FILE" -ac 1 -ar 16000 "$WAV"
    echo "== Lời thoại (STT, có thể sai chính tả)"
    "$VENV/bin/python" -I - "$WAV" <<'PY' 2>/dev/null
import sys, wave
import numpy as np
from faster_whisper import WhisperModel
w = wave.open(sys.argv[1]); a = np.frombuffer(w.readframes(w.getnframes()), dtype=np.int16).astype(np.float32) / 32768.0
m = WhisperModel("small", device="cpu", compute_type="int8")
for s in m.transcribe(a, language="vi", beam_size=5)[0]:
    print(f"[{s.start:.1f}-{s.end:.1f}] {s.text.strip()}")
PY
  else
    echo "== Bỏ qua STT: chưa có $VENV"
    echo "   Cài (một lần, cần người dùng đồng ý): python3 -m venv $VENV && $VENV/bin/pip install faster-whisper numpy"
  fi
fi
