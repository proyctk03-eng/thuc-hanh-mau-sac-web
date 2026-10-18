# Báo Cáo Dự Án Mini: Xây Dựng Layout Trang Chủ Cho Tờ Báo Online

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Sử dụng `display: grid` để kiến tạo bố cục vĩ mô (Macro-layout) vững chắc cho toàn bộ trang web.
- [x] Kết hợp `grid-template-rows: auto 1fr auto` và `min-height: 100vh` để đảm bảo Footer luôn tự động nằm ở đáy màn hình.
- [x] Sử dụng `grid-column: 1 / -1` giúp Header và Footer luôn chiếm trọn vẹn 100% chiều rộng của trang.
- [x] Áp dụng kỹ thuật lưới lồng lưới (Nested Grid) bên trong `<main class="content-grid">` với 4 cột (`repeat(4, 1fr)`).
- [x] Bố trí các thẻ bài viết (`.card`) theo phong cách bất đối xứng (Mosaic Layout) đầy tính nghệ thuật bằng `grid-column: span ...` và `grid-row: span ...`.

---

## 2. Tóm Tắt Các Bước Đã Thực Hiện (Nội Dung Nộp Bài Thực Hành)

### Bước 1: Chuẩn bị Cấu trúc HTML Ngữ Nghĩa
- Tạo tệp `homepage.html` (và `index.html`) với bộ khung ngữ nghĩa chuẩn:
  - Thẻ `<body>` mang lớp `.page-container`.
  - Khối đầu trang `<header class="header">`.
  - Vùng nội dung chính `<main class="content-grid">` chứa 6 thẻ bài viết: `.card-1` đến `.card-6`.
  - Khối chân trang `<footer class="footer">`.

### Bước 2: Kiến Trúc Bố Cục Tổng Thể (Macro-Layout)
- Trong `style.css`, kích hoạt Grid trên `.page-container`:
  ```css
  .page-container {
    display: grid;
    grid-template-rows: auto 1fr auto;
    min-height: 100vh;
  }
  ```
- Ghim Header và Footer trải dài toàn bộ các cột của lưới:
  ```css
  .header, .footer {
    grid-column: 1 / -1;
  }
  ```

### Bước 3: Thiết Lập Lưới Nội Dung Lồng Nhau (Nested Grid)
- Biến phần tử `<main class="content-grid">` thành một grid container thứ cấp (Nested Grid):
  ```css
  .content-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    grid-auto-rows: minmax(200px, auto);
    gap: 20px;
    max-width: 1200px;
    margin: 30px auto;
  }
  ```

### Bước 4: Sắp Xếp Bất Đối Xứng Sáng Tạo (Mosaic Layout)
- Định nghĩa kích thước span linh hoạt cho từng thẻ bài viết:
  - **Thẻ 1 (.card-1 - Tin tiêu điểm):** Chiếm **2 cột và 2 hàng** (`grid-column: span 2; grid-row: span 2;`), tạo thành khối tiêu điểm khổng lồ ở góc trên bên trái.
  - **Thẻ 2 (.card-2 - Đổi mới):** Chiếm **2 cột và 1 hàng** (`grid-column: span 2; grid-row: span 1;`).
  - **Thẻ 3 & 4 (.card-3, .card-4):** Mỗi thẻ chiếm **1 cột và 1 hàng** (`grid-column: span 1; grid-row: span 1;`) lấp đầy hàng 2.
  - **Thẻ 5 (.card-5 - Bài viết góc nhìn):** Chiếm **3 cột và 1 hàng** (`grid-column: span 3; grid-row: span 1;`).
  - **Thẻ 6 (.card-6 - Phân tích):** Chiếm **1 cột và 1 hàng** (`grid-column: span 1; grid-row: span 1;`) hoàn thiện hàng 3.
- Kết hợp Responsive Media Query:
  - Màn hình Tablet (≤ 992px): Chuyển về lưới 2 cột.
  - Màn hình Mobile (≤ 600px): Chuyển về 1 cột dọc duy nhất.

---

## 3. Bảng Kiểm Tra Checklist Yêu Cầu Dự Án

| Hạng mục yêu cầu | Tình trạng | Giải pháp CSS thực thi |
| :--- | :---: | :--- |
| **Bố cục tổng thể Grid** | Hoàn thành | `.page-container { display: grid; }` |
| **Định nghĩa 3 hàng (Header, Main, Footer)** | Hoàn thành | `grid-template-rows: auto 1fr auto;` |
| **Chiều cao tối thiểu full màn hình** | Hoàn thành | `min-height: 100vh;` |
| **Header & Footer chiếm trọn chiều rộng** | Hoàn thành | `grid-column: 1 / -1;` |
| **Lưới lồng nhau (Nested Grid)** | Hoàn thành | `<main class="content-grid">` có `display: grid;` |
| **Định nghĩa 4 cột cho nội dung** | Hoàn thành | `grid-template-columns: repeat(4, 1fr);` |
| **Chiều cao hàng & khoảng cách gap** | Hoàn thành | `grid-auto-rows: minmax(200px, auto); gap: 20px;` |
| **Ít nhất một thẻ chiếm 2 cột** | Hoàn thành | `.card-1` và `.card-2` có `grid-column: span 2;` |
| **Ít nhất một thẻ chiếm 2 hàng** | Hoàn thành | `.card-1` có `grid-row: span 2;` |
| **Bố cục bất đối xứng, đẹp mắt** | Hoàn thành | Khối Mosaic 4x3 ô hoàn chỉnh, không có ô trống |

---

## 4. Mã Nguồn Tham Khảo

### Tệp `homepage.html`
```html
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tạp Chí Công Nghệ - Layout Tờ Báo Online</title>
  <link rel="stylesheet" href="style.css">
</head>
<body class="page-container">
  <header class="header">HEADER</header>

  <main class="content-grid">
    <div class="card card-1">Dự án 1</div>
    <div class="card card-2">Dự án 2</div>
    <div class="card card-3">Dự án 3</div>
    <div class="card card-4">Dự án 4</div>
    <div class="card card-5">Dự án 5</div>
    <div class="card card-6">Dự án 6</div>
  </main>

  <footer class="footer">FOOTER</footer>
</body>
</html>
```

### Tệp `style.css` (Trích đoạn cốt lõi)
```css
.page-container {
  display: grid;
  grid-template-rows: auto 1fr auto;
  min-height: 100vh;
}

.header, .footer {
  grid-column: 1 / -1;
}

.content-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: minmax(200px, auto);
  gap: 20px;
}

.card-1 {
  grid-column: span 2;
  grid-row: span 2;
}

.card-2 {
  grid-column: span 2;
  grid-row: span 1;
}

.card-5 {
  grid-column: span 3;
  grid-row: span 1;
}
```
