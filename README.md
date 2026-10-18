# Báo Cáo Thực Hành: Sắp Xếp Danh Sách Thẻ Sản Phẩm Co Giãn Linh Hoạt với Flexbox

## 1. Mục Tiêu Đạt Được
- [x] Luyện tập xây dựng bố cục danh sách lưới thẻ sản phẩm (Product Card Grid) tự động co giãn và xuống dòng linh hoạt với Flexbox.
- [x] Sử dụng `display: flex;` kết hợp `flex-wrap: wrap;` và thuộc tính khoảng cách `gap` để bố cục sản phẩm tự động thích ứng với nhiều kích thước màn hình.
- [x] Áp dụng quy tắc `flex: 1 1 calc(25% - 20px);` và `min-width: 220px;` giúp thẻ linh hoạt mở rộng nhưng không bị co quá nhỏ trên màn hình bé.
- [x] Tích hợp hiệu ứng vi tương tác hover (`transform: translateY(-4px);`) tạo cảm giác nổi khối và sống động khi tương tác.
- [x] Đã kiểm nghiệm tính co giãn mượt mà khi thay đổi kích thước từ Desktop xuống Tablet và Mobile.

---

## 2. Mã Nguồn Cốt Lõi

### Cấu trúc HTML
```html
<div class="product-grid">
  <div class="product-card">
    <h4>Sản phẩm 1</h4>
    <p class="price">500.000 đ</p>
  </div>
  <div class="product-card">
    <h4>Sản phẩm 2</h4>
    <p class="price">750.000 đ</p>
  </div>
  <div class="product-card">
    <h4>Sản phẩm 3</h4>
    <p class="price">1.200.000 đ</p>
  </div>
  <div class="product-card">
    <h4>Sản phẩm 4</h4>
    <p class="price">320.000 đ</p>
  </div>
</div>
```

### Định dạng CSS Flexbox
```css
.product-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  padding: 20px;
}

.product-card {
  flex: 1 1 calc(25% - 20px);
  min-width: 220px;
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  transition: transform 0.2s ease;
}

.product-card:hover {
  transform: translateY(-4px);
}
```

---

## 3. Cơ Chế Hoạt Động & Khả Năng Co Giãn (Responsive)
1. **`flex-wrap: wrap;`**: Cho phép các phần tử con tự động rớt dòng khi không còn đủ diện tích trên hàng ngang hiện tại.
2. **`gap: 20px;`**: Tạo khoảng cách đều đặn 20px giữa các hàng và cột mà không cần xử lý margin âm phức tạp.
3. **`flex: 1 1 calc(25% - 20px);`**:
   - `flex-grow: 1`: Thẻ sản phẩm sẽ giãn đều để lấp đầy khoảng trống còn thừa trên hàng.
   - `flex-shrink: 1`: Cho phép thẻ co lại khi không gian bị thu hẹp.
   - `flex-basis: calc(25% - 20px)`: Định mức cơ sở xấp xỉ 4 cột trên màn hình rộng Desktop.
4. **`min-width: 220px;`**: Đảm bảo trên các màn hình nhỏ (Tablet/Mobile), thẻ không bị ép hẹp dưới 220px, kích hoạt cơ chế xuống dòng tự động tạo bố cục 2 cột hoặc 1 cột hoàn hảo.
