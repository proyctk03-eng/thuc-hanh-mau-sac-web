# Báo Cáo Thực Hành: "Mổ Xẻ" Trang Web Bằng Developer Tools

## 1. Giới Thiệu & Mục Tiêu Bài Thực Hành
- **Mục tiêu:**
  - Mở và điều hướng thành thạo trong **Developer Tools (DevTools)** của các trình duyệt hiện đại (Google Chrome, Microsoft Edge, Mozilla Firefox).
  - Kiểm tra (**Inspect**) và định vị chính xác cấu trúc cây DOM HTML của từng phần tử trên trang web.
  - Xem và thử nghiệm trực tiếp (**Live Edit**) các thuộc tính CSS (màu sắc, kích thước, khoảng cách, font chữ, hiệu ứng hover).
  - Sử dụng chế độ **Device Toolbar** để mô phỏng hiển thị trên các thiết bị di động (Smartphones, Tablets), phân tích hành vi thiết kế đáp ứng (**Responsive Web Design**).

---

## 2. Các Bước Thao Tác Chi Tiết

### Bước 1: Mở và Điều Hướng Developer Tools
- **Cách 1 (Phím tắt):**
  - Windows/Linux: Bấm `F12` hoặc tổ hợp `Ctrl + Shift + I`.
  - macOS: Bấm `Cmd + Option + I`.
- **Cách 2 (Menu ngữ cảnh):**
  - Click chuột phải vào bất kỳ phần tử nào trên trang web -> Chọn **Inspect** (Kiểm tra).
- **Các tab chính trong DevTools:**
  - `Elements`: Hiển thị cây DOM HTML và bảng Styles CSS.
  - `Console`: Xem log JavaScript và chạy thử nghiệm các lệnh script.
  - `Network`: Theo dõi các request HTTP/HTTPS (tải ảnh, file CSS, API, script).
  - `Application / Storage`: Kiểm tra LocalStorage, SessionStorage, Cookies.

---

### Bước 2: Khám Phá & Chỉnh Sửa Mã HTML
1. Dùng công cụ chọn phần tử (biểu tượng con trỏ góc trái trên cùng của DevTools: `Ctrl + Shift + C` / `Cmd + Shift + C`).
2. Di chuột và click vào phần tử tiêu đề `<h1>` (`Khám Phá Thế Giới Ngầm Của Trang Web`):
   - Cây DOM sẽ tự động highlight thẻ `<h1 id="hero-title" class="hero-title">`.
3. **Thử nghiệm chỉnh sửa nội dung:**
   - Nhấp đúp chuột trực tiếp vào phần văn bản bên trong thẻ `<h1>`.
   - Sửa nội dung thành: *"Trang Web Đã Được Thám Tử Mổ Xẻ Thành Công!"*.
   - Nhấn `Enter` -> Nội dung trên giao diện trang web lập tức thay đổi theo thời gian thực mà không cần tải lại trang.
4. **Nhận xét:** Các thay đổi trên chỉ diễn ra tạm thời trên bộ nhớ RAM của trình duyệt khách (Client-side), không làm thay đổi tệp mã nguồn gốc trên máy chủ (Server-side).

---

### Bước 3: Xem & Thử Nghiệm Thuộc Tính CSS (Styles Pane)
1. Chọn phần tử khối thử nghiệm `#css-target-box`.
2. Quan sát khung bên phải tab **Styles**:
   - Quy tắc hiện tại:
     ```css
     .css-demo-target {
         background: linear-gradient(135deg, #1e293b, #0f172a);
         color: #ffffff;
         padding: 20px;
         border-radius: 12px;
         border: 2px solid #3b82f6;
     }
     ```
3. **Thao tác thử nghiệm:**
   - **Bật/tắt thuộc tính:** Bỏ tích checkbox cạnh `border: 2px solid #3b82f6` -> Khung viền màu xanh lập tức biến mất.
   - **Đổi màu sắc:** Nhấp chuột vào ô màu (color picker) cạnh giá trị hoặc sửa trực tiếp giá trị thành `background: #dc2626;` (đỏ tươi).
   - **Thay đổi Box Model:** Chuyển sang tab phụ **Computed** để quan sát sơ đồ hộp trực quan:
     - Margin: `10px 0`
     - Border: `2px`
     - Padding: `20px`
     - Content (Width x Height)

---

### Bước 4: Mô Phỏng Hiển Thị Trên Thiết Bị Di Động (Device Mode)
1. Bật công cụ mô phỏng thiết bị: Click vào biểu tượng **Toggle device toolbar** hoặc phím tắt `Ctrl + Shift + M` (`Cmd + Shift + M`).
2. Chọn thiết bị thử nghiệm từ danh sách thả xuống:
   - **iPhone 12 Pro (390 x 844)**
   - **Samsung Galaxy S20 Ultra (412 x 915)**
   - **iPad Air (820 x 1180)**
