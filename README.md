# [Thực hành] Tạo thanh điều hướng responsive (Responsive Navbar)

Bài thực hành xây dựng thanh điều hướng (navbar) đáp ứng chuẩn mực kết hợp **HTML**, **CSS (Flexbox, Media Queries)** và **JavaScript**.

---

## 📌 1. Mục tiêu bài thực hành
- Sử dụng **Flexbox** để căn chỉnh logo và menu liên kết nằm ngang trên desktop.
- Sử dụng **Media Queries (`@media (max-width: 768px)`)** để ẩn menu ngang và hiển thị biểu tượng hamburger (`☰`) trên mobile.
- Sử dụng **JavaScript** để lắng nghe sự kiện click vào biểu tượng menu và bật/tắt (toggle) lớp `.active` mở menu dạng cột dọc.

---

## 📂 2. Cấu trúc thư mục

```text
responsive_navbar/
├── index.html       # Cấu trúc HTML chứa logo, nav-links và menu-icon
├── style.css        # Định dạng Flexbox, vị trí tuyệt đối cho mobile menu và class .active
├── script.js        # Xử lý sự kiện click toggle class active
└── README.md        # Hướng dẫn và tài liệu dự án
```

---

## 🚀 3. Hướng dẫn chạy và kiểm tra
1. Mở file `index.html` trong trình duyệt.
2. Trên màn hình Desktop: Menu hiển thị nằm ngang.
3. Thu nhỏ cửa sổ trình duyệt xuống dưới `768px`: Menu ngang tự động ẩn và xuất hiện biểu tượng `☰`.
4. Nhấn vào biểu tượng `☰`: Menu xổ dọc xuống mượt mà.
