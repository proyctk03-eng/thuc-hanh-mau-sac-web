# [Bài tập] Phát Triển Trang Web Xem Hoạt Hình Trực Tuyến

## 📌 Giới Thiệu & Bối Cảnh Đề Tài

Dự án xây dựng cổng xem phim hoạt hình trực tuyến an toàn (**KidsToon**) dành riêng cho trẻ em. Website tập hợp các nội dung hoạt hình giáo dục, có chọn lọc lành mạnh, có **Audio Thuyết Minh tiếng Việt**, chất lượng chuẩn HD 720p đến FullHD 1080p, tải nhanh từ máy chủ và hoàn toàn không chứa quảng cáo độc hại.

### 🎯 Mục tiêu bài học:
- **Luyện tập tạo Layout sử dụng thẻ `<div>` và CSS**: Phân chia các phân vùng chức năng rõ ràng.
- **Làm chủ thẻ HTML5 `<video>`**: Tích hợp trình phát video cục bộ với thanh điều khiển (`controls`) và ảnh đại diện (`poster`).
- **Luyện tập nhúng YouTube Video sử dụng `<iframe>`**: Nhúng luồng video từ YouTube với tỷ lệ khung hình 16:9 đáp ứng chuẩn điện ảnh.
- **Tương tác động bằng JavaScript**: Lựa chọn đổi phim, chuyển đổi linh hoạt 2 chế độ phát và tìm kiếm thời gian thực (Live Search).

---

## 🏆 Bảng Đo Kiểm Đáp Ứng 3 Mức Độ Yêu Cầu

| Mức độ | Tiêu chí yêu cầu đề bài | Trạng thái | Hiện thực hóa trong mã nguồn |
| :--- | :--- | :---: | :--- |
| **Mức 1 (Cơ bản)** | Bố cục gồm: header, head-link, left content, right content, footer | **ĐẠT 100%** | Phân chia cấu trúc thẻ mạch lạc, sử dụng CSS Flexbox hiện đại |
| **Mức 1 (Cơ bản)** | Logo bên trái | **ĐẠT 100%** | `.logo-wrapper` nằm ở góc trên cùng bên trái của header |
| **Mức 1 (Cơ bản)** | Left content: menu danh sách video có sẵn | **ĐẠT 100%** | `.left-content` hiển thị 5 phim hoạt hình mẫu kèm thumbnail, thời lượng, số lượt xem |
| **Mức 1 (Cơ bản)** | Right content: chứa video được chọn từ menu | **ĐẠT 100%** | `.right-content` trình chiếu video, tiêu đề, tags và tóm tắt nội dung |
| **Mức 1 (Cơ bản)** | Mặc định hiển thị video đầu tiên trong danh sách | **ĐẠT 100%** | Tự động tải video Doraemon (mục 0) khi vừa mở trang web |
| **Mức 1 (Cơ bản)** | Footer: chứa thông tin bản quyền | **ĐẠT 100%** | `.footer` đầy đủ cam kết an toàn cho trẻ, liên hệ và copyright 2026 |
| **Mức 2 (Trung bình)** | Bỏ gạch chân link (`text-decoration: none`) | **ĐẠT 100%** | Thiết lập trên `.nav-item` và các liên kết toàn trang |
| **Mức 2 (Trung bình)** | Khi hover: text bôi đậm và chuyển màu khác | **ĐẠT 100%** | `.nav-item:hover { font-weight: 800; color: #f59e0b; }` |
| **Mức 2 (Trung bình)** | Cuộn trang xuống dưới phần header giữ cố định | **ĐẠT 100%** | `.header { position: sticky; top: 0; z-index: 1000; }` |
| **Mức 3 (Nâng cao)** | Giao diện hiển thị phù hợp dưới màn hình khác nhau (RWD) | **ĐẠT 100%** | Breakpoints `1024px` và `640px`: chuyển đổi mượt mà từ 2 cột sang 1 cột trên Tablet & Mobile |
| **Mức 3 (Nâng cao)** | Tìm kiếm phim theo tên | **ĐẠT 100%** | Thanh tìm kiếm Live Search lọc danh sách video ngay khi gõ phím |
| **Mức 3 (Nâng cao)** | Kết hợp song song HTML5 `<video>` & YouTube `<iframe>` | **ĐẠT 100%** | Nút bấm chuyển đổi nhanh 1-click giữa 2 trình phát |

