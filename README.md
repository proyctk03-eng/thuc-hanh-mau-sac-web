# [Thực hành] Tạo trang web để đăng nhập và hiển thị lời chào (JSP / Servlet)

Dự án Java Web Maven Webapp tiêu chuẩn tương thích hoàn toàn với **Tomcat 10.1+** và **Jakarta EE (Servlet API 6.0.0)**.

---

## 📌 1. Mục tiêu & Yêu cầu
- Thiết kế form HTML đăng nhập bằng trang `index.jsp`.
- Truyền nhận dữ liệu thông qua phương thức `POST` tới Servlet.
- Xử lý xác thực người dùng trong `LoginServlet.java`:
  - Tài khoản hợp lệ: `username = admin` và `password = admin` &rarr; Hiển thị **"Welcome admin to website"**.
  - Sai tài khoản hoặc mật khẩu &rarr; Hiển thị thông báo **"Login Error"**.

---

## 📂 2. Cấu trúc thư mục tiêu chuẩn

```text
jsp-servlet-login/
├── pom.xml                                   # Cấu hình Maven dependencies (Jakarta Servlet 6.0, JSP 3.1)
├── README.md                                 # Tài liệu dự án và hướng dẫn triển khai
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── codegym/
        │           └── LoginServlet.java     # Controller xử lý request POST từ endpoint /login
        └── webapp/
            ├── index.jsp                     # Giao diện Form đăng nhập
            └── WEB-INF/
                └── web.xml                   # Cấu hình ứng dụng Web chuẩn Jakarta EE 10
```

---

## ⚙️ 3. Chi tiết kỹ thuật cốt lõi

### 1. `pom.xml` (Jakarta EE / Tomcat 10+)
Khai báo thư viện `jakarta.servlet-api` (version 6.0.0) và `jakarta.servlet.jsp-api` (version 3.1.1):
```xml
<dependency>
    <groupId>jakarta.servlet</groupId>
    <artifactId>jakarta.servlet-api</artifactId>
    <version>6.0.0</version>
    <scope>provided</scope>
</dependency>
```

### 2. Form gửi dữ liệu (`index.jsp`)
Form gửi dữ liệu qua phương thức `POST` tới endpoint `login`:
```html
<form action="login" method="POST">
    <input type="text" name="username" placeholder="Enter username" required />
    <input type="password" name="password" placeholder="Enter password" required />
    <button type="submit">Login</button>
</form>
```

### 3. Servlet xử lý xác thực (`LoginServlet.java`)
```java
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        if ("admin".equals(user) && "admin".equals(pass)) {
            out.println("<h1 style='color: green;'>Welcome admin to website</h1>");
        } else {
            out.println("<h1 style='color: red;'>Login Error</h1>");
        }
    }
}
```

---

## 🚀 4. Hướng dẫn đóng gói và triển khai lên Tomcat 10.1+

1. **Biên dịch & Đóng gói (.war):**
   ```bash
   mvn clean package
   ```
   Tệp tin `jsp-servlet-login.war` sẽ được tạo trong thư mục `target/`.

2. **Triển khai lên máy chủ Tomcat:**
   - Copy file `jsp-servlet-login.war` vào thư mục `webapps/` của Apache Tomcat 10.1+.
   - Khởi động Tomcat bằng `startup.bat` (Windows) hoặc `./startup.sh` (Linux/macOS).

3. **Kiểm tra trên trình duyệt:**
   - Truy cập: `http://localhost:8080/jsp-servlet-login/`
   - Đăng nhập thử với `admin` / `admin` để nhận thông điệp chào mừng.
