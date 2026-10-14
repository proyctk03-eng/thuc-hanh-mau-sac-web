# Ghi Chú Thực Hành: Tạo Trang Web Đầu Tiên Của Bạn - index.html

## 1. Mục Tiêu Đã Hoàn Thành
- [x] Tạo thư mục dự án `my-first-website` để quản lý mã nguồn tập trung.
- [x] Mở thư mục làm việc trong Visual Studio Code (`File -> Open Folder...`).
- [x] Tạo tệp tin `index.html` đầu tiên.
- [x] Khởi tạo cấu trúc khung HTML5 chuẩn bằng phím tắt Emmet (`!` + `Tab` hoặc `Enter`).
- [x] Tùy chỉnh thuộc tính ngôn ngữ (`lang="vi"`) và tiêu đề trang (`<title>Trang Web Đầu Tiên Của Tôi</title>`).
- [x] Khởi chạy và kiểm tra hiển thị trực tiếp trên trình duyệt bằng tiện ích **Live Server**.

---

## 2. Ghi Chú Kiến Thức Cốt Lõi (Nội Dung Nộp Bài Thực Hành)

### 2.1. Ý nghĩa của tệp `index.html`
- `index.html` là quy ước đặt tên quốc tế cho trang chủ (default root document) của một trang web hoặc thư mục trên máy chủ web (Web Server).
- Khi người dùng truy cập vào một tên miền (ví dụ: `https://tenmien.com/`), máy chủ web sẽ tự động tìm kiếm và phản hồi tệp có tên `index.html` đầu tiên mà không cần người dùng phải gõ đầy đủ đường dẫn tệp.

### 2.2. Phím tắt Emmet trong VS Code
- Gõ dấu chấm than `!` trong tệp `.html` và nhấn `Tab` hoặc `Enter`, VS Code sẽ tự động sinh mã khung HTML5 hoàn chỉnh:
  - `<!DOCTYPE html>`: Khai báo tài liệu tuân theo chuẩn HTML5.
  - `<html lang="vi">`: Thẻ gốc bao bọc toàn bộ trang web, khai báo ngôn ngữ trang là Tiếng Việt.
  - `<head>`: Chứa siêu dữ liệu (metadata) của trang web như bảng mã ký tự (`UTF-8`), cấu hình hiển thị responsive trên thiết bị di động (`viewport`), và tiêu đề tab trình duyệt (`<title>`).
  - `<body>`: Chứa toàn bộ nội dung trực quan hiển thị cho người dùng (văn bản, tiêu đề, hình ảnh, liên kết, bảng biểu,...).

### 2.3. Lợi ích của Live Server
- **Tự động làm mới (Hot Reload / Live Reload):** Mỗi khi lưu tệp (`Ctrl + S`), Live Server sẽ tự động làm mới trình duyệt ngay lập tức mà không cần bấm F5 thủ công.
- **Mô phỏng máy chủ cục bộ:** Tạo một máy chủ local HTTP server (thường là `http://127.0.0.1:5500/` hoặc `localhost:5500`), giúp tránh các lỗi liên quan đến giao thức tệp cục bộ (`file:///`).

---

## 3. Cấu Trúc Mã Nguồn Hoàn Chỉnh (`index.html`)

```html
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Web Đầu Tiên Của Tôi</title>
</head>
<body>
    <h1>Chào mừng bạn đến với trang web đầu tiên của tôi!</h1>
    <p>Trang web này được tạo bằng Visual Studio Code, sử dụng phím tắt Emmet và chạy thử nghiệm trực tiếp qua tiện ích Live Server.</p>
</body>
</html>
```
