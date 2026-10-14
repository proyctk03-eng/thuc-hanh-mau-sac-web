# [Bài tập] Ứng dụng Calculator (Java Servlet & JSP)

Dự án máy tính trực tuyến thực hiện các phép toán cơ bản (Cộng, Trừ, Nhân, Chia) và xử lý ngoại lệ chia cho 0, tương thích chuẩn **Tomcat 10.1+** và **Jakarta EE 10**.

---

## 📌 1. Mục tiêu & Yêu cầu
- Thiết kế form nhập liệu 2 toán hạng và toán tử tại `index.jsp`.
- Lớp `Calculator.java` thực thi phép tính số học:
  - Nếu phép chia có mẫu số bằng 0 &rarr; Ném ngoại lệ `RuntimeException("Can't divide by zero")`.
- `CalculatorServlet.java` tiếp nhận dữ liệu POST, gọi `Calculator.calculate()` và bắt lỗi bằng khối `try-catch`.

---

## 📂 2. Cấu trúc thư mục tiêu chuẩn

```text
servlet-calculator/
├── pom.xml                                   # Cấu hình Maven dependencies (Jakarta Servlet 6.0, JSP 3.1)
├── README.md                                 # Hướng dẫn chi tiết triển khai và kiểm thử
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── codegym/
        │           ├── Calculator.java       # Model xử lý phép tính và kiểm tra chia cho 0
        │           └── CalculatorServlet.java # Controller xử lý request POST từ endpoint /calculate
        └── webapp/
            ├── index.jsp                     # Giao diện Form máy tính
            └── WEB-INF/
                └── web.xml                   # Cấu hình chuẩn Jakarta EE 10
```

---

## 🚀 3. Hướng dẫn đóng gói và triển khai lên Tomcat 10.1+

1. **Biên dịch và đóng gói:**
   ```bash
   mvn clean package
   ```
   Tệp tin `servlet-calculator.war` sẽ được tạo bên trong thư mục `target/`.

2. **Triển khai:**
   - Copy file `servlet-calculator.war` vào thư mục `webapps/` của Apache Tomcat 10.1+.
   - Khởi động server bằng file `startup.bat` (Windows) hoặc `./startup.sh` (macOS/Linux).

3. **Kiểm tra trên trình duyệt:**
   - Mở trình duyệt tại: `http://localhost:8080/servlet-calculator/`
   - Nhập các phép tính thông thường (ví dụ: `10 + 5`, `20 / 4`).
   - Thử nghiệm chia cho 0 (`10 / 0`) để kiểm chứng thông báo lỗi `Error: Can't divide by zero`.
