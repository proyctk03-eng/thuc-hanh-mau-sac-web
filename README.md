# Báo Cáo Thực Hành: Xây Dựng Form Liên Hệ Đầu Tiên Của Bạn (contact.html)

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Áp dụng thuần thục các thẻ biểu mẫu HTML: `<form>`, `<label>`, `<input>`, `<textarea>`, `<button>`.
- [x] Sử dụng đa dạng các loại trường nhập liệu: `type="text"`, `type="email"`, `type="radio"`.
- [x] Thiết lập liên kết hai chiều chính xác giữa nhãn `<label for="...">` và phần tử nhập liệu `<input id="...">` / `<textarea id="...">`.
- [x] Xây dựng tệp `contact.html` hoàn chỉnh, kết nối liền mạch hai chiều với trang chủ `index.html`.
- [x] Hoàn thành Thử thách thêm (Optional Challenge): Nhóm các nút chọn `radio button` chọn chủ đề liên hệ với cùng thuộc tính `name="chu_de"`.

---

## 2. Tóm Tắt Các Bước Đã Thực Hiện (Nội Dung Nộp Bài Thực Hành)

### Bước 1: Khởi tạo tệp và bộ khung tài liệu
- Tạo tệp `contact.html` trong thư mục dự án `my-first-website`.
- Sử dụng Emmet (`!`) để sinh khung HTML5 chuẩn, cấu hình `lang="vi"` và đặt tiêu đề `<title>Liên hệ với chúng tôi</title>`.

### Bước 2: Xây dựng cấu trúc Form cơ bản
- Thêm tiêu đề trang `<h1>` và đoạn mô tả hướng dẫn người dùng.
- Bao bọc toàn bộ các trường nhập bằng thẻ `<form action="#" method="post">`.
- Gom nhóm từng cặp `label-input` vào trong từng khối `<div class="form-group">` để quản trị bố cục và khoảng cách khoa học.

### Bước 3: Tạo các trường nhập liệu cốt lõi
1. **Trường Họ và Tên:**
   - Dùng `<label for="ho_ten">` và `<input type="text" id="ho_ten" name="ho_ten">`.
2. **Trường Email:**
   - Dùng `<label for="email">` và `<input type="email" id="email" name="email_nguoi_dung">`. Trình duyệt tự động kiểm tra định dạng email hợp lệ (có ký tự `@` và tên miền).
3. **Nhóm Radio Button chọn chủ đề (Thử thách mở rộng):**
   - Đặt cùng `name="chu_de"` cho 3 lựa chọn (*Hỗ trợ kỹ thuật*, *Góp ý sản phẩm*, *Khác*) để người dùng chỉ chọn được duy nhất một tùy chọn tại một thời điểm.
4. **Trường Lời nhắn nhiều dòng:**
   - Dùng `<textarea id="loi_nhan" name="loi_nhan" rows="5">` cho phép nhập văn bản dài.
5. **Nút gửi biểu mẫu:**
   - Dùng `<button type="submit">Gửi lời nhắn</button>` để kích hoạt sự kiện submit dữ liệu.

### Bước 4: Kiểm thử trải nghiệm người dùng
- Kiểm tra tính năng nhấp chuột vào nhãn `<label>`: Con trỏ tự động focus vào ô nhập liệu tương ứng.
- Kiểm tra tính năng validation: Khi nhập email sai định dạng (ví dụ `abc`), trình duyệt hiện thông báo cảnh báo lỗi chuẩn HTML5.

---

## 3. Bảng Phân Tích Các Thuộc Tính Cốt Lõi Của Thẻ Form

| Thẻ / Thuộc tính | Vai Trò & Tác Dụng | Ví Dụ Trong Bài |
| :--- | :--- | :--- |
| `<form action="..." method="...">` | Khung bao bọc, xác định đích đến (`action`) và phương thức truyền tải (`method="post"`) của dữ liệu. | `<form action="#" method="post">` |
| `<label for="...">` | Nhãn mô tả cho ô nhập liệu. Thuộc tính `for` phải trùng khớp với `id` của input để mở rộng vùng nhấp chuột (hỗ trợ tiếp cận a11y). | `<label for="ho_ten">` |
| `type="email"` | Kích hoạt bộ kiểm tra hợp lệ định dạng email tích hợp sẵn trên trình duyệt và bàn phím chuyên dụng `@` trên di động. | `<input type="email" id="email">` |
| `type="radio"` | Cho phép người dùng chọn 1 trong nhiều phương án. Cần chung thuộc tính `name` để nhóm chúng lại với nhau. | `<input type="radio" name="chu_de">` |
| `<textarea>` | Cho phép người dùng nhập văn bản nhiều dòng linh hoạt (khác với `<input>` chỉ nhận 1 dòng). | `<textarea id="loi_nhan" rows="5">` |
| `<button type="submit">` | Nút kích hoạt gửi dữ liệu form tới địa chỉ `action`. | `<button type="submit">` |

---

## 4. Mã Nguồn Hoàn Chỉnh (`contact.html`)

```html
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Liên hệ với chúng tôi</title>
</head>
<body>
  <div class="form-container">
    <h1>Liên hệ với chúng tôi</h1>
    <p>Chúng tôi rất mong nhận được phản hồi từ bạn!</p>

    <form action="#" method="post">
      <div>
        <label for="ho_ten">Họ và tên:</label><br>
        <input type="text" id="ho_ten" name="ho_ten" required>
      </div>
      <br>
      <div>
        <label for="email">Email của bạn:</label><br>
        <input type="email" id="email" name="email_nguoi_dung" required>
      </div>
      <br>
      <!-- Nhóm radio button chọn chủ đề liên hệ -->
      <div>
        <label>Chủ đề liên hệ:</label><br>
        <input type="radio" id="topic_tech" name="chu_de" value="tech_support" checked>
        <label for="topic_tech">Hỗ trợ kỹ thuật</label><br>
        <input type="radio" id="topic_feedback" name="chu_de" value="feedback">
        <label for="topic_feedback">Góp ý sản phẩm</label><br>
        <input type="radio" id="topic_other" name="chu_de" value="other">
        <label for="topic_other">Khác</label>
      </div>
      <br>
      <div>
        <label for="loi_nhan">Lời nhắn:</label><br>
        <textarea id="loi_nhan" name="loi_nhan" rows="5" required></textarea>
      </div>
      <br>
      <div>
        <button type="submit">Gửi lời nhắn</button>
      </div>
    </form>

    <p><a href="index.html">&larr; Quay lại trang chủ Profile</a></p>
  </div>
</body>
</html>
```
