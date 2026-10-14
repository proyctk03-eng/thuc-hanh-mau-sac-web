# [Thực hành] Ứng dụng chuyển đổi tiền tệ - Servlet (USD to VNĐ)

Dự án Java Web Maven Webapp tiêu chuẩn tương thích với **Tomcat 10.1+** và **Jakarta EE (Servlet API 6.0.0)**.

---

## 📌 1. Mục tiêu bài thực hành
- Luyện tập tạo và cấu hình Servlet xử lý form POST.
- Xây dựng giao diện trang `index.jsp` cho phép người dùng nhập tỉ giá (`rate`) và lượng USD (`usd`).
- Servlet `ConverterServlet.java` tiếp nhận dữ liệu, tính toán theo công thức:
  $$\text{VND} = \text{USD} \times \text{Rate}$$
- Xử lý ngoại lệ `NumberFormatException` khi dữ liệu nhập vào không hợp lệ.

---

## 📂 2. Cấu trúc thư mục tiêu chuẩn

```text
jsp-servlet-currency-converter/
├── pom.xml                                   # Quản lý thư viện Jakarta Servlet 6.0 và JSP 3.1
├── README.md                                 # Hướng dẫn chi tiết triển khai và kiểm thử
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── codegym/
        │           └── ConverterServlet.java # Xử lý tính toán và xuất kết quả chuyển đổi
        └── webapp/
            ├── index.jsp                     # Giao diện Form nhập tỉ giá và lượng USD
            └── WEB-INF/
                └── web.xml                   # Cấu hình chuẩn Jakarta EE 10
```

---

## ⚙️ 3. Chi tiết xử lý logic

### 1. Form nhập liệu (`index.jsp`)
Form gửi dữ liệu qua phương thức `POST` tới endpoint `convert`:
```html
<form action="convert" method="POST">
    <label>Tỉ giá (VND/USD):</label>
    <input type="number" name="rate" value="25000" required step="any"/>
    <label>Lượng USD cần đổi:</label>
    <input type="number" name="usd" required step="any"/>
    <button type="submit">Chuyển đổi</button>
</form>
```

### 2. Servlet tính toán (`ConverterServlet.java`)
```java
@WebServlet(name = "ConverterServlet", urlPatterns = {"/convert"})
public class ConverterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));
        float vnd = rate * usd;
        // Xuất HTML kết quả hiển thị ra trình duyệt
    }
}
```

---

## 🚀 4. Hướng dẫn đóng gói và triển khai lên Tomcat 10.1+

1. **Biên dịch và đóng gói:**
   ```bash
   mvn clean package
   ```
   Tệp tin `jsp-servlet-currency-converter.war` sẽ được tạo bên trong thư mục `target/`.

2. **Triển khai:**
   - Copy file `jsp-servlet-currency-converter.war` vào thư mục `webapps/` của Tomcat 10.1+.
   - Khởi động server bằng file `startup.bat` (Windows) hoặc `./startup.sh` (macOS/Linux).

3. **Truy cập kiểm thử:**
   - Mở trình duyệt tại: `http://localhost:8080/jsp-servlet-currency-converter/`
   - Nhập số lượng USD (ví dụ: `100`), bấm **Chuyển đổi** và xem kết quả.
