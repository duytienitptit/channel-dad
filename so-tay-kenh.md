# Sổ tay kênh Channel Dad

## 1. Định vị
- Kênh **nhiều người cha**: mỗi nhân vật đại diện cho một hình tượng người cha (xem mục 3). Ai cũng nói chuyện với con về tiền bạc và cách sống, thương con, không dạy đời. Mỗi người có góc nhìn riêng theo hoàn cảnh của mình.
- Khán giả: người trẻ đi làm, khoảng 25–40 tuổi.

## 2. Khuôn reel
- **Khuôn 1, talking head kiểu podcast:** ông bố ngồi ghế bành trong thư viện, nhìn hơi lệch khỏi máy như đang nói với người phỏng vấn, đến câu chốt thì quay thẳng vào máy. Cử chỉ tay ngang ngực, giữa các câu tay về nghỉ. Xen kẽ trung cảnh và cận mặt. Video mẫu về cử chỉ: bà cụ Trung Quốc ngồi ghế bành (VidBake.com_video-033925.mp4).

## 3. Các nhân vật người cha
Mỗi nhân vật có **ảnh chuẩn, câu khóa và khối VOICE riêng**, dùng cố định cho mọi video của người đó. Không bao giờ đính kèm ảnh của nhân vật này khi tạo ảnh cho nhân vật khác (Nano Banana sẽ chép y nguyên).

| Mã | Hình tượng | Bối cảnh, trang phục | Giọng | Trạng thái |
|---|---|---|---|---|
| `cha-giau` | Cha giàu, trí thức, từng trải về tiền bạc | Thư viện, ghế bành, áo gấm xanh than, chuỗi hạt đỏ | Hà Nội | **Đã có ảnh.** Video đầu tiên "làm chủ đồng tiền" (2026-10-21). Người dùng đã xác nhận |
| `cha-ngheo` | Cha nghèo nông thôn | (chưa có) | (chưa chọn vùng) | Chưa có |
| `cha-giao-vien` | Cha làm giáo viên | (chưa có) | (chưa chọn vùng) | Chưa có |
| `cha-bac-bo` | Cha Bắc Bộ | (chưa có) | Bắc Bộ, khác giọng Hà Nội của `cha-giau` | Chưa có |
| `cha-nam-bo` | Cha Nam Bộ | (chưa có) | Nam Bộ | Chưa có |

Thoại nên hợp với từng người: cha Nam Bộ nói "con nè", "nghen"; cha nông thôn dùng ví dụ ruộng vườn, chữ mộc mạc; cha giáo viên giảng có ý thứ nhất, thứ hai.

### cha-giau
- Ảnh chuẩn: `assets/nhan-vat/bo-thu-vien.webp`.
- Ảnh khung đầu: `assets/nhan-vat/bo-trung-canh.png` (thấy hai tay, có mic cài áo) và `assets/nhan-vat/bo-can-mat.png`. Lưu vào đây sau khi tạo xong.
- Câu khóa nhân vật: `face, grey slicked-back hair, grey goatee, navy blue brocade mandarin-collar jacket with round metal buttons and the long dark red wooden prayer bead necklace stay exactly the same`

## 4. Khối VOICE
Khung chung cho mọi nhân vật (đủ "ADN giọng"): tuổi · quê và vùng giọng · độ cao · chất giọng · nhịp · thái độ · kiểu thu âm, cùng câu "the exact same voice in every clip". Khi thêm nhân vật mới thì viết một khối theo khung này rồi giữ cố định.