3. **Quan sát phản ứng của giao diện:**
   - Khi chiều rộng màn hình thu nhỏ xuống dưới `768px`, quy tắc Media Query `@media (max-width: 768px)` được kích hoạt.
   - Thanh Menu (`.nav-links`) tự động bẻ dòng và căn giữa.
   - Lưới 4 thẻ (`.grid-container`) chuyển đổi từ dạng 2 cột (`grid-template-columns: repeat(2, 1fr)`) thành dạng 1 cột duy nhất (`grid-template-columns: 1fr`).
   - Kích thước font chữ của `<h1>` tự động thu nhỏ từ `2.5rem` xuống `1.85rem` để tránh tràn màn hình di động.

---

## 3. Trả Lời Các Câu Hỏi Của "Thám Tử"

### 🔎 Câu Hỏi 1: Tìm thẻ `<img>` và thử thay đổi giá trị thuộc tính `src` của nó bằng một đường dẫn ảnh khác. Điều gì xảy ra?
- **Cách thực hiện:**
  - Trong tab Elements, tìm thẻ:
    ```html
    <img id="target-image" class="article-img" src="https://images.unsplash.com/..." alt="...">
    ```
  - Nhấp đúp vào giá trị của thuộc tính `src` và thay bằng URL ảnh khác (ví dụ: `https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=600`).
- **Hiện tượng quan sát được:**
  - Trình duyệt ngay lập tức kích hoạt một request HTTP mới (có thể quan sát trong tab `Network`) để tải tệp ảnh từ URL mới.
  - Ngay sau khi tải xong, khung ảnh trên giao diện được cập nhật tức thì với hình ảnh mới mà trang không hề bị load lại.
  - **Lưu ý:** Nếu nhập vào một URL sai hoặc ảnh bị lỗi 404, trình duyệt sẽ hiển thị biểu tượng "broken image" (ảnh bị gãy) kèm thuộc tính văn bản thay thế `alt`.

---

### 🔎 Câu Hỏi 2: Bạn có thể tìm thấy thuộc tính CSS nào quy định màu sắc của các liên kết trên trang web không?
- **Thuộc tính CSS xác định:**
  - Thuộc tính quy định màu sắc của các liên kết (`<a>`) là:
    ```css
    color: var(--link-color); /* hoặc mã màu cụ thể như #0284c7 */
    ```
- **Các trạng thái liên quan của thẻ `<a>`:**
  - Trạng thái mặc định: `a { color: #0284c7; text-decoration: underline; }`
  - Trạng thái khi di chuột qua: `a:hover { color: #0369a1; text-decoration: none; }`
  - Trạng thái đã từng nhấp qua: `a:visited { color: #7c3aed; }`
  - Trạng thái khi đang click giữ: `a:active { color: #b91c1c; }`

---

### 🔎 Câu Hỏi 3: So sánh giao diện khi xem ở chế độ Desktop và chế độ Mobile. Bạn thấy có những thay đổi nào đáng chú ý?
Bảng so sánh chi tiết:

| Đặc Điểm / Thành Phần | Chế Độ Desktop (Màn hình rộng > 768px) | Chế Độ Mobile (Màn hình nhỏ ≤ 768px) | Cơ Chế CSS Thực Thi |
| :--- | :--- | :--- | :--- |
| **Bố cục chính (Grid Layout)** | Hiển thị dạng lưới **2 cột** song song cân đối. | Tự động chuyển thành **1 cột duy nhất** xếp chồng lên nhau. | `@media (max-width: 768px) { .grid-container { grid-template-columns: 1fr; } }` |
| **Thanh điều hướng (Header/Nav)** | Menu dàn trải theo chiều ngang (`flex-direction: row`), căn đều hai bên. | Header chuyển sang xếp theo cột (`flex-direction: column`), các liên kết tự căn giữa và xuống dòng. | `flex-direction: column; flex-wrap: wrap;` |
| **Kích thước tiêu đề (`<h1>`)** | Font chữ lớn: `2.5rem` (40px) tạo điểm nhấn mạnh mẽ. | Font chữ thu gọn: `1.85rem` (~30px) để không bị vỡ layout trên màn hình hẹp. | `@media (max-width: 768px) { .hero-title { font-size: 1.85rem; } }` |
| **Cụm nút bấm (Action buttons)** | Nằm song song hàng ngang (`flex-direction: row`). | Xếp chồng theo chiều dọc (`flex-direction: column`) với độ rộng tràn màn hình để bấm dễ dàng bằng ngón tay. | `flex-direction: column; align-items: stretch;` |
| **Khoảng cách (Padding & Spacing)** | Padding các khối lớn (`24px` - `50px`) tận dụng không gian rộng. | Padding thu gọn (`16px` - `30px`) để tối ưu hóa không gian hiển thị nội dung. | Giảm `padding` và `gap` trong media query. |

---

## 4. Kết Luận
- Developer Tools là một công cụ phân tích và gỡ lỗi (debugging) cực kỳ mạnh mẽ không thể thiếu của mọi lập trình viên web.
- Nó cho phép kiểm tra trực tiếp DOM, thử nghiệm phong cách CSS mà không sợ làm hỏng mã nguồn gốc, và mô phỏng chính xác giao diện người dùng trên mọi loại thiết bị.
