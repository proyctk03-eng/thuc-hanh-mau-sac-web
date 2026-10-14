# Báo Cáo Thực Hành: Hoàn Thiện Trang Cá Nhân Với Liên Kết Mạng Xã Hội

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Áp dụng thẻ neo liên kết `<a>` (Anchor tag) để tạo các siêu liên kết (hyperlinks) ra các nền tảng mạng xã hội bên ngoài.
- [x] Sử dụng thuộc tính `target="_blank"` giúp liên kết tự động mở trong một thẻ (tab) trình duyệt mới mà không làm mất trang web hiện tại.
- [x] Tích hợp chuẩn an toàn bảo mật `rel="noopener noreferrer"` nhằm ngăn chặn tấn công Tabnabbing và rò rỉ thông tin Header Referer.
- [x] Phân biệt rõ ràng và vận dụng chính xác giữa **Đường dẫn tuyệt đối (Absolute URL)** và **Đường dẫn tương đối (Relative URL)**.
- [x] Hoàn thiện trọn vẹn dự án trang web đầu tiên của Module 1.

---

## 2. Ghi Chú Kiến Thức Cốt Lõi (Nội Dung Nộp Bài Thực Hành)

### 2.1. Phân biệt Đường dẫn Tuyệt đối và Tương đối

| Tiêu Chí | Đường Dẫn Tuyệt Đối (Absolute URL) | Đường Dẫn Tương Đối (Relative URL) |
| :--- | :--- | :--- |
| **Định nghĩa** | Chỉ định vị trí đầy đủ, chính xác của tài nguyên trên Internet bao gồm cả giao thức (`https://`), tên miền và đường dẫn. | Chỉ định vị trí của tệp tin dựa trên vị trí của tệp tin HTML hiện tại trong cùng thư mục dự án. |
| **Ví dụ trong bài** | `https://github.com/proyctk03-eng`<br>`https://www.facebook.com/your-username` | `images/avatar.jpg`<br>`style.css` |
| **Trường hợp dùng** | Liên kết ra các trang web hoặc tài nguyên bên ngoài hệ thống. | Nhúng hình ảnh, video, liên kết chuyển trang nội bộ trong cùng website. |

### 2.2. Phân tích các thuộc tính của thẻ `<a>`
- `href` (Hypertext Reference): Chỉ định địa chỉ đích mà liên kết sẽ dẫn đến khi người dùng nhấp chuột.
- `target="_blank"`: Báo cho trình duyệt mở tài liệu được liên kết trong một tab hoặc cửa sổ mới thay vì ghi đè lên trang hiện tại.
- `rel="noopener noreferrer"`: Tiêu chuẩn an toàn bắt buộc khi sử dụng `target="_blank"`:
  - `noopener`: Ngăn trang mới truy cập vào đối tượng `window.opener` của trang gốc, phòng chống lỗ hổng bảo mật tấn công chiếm quyền điều khiển trang tab cũ (Reverse Tabnabbing).
  - `noreferrer`: Không gửi thông tin nguồn gốc truy cập (HTTP referer header) sang máy chủ đích nhằm bảo vệ quyền riêng tư.

---

## 3. Cấu Trúc Mã Nguồn Hoàn Chỉnh (`index.html`)

```html
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Web Đầu Tiên Của Tôi - Profile Cá Nhân</title>
</head>
<body>
    <h1>Nguyễn Thị Bê</h1>
    <img src="images/avatar.jpg" alt="Ảnh chân dung của Nguyễn Thị Bê" width="200">
    
    <h2>Giới thiệu bản thân</h2>
    <p>Xin chào! Tôi là một <strong>lập trình viên</strong> đang trên hành trình học hỏi về thế giới phát triển web. Tôi có niềm đam mê với công nghệ và thích tạo ra những sản phẩm <em>đẹp mắt</em> và hữu ích.</p>
    
    <h2>Sở thích</h2>
    <ul>
        <li>Đọc sách khoa học viễn tưởng</li>
        <li>Chơi cờ vua</li>
        <li>Đi bộ đường dài</li>
    </ul>

    <h2>Kết nối với tôi</h2>
    <ul>
        <li>
            <a href="https://www.facebook.com/your-username" target="_blank" rel="noopener noreferrer">Facebook</a>
        </li>
        <li>
            <a href="https://www.linkedin.com/in/your-username" target="_blank" rel="noopener noreferrer">LinkedIn</a>
        </li>
        <li>
            <a href="https://github.com/proyctk03-eng" target="_blank" rel="noopener noreferrer">Github</a>
        </li>
    </ul>
</body>
</html>
```

---

## 4. Ghi Chú Kinh Nghiệm & Kiểm Thử
1. **Kiểm tra hoạt động với Live Server:** Khi nhấp vào các liên kết mạng xã hội (Facebook, LinkedIn, Github), trình duyệt mở sang tab mới mượt mà, đồng thời tab trang web ban đầu vẫn giữ nguyên trạng thái.
2. **Cấu trúc danh sách ngữ nghĩa:** Việc đặt các thẻ `<a>` bên trong thẻ `<li>` và danh sách `<ul>` giúp các thiết bị đọc màn hình (Screen Readers) thông báo chính xác số lượng liên kết mạng xã hội hiện có, nâng cao trải nghiệm người dùng (UX) và khả năng tiếp cận (Accessibility - a11y).
