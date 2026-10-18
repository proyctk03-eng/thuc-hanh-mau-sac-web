# Báo Cáo Dự Án Tốt Nghiệp: Hoàn Thiện Layout Trang Chủ Portfolio - Responsive Từ Mobile Đến Desktop

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] **Triết lý Mobile-First**: Xây dựng toàn bộ CSS bắt đầu từ màn hình nhỏ nhất (Mobile) làm nền tảng cốt lõi, không phụ thuộc vào media query ban đầu.
- [x] **Media Queries (`min-width`)**: Sử dụng phương pháp nâng cấp lũy tiến (Progressive Enhancement) với 2 điểm ngắt: Tablet (`min-width: 768px`) và Desktop (`min-width: 1024px`).
- [x] **Đơn vị tương đối (`rem`, `%`)**: Sử dụng `rem` cho toàn bộ typography, padding, margin và gap, giúp giao diện co giãn tự nhiên theo thiết lập hệ thống và hỗ trợ khả năng tiếp cận (Accessibility).
- [x] **Tối ưu hình ảnh đáp ứng (Responsive Images)**: Triển khai thẻ `<picture>` kết hợp `<source media="...">` cho thẻ dự án tiêu điểm (`.card-1`), áp dụng kỹ thuật Art Direction & Resolution Switching, đảm bảo hình ảnh không bị tràn màn hình (`max-width: 100%`).
- [x] **Bố cục Mosaic bất đối xứng**: Khôi phục lưới 4 cột nghệ thuật trên Desktop, trong khi vẫn duy trì 2 cột trên Tablet và 1 cột gọn gàng trên Mobile.

---

## 2. Tóm Tắt Các Bước Thực Hiện (Nội Dung Nộp Bài)

### Bước 1: Thiết Lập & Chuẩn Bị
- Khởi tạo tệp `homepage.html` có chứa thẻ viewport bắt buộc:
  `<meta name="viewport" content="width=device-width, initial-scale=1.0">`.
- Tạo mới hoàn toàn tệp `style.css` và liên kết với `homepage.html`.
- Bắt đầu `style.css` bằng đoạn mã reset box-sizing chuẩn mực:
  ```css
  html { box-sizing: border-box; font-size: 16px; }
  *, *::before, *::after { box-sizing: inherit; margin: 0; padding: 0; }
  ```

### Bước 2: Xây Dựng Layout Mobile (Mặc Định - Không Dùng Media Query)
- Bố cục tổng thể 1 cột dọc: `<header>`, `<main>`, `<footer>` xếp chồng tuần tự.
- Vùng nội dung chính `.content-grid` thiết lập dạng lưới 1 cột duy nhất (`grid-template-columns: 1fr;`), các thẻ dự án `.card` xếp chồng gọn gàng theo chiều dọc.
- Sử dụng triệt để đơn vị `rem` cho `font-size`, `padding`, `margin`, `gap`.
- Đảm bảo hình ảnh co giãn linh hoạt, không bị vỡ hoặc tràn mép màn hình:
  ```css
  .card-img, .card-picture { max-width: 100%; height: auto; object-fit: cover; }
  ```

### Bước 3: Nâng Cấp Layout Tablet (`@media (min-width: 768px)`)
- Thiết lập breakpoint đầu tiên tại `min-width: 768px`.
- Chuyển đổi `.content-grid` thành lưới 2 cột: `grid-template-columns: repeat(2, 1fr);`.
- Tạo điểm nhấn bất đối xứng đầu tiên: Cho thẻ dự án tiêu điểm `.card-1` chiếm trọn 2 cột (`grid-column: span 2;`).
- Điều chỉnh Header sang dạng hàng ngang với thanh điều hướng nằm bên phải logo.

### Bước 4: Hoàn Thiện Layout Desktop (`@media (min-width: 1024px)`)
- Thiết lập breakpoint thứ hai tại `min-width: 1024px`.
- Đặt `max-width: 1200px;` và `margin: 0 auto;` cho `.page-container` để giữ toàn bộ trang luôn ở vị trí trung tâm màn hình, không bị trải dài vô tận trên các màn hình siêu rộng.
- Khôi phục hệ thống lưới 4 cột bất đối xứng phức tạp (Mosaic Layout):
  - `.card-1`: Chiếm 2 cột x 2 hàng (`grid-column: span 2; grid-row: span 2;`).
  - `.card-2`: Chiếm 2 cột x 1 hàng (`grid-column: span 2; grid-row: span 1;`).
  - `.card-3`, `.card-4`, `.card-6`: Chiếm 1 cột x 1 hàng.
  - `.card-5`: Chiếm 3 cột x 1 hàng (`grid-column: span 3; grid-row: span 1;`).

### Bước 5: Triển Khai Kỹ Thuật Hình Ảnh Đáp Ứng
- Áp dụng cấu trúc `<picture>` cho `.card-1`:
  - Màn hình Desktop (≥ 1024px): Tải ảnh chất lượng cao 1000px.
  - Màn hình Tablet (≥ 768px): Tải ảnh 700px.
  - Màn hình Mobile: Tải phiên bản ảnh 450px nhẹ và tiết kiệm băng thông.
- Kèm theo thuộc tính `loading="lazy"` để tối ưu tốc độ tải trang.
