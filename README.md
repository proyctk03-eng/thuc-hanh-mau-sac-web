# [Bài tập] Nhúng CSS Vào Trang HTML

## 📌 Mục Tiêu & Tổng Quan

Bài tập này hướng dẫn cách nhúng định kiểu **CSS (Cascading Style Sheets)** vào tài liệu HTML thông qua 3 phương pháp tiêu chuẩn:
1. **Inline Style** (Định kiểu nội dòng)
2. **Internal Style** (Định kiểu nội bộ trong trang)
3. **External Style** (Định kiểu tệp rời bên ngoài)

Dự án cung cấp cả 3 tệp HTML độc lập tương ứng với 3 phần bài tập, cùng một trang điều khiển trung tâm [**`index.html`**](file:///C:/Users/dathao/Downloads/nhung_css_vao_trang_html/index.html) đối chiếu trực quan 3 phương pháp song song.

---

## 📂 Cấu Trúc Mã Nguồn

```text
nhung_css_vao_trang_html/
├── index.html           # Trang tổng quan so sánh trực quan cả 3 phương pháp
├── part1_inline.html    # Phần 1: Sử dụng Inline-style
├── part2_internal.html  # Phần 2: Sử dụng Internal-style
├── part3_external.html  # Phần 3: Sử dụng External-style
├── style.css            # Tệp CSS rời phục vụ Phần 3
└── README.md            # Tài liệu phân tích và hướng dẫn chi tiết
```

---

## 🔬 Chi Tiết 3 Phương Pháp Nhúng CSS

### 1. Phần 1: Inline Style (Nội dòng)
- **Vị trí**: Đặt trực tiếp trong thuộc tính `style` của thẻ HTML cần định dạng.
- **Cú pháp minh họa**:
  ```html
  <h1 style="color: #1D4ED8;">Tiêu Đề Trang Web (Inline Style)</h1>
  <p style="color: #0369A1;">Đoạn văn bản định dạng màu xanh lam đậm.</p>
  ```
- **Đặc điểm**:
  - Có độ ưu tiên cao nhất trong 3 phương pháp (chỉ chịu thua `!important`).
  - *Nhược điểm*: Khiến mã nguồn HTML cồng kềnh, không thể tái sử dụng định kiểu cho nhiều thẻ giống nhau, vi phạm nguyên tắc tách biệt giữa dữ liệu và giao diện.

---

### 2. Phần 2: Internal Style (Nội bộ)
- **Vị trí**: Đặt trong cặp thẻ `<style> ... </style>` nằm ở phần `<head>` của trang HTML.
- **Cú pháp minh họa**:
  ```html
  <head>
      <style>
          h1 {
              color: #15803D; /* Xanh lá cây đậm Forest Green */
          }
          p {
              color: #047857; /* Xanh lục bảo Emerald */
          }
      </style>
  </head>
  <body>
      <h1>Tiêu Đề Trang Web (Internal Style)</h1>
      <p>Đoạn văn bản định dạng màu xanh lá.</p>
  </body>
  ```
- **Đặc điểm**:
  - Áp dụng đồng bộ cho tất cả các thẻ `h1`, `p` trong cùng một tài liệu HTML.
  - Phù hợp khi thiết kế landing page 1 trang hoặc email marketing.
  - *Nhược điểm*: Không thể chia sẻ bộ định kiểu này sang các trang HTML khác trong cùng website.

---

### 3. Phần 3: External Style (Tệp rời bên ngoài)
- **Vị trí**: Viết toàn bộ mã CSS vào tệp độc lập có phần mở rộng `.css` (ví dụ: `style.css`), sau đó liên kết vào HTML bằng thẻ `<link>` đặt ở `<head>`.
- **Cú pháp minh họa**:
  - Trong file `style.css`:
    ```css
    h1 {
        color: #7E22CE; /* Tím hoàng gia Purple */
    }
    p {
        color: #9333EA; /* Tím hoa cà Lavender */
    }
    ```
  - Trong file `part3_external.html`:
    ```html
    <head>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Tiêu Đề Trang Web (External Style)</h1>
        <p>Đoạn văn bản định dạng màu tím hoàng gia.</p>
    </body>
    ```
- **Đặc điểm**:
  - **Tiêu chuẩn vàng trong ngành web**: Tách biệt hoàn toàn giữa cấu trúc (HTML) và thẩm mỹ (CSS).
  - Tái sử dụng được trên hàng ngàn trang của hệ thống, giúp bảo trì tập trung nhanh chóng.
  - Tận dụng cơ chế Browser Caching (trình duyệt lưu đệm file CSS) giúp tăng tốc độ tải trang đáng kể.

---

## 📊 Bảng So Sánh Toàn Diện 3 Phương Pháp

| Tiêu chí | Inline Style | Internal Style | External Style |
| :--- | :--- | :--- | :--- |
| **Vị trí đặt code** | Thuộc tính `style="..."` trong thẻ | Thẻ `<style>` bên trong `<head>` | Tệp `.css` riêng biệt liên kết qua `<link>` |
| **Độ ưu tiên (Cascade)** | **Rất cao** (Ghi đè Internal & External) | **Trung bình** (Quy tắc sau ghi đè quy tắc trước) | **Trung bình** (Quy tắc sau ghi đè quy tắc trước) |
| **Khả năng tái sử dụng** | Rất thấp (Chỉ 1 phần tử duy nhất) | Trung bình (Tất cả phần tử trong 1 trang) | **Tối ưu nhất** (Mọi trang trong toàn hệ thống) |
| **Bảo trì dự án** | Khó khăn, dễ sinh lỗi | Chỉ thuận tiện cho dự án 1 trang | **Dễ dàng, thay đổi 1 nơi tác động toàn site** |
| **Hiệu năng & Caching** | Không thể cache | Không thể cache riêng | **Được trình duyệt lưu bộ nhớ đệm (Cache)** |
| **Khuyến nghị thực tế** | Hạn chế tối đa (trừ email HTML / dynamic JS style) | Dùng cho single page thử nghiệm | **Bắt buộc cho dự án thực tế tiêu chuẩn** |

---

## 🚀 Hướng Dẫn Mở & Xem Trang Web

Bạn có thể mở trực tiếp bất kỳ tệp HTML nào bằng trình duyệt web (Chrome, Edge, Firefox):
1. Mở trang tổng quan: `index.html` để trải nghiệm giao diện so sánh trực quan.
2. Mở từng phần riêng biệt:
   - `part1_inline.html`
   - `part2_internal.html`
   - `part3_external.html`
