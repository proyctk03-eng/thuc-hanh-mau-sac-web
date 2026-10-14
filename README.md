# Ứng Dụng Quản Lý Khách Hàng (Customer Management - Java MVC)

Dự án Java Web MVC quản lý khách hàng phát triển theo mô hình Model-View-Controller chuẩn Jakarta EE 10 / Tomcat 10.1+.

## 1. Kiến Trúc & Cấu Trúc Dự Án (MVC Architecture)

```
customer-management/
├── pom.xml
├── README.md
└── src
    └── main
        ├── java
        │   └── com
        │       └── codegym
        │           ├── controller
        │           │   └── CustomerServlet.java     # C - Controller điều hướng và xử lý request
        │           ├── model
        │           │   └── Customer.java            # M - Model đối tượng khách hàng
        │           └── service
        │               ├── CustomerService.java     # Interface tầng nghiệp vụ
        │               └── CustomerServiceImpl.java # Triển khai thao tác dữ liệu (In-Memory Map)
        └── webapp
            ├── WEB-INF
            │   └── web.xml                          # Cấu hình Webapp Jakarta EE 10
            ├── customer
            │   ├── list.jsp                         # V - Hiển thị danh sách khách hàng (JSTL)
            │   ├── create.jsp                       # V - Form thêm khách hàng mới
            │   ├── edit.jsp                         # V - Form sửa thông tin khách hàng
            │   ├── delete.jsp                       # V - Xác nhận xoá khách hàng
            │   └── view.jsp                         # V - Xem chi tiết thông tin khách hàng
            ├── error-404.jsp                        # Trang thông báo lỗi 404 Not Found
            └── index.jsp                            # Tự động điều hướng về /customers
```

## 2. Các Chức Năng Chính

- **Xem danh sách khách hàng (`GET /customers`):** Hiển thị danh sách khách hàng dạng bảng với JSTL `<c:forEach>`.
- **Thêm mới khách hàng (`GET /customers?action=create`, `POST /customers?action=create`):** Form nhập thông tin và lưu vào Map.
- **Sửa thông tin khách hàng (`GET /customers?action=edit&id=...`, `POST /customers?action=edit`):** Chỉnh sửa dữ liệu của khách hàng theo `id`.
- **Xoá khách hàng (`GET /customers?action=delete&id=...`, `POST /customers?action=delete`):** Xác nhận và xoá khách hàng khỏi danh sách.
- **Xem chi tiết (`GET /customers?action=view&id=...`):** Xem thông tin chi tiết một khách hàng.
- **Xử lý 404 (`error-404.jsp`):** Điều hướng trang báo lỗi khi không tìm thấy khách hàng.

## 3. Hướng Dẫn Biên Dịch & Triển Khai (Tomcat 10.1+)

1. Đóng gói dự án bằng Maven:
   ```bash
   mvn clean package
   ```
2. File WAR `customer-management.war` sinh ra tại thư mục `target/`.
3. Copy file `customer-management.war` vào thư mục `webapps/` của Apache Tomcat 10.1+.
4. Khởi động Tomcat và truy cập:
   ```
   http://localhost:8080/customer-management/customers
   ```
