#!/bin/bash
# Kiểm tra video đã có end card ở cuối chưa; chưa có thì chèn và thay file gốc.
# Dùng: end-card.sh <video.mp4> <end-card.png> [--chi-kiem-tra] [--giay N]
#   --chi-kiem-tra : chỉ báo CÓ / CHƯA CÓ, không sửa gì
#   --giay N       : số giây cuối được phủ end card (mặc định 2.5)
# Cách chèn: PHỦ end card lên N giây cuối (mờ dần vào 0,4s), GIỮ NGUYÊN âm thanh,
# nên nhạc chạy liền tới hết video và độ dài không đổi. File gốc được chuyển vào Thùng rác.
set -euo pipefail

VID="${1:-}"; CARD="${2:-}"; shift 2 || true
CHECK_ONLY=0; SEC=2.5
while [ $# -gt 0 ]; do
  case "$1" in
    --chi-kiem-tra) CHECK_ONLY=1 ;;
    --giay) SEC="$2"; shift ;;
  esac; shift
done
[ -f "$VID" ] && [ -f "$CARD" ] || { echo "Thiếu file video hoặc end card"; exit 1; }

TMP="${TMPDIR:-/tmp}/end-card-$$"; mkdir -p "$TMP"
DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$VID")
W=$(ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 "$VID")
H=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 "$VID")
LAST=$(python3 -c "print(max(0, float('$DUR') - 0.3))")

# So khung hình cuối với end card (SSIM). >= 0.55 coi là đã có end card.
ffmpeg -loglevel error -y -ss "$LAST" -i "$VID" -frames:v 1 -vf "scale=270:480" "$TMP/last.png"
ffmpeg -loglevel error -y -i "$CARD" -vf "scale=270:480" "$TMP/card.png"
SSIM=$(ffmpeg -hide_banner -i "$TMP/last.png" -i "$TMP/card.png" -lavfi ssim -f null - 2>&1 | sed -n 's/.*All:\([0-9.]*\).*/\1/p' | tail -1)
HAS=$(python3 -c "print(1 if float('${SSIM:-0}') >= 0.55 else 0)")

echo "Video: $(basename "$VID") · ${DUR}s · ${W}x${H}"
if [ "$HAS" = "1" ]; then echo "End card: CÓ (độ giống ${SSIM})"; rm -rf "$TMP"; exit 0; fi
echo "End card: CHƯA CÓ (độ giống ${SSIM})"
[ "$CHECK_ONLY" = "1" ] && { rm -rf "$TMP"; exit 0; }

ST=$(python3 -c "print(max(0, float('$DUR') - float('$SEC')))")
OUT="$TMP/out.mp4"
ffmpeg -loglevel error -y -i "$VID" -loop 1 -i "$CARD" -filter_complex \
  "[1:v]scale=${W}:${H}:force_original_aspect_ratio=increase,crop=${W}:${H},format=rgba,fade=t=in:st=0:d=0.4:alpha=1,setpts=PTS+${ST}/TB[c];[0:v][c]overlay=0:0:enable='gte(t,${ST})':shortest=1,format=yuv420p[v]" \
  -map "[v]" -map 0:a? -c:v libx264 -preset slow -crf 18 -c:a copy -movflags +faststart "$OUT"

# File gốc vào Thùng rác (không xóa vĩnh viễn), file mới thay đúng tên cũ.
TRASH="$HOME/.Trash/$(basename "${VID%.*}")_goc-chua-end-card_$(date +%H%M%S).mp4"
mv "$VID" "$TRASH"
mv "$OUT" "$VID"
rm -rf "$TMP"
echo "Đã chèn end card vào ${SEC} giây cuối (âm thanh giữ nguyên). File gốc đã chuyển vào Thùng rác."
