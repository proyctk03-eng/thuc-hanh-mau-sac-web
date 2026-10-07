# [Thực Hành] Sử Dụng Màu Sắc Trong Trang Web (Monochromatic Color Scheme)

[![GitHub repo](https://img.shields.io/badge/GitHub-proyctk03--eng%2Fthuc--hanh--mau--sac--web-blue?logo=github)](https://github.com/proyctk03-eng/thuc-hanh-mau-sac-web)
[![Live Demo](https://img.shields.io/badge/Live%20Demo-GitHub%20Pages-success?logo=githubpages)](https://proyctk03-eng.github.io/thuc-hanh-mau-sac-web/)
[![Color Scheme](https://img.shields.io/badge/Scheme-Monochromatic%20Blue-00ADEE)](https://github.com/proyctk03-eng/thuc-hanh-mau-sac-web)

* **Tác giả:** Nguyen Tuan Dat ([@proyctk03-eng](https://github.com/proyctk03-eng))
* **Môn học:** Thiết kế Web & Giao diện UI/UX (CodeGym)
* **Repository:** [https://github.com/proyctk03-eng/thuc-hanh-mau-sac-web](https://github.com/proyctk03-eng/thuc-hanh-mau-sac-web)
* **Live Demo:** [https://proyctk03-eng.github.io/thuc-hanh-mau-sac-web/](https://proyctk03-eng.github.io/thuc-hanh-mau-sac-web/)

---

## 📖 Giới Thiệu Đề Tài

Dự án bài tập thực hành phối lại màu cho website e-commerce bán đĩa nhạc cổ điển (**J.S. Bach Collection**) sử dụng **nguyên lý phối màu đơn tông (Monochromatic)** dựa trên màu xanh chủ đạo của logo CodeGym (`#00ADEE`), giảm dần qua 9 bậc sắc độ.

Dự án cũng đồng thời hoàn thành **Bước 8 (Nâng cao)**: xây dựng thêm một biến thể phối màu đơn tông hoàn chỉnh khác là **Emerald Green** (`#059669` -> `#ECFDF5`).

---

## 🎨 1. BẢNG MÀU ĐƠN TÔNG XANH DƯƠNG (BẬC 1 ĐẾN BẬC 9)

```
Bậc 1: #00ADEE  ████████  Màu chính (Primary Base) - Logo CodeGym, nút CTA, nhãn ON SALE, icon tròn
Bậc 2: #00B2EF  ████████  Điểm nhấn nổi bật, hiệu ứng hover nút bấm
Bậc 3: #00B8F1  ████████  Màu chuyển tiếp sắc độ
Bậc 4: #00BFF2  ████████  Màu nền Banner chính & Background trang (Bước 2)
Bậc 5: #33CBF5  ████████  Màu sáng trung gian
Bậc 6: #66D8F6  ████████  Màu viền phân cách (divider border)
Bậc 7: #8DD7F7  ████████  Màu nền phần nội dung Preview (Bước 4 - thay nền hồng cũ #fac7d2)
Bậc 8: #B3EEFA  ████████  Màu nền phụ rất nhạt, trích dẫn quote
Bậc 9: #C6E9FA  ████████  Màu nền phần Info & Footer (Bước 5 - tạo độ sáng, hài hòa toàn trang)
```

| Cấp Bậc | Mã HEX | Vai Trò Ứng Dụng Trong UI/UX |
| :---: | :---: | :--- |
| **Bậc 1** | `#00ADEE` | **Màu chính (Primary / Base Color)** — Logo CodeGym, nút hành động, nhãn ON SALE, vòng tròn icon preview. |
| **Bậc 2** | `#00B2EF` | Điểm nhấn nổi bật, trạng thái hover của các nút hành động. |
| **Bậc 3** | `#00B8F1` | Màu chuyển tiếp sắc độ. |
| **Bậc 4** | `#00BFF2` | **Màu nền Banner chính & Background trang (Bước 2)**. |
| **Bậc 5** | `#33CBF5` | Màu sáng trung gian. |
| **Bậc 6** | `#66D8F6` | Màu đường viền phân tách cấu trúc (divider border). |
| **Bậc 7** | `#8DD7F7` | **Màu nền phần nội dung Preview (Bước 4)** — Thay thế cho nền hồng cũ `#fac7d2`. |
| **Bậc 8** | `#B3EEFA` | Màu nền phụ rất nhạt, trích dẫn quote. |
| **Bậc 9** | `#C6E9FA` | **Màu nền phần Info & Footer (Bước 5)** — Tạo độ sáng, hài hòa cho toàn trang. |

---

## 🛠️ 2. CHI TIẾT CÁC BƯỚC ĐÃ THỰC HIỆN THEO ĐỀ BÀI

* **Bước 1:** Xác định màu xanh logo `#00ADEE` làm màu bậc 1, xây dựng hệ thống 9 cấp độ màu nhạt dần bằng CSS Custom Properties (`:root`).
* **Bước 2:** Chuyển màu nền `#banner` sang màu bậc 4 (`#00BFF2`). Màu chữ chuyển thành màu đen sẫm (`#032b43` / `#111827`) để đảm bảo độ tương phản cao, dễ đọc.
* **Bước 3:** Đổi màu nhãn `.trans .on-sale`, nút `Add to Cart` và vòng tròn `.preview .circle` từ màu đỏ cũ sang màu bậc 1 (`#00ADEE`) và bậc 2 (`#00B2EF`).
* **Bước 4:** Đổi màu nền hồng (`#fac7d2`) của danh sách Preview sang màu bậc 7 (`#8DD7F7`). Giữ màu chữ đen để đọc sắc nét trên nền nhạt.
* **Bước 5:** Đổi màu nền phần `#info` và `footer` sang màu bậc 9 (`#C6E9FA`).
* **Bước 6:** Giữ màu chữ cho toàn bộ trang là màu đen (chuẩn WCAG AA).
* **Bước 7:** Kiểm tra giao diện và hiệu ứng 3D flip card, responsive trên di động.
* **Bước 8 (Nâng cao):** Tạo thêm biến thể đơn tông thứ 2: **Emerald Green** (`theme-emerald.css` & `index-variant2.html`) với thanh chuyển đổi trực quan.

---

## 📁 3. CẤU TRÚC THƯ MỤC DỰ ÁN

```
thuc-hanh-mau-sac-web/
├── index.html                 # Trang web chính (Phối màu Monochromatic Blue)
├── style.css                  # Stylesheet Monochromatic Blue 9 bậc
├── index-variant2.html        # Biến thể Bước 8 (Monochromatic Emerald Green)
├── theme-emerald.css          # Stylesheet Bước 8 (Emerald Green)
├── codepen-ready.html         # File đơn độc lập 100% để copy dán vào CodePen
├── README.md                  # Tài liệu hướng dẫn nộp bài chi tiết
├── images/                    # Thư mục ảnh (logo 2.png, disc-cover.png,...)
└── fonts/                     # Thư mục font (pacifico.woff, ptsans.woff)
```

---

## 🔗 4. LIÊN KẾT NỘP BÀI

* **Link GitHub Repository chính thức:**  
  👉 **`https://github.com/proyctk03-eng/thuc-hanh-mau-sac-web`**
* **Link Trực Tiếp (GitHub Pages):**  
  👉 **`https://proyctk03-eng.github.io/thuc-hanh-mau-sac-web/`**
* **Link Biến thể Emerald Green (Bước 8):**  
  👉 **`https://proyctk03-eng.github.io/thuc-hanh-mau-sac-web/index-variant2.html`**
