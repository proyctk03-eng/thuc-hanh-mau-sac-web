# [Thực hành] Ứng dụng Từ điển đơn giản - Servlet (English - Vietnamese Dictionary)

Dự án Java Web Maven Webapp tra cứu từ điển Anh - Việt tương thích hoàn toàn với **Tomcat 10.1+** và **Jakarta EE (Servlet API 6.0.0)**.

---

## 📌 1. Mục tiêu bài thực hành
- Luyện tập tạo Servlet tiếp nhận và xử lý request phương thức `POST`.
- Lưu trữ cấu trúc từ vựng bằng cấu trúc dữ liệu `Map<String, String>`.
- Tạo form tra cứu tại `index.jsp` gửi dữ liệu tới endpoint `/translate`.
- Hiển thị nghĩa tiếng Việt nếu tìm thấy, hoặc thông báo không tìm thấy từ tương ứng.

---

## 📂 2. Cấu trúc thư mục tiêu chuẩn

```text
jsp-servlet-dictionary/
├── pom.xml                                   # Quản lý thư viện Jakarta Servlet 6.0 và JSP 3.1
├── README.md                                 # Hướng dẫn chi tiết triển khai và kiểm thử
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── codegym/
        │           └── DictionaryServlet.java # Controller tra cứu từ điển và render giao diện kết quả
        └── webapp/
            ├── index.jsp                     # Giao diện Form tra cứu từ vựng
            └── WEB-INF/
                └── web.xml                   # Cấu hình chuẩn Jakarta EE 10
```

---

## ⚙️ 3. Chi tiết xử lý logic

### 1. Form tra cứu từ vựng (`index.jsp`)
Form gửi từ khóa qua phương thức `POST` tới endpoint `translate`:
```html
<form action="translate" method="POST">
    <input type="text" name="word" placeholder="Nhập từ tiếng Anh..." required autofocus />
    <button type="submit">Tìm kiếm</button>
</form>
```

### 2. Servlet tra cứu (`DictionaryServlet.java`)
```java
@WebServlet(name = "DictionaryServlet", urlPatterns = {"/translate"})
public class DictionaryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển sách");
        dictionary.put("computer", "Máy tính");
        dictionary.put("student", "Sinh viên");

        String searchWord = request.getParameter("word");
        String result = dictionary.get(searchWord.trim().toLowerCase());
        // Hiển thị kết quả tìm kiếm hoặc thông báo lỗi ra màn hình
    }
}
```

---

## 🚀 4. Hướng dẫn đóng gói và triển khai lên Tomcat 10.1+

1. **Biên dịch và đóng gói:**
   ```bash
   mvn clean package
   ```
   Tệp tin `jsp-servlet-dictionary.war` sẽ được tạo bên trong thư mục `target/`.

2. **Triển khai:**
   - Copy file `jsp-servlet-dictionary.war` vào thư mục `webapps/` của Tomcat 10.1+.
   - Khởi động server bằng file `startup.bat` (Windows) hoặc `./startup.sh` (macOS/Linux).

3. **Truy cập kiểm thử:**
   - Mở trình duyệt tại: `http://localhost:8080/jsp-servlet-dictionary/`
   - Nhập từ có sẵn trong từ điển (ví dụ: `hello`, `book`, `computer`) để xem nghĩa tiếng Việt.
   - Nhập từ không có để kiểm tra thông báo không tìm thấy.
