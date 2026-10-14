# Báo Cáo Thực Hành: Viết Profile Cá Nhân Bằng Các Thẻ HTML Đã Học

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Áp dụng thuần thục các thẻ HTML cốt lõi: `<h1>`, `<h2>`, `<p>`, `<img>`, `<strong>`, `<em>`, `<ul>`, `<li>`.
- [x] Tổ chức cấu trúc thư mục dự án chuẩn với thư mục tài nguyên hình ảnh `images/` và tệp ảnh đại diện `avatar.jpg`.
- [x] Hiển thị nội dung đa phương tiện kết hợp văn bản có cấu trúc ngữ nghĩa (semantic HTML).
- [x] Kiểm tra hiển thị trực quan thông qua tiện ích Live Server trong Visual Studio Code.

---

## 2. Ghi Chú Kiến Thức Cốt Lõi (Nội Dung Nộp Bài Thực Hành)

### 2.1. Cấu trúc thư mục dự án chuẩn
```text
my-first-website/
├── images/
│   └── avatar.jpg          # Tệp ảnh đại diện (đường dẫn tương đối: images/avatar.jpg)
├── index.html              # Trang chủ hiển thị thông tin cá nhân
└── README.md               # Tài liệu ghi chú và hướng dẫn thực hành
```

### 2.2. Bảng phân tích ngữ nghĩa các thẻ HTML đã sử dụng

| Thẻ HTML | Tên gọi & Ngữ nghĩa | Vai trò trong bài thực hành |
| :--- | :--- | :--- |
| `<h1>` | Heading 1 (Đề mục cấp cao nhất) | Hiển thị tên đầy đủ của chủ nhân trang web (`Nguyễn Thị Bê`). Mỗi trang web chỉ nên có duy nhất một thẻ `<h1>`. |
| `<h2>` | Heading 2 (Đề mục phụ cấp 2) | Phân chia các khối nội dung lớn: *"Giới thiệu bản thân"* và *"Sở thích"*. |
| `<img>` | Image (Thẻ tự đóng) | Nhúng ảnh chân dung đại diện với thuộc tính `src="images/avatar.jpg"`, `alt` mô tả hỗ trợ tiếp cận (a11y) và `width="200"`. |
| `<p>` | Paragraph (Đoạn văn) | Chứa văn bản giới thiệu chi tiết về nghề nghiệp và đam mê công nghệ. |
| `<strong>` | Strong Importance (Nhấn mạnh tầm quan trọng) | In đậm cụm từ **lập trình viên** nhằm làm nổi bật chuyên môn chính. |
| `<em>` | Emphasis (Nhấn mạnh ngữ điệu) | In nghiêng từ *đẹp mắt* để biểu thị cảm xúc và sắc thái biểu cảm. |
| `<ul>` | Unordered List (Danh sách không có thứ tự) | Bao bọc danh sách các sở thích cá nhân dưới dạng bullet points. |
| `<li>` | List Item (Mục trong danh sách) | Biểu diễn từng sở thích cụ thể như đọc sách, chơi cờ vua, đi bộ đường dài. |

---

## 3. Mã Nguồn Hoàn Chỉnh (`index.html`)

```html
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Web Đầu Tiên Của Tôi - Profile Cá Nhân</title>
</head>
<body>
    <h1>Nguyễn Thị Bê</h1>
    <img src="images/avatar.jpg" alt="Ảnh chân dung của Nguyễn Thị Bê" width="200">
    
    <h2>Giới thiệu bản thân</h2>
    <p>Xin chào! Tôi là một <strong>lập trình viên</strong> đang trên hành trình học hỏi về thế giới phát triển web. Tôi có niềm đam mê với công nghệ và thích tạo ra những sản phẩm <em>đẹp mắt</em> và hữu ích.</p>
    
    <h2>Sở thích</h2>
    <ul>
        <li>Đọc sách khoa học viễn tưởng</li>
        <li>Chơi cờ vua</li>
        <li>Đi bộ đường dài</li>
    </ul>
</body>
</html>
```

---

## 4. Ghi Chú Kinh Nghiệm Khi Làm Bài
1. **Đường dẫn tương đối (Relative Path):** Khi tệp `index.html` và thư mục `images/` nằm cùng cấp, đường dẫn tới ảnh phải là `images/avatar.jpg`. Nếu viết `/images/avatar.jpg` hoặc nhầm tên tệp, ảnh sẽ không hiển thị.
2. **Thuộc tính `alt`:** Luôn khai báo thuộc tính `alt` đầy đủ để người khiếm thị sử dụng Screen Reader có thể hiểu được nội dung ảnh, đồng thời hỗ trợ SEO và hiển thị văn bản thay thế khi đường dẫn ảnh bị lỗi.
3. **Phân biệt `<strong>` vs `<b>`, `<em>` vs `<i>`:** Thẻ `<strong>` và `<em>` mang ý nghĩa ngữ nghĩa (semantic meaning), giúp công cụ tìm kiếm và thiết bị trợ thính hiểu được mức độ quan trọng của từ ngữ, thay vì chỉ đơn thuần là định dạng hiển thị thị giác.
