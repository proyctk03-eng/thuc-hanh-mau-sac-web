# [Thực Hành] Sử Dụng Màu Sắc Trong Trang Web (Monochromatic Color Scheme)

Dự án bài tập thực hành phối lại màu cho website e-commerce (J.S. Bach Collection) sử dụng **nguyên lý phối màu đơn tông (Monochromatic)** từ màu xanh logo CodeGym (`#00ADEE`).

---

## 🎨 1. BẢNG MÀU ĐƠN TÔNG XANH DƯƠNG (BẬC 1 ĐẾN BẬC 9)

| Cấp Bậc | Mã HEX | Tên Màu & Vai Trò Trong Giao Diện |
| :---: | :---: | :--- |
| **Bậc 1** | `#00ADEE` | **Màu chính (Primary / Base Color)** — Màu logo CodeGym, nút hành động, nhãn ON SALE, vòng tròn icon preview. |
| **Bậc 2** | `#00B2EF` | Điểm nhấn nổi bật, trạng thái hover của các nút hành động. |
| **Bậc 3** | `#00B8F1` | Màu chuyển tiếp sắc độ. |
| **Bậc 4** | `#00BFF2` | **Màu nền Banner chính & Background trang (Bước 2)**. |
| **Bậc 5** | `#33CBF5` | Màu sáng trung gian. |
| **Bậc 6** | `#66D8F6` | Màu đường viền phân tách cấu trúc (divider border). |
| **Bậc 7** | `#8DD7F7` | **Màu nền phần nội dung Preview (Bước 4)** — Thay thế cho nền hồng cũ `#fac7d2`. |
| **Bậc 8** | `#B3EEFA` | Màu nền phụ rất nhạt, trích dẫn quote. |
| **Bậc 9** | `#C6E9FA` | **Màu nền phần Info & Footer (Bước 5)** — Tạo độ sáng, hài hòa cho toàn trang. |

---

## 🛠️ 2. CHI TIẾT CÁC BƯỚC ĐÃ THỰC HIỆN

- **Bước 1:** Xác định màu xanh logo `#00ADEE` làm màu bậc 1, xây dựng hệ thống 9 cấp độ màu nhạt dần bằng CSS Custom Properties (`:root`).
- **Bước 2:** Chuyển màu nền `#banner` sang màu bậc 4 (`#00BFF2`). Màu chữ chuyển thành màu đen sẫm (`#032b43` / `#111827`) để đảm bảo độ tương phản cao, dễ đọc.
- **Bước 3:** Đổi màu nhãn `.trans .on-sale`, nút `Add to Cart` và vòng tròn `.preview .circle` từ màu đỏ cũ sang màu bậc 1 (`#00ADEE`) và bậc 2 (`#00B2EF`).
- **Bước 4:** Đổi màu nền hồng (`#fac7d2`) của danh sách Preview sang màu bậc 7 (`#8DD7F7`). Giữ màu chữ đen để đọc sắc nét trên nền nhạt.
- **Bước 5:** Đổi màu nền phần `#info` và `footer` sang màu bậc 9 (`#C6E9FA`).
- **Bước 6:** Giữ màu chữ cho toàn bộ trang là màu đen (chuẩn WCAG AA).
- **Bước 7:** Kiểm tra giao diện và hiệu ứng 3D flip card, responsive trên di động.
- **Bước 8 (Nâng cao):** Tạo thêm biến thể đơn tông thứ 2: **Emerald Green** (`theme-emerald.css` & `index-variant2.html`) với thanh chuyển đổi trực quan.

---

## 🚀 3. HƯỚNG DẪN NỘP BÀI LÊN GITHUB HOẶC CODEPEN

### Cách 1: Nộp qua CodePen (Nhanh nhất — 1 phút)
1. Mở trang web [https://codepen.io/pen/](https://codepen.io/pen/)
2. Mở file [codepen-ready.html](codepen-ready.html) trong thư mục này, copy toàn bộ nội dung.
3. Dán vào ô **HTML** trên CodePen (vì toàn bộ CSS đã được nhúng sẵn trong thẻ `<style>`).
4. Bấm **Save** trên CodePen.
5. Copy đường link CodePen (ví dụ: `https://codepen.io/username/pen/xxxxxx`) dán vào ô nộp bài.

### Cách 2: Nộp qua GitHub Repository
1. Đăng nhập vào [https://github.com/](https://github.com/) và bấm **New repository** (đặt tên ví dụ: `thuc-hanh-mau-sac-web`).
2. Mở terminal tại thư mục này và chạy các lệnh:
```bash
git init
git add .
git commit -m "feat: complete monochromatic color scheme practice"
git branch -M main
git remote add origin https://github.com/<tai-khoan-cua-ban>/thuc-hanh-mau-sac-web.git
git push -u origin main
```
3. Copy link repository dán vào ô nộp bài.
