# [Bài tập] Tạo Gallery Đơn Giản Sử Dụng Bootstrap

## 📌 Giới Thiệu & Mục Tiêu

Bài tập hướng dẫn kỹ thuật xây dựng thư viện ảnh đáp ứng (**Responsive Image Gallery**) sử dụng hệ thống lưới (**Bootstrap Grid System**) và các lớp tiện ích (*Utility Classes*) của **Bootstrap 5.3**, mô phỏng theo bản mẫu chuẩn của CodeGym.

### 🎯 Mục tiêu bài học:
- **Làm chủ hệ thống lưới 12 cột của Bootstrap**: Sử dụng kết hợp các lớp `container`, `row`, `col-12`, `col-sm-6`, `col-lg-3`.
- **Phân chia số lượng cột chính xác theo từng kích thước màn hình**:
  - **Desktop (`col-lg-3`)**: Hiển thị **4 ảnh trên cùng một dòng**.
  - **Tablet (`col-sm-6`)**: Hiển thị **2 ảnh trên cùng một dòng**.
  - **Mobile (`col-12`)**: Hiển thị **1 ảnh trên một dòng**.
- **Vận dụng linh hoạt các thành phần Bootstrap**: Card Component (`card`, `card-img-top`, `card-body`), khoảng cách rãnh cột (`g-4`), bo góc (`rounded-4`), đổ bóng (`shadow-sm`) và Lightbox Modal phóng to ảnh.

---

## 📐 Phân Tích Hệ Thống Lưới Bootstrap (12-Column Grid)

Bootstrap chia màn hình thành một lưới gồm 12 cột bằng nhau. Số lượng phần tử trên một dòng được xác định bởi công thức:
$$\text{Số phần tử / dòng} = \frac{12}{\text{Chỉ số class}}$$

| Điểm ngắt màn hình | Lớp Bootstrap | Cách tính toán | Số ảnh hiển thị / dòng |
| :--- | :---: | :---: | :---: |
| **Màn hình lớn (Desktop $\ge 992\text{px}$)** | **`col-lg-3`** | $\frac{12}{3} = 4$ | **4 ảnh / dòng** |
| **Màn hình vừa (Tablet $\ge 576\text{px}$)** | **`col-sm-6`** | $\frac{12}{6} = 2$ | **2 ảnh / dòng** |
| **Màn hình nhỏ (Mobile $< 576\text{px}$)** | **`col-12`** | $\frac{12}{12} = 1$ | **1 ảnh / dòng** |

```html
<!-- Cú pháp tích hợp trên từng thẻ ảnh -->
<div class="col-12 col-sm-6 col-lg-3 gallery-item">
    <div class="card h-100 shadow-sm border-0 rounded-4">
        ...
    </div>
</div>
```

---

## 📂 Cấu Trúc Mã Nguồn

```text
gallery_bootstrap/
├── index.html       # Cấu trúc Gallery: Hero Banner, Grid System 8 ảnh, Lightbox Modal
├── styles.css       # Hiệu ứng phóng to khi hover, lớp phủ kính mờ & typography
└── README.md        # Báo cáo kỹ thuật phân tích chi tiết
```

---

## 🌟 Các Tính Năng Nổi Bật Được Tích Hợp

1. **Chuẩn Bootstrap 5.3 CDN**: Sử dụng thư viện CSS & JS mới nhất, không phụ thuộc jQuery.
2. **Chiều cao thẻ đồng đều (`h-100`)**: Đảm bảo các khung Card luôn có cùng chiều cao dù nội dung mô tả ngắn dài khác nhau.
3. **Khoảng cách rãnh thông minh (`g-4`)**: Tạo khoảng cách 1.5rem đồng đều giữa các ảnh cả theo chiều dọc lẫn chiều ngang.
4. **Hiệu ứng Micro-Interaction mượt mà**:
   - Khi di chuột qua ảnh: Ảnh tự động phóng to nhẹ nhàng (`transform: scale(1.08)`), thẻ Card nổi khối (`translateY(-5px)`).
   - Xuất hiện lớp phủ kính mờ kèm biểu tượng *"🔍 Phóng to"*.
5. **Lightbox Modal tiện ích**: Click vào bất kỳ ảnh nào để mở chế độ xem toàn cảnh độ phân giải cao kèm thông tin chi tiết.
6. **Bộ lọc chuyên mục nhanh**: Lọc ảnh theo chủ đề *Núi Non*, *Biển & Hồ*, *Rừng Cây*.

---

## 🚀 Hướng Dẫn Mở & Kiểm Thử Trên Trình Duyệt

1. Mở trực tiếp tệp [**`index.html`**](file:///C:/Users/dathao/Downloads/gallery_bootstrap/index.html) bằng trình duyệt web.
2. **Kiểm tra trên Desktop**: Thu phóng trình duyệt toàn màn hình để thấy 4 ảnh xếp đều trên 1 hàng.
3. **Kiểm tra trên Tablet**: Thu nhỏ cửa sổ về khoảng 600px - 900px (hoặc bấm `F12` chọn iPad) để thấy 2 ảnh / hàng.
4. **Kiểm tra trên Mobile**: Thu nhỏ cửa sổ dưới 576px (hoặc chọn iPhone trong `F12`) để thấy mỗi ảnh chiếm trọn 1 dòng (100% bề rộng).
5. **Kiểm tra Lightbox**: Click vào ảnh bất kỳ để phóng to xem chi tiết trong Modal.
