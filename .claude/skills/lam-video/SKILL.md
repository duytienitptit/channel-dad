---
name: lam-video
description: Quy trình làm một reel/video ngắn bằng AI (Google Flow: Nano Banana cho ảnh, Omni Flash cho video), từ ý tưởng, kịch bản, prompt ảnh và video, kiểm tra, đến lưu file và đăng. Dùng khi người dùng muốn làm, tạo hoặc lên kịch bản một video/reel mới cho bất kỳ kênh nào, ví dụ "làm reel mới", "làm video tiếp", "tạo video dạng như reel trước", "lên kịch bản reel", "/lam-video". Không dùng cho bài ảnh đơn lẻ, và không dùng để đẩy video lên Drive (đó là skill dang-video-xong).
---

# Làm video (reel AI) cho kênh

Trả lời bằng **tiếng Việt**, ngắn gọn, dễ hiểu. Người dùng **tự thao tác trên Google Flow**: dán prompt, bấm tạo, tải file. Claude viết kịch bản và prompt, đọc màn hình Flow bằng trình duyệt tích hợp để kiểm tra, và kiểm tra file video tải về.

## 0. Nạp thông tin kênh (bắt buộc, trước mọi việc)
1. Xác định kênh theo thư mục dự án đang mở. Đọc `CLAUDE.md` của dự án.
2. Đọc **sổ tay kênh** (ở kênh Dharma là `so-tay-kenh.md`). Lấy ra: các khuôn reel, nhân vật và ảnh tham chiếu, khối giọng (VOICE), khối màu (LOOK), **bảng lỗi đã gặp**, nguyên tắc nội dung, quy ước tên file.
3. Đọc `references/bai-hoc-chung.md` trong skill này (các lỗi chung đã gặp ở mọi kênh).
4. Kênh chưa có sổ tay: báo người dùng, đề xuất tạo theo các mục ở `references/mau-prompt.md` (mục "Sổ tay kênh cần có"), rồi mới làm tiếp.

## 1. Ý tưởng & kịch bản → CHỜ DUYỆT
**Không viết prompt trước khi người dùng duyệt kịch bản.**

### Ý tưởng lấy từ đâu (theo thứ tự ưu tiên)
1. **Video tham khảo đã chứng minh hiệu quả:** Google Sheet "Channel Content References", tab **Tham_khao**, các dòng của kênh. Xin link nếu chưa có. Ngoài ra là các reel nhiều lượt xem nhất của page mẫu hoặc đối thủ (xem số lượt xem, cảm xúc, bình luận trực tiếp trên Facebook).
2. **Số liệu của chính kênh:** reel nào của mình đang thắng (Insights), khuôn và chủ đề nào được nhiều người xem hết, theo dõi mới.
3. **Tiếng nói khán giả:** bình luận và tin nhắn (nỗi lo, câu hỏi lặp lại).
4. **Lịch:** ngày âm lịch, ngày lễ, mùa (Vu Lan, Tết…).
5. **Nguồn nội dung** của kênh (kênh Phật pháp: kinh điển) để ý tưởng có chiều sâu và đúng.

### Làm sao để ý tưởng "hay" (không có gì chắc chắn 100%, nhưng giảm rủi ro)
- **Mỗi ý tưởng phải dẫn một video tham khảo** đã có nhiều lượt xem (link + số liệu) và nói rõ mình **học điều gì** từ nó (hook, cảm xúc, bố cục). Không học thuộc câu chữ.
- **Trình 2–3 ý tưởng ngắn** để người dùng chọn, sau đó mới viết kịch bản chi tiết cho ý được chọn.
- Tự chấm trước khi trình:
  - Hook có chạm một **nỗi đau hoặc mong ước chung** trong 3 giây đầu không?
  - Có **một cảm xúc chính** rõ ràng không?
  - Có **một câu chốt** dễ chia sẻ cho người thân không?
  - Có hợp **khuôn và chủ đề đang thắng** của kênh không?
- **Sau khi đăng 2–3 ngày,** xem số liệu reel đó và ghi lại "giả thuyết đúng hay sai" vào sổ tay kênh, để ý tưởng sau tốt hơn.

