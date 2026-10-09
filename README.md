# [Bài tập] Xây dựng Landing Page Microsoft Surface (Bootstrap 5)

Dự án hoàn thành bài tập xây dựng **Landing Page Microsoft Surface** theo chuẩn trang chủ chính thức của Microsoft Store ([https://www.microsoft.com/en-us/store/b/surface](https://www.microsoft.com/en-us/store/b/surface)) sử dụng **Bootstrap 5.3.3**, tuân thủ nguyên tắc tối đa hóa các thành phần của Bootstrap và tối thiểu hóa custom CSS.

---

## 📌 1. Mục tiêu bài tập
- **Luyện tập sử dụng các thành phần của Bootstrap:** Navbar, Carousel, Cards, Grid System, Accordion, Badges, Buttons, Utilities.
- **Tận dụng tối đa Bootstrap:** Hạn chế viết CSS mới, ưu tiên sử dụng utility classes (`d-flex`, `py-*`, `shadow-sm`, `rounded-4`, `bg-gradient`, `text-muted`, etc.).
- **Đáp ứng Responsive:** Hoạt động mượt mà trên mọi thiết bị: Desktop (1200px+), Tablet (768px - 991px), và Mobile (<768px).

---

## 🎨 2. Cấu trúc các thành phần (Bootstrap Components)

| Thành phần | Bootstrap Component & Class | Mô tả chức năng |
| :--- | :--- | :--- |
| **1. Announcement Bar** | `bg-primary`, `badge`, `d-flex` | Thanh thông báo khuyến mãi đầu trang với badge và liên kết nhanh. |
| **2. Main Navigation** | `navbar navbar-expand-lg`, `sticky-top`, `input-group` | Thanh điều hướng dính đầu trang, responsive hamburger menu, thanh tìm kiếm và giỏ hàng. |
| **3. Hero Carousel** | `carousel slide carousel-fade`, `carousel-inner`, `carousel-indicators` | Trình chiếu 3 dòng sản phẩm chủ lực: Surface Pro 9, Surface Laptop 5, và Laptop Studio 2. |
| **4. Category Quick Nav** | `row-cols-2 row-cols-md-3 row-cols-lg-6`, `card`, `shadow-sm` | Lưới 6 danh mục sản phẩm trực quan với icon và màu nền thương hiệu. |
| **5. Featured Products** | `row g-4`, `col-12 col-md-6 col-lg-3`, `card h-100` | Lưới 4 cột hiển thị các dòng máy kèm tag NEW, SAVE $200, cấu hình và nút đặt mua. |
| **6. Value Proposition** | `row g-4`, `col-12 col-md-6 col-lg-3` | 4 cột giới thiệu lợi ích mua hàng: Giao hàng miễn phí, đổi trả 60 ngày, trả góp 0%, hỗ trợ kỹ thuật 90 ngày. |
| **7. Surface for Business** | `row align-items-center`, `bg-dark text-white` | Khối giới thiệu giải pháp doanh nghiệp Secured-core PC và triển khai đám mây Intune. |
| **8. FAQ Accordion** | `accordion`, `accordion-item`, `collapse` | Khối câu hỏi thường gặp với hiệu ứng đóng/mở mượt mà không cần viết thêm JS. |
| **9. Microsoft Footer** | `row g-4`, `col-6 col-md-4 col-lg-2`, `bg-dark` | Chân trang 6 cột phân cấp liên kết chuẩn Microsoft và thanh bản quyền, ngôn ngữ. |

---

## 📂 3. Cấu trúc thư mục

```text
landing_page_surface/
├── index.html       # Mã nguồn HTML5 tích hợp đầy đủ Bootstrap 5.3.3 và Bootstrap Icons
├── styles.css       # File CSS tối giản bổ sung font chữ và gradient background
└── README.md        # Tài liệu hướng dẫn và mô tả bài tập
```

---

## 🚀 4. Hướng dẫn chạy và xem trực tiếp

1. Mở trực tiếp file `index.html` trong trình duyệt web bất kỳ (Chrome, Edge, Firefox).
2. Hoặc sử dụng extension **Live Server** trong VS Code / IDE.
3. Toàn bộ thư viện CDN (Bootstrap 5 CSS, Bootstrap Icons, Google Fonts, Bootstrap JS) được nhúng qua CDN tốc độ cao, không cần cài đặt thêm dependency.
