# Mẫu prompt (Google Flow)

Thay phần trong `[ … ]`. Khối **LOOK**, **VOICE**, **NARRATOR VOICE** và câu khóa nhân vật lấy từ sổ tay của kênh.

## Ảnh khung đầu, tạo mới (Nano Banana, x2, đính kèm ảnh nhân vật chuẩn)
```
Place the [NHÂN VẬT] from the attached image into a new scene. Keep his face, eyes, hair, [trang phục], [đạo cụ] and art style exactly the same. [Câu khóa màu trang phục, nếu cần].
Vertical 9:16. [Thời điểm, nơi chốn]. FOREGROUND: [tiền cảnh, người gần máy nhất]. MIDDLE: [nhân vật chính: vị trí, hướng mặt, biểu cảm; mặt rõ ở 1/3 trên]. BACKGROUND: [hậu cảnh 3 lớp].
LOOK: [khối LOOK của kênh]
[Nhân vật phụ] is a realistic person as in a cinematic film still (natural skin and fabric, not cartoon); [nhân vật chính] keeps [phong cách riêng]. No text, no watermark.
```

## Ảnh sửa ra từ ảnh chính (ô "What do you want to change?", x2)
```
Edit this image into a [close-up / medium / wider shot] of the same scene [a moment earlier / later]: [mô tả khung hình mới]. Keep exactly the same characters, [màu trang phục], the same place, light, colors and art style. Vertical 9:16, no text, no watermark.
```

## Video 1 góc máy, có thoại
```
Exactly as in the start frame. [Nhân vật] starts speaking immediately in the first second, no intro, [biểu cảm], natural lip movement. [1 chuyển động máy]. [Rào chắn nhân vật chính].
VOICE: [khối VOICE]
He says in Vietnamese: "[thoại khoảng 20–25 tiếng cho 10 giây]"
AUDIO: only his voice, no background music, [âm thanh nền rất nhẹ].
```

## Video 2 góc máy trong 1 clip
```
Same characters, same place and same light throughout, calm and slow pacing.
[0-5s] [Góc máy 1], exactly as in the start frame: [1 hành động].
[5-10s] Cut to [góc máy 2]: [1 hành động].
[Rào chắn nhân vật chính]; no morphing.
AUDIO: no background music, [có hoặc không thoại], [âm thanh nền].
```

## Video có người dẫn đọc (voice-over), mỗi clip khoảng 3 câu, chung một ảnh khung đầu
```
Exactly as in the start frame. [Chuyển động rất nhẹ: nến, khói, hơi thở]. [Vật thể tĩnh] stays completely still. Static camera, no zoom, no morphing, no new objects or people.
NARRATOR VOICE (voice-over, nobody on screen speaks): [khối NARRATOR VOICE]
The narrator starts immediately in the first second and says in Vietnamese: "[câu 1]. [câu 2]. [câu 3]."
AUDIO: only the narrator's voice, no background music.
```

## Sổ tay kênh cần có (để skill dùng được cho kênh mới)
1. Định vị, khán giả, nguyên tắc nội dung (điều cấm)
2. Các khuôn reel và nhịp đăng
3. **Nhân vật chính:** ảnh tham chiếu (đường dẫn), các điểm bắt buộc giữ, câu khóa nhân vật
4. **Khối VOICE** (nhân vật chính) và **NARRATOR VOICE** nếu có
5. **Khối LOOK** (màu và ánh sáng)
6. **Bảng lỗi đã gặp & cách tránh** của riêng kênh
7. Quy ước tên file, nơi lưu, caption mẫu
