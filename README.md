# 🎨 CreativeChronicle - Thoát Khỏi Cơn Ác Mộng "Float" và "Position"

> **Dự án Frontend UI Modernization:** Nâng cấp và tái cấu trúc giao diện trang chi tiết bài viết của tạp chí nghệ thuật cao cấp **"CreativeChronicle"**, xóa sạch toàn bộ mã nguồn cổ điển (float, position: absolute) 10 năm trước và thay thế bằng bộ ba quyền lực: **Flexbox (1D)**, **CSS Grid (2D)** và **Bootstrap 5 Grid System**.

---

## 📌 1. Bối cảnh & 3 Điểm Chết Đã Khắc Phục Triệt Để

| STT | Khu Vực | Kỹ Thuật Legacy Lỗi Thời | Hiện Tượng Lỗi Cũ | Kỹ Thuật Tái Cấu Trúc Hiện Đại | Kết Quả Đạt Được |
| :---: | :--- | :--- | :--- | :--- | :--- |
| **1** | **Author Meta-info** | `float: left`, `float: right`, `overflow: hidden` | Không thể căn giữa dọc; tên dài làm lệch hàng; nút Share bị đẩy vỡ khung. | **Modern Flexbox (1D):** `display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap;` | Căn giữa dọc tuyệt đối; tự động dạt 2 biên; responsive bẻ dòng mượt mà trên mobile. |
| **2** | **Mosaic Gallery** | `position: absolute`, `height: 400px` cứng | Tách khỏi Normal Flow; ảnh đè bẹp lên nhau trên mobile; văn bản bài viết trồi lên che khuất ảnh. | **CSS Grid (2D):** `grid-template-columns: 2fr 1fr; grid-template-areas: "main sub1" "main sub2";` | Bảo toàn Normal Flow; tự động tính chiều cao; chuyển 1 cột trên mobile; không đè lấn text. |
| **3** | **Recommended Articles** | `float: left`, `width: 23%`, `margin: 1%` | Không có breakpoints; màn hình iPad/Tablet hơi co lại là thẻ thứ 4 bị rớt dòng méo mó. | **Bootstrap 5 Grid:** `<div class="row g-4">` + `<div class="col-12 col-md-6 col-lg-3">` | Desktop 4 thẻ, Tablet 2 thẻ/hàng, Mobile 1 thẻ xếp chồng chuẩn xác theo chuẩn 12 cột. |

---

## 📂 2. Cấu Trúc Thư Mục Đồ Án

```text
creative_chronicle/
├── magazine.html          # Trang bài viết chính thức đã được tái cấu trúc hoàn hảo
├── index.html             # Bản sao root tiện dụng cho Live Server và GitHub Pages preview
├── styles.css             # Stylesheet phong cách tạp chí nghệ thuật cao cấp, không dùng float
├── layout_refactoring.md  # Báo cáo phân tích tác hại position: absolute & vấn đáp Art Director
├── ai_prompt_log.md       # Nhật ký tra cứu kỹ thuật Grid, Flexbox và Bootstrap utilities với AI
└── README.md              # Tài liệu tổng quan và hướng dẫn kiểm thử dự án
```

---

## 🌟 3. Tính Năng Nổi Bật

1. **Bộ Ba Dàn Trang Chuẩn Mực Hiện Đại:**
   - **Flexbox cho Trục 1D:** Căn chỉnh danh tính tác giả và nút chia sẻ.
   - **CSS Grid cho Lưới 2D Bất Đối Xứng:** Thư viện ảnh Mosaic Gallery với `object-fit: cover` nghệ thuật.
   - **Bootstrap 5 cho Multi-breakpoint Grid:** Danh sách bài viết đề xuất co giãn tự động.
2. **Nút Chuyển Đổi Trực Quan (Interactive Toggle Toolbar):**
   - Tích hợp nút **"Xem lại Legacy Mode"** ngay đầu trang giúp Giám đốc Nghệ thuật (Art Director) và Giảng viên đối chiếu trực tiếp sự khác biệt giữa giao diện lỗi ngày xưa và giao diện hoàn hảo hôm nay.
3. **Typography Tạp Chí Nghệ Thuật Quốc Tế:**
   - Sử dụng phông chữ cao cấp `Playfair Display` (Serif tiêu đề) kết hợp `Plus Jakarta Sans` (Nội dung) và drop-cap chữ cái đầu bài.

---

## 🧪 4. Hướng Dẫn Kiểm Thử UI (Stress Test UI)

- **Desktop ($\ge 1200px$):**
  - Thanh tác giả căn giữa dọc hoàn hảo; nút Share nằm sát lề phải.
  - Mosaic Gallery: 1 ảnh lớn bên trái chiếm 2/3, 2 ảnh nhỏ xếp chồng bên phải chiếm 1/3.
  - Recommended Articles: 4 thẻ bài viết nằm thẳng hàng trên cùng 1 hàng.
- **Tablet ($768px - 991px$):**
  - Mosaic Gallery tự động co dãn tỷ lệ mà không vỡ.
  - Recommended Articles: Tự động gập thành 2 hàng, mỗi hàng đúng 2 thẻ cân đối (`col-md-6`).
- **Mobile ($375px$):**
  - Thanh tác giả tự động rớt cụm nút Share xuống dòng dưới (`flex-wrap: wrap`).
  - Mosaic Gallery chuyển thành 1 cột dọc (`grid-template-columns: 1fr`), từng ảnh xếp ngay ngắn.
  - Đoạn văn bản nội dung bài viết bên dưới giữ nguyên khoảng cách, **hoàn toàn không bị đè lấn**.
  - Recommended Articles xếp chồng 1 cột (`col-12`).
