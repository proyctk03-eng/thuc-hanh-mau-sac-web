# Nhật Ký Tra Cứu Kỹ Thuật Cùng AI (AI Prompt & Interaction Log)
**Dự án:** CreativeChronicle Magazine Layout Refactoring  
**Học viên:** Jane Doe  
**Mục tiêu:** Tra cứu cú pháp CSS Grid 2D (`grid-template-areas`), Flexbox Vertical Alignment, và hệ thống Utilities classes của Bootstrap 5.

---

## 📌 Prompt 1: Khám phá Cú pháp `grid-template-areas` trong CSS Grid cho Thư viện Ảnh Mosaic

### Câu hỏi đặt cho AI (Prompt):
> *"Mình đang cần làm một thư viện ảnh nghệ thuật bất đối xứng (Mosaic Gallery) gồm 1 ảnh to chiếm 2/3 chiều ngang và cao bằng 2 hàng bên trái, cùng 2 ảnh nhỏ xếp chồng lên nhau ở 1/3 bên phải. Làm thế nào để dùng thuộc tính `grid-template-areas` trong CSS Grid để vẽ bố cục này như một bức tranh trực quan, và khi trên mobile thì chuyển thành xếp chồng 1 cột mà không làm ảnh bị méo tỷ lệ?"*

### Tóm tắt câu trả lời từ AI & Ứng dụng thực tế:
- **Cú pháp trực quan:** CSS Grid cho phép "vẽ" cấu trúc layout bằng chuỗi ký tự mô phỏng ma trận:
  ```css
  .mosaic-gallery {
      display: grid;
      grid-template-columns: 2fr 1fr;
      grid-template-rows: 240px 240px;
      grid-template-areas:
          "main sub1"
          "main sub2";
      gap: 16px;
  }
  .photo-main  { grid-area: main; }
  .photo-sub-1 { grid-area: sub1; }
  .photo-sub-2 { grid-area: sub2; }
  ```
- **Chống méo hình:** Áp dụng `object-fit: cover` cho thẻ `<img>` kết hợp `width: 100%; height: 100%;` để ảnh luôn lấp đầy ô lưới mà giữ nguyên tỉ lệ gốc của bức tranh.
- **Responsive Media Query:** Khi màn hình $\le 768px$, chỉ cần viết lại ma trận thành 1 cột dọc:
  ```css
  @media (max-width: 768px) {
      .mosaic-gallery {
          grid-template-columns: 1fr;
          grid-template-areas:
              "main"
              "sub1"
              "sub2";
      }
  }
  ```

---

## 📌 Prompt 2: Tối ưu hóa Flexbox bằng Bootstrap 5 Utility Classes

### Câu hỏi đặt cho AI (Prompt):
> *"Trong thanh Author Meta-info, mình muốn căn giữa theo trục dọc tuyệt đối giữa ảnh đại diện, tên tác giả và nút chia sẻ ở góc phải. Thay vì phải mở file CSS viết dài dòng, Bootstrap 5 có sẵn những Utility classes nào giúp mình dàn trang Flexbox trực tiếp trong file HTML một cách ngắn gọn, hỗ trợ tự động bẻ dòng trên điện thoại không?"*

### Tóm tắt câu trả lời từ AI & Ứng dụng thực tế:
- **Các utility classes hữu dụng:**
  - `d-flex`: Kích hoạt `display: flex;`.
  - `align-items-center`: Căn giữa dọc tuyệt đối (`align-items: center;`).
  - `justify-content-between`: Đẩy cụm thông tin tác giả sang trái và cụm nút chia sẻ sang sát lề phải.
  - `flex-wrap`: Tự động cho phép rớt dòng khi không gian trên màn hình nhỏ không đủ.
  - `gap-3` (hoặc `gap-2`): Tạo khoảng cách đều đặn giữa các phần tử flex-item mà không cần viết `margin-right` thủ công.
- **Cấu trúc HTML tinh gọn đạt được:**
  ```html
  <div class="d-flex align-items-center justify-content-between flex-wrap gap-3 pb-3 mb-4 border-bottom">
      <div class="d-flex align-items-center gap-3">
          <img src="..." class="rounded-circle" style="width: 60px; height: 60px; object-fit: cover;">
          <div>
              <h5 class="mb-0">Jane Doe</h5>
              <small class="text-muted">Published on Oct 25, 2026</small>
          </div>
      </div>
      <div class="d-flex align-items-center gap-2">
          <button class="btn btn-outline-primary btn-sm rounded-pill">Share</button>
      </div>
  </div>
  ```

---

## 📌 Prompt 3: Cấu hình Điểm ngắt (Breakpoints) của Bootstrap 5 Grid cho Danh sách Bài viết Đề xuất

### Câu hỏi đặt cho AI (Prompt):
> *"Mình cần chia 4 thẻ bài viết liên quan (Recommended Articles) sao cho: trên Desktop hiển thị đúng 4 cột trên 1 dòng; trên Tablet hiển thị 2 cột mỗi dòng; và trên Mobile hiển thị 1 cột xếp chồng. Hệ thống lưới của Bootstrap 5 cần dùng những class nào và logic chia 12 cột hoạt động ra sao?"*

### Tóm tắt câu trả lời từ AI & Ứng dụng thực tế:
- **Nguyên lý 12 cột chuẩn của Bootstrap:**
  - Tổng số cột trong một hàng (`row`) luôn là 12.
  - **Desktop ($\ge 992px$ - Large/Desktop):** Mỗi thẻ chiếm 3 cột $\rightarrow 12 / 3 = 4$ thẻ trên 1 hàng $\Rightarrow$ sử dụng `col-lg-3`.
  - **Tablet ($768px - 991px$ - Medium):** Mỗi thẻ chiếm 6 cột $\rightarrow 12 / 6 = 2$ thẻ trên 1 hàng $\Rightarrow$ sử dụng `col-md-6`.
  - **Mobile ($< 768px$ - Extra Small / Small):** Mỗi thẻ chiếm trọn 12 cột $\rightarrow 12 / 12 = 1$ thẻ trên 1 hàng $\Rightarrow$ sử dụng `col-12`.
- **Khoảng cách hàng và cột tự động:** Sử dụng `g-4` trên thẻ `<div class="row g-4">` để tạo gutter chuẩn $1.5rem$ cả theo chiều ngang và dọc, triệt tiêu hoàn toàn lỗi rớt dòng méo mó do float/margin phần trăm gây ra.
- **Code áp dụng:**
  ```html
  <div class="row g-4">
      <div class="col-12 col-md-6 col-lg-3">
          <div class="card h-100 shadow-sm border-0">...</div>
      </div>
      <!-- Lặp lại 4 thẻ -->
  </div>
  ```

---

## 🎯 Đánh Giá Hiệu Quả Tương Tác
- AI đóng vai trò như một người tra cứu tài liệu nhanh (Cheat Sheet & Architectural Partner), giúp tiết kiệm thời gian tra cứu W3C spec và Bootstrap docs.
- Học viên nắm quyền kiểm soát toàn bộ tư duy thiết kế, trực tiếp thẩm định và tự tay viết code sạch (clean code) mà không giao phó việc giải quyết vấn đề thụ động cho AI.
