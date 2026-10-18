# Báo Cáo Thực Hành: Thử Thách Sáng Tạo Với Bố Cục Bất Đối Xứng (Asymmetrical Layout)

## 1. Mục Tiêu Đạt Được
- [x] Sử dụng `grid-column` và `grid-row` kết hợp với từ khóa `span` để kiểm soát số cột và số hàng mà mỗi item chiếm giữ.
- [x] Sắp xếp các phần tử chiếm các khu vực kích thước khác nhau trên hệ thống lưới 4 cột x chiều cao tự động `grid-auto-rows: 120px;`.
- [x] Tạo thành công bố cục bất đối xứng (asymmetrical / mosaic layout) hiện đại, mang phong cách tạp chí nghệ thuật.

## 2. Tóm Tắt Các Bước Thực Hiện
1. **Bước 1: Chuẩn bị cấu trúc HTML (`creative-layout.html`)**:
   - Tạo container `.grid-container` chứa 6 phần tử `.item` từ `item-1` đến `item-6`.
   - Liên kết tệp `style.css`.
2. **Bước 2: Cài đặt CSS cơ bản và màu sắc**:
   - Áp dụng reset `box-sizing: border-box`.
   - Định dạng typography, căn giữa chữ và tô 6 mã màu khác nhau cho từng item để dễ nhận diện trên nền tối `#333`.
3. **Bước 3: Dựng hệ thống lưới Grid**:
   - Thiết lập `.grid-container` với `display: grid;`.
   - Chia 4 cột đều nhau bằng `grid-template-columns: repeat(4, 1fr);`.
   - Đặt chiều cao mặc định cho mỗi hàng `grid-auto-rows: 120px;` và khoảng cách `gap: 10px;`.
4. **Bước 4: Sắp xếp bố cục bất đối xứng**:
   - `.item-1`: Chiếm 2 cột và 2 hàng (`grid-column: span 2; grid-row: span 2;`) làm khối điểm nhấn nổi bật (feature box).
   - `.item-2`: Tự động tràn vào vị trí trống kế tiếp.
   - `.item-3`: Chiếm 2 cột (`grid-column: span 2;`) để mở rộng chiều ngang.
   - `.item-4`: Chiếm 2 hàng (`grid-row: span 2;`) tạo chiều sâu thẳng đứng.
   - `.item-5` và `.item-6`: Tự động lấp đầy các khoảng trống còn lại trên lưới.
5. **Bước 5: Kiểm tra và hoàn thiện**:
   - Kiểm tra hiển thị trên trình duyệt: các khối ghép lại thành một bức tranh mosaic bất đối xứng hoàn chỉnh, thẳng hàng và không bị vỡ bố cục.
