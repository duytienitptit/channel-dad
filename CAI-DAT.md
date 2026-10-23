# Bắt đầu với kênh Dad trên máy mới

Dự án gồm hai kho GitHub riêng tư, đặt cạnh nhau trong `~/01_Projects/`:

| Kho | Thư mục trên máy | Nội dung |
|---|---|---|
| `channel-dad` | `~/01_Projects/Channel_Dad` | Chuyện kênh: sổ tay, nhân vật, giọng nói, kịch bản, quy trình, skill `lam-video` |
| `edit-hyperframe` | `~/01_Projects/EditHyperframe` | Chuyện dựng: công cụ, kiểu dựng, dữ liệu dựng từng video |

Giữ **đúng tên thư mục** như bảng trên, vì hướng dẫn và các liên kết dựa vào đó.

## Người mới làm 3 bước
1. Cài [Claude Code](https://claude.com/claude-code) và đăng nhập GitHub (đã được mời vào hai kho).
2. Mở Terminal, chạy:
   ```bash
   mkdir -p ~/01_Projects && cd ~/01_Projects
   gh repo clone duytienitptit/channel-dad Channel_Dad
   ```
3. Mở Claude Code trong thư mục `Channel_Dad` và nói: **"Cài đặt theo CAI-DAT.md"**.

## Phần Claude làm
1. Tải kho dựng về cạnh kho này:
   ```bash
   cd ~/01_Projects && gh repo clone duytienitptit/edit-hyperframe EditHyperframe
   ```
2. Làm theo `~/01_Projects/EditHyperframe/CAI-DAT.md` (phần mềm nền, HyperFrames, công cụ Python, font).
3. Người chỉ làm clip trên Google Flow, không dựng: dừng sau bước 1, không cần cài phần dựng.
4. Báo lại cho người dùng: đã cài gì, kiểm tra nào đã chạy, còn thiếu gì.

## Không có trong kho
Video (clip gốc, thành phẩm) không đưa lên GitHub. Cần file nào thì chia sẻ qua Google Drive rồi đặt vào `assets/videos/` hoặc `assets/videos/goc/` theo tên trong sổ tay (mục 8).
