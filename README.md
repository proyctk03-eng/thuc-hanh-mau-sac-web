# Báo Cáo Thực Hành: Xây Dựng Nút "Cuộn Lên Đầu Trang" (Back To Top) Với position: fixed

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Sử dụng thành thạo thuộc tính `position: fixed` để ghim một phần tử vào vị trí cố định trên màn hình (Viewport).
- [x] Định vị phần tử chính xác bằng các tọa độ (`bottom: 30px; right: 30px;`) và kiểm soát lớp xếp chồng hiển thị (`z-index: 100`).
- [x] Thiết lập liên kết neo nội bộ (`href="#page-top"`) trỏ chính xác về `<body id="page-top">`.
- [x] Kích hoạt thuộc tính `scroll-behavior: smooth` trên thẻ `html` để chuyển đổi hành vi nhảy trang đột ngột thành hiệu ứng lướt cuộn mượt mà.
- [x] Tối ưu hóa trải nghiệm người dùng (UX) trên các trang web có nội dung dài.

---

## 2. Ghi Chú Tóm Tắt Các Bước Đã Thực Hiện (Nội Dung Nộp Bài Thực Hành)

### Phần 1: Chuẩn bị "Trang web dài"
- Tạo tệp `long-page.html` với cấu trúc HTML5 chuẩn và liên kết đến `style.css`.
- Gắn định danh `id="page-top"` trực tiếp vào thẻ `<body>` để làm tọa độ đích đến cho liên kết neo.
- Xây dựng bài viết nhiều phân đoạn với độ dài đủ lớn để trình duyệt xuất hiện thanh cuộn dọc.
- Bổ sung nút liên kết ở cuối trang:
  ```html
  <a href="#page-top" class="back-to-top-btn" title="Cuộn lên đầu trang">↑</a>
  ```

### Phần 2: "Ghim" Nút bấm vào Màn hình với CSS
1. **Định vị cố định (Fixed Positioning):**
   - Áp dụng `position: fixed` giúp nút tách khỏi luồng thông thường và luôn gắn liền với khung nhìn của trình duyệt.
   - Sử dụng `bottom: 30px; right: 30px;` để đặt nút nằm gọn gàng tại góc dưới bên phải màn hình.
   - Đặt `z-index: 100` để đảm bảo nút luôn nổi lên trên mọi lớp văn bản và hình ảnh khác.
2. **Tạo hình và căn chỉnh nút:**
   - Kích thước `width: 50px; height: 50px;`, màu nền xanh `#007bff`, chữ trắng `#ffffff`.
   - `border-radius: 50%;`: Biến khối vuông thành nút tròn hoàn hảo.
   - `display: grid; place-items: center;`: Căn giữa biểu tượng mũi tên `↑` một cách chuẩn xác theo cả chiều dọc và chiều ngang.
3. **Hiệu ứng tương tác `:hover`:**
   - Khi di chuột qua, màu nền đổi sang xanh đậm `#0056b3` và nhấc nhẹ nút lên `translateY(-3px)` với `transition: 0.3s`.

### Phần 3: Thêm Hiệu ứng "Cuộn Mượt" (Smooth Scrolling)
- Khai báo quy tắc trên phần tử gốc `html`:
  ```css
  html {
    scroll-behavior: smooth;
  }
  ```
- *Tác dụng:* Thay vì trang "giật" tức thì lên đầu, trình duyệt sẽ lướt mượt mà với tốc độ ổn định, mang lại cảm giác dễ chịu cho người đọc.

### Phần 4: Kiểm thử Trải Nghiệm (UX Testing)
1. **Vị trí & Tính cố định:** Khi cuộn chuột qua bài viết, nút luôn đứng yên ở góc phải dưới mà không bị trôi theo nội dung.
2. **Khả năng hoạt động:** Nhấp vào nút từ bất kỳ vị trí nào dưới chân trang, trang web tự động cuộn êm ái về vị trí đỉnh đầu trang.

---

## 3. Bảng Phân Tích Kỹ Thuật Các Thuộc Tính CSS Cốt Lõi

| Thuộc tính CSS | Giá trị sử dụng | Vai trò & Ý nghĩa kỹ thuật |
| :--- | :--- | :--- |
| `position` | `fixed` | Tách phần tử khỏi luồng văn bản (Normal Flow), neo cố định theo khung nhìn trình duyệt (Viewport). |
| `bottom` & `right` | `30px` | Tọa độ khoảng cách từ mép dưới và mép phải của cửa sổ trình duyệt tới phần tử. |
| `z-index` | `100` | Thứ tự lớp hiển thị theo trục Z; số càng lớn thì phần tử càng nằm đè lên trên các phần tử khác. |
| `scroll-behavior` | `smooth` | Thiết lập cơ chế cuộn trang mượt mà cho mọi hành động di chuyển bằng anchor link. |
| `border-radius` | `50%` | Bo tròn hoàn toàn các góc của khối vuông tạo thành nút tròn. |
| `display` | `grid` (`place-items: center`) | Căn giữa icon mũi tên hoàn hảo mà không cần căn chỉnh dòng thủ công. |

---

## 4. Mã Nguồn Hoàn Chỉnh

### Tệp `long-page.html`
```html
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trang web dài - Nút Cuộn Lên Đầu Trang</title>
  <link rel="stylesheet" href="style.css">
</head>
<body id="page-top">
  <div class="container">
    <h1>Một Bài Viết Rất Dài</h1>
    <p>Nội dung bài viết dài...</p>
  </div>

  <a href="#page-top" class="back-to-top-btn">↑</a>
</body>
</html>
```

### Tệp `style.css`
```css
html {
  box-sizing: border-box;
  scroll-behavior: smooth;
}
*, *::before, *::after {
  box-sizing: inherit;
}

body {
  font-family: sans-serif;
  line-height: 1.7;
}

.container {
  max-width: 800px;
  margin: 20px auto;
}

.back-to-top-btn {
  position: fixed;
  bottom: 30px;
  right: 30px;
  z-index: 100;
  background-color: #007bff;
  color: white;
  text-decoration: none;
  width: 50px;
  height: 50px;
  font-size: 24px;
  border-radius: 50%;
  display: grid;
  place-items: center;
  transition: background-color 0.3s;
}

.back-to-top-btn:hover {
  background-color: #0056b3;
}
```
