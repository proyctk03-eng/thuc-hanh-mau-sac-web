# [Thực hành] Đóng Gói Thư Viện Java & Nhúng Tái Sử Dụng

Dự án thực hành quy trình chuẩn trong hệ sinh thái Java:
1. **Phần 1:** Xây dựng và đóng gói mã nguồn thành một thư viện độc lập (tệp `.jar` - `math-lib`).
2. **Phần 2:** Khởi tạo dự án mới (`calculator-app`), nhúng thư viện `.jar` cục bộ thông qua Maven và thực thi gọi các hàm tiện ích.

---

## 1. Cấu Trúc Tổng Thể Dự Án

```
dong_goi_thu_vien_java/
├── README.md
├── math-lib/                                   # Dự án thư viện tiện ích (Library Project)
│   ├── pom.xml                                 # Cấu hình Maven groupId: com.codegym, artifactId: math-lib
│   ├── src/main/java/com/codegym/
│   │   └── Calculator.java                     # Lớp chứa các hàm static: sum, sub, mul, divide
│   └── target/
│       └── math-lib-1.0-SNAPSHOT.jar           # Thư viện .jar sau khi đóng gói
└── calculator-app/                             # Dự án ứng dụng tiêu thụ (Consumer Project)
    ├── pom.xml                                 # Nhúng dependency jar từ thư mục lib/
    ├── lib/
    │   └── math-lib.jar                        # Bản sao thư viện .jar được nhúng
    ├── src/main/java/com/codegym/
    │   └── Main.java                           # Lớp Main gọi các hàm từ Calculator trong math-lib.jar
    └── target/
        ├── classes/com/codegym/Main.class
        └── calculator-app.jar
```

---

## 2. Phần 1: Xây Dựng & Đóng Gói Thư Viện `math-lib`

### 2.1. Mã nguồn `Calculator.java`:
```java
package com.codegym;

import java.security.NoSuchAlgorithmException;

public class Calculator {
    public static int sum(int a, int b) {
        return a + b;
    }

    public static int sub(int a, int b) {
        return a - b;
    }

    public static int mul(int a, int b) {
        return a * b;
    }

    public static int divide(int a, int b) throws NoSuchAlgorithmException {
        if (b == 0) {
            throw new NoSuchAlgorithmException();
        }
        return a / b;
    }
}
```

### 2.2. Lệnh đóng gói Maven:
Tại thư mục `math-lib/`, chạy:
```bash
mvn clean package
```
Kết quả sinh ra tệp `target/math-lib-1.0-SNAPSHOT.jar`.

---

## 3. Phần 2: Nhúng Thư Viện Vào Dự Án `calculator-app`

### 3.1. Cấu hình Maven `pom.xml`:
Nhúng file `.jar` cục bộ trong thư mục `lib/` bằng phạm vi `system`:
```xml
<dependencies>
    <!-- Khai báo thư viện jar lấy từ thư mục lib cục bộ -->
    <dependency>
        <groupId>com.codegym</groupId>
        <artifactId>math-lib</artifactId>
        <version>1.0</version>
        <scope>system</scope>
        <systemPath>${project.basedir}/lib/math-lib.jar</systemPath>
    </dependency>
</dependencies>
```

### 3.2. Mã nguồn kiểm thử `Main.java`:
```java
package com.codegym;

import java.security.NoSuchAlgorithmException;

public class Main {
    public static void main(String[] args) {
        System.out.println("Kết quả gọi từ thư viện đóng gói (.jar):");
        System.out.println("Tổng 2 số (5, 9): " + Calculator.sum(5, 9));
        System.out.println("Hiệu 2 số (5, 9): " + Calculator.sub(5, 9));
        System.out.println("Tích 2 số (5, 9): " + Calculator.mul(5, 9));
        try {
            System.out.println("Thương 2 số (10, 5): " + Calculator.divide(10, 5));
        } catch (NoSuchAlgorithmException e) {
            System.err.println("Lỗi thuật toán: Không thể chia cho 0!");
            e.printStackTrace();
        }
    }
}
```

---

## 4. Chạy Ứng Dụng & Kết Quả Kiểm Thử

### 4.1. Lệnh thực thi qua dòng lệnh (Terminal):
- **Trên Windows:**
  ```powershell
  java -cp "target/classes;lib/math-lib.jar" com.codegym.Main
  ```
- **Trên Linux/macOS:**
  ```bash
  java -cp "target/classes:lib/math-lib.jar" com.codegym.Main
  ```

### 4.2. Kết quả đầu ra (Console Output):
```text
Kết quả gọi từ thư viện đóng gói (.jar):
Tổng 2 số (5, 9): 14
Hiệu 2 số (5, 9): -4
Tích 2 số (5, 9): 45
Thương 2 số (10, 5): 2
```
Chương trình chạy hoàn toàn chính xác, chứng minh ứng dụng `calculator-app` đã liên kết và thực thi trơn tru mã nguồn từ tệp thư viện `.jar` bên ngoài.
