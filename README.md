# Báo Cáo Thực Hành: Biến Đổi Menu Điều Hướng Thành "Hamburger" Menu Trên Mobile

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Xây dựng một thanh điều hướng đáp ứng hoàn chỉnh (Responsive Navigation Bar).
- [x] Áp dụng phương pháp luận thiết kế **Mobile First**: ưu tiên hiển thị gọn gàng trên màn hình nhỏ trước, sau đó mở rộng giao diện cho màn hình lớn.
- [x] Ứng dụng "thủ thuật Checkbox" (Checkbox Hack) kết hợp với lớp giả `:checked` và bộ chọn anh em cùng cấp `~` để bật/tắt menu hoàn toàn bằng CSS thuần (Pure CSS, không cần JavaScript).
- [x] Sử dụng **Media Query** (`@media (min-width: 768px)`) để chuyển đổi linh hoạt giữa Hamburger Menu xổ dọc và thanh Menu ngang truyền thống.

---

## 2. Ghi Chú Tóm Tắt Các Bước Đã Thực Hiện (Nội Dung Nộp Bài Thực Hành)

### Bước 1: Xây Dựng Cấu Trúc HTML "Thông Minh"
- Tạo tệp `responsive-nav.html` và `index.html`.
- Đặt thẻ `<input type="checkbox" id="menu-toggle" class="menu-toggle">` đóng vai trò là "công tắc" vô hình lưu trữ trạng thái đóng/mở menu.
- Tạo thẻ `<label for="menu-toggle" class="hamburger-menu">` chứa 3 thẻ `<span class="bar">` đại diện cho biểu tượng 3 vạch hamburger (☰). Khi nhấp vào label này, trình duyệt sẽ tự động đảo trạng thái của checkbox.
- Đặt khối điều hướng `<nav class="main-nav">` nằm cùng cấp (sibling) ngay sau checkbox để CSS có thể truy vấn tới.

### Bước 2: Thiết Lập Giao Diện Mobile First
- Header được định dạng Flexbox với logo và icon hamburger nằm ở 2 góc.
- Ẩn hoàn toàn checkbox khỏi giao diện: `.menu-toggle { display: none; }`.
- Định dạng icon hamburger với 3 vạch ngang màu trắng.
- Menu chính `.main-nav` được định vị tuyệt đối `position: absolute; top: 65px; left: 0; width: 100%;` và ẩn ra khỏi khung nhìn bằng `transform: translateY(-150%); transition: transform 0.3s ease;`.

### Bước 3: Cơ Chế Bật/Tắt Menu (Checkbox Hack)
- Khi người dùng nhấp vào icon hamburger, checkbox chuyển sang trạng thái `:checked`.
- CSS kích hoạt quy tắc:
  ```css
  .menu-toggle:checked ~ .main-nav {
    transform: translateY(0); /* Kéo menu trượt xuống mượt mà */
  }
  ```
- Thêm hiệu ứng xoay 3 vạch thành biểu tượng dấu nhân (X) khi menu đang mở.

### Bước 4: Mở Rộng Sang Desktop Bằng Media Query
- Khai báo breakpoint `@media (min-width: 768px)`:
  - Ẩn hoàn toàn icon hamburger: `.hamburger-menu { display: none; }`.
  - Khôi phục `.main-nav` về luồng hiển thị bình thường: `position: static; transform: none; width: auto; background-color: transparent;`.
  - Dàn các mục liên kết thành hàng ngang bằng Flexbox: `.main-nav ul { display: flex; gap: 8px; }`.

---

## 3. Bảng Phân Tích Kỹ Thuật Checkbox Hack

| Thành phần kỹ thuật | Cú pháp CSS | Vai trò & Bản chất hoạt động |
| :--- | :--- | :--- |
| **Công tắc trạng thái** | `<input type="checkbox">` | Giữ trạng thái logic Boolean (True = Mở, False = Đóng) trong DOM mà không cần biến JavaScript. |
| **Vùng kích hoạt** | `<label for="menu-toggle">` | Mở rộng vùng nhấp chuột cho người dùng; kích hoạt thay đổi thuộc tính `checked` của input tương ứng. |
| **Trạng thái kích hoạt** | `:checked` | Pseudo-class bắt thời điểm checkbox được tích chọn. |
| **Bộ chọn anh em** | `~ .main-nav` | General sibling combinator tìm phần tử `.main-nav` cùng cấp đứng sau checkbox để áp dụng kiểu dáng mở menu. |
| **Hiệu ứng trượt** | `transform` & `transition` | Trượt menu mượt mà theo trục Y với hiệu năng phần cứng GPU tối ưu. |

---

## 4. Mã Nguồn Hoàn Chỉnh

### Tệp `responsive-nav.html`
```html
<header class="main-header">
  <a href="#" class="logo">MyBrand</a>

  <input type="checkbox" id="menu-toggle" class="menu-toggle">
  
  <label for="menu-toggle" class="hamburger-menu">
    <span class="bar"></span>
    <span class="bar"></span>
    <span class="bar"></span>
  </label>

  <nav class="main-nav">
    <ul>
      <li><a href="#">Trang chủ</a></li>
      <li><a href="#">Sản phẩm</a></li>
      <li><a href="#">Dịch vụ</a></li>
      <li><a href="#">Liên hệ</a></li>
    </ul>
  </nav>
</header>
```

### Tệp `style.css` (Trích đoạn cốt lõi)
```css
.menu-toggle { display: none; }

.main-nav {
  position: absolute;
  top: 65px;
  left: 0;
  width: 100%;
  background-color: #444;
  transform: translateY(-150%);
  transition: transform 0.3s ease;
}

.menu-toggle:checked ~ .main-nav {
  transform: translateY(0);
}

@media (min-width: 768px) {
  .hamburger-menu { display: none; }
  .main-nav {
    position: static;
    transform: none;
    width: auto;
    background-color: transparent;
  }
  .main-nav ul { display: flex; }
}
```