**cha-giau**
```
VOICE (the exact same voice in every clip): a 62-year-old Vietnamese man from Hanoi, standard Northern Vietnamese (Hà Nội) accent; low-medium baritone pitch, warm chest resonance, slightly husky, grainy texture; natural conversational pace like talking to his grown child face to face, not slow, short pauses only at commas; clear diction, calm and confident, a faint smile in his voice; sentences end with a gentle falling tone; close-mic podcast sound, dry, no echo.
```
- **Nhịp vừa phải: khoảng 2,5–2,8 tiếng/giây**, tức **25–28 tiếng cho clip 10s** và **15–16 tiếng cho clip 6s**. Đã thử: 29–35 tiếng/10s thì nói hơi nhanh; 11 tiếng/6s kèm chữ "slow" thì lề mề.
- Người dùng thích **ít clip, mỗi clip 10s** (giọng đồng đều hơn, ít phải ghép). Kịch bản dài hơn thì chia thành vài clip 10s, cắt ở chỗ hết ý.
- **Được phép sửa nhẹ lời thoại** (bớt từ đệm, rút gọn câu) để vừa nhịp, miễn giữ nguyên ý và câu chốt. Khi trình kịch bản, ghi rõ chỗ nào đã rút gọn.

## 5. Khối LOOK
```
LOOK: warm cozy library, soft golden lamp light from the left, rich warm wood tones, gentle contrast, realistic cinematic photo, natural skin texture, shallow depth of field.
```

## 6. Rào chắn cho video
```
Static camera, no zoom. Calm, dignified presence; slow, moderate gestures at chest level; natural hands with five fingers; the bead necklace hangs still; the library background stays still; no morphing. No subtitles, no on-screen text.
```

## 7. Bảng lỗi đã gặp
| Lỗi | Nguyên nhân | Cách tránh |
|---|---|---|
| Nói chậm quá, lề mề (2026-10-21) | Prompt ghi "slow and deliberate", "speaking even slower", thoại có dấu "..." và clip dài hơn số tiếng (11 tiếng trong 6s) | Ghi "natural conversational pace, not slow", bỏ "...", thời lượng theo 3–3,5 tiếng/giây |
| Giọng giữa các clip không giống nhau (2026-10-21) | Khối VOICE mô tả chung chung | Dùng khối VOICE cố định: tuổi, quê, vùng giọng, độ cao, chất giọng, nhịp, kiểu âm thanh. Dán y hệt mọi clip, tạo x2 rồi chọn bản giống giọng chuẩn nhất |

## 8. Tên file & nơi lưu
- Bản dựng cuối: `assets/videos/YYYY-MM-DD_<chu-de>_khuon<N>.mp4`
- Clip gốc từ Flow: `assets/videos/goc/YYYY-MM-DD_<chu-de>_goc.mp4`. **Không để file gốc trong Downloads**: dự án dựng chỉ trỏ tới file ở đây.
- **Kênh này không dùng end card** (người dùng chốt 2026-10-21). Bỏ qua bước kiểm tra end card của skill lam-video.

## 9. Dựng video
Dựng ở thư mục riêng `~/01_Projects/EditHyperframe/talking-head/` (dùng chung công cụ, b-roll, nhạc và SFX với các kênh khác). Thư mục kênh này chỉ ghi **dùng kiểu dựng nào**; chi tiết kiểu dựng nằm bên đó.

- **Kiểu dựng đã chốt:** `bw-film-quote` (file `EditHyperframe/talking-head/styles/bw-film-quote.md`): màu tươi sáng, viền tối nhẹ, phụ đề vàng một dòng, b-roll minh họa khoảng 40–50% thời lượng, chữ lớn nổi bật ở các từ khóa, nhạc nền nhẹ dưới giọng nói.
- **Tên dự án dựng:** `DAD<nn>_<ChuDeKhongDau>`, ví dụ `DAD01_LamChuDongTien`.
- **Quy trình chuyển giao:**
  1. Clip gốc từ Flow lưu vào `assets/videos/goc/` (mục 8).
  2. Dự án dựng trỏ tới clip gốc đó (`source/`), không chép.
  3. Dựng xong, bản cuối được **chép về** `assets/videos/` theo tên ở mục 8 và ghi vào bảng dưới.

| Ngày | Nhân vật | Chủ đề | Bản cuối | Dự án dựng | Đăng |
|---|---|---|---|---|---|
| 2026-10-21 | `cha-giau` | Làm chủ đồng tiền (26s) | `assets/videos/2026-10-21_lam-chu-dong-tien_khuon1.mp4` | `DAD01_LamChuDongTien` | Chưa |
