# [Bài tập] Tạo gallery đơn giản sử dụng RWD

Dự án bài tập thực hành xây dựng thư viện ảnh responsive (Responsive Image Gallery) sử dụng **CSS Media Queries** theo bản mẫu CodeGym.

---

## 📌 1. Mục tiêu bài tập
- Luyện tập sử dụng Media Query để thay đổi bố cục linh hoạt theo kích thước màn hình.
- Đáp ứng chính xác 3 điều kiện:
  - Màn hình rộng $> 700px$: Hiển thị **4 ảnh trên cùng một dòng** (`width: 24.99999%`).
  - Màn hình $\le 700px$: Hiển thị **2 ảnh trên cùng một dòng** (`width: 49.99999%`).
  - Màn hình $\le 500px$: Hiển thị **1 ảnh trên một dòng** (`width: 100%`).

---

## 📂 2. Cấu trúc thư mục

```text
gallery_rwd/
├── index.html       # File HTML chứa cấu trúc tiêu đề, 4 khối responsive gallery và mô tả
├── style.css        # File CSS cấu hình Media Query 700px và 500px, clearfix và hover effects
└── README.md        # Tài liệu hướng dẫn bài tập
```

---

## 🚀 3. Hướng dẫn chạy và kiểm tra
Mở file `index.html` trong trình duyệt và thay đổi kích thước cửa sổ (hoặc mở chế độ F12 Device Mode) để kiểm tra:
- Desktop (> 700px): 4 cột.
- Tablet (501px - 700px): 2 cột.
- Mobile (<= 500px): 1 cột xếp chồng.