---

## 📂 Cấu Trúc Mã Nguồn

```text
web_xem_hoat_hinh_truc_tuyen/
├── index.html       # Cấu trúc trang web: Header, Nav, Playlist, Player, Footer
├── styles.css       # Định kiểu giao diện, Sticky Header, Tỷ lệ 16:9, Media Queries
├── app.js           # Xử lý tương tác: Đổi video, chuyển đổi Player, Live Search
└── README.md        # Tài liệu báo cáo kỹ thuật & hướng dẫn kiểm thử
```

---

## 🔬 Phân Tích Kỹ Thuật Chuyên Sâu

### 1. Thẻ HTML5 `<video>`
```html
<video id="mainVideoPlayer" controls poster="banner.jpg">
    <source src="cartoon.mp4" type="video/mp4">
    Trình duyệt không hỗ trợ thẻ video HTML5.
</video>
```
- `controls`: Kích hoạt thanh điều khiển mặc định của trình duyệt (Play/Pause, Thanh tua thời gian, m m lượng, Toàn màn hình).
- `poster`: Ảnh hiển thị đại diện trước khi người dùng nhấn phát video.
- Sử dụng link MP4 trực tiếp từ Server giúp video tải tức thì, chống giật lag và không bị chèn quảng cáo.

### 2. Nhúng YouTube Video Bằng `<iframe>`
```html
<iframe src="https://www.youtube.com/embed/aqz-KE-bpKQ?rel=0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
        allowfullscreen>
</iframe>
```
- Tham số `rel=0`: Giới hạn các video gợi ý liên quan sau khi xem xong.
- `allowfullscreen`: Cho phép trẻ em phóng to xem trọn màn hình.

### 3. Kỹ Thuật Tỷ Lệ Vàng 16:9 (Aspect Ratio 16/9)
```css
.video-container {
    position: relative;
    width: 100%;
    aspect-ratio: 16 / 9;
    background: #000000;
}

.video-container video,
.video-container iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
```
- Giúp khung video luôn giữ đúng tỷ lệ chuẩn điện ảnh trên mọi kích thước màn hình mà không bao giờ bị méo hình hay xuất hiện vệt đen hai bên viền.

---

## 🚀 Hướng Dẫn Trải Nghiệm & Kiểm Thử

1. Mở tệp [**`index.html`**](file:///C:/Users/dathao/Downloads/web_xem_hoat_hinh_truc_tuyen/index.html) bằng trình duyệt web.
2. **Kiểm tra Mức 1**: Quan sát video Doraemon tự động nạp sẵn; bấm vào các mục phim khác ở cột bên trái để đổi phim.
3. **Kiểm tra Mức 2**:
   - Cuộn trang xuống dưới và thấy thanh Header luôn giữ cố định ở đỉnh màn hình.
   - Rê chuột qua thanh menu điều hướng và thấy chữ chuyển sang màu vàng cam và bôi đậm rõ rệt.
4. **Kiểm tra Mức 3**:
   - Thử nghiệm nút **"Trình Phát HTML5 <video>"** và **"Nhúng YouTube <iframe>"**.
   - Gõ từ khóa vào ô tìm kiếm (ví dụ: *"Tom"*, *"Cây Tre"*) để thấy danh sách tự động lọc ngay lập tức.
   - Thu nhỏ cửa sổ trình duyệt để quan sát giao diện tự động thích ứng trên điện thoại di động.
