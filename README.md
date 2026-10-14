# [Thực hành] Ứng dụng Từ điển đơn giản - JSP (Pure JSP Dictionary)

Dự án Java Web Maven Webapp tra cứu từ điển Anh - Việt xử lý trực tiếp bằng mã Java nhúng trong **JSP (Scriptlets `<% %>` và Expressions `<%= %>`)**, tương thích hoàn toàn với **Tomcat 10.1+** và **Jakarta EE 10**.

---

## 📌 1. Mục tiêu bài thực hành
- Luyện tập tạo và lập trình trang JSP.
- Sử dụng thẻ Scriptlet (`<% ... %>`) để khởi tạo dữ liệu `Map<String, String>` và tra cứu từ khóa.
- Sử dụng thẻ Expression (`<%= ... %>`) để kết xuất kết quả nghĩa tiếng Việt hoặc thông báo không tìm thấy ra giao diện HTML.

---

## 📂 2. Cấu trúc thư mục tiêu chuẩn

```text
jsp-pure-dictionary/
├── pom.xml                                   # Cấu hình Maven dependencies (Jakarta Servlet 6.0, JSP 3.1)
├── README.md                                 # Hướng dẫn chi tiết triển khai và kiểm thử
└── src/
    └── main/
        └── webapp/
            ├── index.jsp                     # Giao diện Form nhập từ khóa tra cứu
            ├── dictionary.jsp                # Xử lý tra cứu và hiển thị nghĩa bằng mã Java nhúng JSP
            └── WEB-INF/
                └── web.xml                   # Cấu hình chuẩn Jakarta EE 10
```

---

## 🚀 3. Hướng dẫn đóng gói và triển khai lên Tomcat 10.1+

1. **Biên dịch và đóng gói:**
   ```bash
   mvn clean package
   ```
   Tệp tin `jsp-pure-dictionary.war` sẽ được tạo bên trong thư mục `target/`.

2. **Triển khai:**
   - Copy file `jsp-pure-dictionary.war` vào thư mục `webapps/` của Apache Tomcat 10.1+.
   - Khởi động server bằng file `startup.bat` (Windows) hoặc `./startup.sh` (macOS/Linux).

3. **Kiểm tra trên trình duyệt:**
   - Mở trình duyệt tại: `http://localhost:8080/jsp-pure-dictionary/`
   - Nhập từ khóa tiếng Anh (ví dụ: `hello`, `book`, `computer`) để xem kết quả.