### Kịch bản chi tiết cho ý được chọn, trình bày:
- **Ý tưởng:** chủ đề, khuôn, cảm xúc muốn gợi, vì sao người xem dừng lại.
- **Hook 3 giây đầu:** vào chuyện **ngay giây 0**, không có cảnh đi tới hay mở mắt trước khi nói.
- **Nguồn** của ý chính, nếu kênh yêu cầu (kênh Phật pháp: ý phải có trong kinh thật).
- **Bảng cảnh:** clip · thời lượng · góc máy · hình · thoại.
- **Caption** dự kiến.
- Một dòng **đối chiếu các góp ý cũ** của người dùng đã áp dụng (lấy từ bảng lỗi).

Nhịp dựng: **mỗi clip 10 giây tối đa 2 góc máy** (khoảng 5 giây mỗi góc). Cần nhiều góc hơn thì thêm clip. Một reel thường gồm 1–4 clip, dài 10–40 giây.

Người dùng góp ý thì sửa kịch bản và trình lại. Nếu góp ý của họ mâu thuẫn với một bài học cũ, **phản biện ngắn và đưa phương án dung hòa**, đừng làm theo một cách máy móc.

## 2. Ảnh khung đầu (Nano Banana, miễn phí)
- Mỗi clip cần **một ảnh khung đầu**. Thứ tự: tạo **ảnh chính** (thường là toàn cảnh có đủ nhân vật), rồi **sửa ra từ chính ảnh đó** các ảnh cận hoặc góc khác ("What do you want to change?"), để nhân vật và bối cảnh đồng nhất. Người dùng muốn tạo mới từ đầu thì làm theo.
- Luôn **đính kèm ảnh nhân vật chuẩn** của kênh. Dùng `mcp__ccd_host__reveal_path` mở Finder chọn sẵn file đó, để người dùng kéo thả vào Flow.
- `references/mau-prompt.md` chỉ là **điểm xuất phát**. Mỗi video viết prompt **riêng cho tình huống đó**, thêm, bớt hay đổi tùy cảnh và tùy kết quả lần trước. Phần nên giữ ổn định (vì đã sửa được lỗi lặp lại): câu khóa nhân vật, khối VOICE, khối LOOK, rào chắn cho nhân vật chính, "no background music". Người dùng muốn đổi cả những phần này thì cứ đổi.
- Mỗi bước người dùng cần làm phải ghi **ngay trong tin nhắn**, đánh số: bấm gì, file nào, cài đặt gì (Nano Banana · tỉ lệ khung · x2), **prompt đầy đủ trong khối code**. Không chỉ trỏ tới file.
- Người dùng tạo xong: **tự mở màn hình Flow** (tab Flow trong trình duyệt tích hợp) xem ảnh, đối chiếu bảng lỗi, chọn ảnh tốt hơn và nói lý do. Chỉ một chi tiết sai thì **sửa trên ảnh đó**, đừng tạo lại cả ảnh.

## 3. Video (Omni 1.1 Flash)
- Model thường dùng: **Omni 1.1 Flash**, thời lượng 4/6/8/10s, khung dọc. **Độ phân giải, số bản (x1–x4) và có chạy thử hay không là do người dùng quyết định.** Chỉ nhắc số credit nếu được hỏi.
- Viết prompt theo nguyên tắc **"ít hành động, nhiều ràng buộc"**:
  - 1 hành động chính cho mỗi góc máy.
  - 1 chuyển động máy.
  - Phần phụ (gió, nến, nước, lá) để AI tự lo.
  - Luôn có **rào chắn** cho nhân vật chính (giữ mặt, trang phục, hào quang; cử động chậm; no morphing).
- Có 2 góc máy thì dùng mốc thời gian: `[0-5s] … [5-10s] Cut to …`.
- Nhân vật nói: dán **nguyên khối VOICE** của kênh. Ghi *"starts speaking immediately in the first second, no intro"* và *"natural lip movement"*. Thoại khoảng **20–25 tiếng cho 10 giây**, khoảng 14 tiếng cho 6 giây.
- Người dẫn đọc (voice-over): dùng khối **NARRATOR VOICE**, chia khoảng 3 câu mỗi clip 10 giây, mọi clip **dùng chung một ảnh khung đầu**.
- Luôn ghi **`AUDIO: no background music`**. Người dùng tự ghép nhạc và end card trong CapCut.

