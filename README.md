# Ứng Dụng Quản Lý User (User Management - JSP, Servlet, JDBC & MySQL)

Dự án Java Web MVC nâng cao kết nối cơ sở dữ liệu MySQL qua JDBC, hoàn thành đầy đủ các yêu cầu bài tập nâng cấp tính năng:
- **Tìm kiếm theo country (Search by Country)**
- **Sắp xếp theo name (Sort by Name A-Z)**

---

## 1. Cấu Trúc Dự Án (MVC & DAO Architecture)

```
user-management/
├── pom.xml
├── README.md
├── sql
│   └── demo.sql                             # CSDL MySQL: demo & bảng users
└── src
    └── main
        ├── java
        │   └── com
        │       └── codegym
        │           ├── controller
        │           │   └── UserServlet.java # Controller điều hướng CRUD, Search & Sort
        │           ├── dao
        │           │   ├── IUserDAO.java    # Interface tầng DAO (thêm searchByCountry & sortByName)
        │           │   └── UserDAO.java     # Triển khai truy vấn JDBC với PreparedStatements
        │           └── model
        │               └── User.java        # POJO Model đại diện cho người dùng
        └── webapp
            ├── WEB-INF
            │   └── web.xml                  # Cấu hình Webapp Jakarta EE 10
            ├── index.jsp                    # Tự động điều hướng sang /users
            └── user
                ├── create.jsp               # Giao diện thêm mới User
                ├── edit.jsp                 # Giao diện sửa thông tin User
                └── list.jsp                 # Danh sách User kèm ô Tìm kiếm Country & Nút Sắp xếp Name
```

---

## 2. Chi Tiết Các Tính Năng Đã Cập Nhật

### 2.1. Cập nhật `IUserDAO` & `UserDAO`:
- Thêm phương thức `List<User> searchByCountry(String country)`:
  ```sql
  SELECT * FROM users WHERE country LIKE ?;
  ```
- Thêm phương thức `List<User> sortByName()`:
  ```sql
  SELECT * FROM users ORDER BY name ASC;
  ```

### 2.2. Cập nhật `UserServlet`:
- Tiếp nhận tham số `action="search"` và `action="sort"` trong cả `doGet` và `doPost`.
- Điều hướng và gán `request.setAttribute("listUser", ...)` trả về `user/list.jsp`.

### 2.3. Cập nhật Giao Diện `user/list.jsp`:
- Tích hợp thanh tìm kiếm Country trực tiếp trên thanh công cụ.
- Bổ sung nút **Sort by Name (A-Z)** và nút **Show All Users** (xoá bộ lọc).
- Hiển thị thông báo trạng thái tìm kiếm/sắp xếp hiện tại.

---

## 3. Hướng Dẫn Cài Đặt & Triển Khai (Tomcat 10.1+ & MySQL)

1. **Khởi tạo CSDL MySQL:**
   Chạy tệp `sql/demo.sql` trên MySQL Client / phpMyAdmin / MySQL Workbench:
   ```bash
   mysql -u root -p < sql/demo.sql
   ```

2. **Cấu hình thông tin kết nối CSDL:**
   Kiểm tra tài khoản/mật khẩu MySQL trong `com.codegym.dao.UserDAO`:
   ```java
   private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
   private String jdbcUsername = "root";
   private String jdbcPassword = "";
   ```

3. **Đóng gói & Chạy:**
   ```bash
   mvn clean package
   ```
   Copy file `.war` vào thư mục `webapps/` của Tomcat 10.1+ và truy cập:
   ```
   http://localhost:8080/user-management/users
   ```
