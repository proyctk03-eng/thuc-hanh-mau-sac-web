# Báo Cáo Thực Hành: Tạo Hiệu Ứng Tương Tác Cho Nút Bấm Với :hover & transition

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Biến đổi một phần tử liên kết nội tuyến `<a>` thành một nút bấm (Button) hiện đại với `display: inline-block`.
- [x] Áp dụng lớp giả (pseudo-class) `:hover` để cung cấp phản hồi thị giác tức thì khi người dùng tương tác.
- [x] Khai thác thuộc tính `transition` để làm mềm các thay đổi thuộc tính CSS, tạo cảm giác mượt mà và chuyên nghiệp.
- [x] Hoàn thành Thử thách nâng cao (Optional Challenge): Kết hợp `transform: translateY(-3px)` và `box-shadow` tạo hiệu ứng nút nổi 3D khi di chuột.

---

## 2. Ghi Chú Tóm Tắt Các Bước Đã Thực Hiện (Nội Dung Nộp Bài Thực Hành)

### Phần 1: Chuẩn bị "Nút bấm"
- Tạo tệp `hover-button.html` với cấu trúc HTML5 chuẩn và liên kết đến `style.css`.
- Tạo phần tử nút bấm bằng thẻ liên kết: `<a href="#" class="btn">Khám phá ngay</a>`.

### Phần 2: Định dạng Trạng thái Tĩnh (Default State)
1. **Thiết lập môi trường hiển thị:**
   - Sử dụng CSS Grid trên `body`: `display: grid; place-items: center; height: 100vh;` giúp căn giữa nút bấm hoàn hảo theo cả 2 trục.
2. **Quy tắc cho lớp `.btn`:**
   - `display: inline-block;`: Chuyển đổi thẻ `<a>` từ inline sang inline-block để phần tử chấp nhận đầy đủ `padding`, `margin` và kích thước.
   - `background-color: #3498db;` & `color: #ffffff;`: Tông xanh dương hiện đại cùng chữ trắng nổi bật.
   - `padding: 15px 30px;`: Vùng đệm 15px trên/dưới và 30px trái/phải giúp nút bấm cân đối, dễ chạm bấm.
   - `text-decoration: none;`: Loại bỏ gạch chân mặc định của thẻ siêu liên kết.
   - `border-radius: 8px;`: Bo tròn 4 góc tạo phong cách giao diện mềm mại.

### Phần 3: Thêm "Phép màu" Tương tác với `:hover`
- Khởi tạo quy tắc lớp giả `.btn:hover`.
- Đổi màu nền sang tông xanh đậm hơn: `background-color: #2980b9;`.
- *Hiện tượng quan sát:* Khi di chuột vào nút, màu sắc lập tức đổi sang xanh đậm, tạo tín hiệu nhận diện phần tử tương tác được.

### Phần 4: Tinh chỉnh Sự "Mượt mà" với `transition` & Nâng cao
- Thêm thuộc tính `transition` vào trạng thái mặc định của `.btn`:
  ```css
  transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
  ```
- Ý nghĩa: Trình duyệt sẽ chuyển đổi các thuộc tính này dần dần trong thời gian `0.3s` theo hàm gia tốc mềm `ease` (nhẹ nhàng ở đầu và cuối chuyển động).
- **Thử thách thêm:**
  - Bổ sung `transform: translateY(-3px);` và `box-shadow: 0 8px 15px rgba(41, 128, 185, 0.3);` vào `.btn:hover`.
  - Nút bấm khi di chuột qua sẽ "nhấc" nhẹ lên 3px và tỏa bóng sáng, tạo trải nghiệm tactile (cảm giác nút bấm thực) rất cao cấp.

---

## 3. Bảng Phân Tích Các Thuộc Tính CSS Cốt Lõi

| Thuộc tính CSS | Giá trị sử dụng | Ý nghĩa & Tác dụng |
| :--- | :--- | :--- |
| `display` | `inline-block` | Giúp thẻ `<a>` tuân thủ mô hình hộp (Box Model) về padding, margin và border. |
| `:hover` | Pseudo-class | Lớp giả kích hoạt khi trỏ chuột nằm trong phạm vi hiển thị của phần tử. |
| `transition` | `background-color 0.3s ease, transform 0.3s ease` | Tạo hiệu ứng hoạt ảnh chuyển đổi mượt mà giữa trạng thái thường và hover. |
| `transform` | `translateY(-3px)` | Dịch chuyển vị trí phần tử theo trục tung (Y) lên trên 3 pixel. |
| `box-shadow` | `0 8px 15px rgba(41, 128, 185, 0.3)` | Tạo hiệu ứng bóng đổ mờ ảo, tăng độ sâu thị giác (elevation). |

---

## 4. Mã Nguồn Hoàn Chỉnh

### Tệp `hover-button.html`
```html
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hiệu ứng Hover cho Nút bấm</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container">
    <h1>Khám Phá Hiệu Ứng Nút Bấm :hover</h1>
    <p>Di chuột qua nút bên dưới để trải nghiệm chuyển đổi mượt mà với transition và transform:</p>
    <a href="#" class="btn">Khám phá ngay</a>
  </div>
</body>
</html>
```

### Tệp `style.css`
```css
html {
  box-sizing: border-box;
}
*, *::before, *::after {
  box-sizing: inherit;
}

body {
  display: grid;
  place-items: center;
  height: 100vh;
  margin: 0;
  background-color: #f0f0f0;
}

.btn {
  display: inline-block;
  background-color: #3498db;
  color: #ffffff;
  padding: 15px 30px;
  text-decoration: none;
  font-family: Arial, sans-serif;
  font-size: 18px;
  font-weight: bold;
  border-radius: 8px;
  transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.btn:hover {
  background-color: #2980b9;
  transform: translateY(-3px);
  box-shadow: 0 8px 15px rgba(41, 128, 185, 0.3);
}
```
