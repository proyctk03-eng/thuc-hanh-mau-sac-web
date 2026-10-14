# Báo Cáo Thực Hành: "Trang Điểm" Cho Trang "Công Thức Nấu Ăn" Với Màu Sắc & Font Chữ

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Sử dụng thuần thục các bộ chọn CSS cơ bản:
  - **Element Selector:** `body`, `h1, h2`, `table`, `th`, `td`.
  - **ID Selector:** `#recipe-card` (định hình bố cục vùng chứa chính).
  - **Class Selector:** `.highlight` (lớp tiện ích làm nổi bật thông tin quan trọng).
- [x] Thiết lập màu sắc trực quan hài hòa:
  - Màu nền: `background-color: #f8f9fa` (nền trang), `#ffffff` (nền thẻ công thức), `#ecf0f1` (nền tiêu đề bảng).
  - Màu chữ: `color: #333` (văn bản mặc định), `#c0392b` (tiêu đề đỏ đậm), `#e67e22` (cam nổi bật).
- [x] Tối ưu hóa chữ viết (Typography):
  - Font chữ có chân `font-family: "Georgia", serif` cho tiêu đề trang trọng.
  - Font chữ không chân `font-family: Arial, Helvetica, sans-serif` cùng `line-height: 1.6` cho văn bản dễ đọc.
  - Căn chỉnh văn bản `text-align: center`, kích thước `font-size: 2.5rem`, `font-size: 1.8rem`, độ đậm `font-weight: bold`.
- [x] Phân chia tệp tin mã nguồn chuẩn hóa: `recipe.html`, `style.css` và `README.md`.

---

## 2. Tóm Tắt Các Bước Đã Thực Hiện (Nội Dung Nộp Bài Thực Hành)

### Phần 1: Thiết lập Phong cách Tổng thể
1. **Định dạng cho thẻ `<body>`:**
   - Đặt font chữ không chân phổ biến `font-family: Arial, Helvetica, sans-serif`.
   - Giãn cách dòng `line-height: 1.6` giúp mắt đọc thoải mái.
   - Thiết lập màu nền xám nhạt dịu mắt `#f8f9fa` và màu chữ mặc định `#333`.
2. **Định hình thẻ bao bọc chính `#recipe-card`:**
   - Thêm `id="recipe-card"` vào thẻ `<article>` trong `recipe.html`.
   - Giới hạn độ rộng tối đa `width: 800px` và căn giữa tự động với `margin: 40px auto`.
   - Đổ màu nền trắng `#ffffff` và đệm khoảng trống bên trong `padding: 30px` tạo hiệu ứng tấm card nổi bật.

### Phần 2: Trang điểm cho các Phần tử cụ thể
1. **Tạo điểm nhấn cho Tiêu đề (`<h1>`, `<h2>`):**
   - Dùng bộ chọn gộp `h1, h2` để áp dụng font chữ nghệ thuật `Georgia, serif` và màu đỏ đun đặc trưng của món sốt vang `#c0392b`.
   - Thẻ `<h1>` được căn giữa (`text-align: center`) và tăng kích thước lên `2.5rem`.
   - Thẻ `<h2>` được bổ sung đường viền chân trang trí màu vàng ấm `border-bottom: 2px solid #f1c40f` cùng `padding-bottom: 5px`.
2. **Tạo lớp tiện ích `.highlight`:**
   - Thiết lập `color: #e67e22` (màu cam cà rốt/rượu vang) và `font-weight: bold`.
   - Gắn `class="highlight"` vào các ô `<td>` nguyên liệu then chốt (*Thịt bò*, *500g*, *Rượu vang đỏ*) và đoạn mẹo vặt nấu ăn.
3. **Định dạng Bảng Nguyên liệu (`<table>`):**
   - Đặt `width: 100%` để bảng trải đều theo thẻ cha.
   - Căn lề trái `text-align: left` và phủ nền xám trang nhã `#ecf0f1` cho hàng tiêu đề `<th>`.
   - Thêm khoảng đệm `padding: 10px 12px` cho các ô `<th>`, `<td>` giúp dữ liệu thông thoáng, chuyên nghiệp.

---

## 3. Bảng Tổng Hợp Các Bộ Chọn & Thuộc Tính CSS Sử Dụng

| Bộ chọn CSS | Loại bộ chọn | Thuộc tính chính áp dụng | Ý nghĩa giao diện |
| :--- | :--- | :--- | :--- |
| `body` | Element | `font-family`, `line-height`, `background-color`, `color` | Thiết lập nền tảng kiểu dáng toàn trang web. |
| `#recipe-card` | ID | `width: 800px`, `margin: 40px auto`, `background-color: #ffffff`, `padding: 30px` | Tạo khung chứa dạng thẻ (Card) căn giữa màn hình. |
| `h1, h2` | Group Element | `font-family: "Georgia", serif`, `color: #c0392b` | Đồng bộ phong cách font có chân cổ điển và màu đỏ ấm. |
| `h1` | Element | `text-align: center`, `font-size: 2.5rem` | Tiêu đề chính to, nổi bật ngay giữa trang. |
| `h2` | Element | `font-size: 1.8rem`, `border-bottom: 2px solid #f1c40f` | Tiêu đề mục có đường kẻ nhấn màu vàng sang trọng. |
| `.highlight` | Class | `color: #e67e22`, `font-weight: bold` | Làm nổi bật các từ khóa nguyên liệu quan trọng. |
| `table`, `th`, `td`| Element | `width: 100%`, `background-color: #ecf0f1`, `padding` | Bảng nguyên liệu gọn gàng, rõ ràng, dễ theo dõi. |

---

## 4. Mã Nguồn Tham Khảo

### Tệp `style.css`
```css
/* --- Phong cách chung --- */
body {
  font-family: Arial, Helvetica, sans-serif;
  line-height: 1.6;
  background-color: #f8f9fa;
  color: #333;
}

/* --- Bố cục chính --- */
#recipe-card {
  width: 800px;
  margin: 40px auto;
  background-color: #ffffff;
  padding: 30px;
}

/* --- Chữ viết (Typography) --- */
h1, h2 {
  font-family: "Georgia", serif;
  color: #c0392b;
}

h1 {
  text-align: center;
  font-size: 2.5rem;
}

h2 {
  font-size: 1.8rem;
  border-bottom: 2px solid #f1c40f;
  padding-bottom: 5px;
}

/* --- Bảng biểu --- */
table {
  width: 100%;
}

th {
  text-align: left;
  background-color: #ecf0f1;
  padding: 8px;
}

td {
  padding: 8px;
}

/* --- Tiện ích --- */
.highlight {
  color: #e67e22;
  font-weight: bold;
}
```
