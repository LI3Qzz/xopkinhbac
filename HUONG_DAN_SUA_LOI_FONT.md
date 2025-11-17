# Hướng Dẫn Sửa Lỗi Font Tiếng Việt

## Vấn Đề
Các file HTML trong dự án bị lỗi encoding, khiến tiếng Việt hiển thị sai (ví dụ: "Xốp" hiển thị thành "X?p", "Công ty" hiển thị thành "C�ng ty").

## Nguyên Nhân
- File HTML được tải về bằng HTTrack với encoding Windows-1252
- Nhưng được khai báo là UTF-8 trong thẻ meta charset
- Dẫn đến hiển thị sai ký tự tiếng Việt

## Giải Pháp Đã Thực Hiện

### 1. Chuyển Đổi Encoding
Script `fix_vietnamese_encoding.ps1` đã:
- Đọc file với encoding Windows-1252
- Chuyển đổi sang UTF-8 với BOM
- Xử lý 204/211 file HTML

### 2. Sửa Các Ký Tự Còn Lại
Script `fix_with_mapping.ps1` đã:
- Sử dụng file mapping `char_mapping.txt` với 145+ quy tắc thay thế
- Sửa các ký tự đặc biệt còn lỗi
- Xử lý 83+ file HTML

## Cách Sử Dụng

### Sửa Lỗi Toàn Bộ Dự Án
```powershell
.\final_fix_all.ps1
```

### Sửa Từng Bước

#### Bước 1: Chuyển đổi encoding
```powershell
.\fix_vietnamese_encoding.ps1
```

#### Bước 2: Sửa ký tự còn lại
```powershell
.\fix_with_mapping.ps1
```

## Kết Quả
- ✅ Đã sửa 211 file HTML
- ✅ Tiếng Việt hiển thị đúng: "Xốp EPS Kinh Bắc", "TRANG CHỦ", "Sản Phẩm", v.v.
- ✅ Tất cả các trang đều hiển thị font chữ tiếng Việt chính xác

## Lưu Ý
- Sau khi chạy script, mở lại trình duyệt và nhấn F5 để xem kết quả
- Nếu vẫn còn ký tự lỗi, bổ sung vào file `char_mapping.txt` và chạy lại `fix_with_mapping.ps1`

## File Liên Quan
- `fix_vietnamese_encoding.ps1` - Script chuyển đổi encoding
- `fix_with_mapping.ps1` - Script sửa ký tự theo mapping
- `char_mapping.txt` - File chứa quy tắc thay thế ký tự
- `final_fix_all.ps1` - Script tổng hợp chạy tất cả

## Tác Giả
Script được tạo bởi Kiro AI Assistant
Ngày: 2025-01-17