## 4. Kiểm tra end card (bắt buộc trước khi đăng)
Người dùng tự xem và dựng video, nên **không cần kiểm tra lại toàn bộ hình ảnh**. Chỉ kiểm tra **đã có end card ở cuối chưa**:
```bash
~/.claude/skills/lam-video/scripts/end-card.sh "<video.mp4>" "<end-card.png của kênh>" --chi-kiem-tra
```
- **CÓ:** đăng luôn.
- **CHƯA CÓ:** chạy lại lệnh **không có** `--chi-kiem-tra`. Script **phủ end card lên 2,5 giây cuối** (mờ dần vào), **giữ nguyên âm thanh** nên nhạc chạy liền tới hết video. File gốc chuyển vào **Thùng rác**, file có end card thay đúng tên cũ. Dùng file đó để đăng.
- Lưu ý: cách phủ sẽ **che 2,5 giây hình cuối**. Nếu 2,5 giây cuối có nhân vật **đang nói trước màn hình**, xem nhanh khung cuối trước (`ffmpeg -sseof -3 …`); nếu có thì giảm `--giay` hoặc báo người dùng. Cách sạch nhất là khi dựng trong CapCut để nhạc chạy dư 2–3 giây sau cảnh cuối rồi đặt end card vào đó.
- End card của kênh Dharma: `assets/end-card/end-card.png`.

`scripts/kiem-tra-video.sh` (ảnh lưới khung hình, thoại) **chỉ dùng khi người dùng nhờ** phân tích một video, ví dụ video tham khảo hoặc video bị lỗi.

## 5. Lưu file
- Bản dựng cuối: chuyển vào `assets/videos/` theo quy ước tên của kênh (Dharma: `YYYY-MM-DD_<sang|toi>_<chu-de>_khuon<N>.mp4`).
- Clip gốc từ Flow: chuyển vào `assets/videos/goc/`.
- Chỉ di chuyển những file chắc chắn thuộc video này. File lạ trong Downloads thì hỏi trước. File bỏ đi thì chuyển vào Thùng rác, không xóa vĩnh viễn.

## 6. Đăng & đẩy lên Drive
- **Người dùng tự hẹn giờ đăng trên Meta Business Suite.** Đăng qua trình duyệt rất tốn token, nên Claude **không tự đăng**, trừ khi người dùng yêu cầu rõ.
- Claude soạn **bảng đăng**, mỗi reel một dòng:
  - File (đường dẫn), ngày giờ đăng, caption đầy đủ (trong khối code để copy).
  - Khung gợi ý làm ảnh bìa (giây thứ mấy).
  - Nhắc: bật **AI label**, không Boost.
  - Ghi chú: Facebook hay lấy **end card** làm ảnh bìa, phải đổi sang khung đẹp.
  - Dùng `reveal_path` mở sẵn thư mục video.
- Nhịp đăng theo sổ tay kênh (kênh Dharma: 2 reel/ngày, sáng 6:00 và tối 20:30). Tên file theo **ngày giờ đăng**; đổi lịch thì đổi tên.
- Người dùng báo đã hẹn hoặc đăng xong thì dùng skill **dang-video-xong** để đẩy lên Drive và cập nhật Sheet.

## 7. Học từ lỗi
Gặp lỗi mới (người dùng chê, hoặc kiểm tra thấy sai):
- Lỗi riêng của kênh: thêm một dòng vào **bảng lỗi trong sổ tay kênh**.
- Lỗi áp dụng cho mọi kênh: thêm vào `references/bai-hoc-chung.md` của skill này.

Mỗi dòng ghi rõ: lỗi · nguyên nhân · cách tránh.

## Không được làm
- Không viết prompt khi kịch bản chưa được duyệt.
- Không đính kèm ảnh của kênh khác làm ảnh tham chiếu hay khung đầu: Nano Banana sẽ chép y nguyên.
- Không dùng connector Google Drive để tải video (base64, rất tốn token).
- Không nhập mật khẩu thay người dùng.
