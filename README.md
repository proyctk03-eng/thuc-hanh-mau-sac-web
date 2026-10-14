# Báo Cáo Thực Hành: "Nắn" Các Chiếc Hộp - Tương Tác Với Padding, Border Và Margin

## 1. Giới Thiệu & Mục Tiêu Đạt Được
- [x] Sử dụng thành thạo các thuộc tính chi tiết cho từng cạnh của Box Model (`padding-top`, `padding-right`, `padding-bottom`, `padding-left`, `margin-top`, `margin-left`, `border-left`).
- [x] Nắm vững quy tắc viết tắt (Shorthand Syntax) theo chiều kim đồng hồ (Top -> Right -> Bottom -> Left) cho cả `padding` và `margin`.
- [x] Tích hợp chuẩn thiết kế hiện đại với **Universal Box-Sizing Reset** (`box-sizing: border-box`) giúp kích thước phần tử luôn ổn định khi thêm padding và border.
- [x] Điều chỉnh chính xác không gian bên trong (khoảng đệm nội dung) và khoảng cách bên ngoài (lề giữa các phần tử).

---

## 2. Ghi Chú Tóm Tắt Các Bước Đã Thực Hiện (Nội Dung Nộp Bài Thực Hành)

### Phần 1: Chuẩn bị "Xưởng điêu khắc" & Reset Box-Sizing
1. **Thiết lập Box-Sizing kế thừa:**
   ```css
   html {
     box-sizing: border-box;
   }
   *, *::before, *::after {
     box-sizing: inherit;
   }
   ```
   *Tác dụng:* Khi khai báo `width: 250px`, kích thước tổng thể của hộp sẽ luôn được giữ nguyên là 250px dù ta có tăng thêm `padding` hay `border`.
2. **Khai báo kích thước ban đầu cho 2 hộp:**
   - `.box`: `width: 250px; height: 150px;`
   - `.box-1`: `background-color: lightskyblue;`
   - `.box-2`: `background-color: lightsalmon;`

### Phần 2: Tương tác với từng cạnh (Thuộc tính chi tiết)
1. **Tinh chỉnh padding không đồng đều cho Hộp 1:**
   - Sử dụng 4 thuộc tính chi tiết:
     ```css
     padding-top: 10px;
     padding-right: 20px;
     padding-bottom: 30px;
     padding-left: 40px;
     ```
   - *Hiện tượng quan sát:* Nội dung chữ *"Đây là Hộp 1"* bị đẩy lệch sâu vào trong về phía dưới - phải do khoảng đệm bên trái (40px) và dưới (30px) lớn hơn cạnh trên (10px) và phải (20px).
2. **Tinh chỉnh margin định vị cho Hộp 2:**
   - Thêm `margin-top: 60px` -> Đẩy Hộp 2 cách xa Hộp 1 một khoảng 60px theo chiều dọc.
   - Thêm `margin-left: 100px` -> Đẩy Hộp 2 cách xa lề trái màn hình 100px theo chiều ngang.
3. **Tinh chỉnh đường viền độc lập cho Hộp 1:**
   - Thêm `border-left: 8px dotted red;` -> Tạo một dải viền chấm bi màu đỏ nổi bật dày 8px chỉ riêng ở cạnh mép trái của Hộp 1.

### Phần 3: Ứng dụng Cú pháp viết tắt (Shorthand)
1. **Thay thế 4 dòng padding chi tiết của Hộp 1 bằng Shorthand 4 giá trị:**
   ```css
   padding: 10px 20px 30px 40px; /* Tương đương Top 10px, Right 20px, Bottom 30px, Left 40px */
   ```
2. **Thêm padding cho Hộp 2 bằng Shorthand 2 giá trị:**
   ```css
   padding: 25px 50px; /* 25px cho Trên/Dưới, 50px cho Trái/Phải */
   ```

---

## 3. Bảng Quy Tắc Cú Pháp Viết Tắt (Shorthand) Trong CSS

| Cú pháp Shorthand | Ý nghĩa thứ tự giá trị | Ví dụ minh họa | Tương đương với thuộc tính chi tiết |
| :--- | :--- | :--- | :--- |
| **4 giá trị** | `Trên  Phải  Dưới  Trái`<br>*(Theo chiều kim đồng hồ)* | `padding: 10px 20px 30px 40px;` | `padding-top: 10px;`<br>`padding-right: 20px;`<br>`padding-bottom: 30px;`<br>`padding-left: 40px;` |
| **3 giá trị** | `Trên  (Trái & Phải)  Dưới` | `padding: 10px 20px 30px;` | `padding-top: 10px;`<br>`padding-left: 20px; padding-right: 20px;`<br>`padding-bottom: 30px;` |
| **2 giá trị** | `(Trên & Dưới)  (Trái & Phải)` | `padding: 25px 50px;` | `padding-top: 25px; padding-bottom: 25px;`<br>`padding-left: 50px; padding-right: 50px;` |
| **1 giá trị** | `Áp dụng cả 4 cạnh` | `padding: 15px;` | `padding-top: 15px; padding-right: 15px;`<br>`padding-bottom: 15px; padding-left: 15px;` |

---

## 4. Mã Nguồn Hoàn Chỉnh

### Tệp `box-model.html`
```html
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thực Hành "Nắn" Các Chiếc Hộp: Padding, Border & Margin</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Thực Hành Box Model: Padding, Border & Margin</h1>
    <p>Quan sát sự thay đổi khoảng đệm (padding), đường viền (border) và khoảng cách lề (margin) của hai chiếc hộp bên dưới:</p>

    <div class="box box-1">Đây là Hộp 1</div>
    <div class="box box-2">Đây là Hộp 2</div>
</body>
</html>
```

### Tệp `style.css`
```css
/* --- Universal Box-Sizing Reset --- */
html {
  box-sizing: border-box;
}
*, *::before, *::after {
  box-sizing: inherit;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  line-height: 1.6;
  background-color: #f8fafc;
  color: #1e293b;
  padding: 30px;
  margin: 0;
}

.box {
  width: 250px;
  height: 150px;
  font-weight: bold;
  font-size: 1.1rem;
  color: #0f172a;
}

.box-1 {
  background-color: lightskyblue;
  padding: 10px 20px 30px 40px; /* Cú pháp viết tắt 4 giá trị */
  border-left: 8px dotted red; /* Viền trái chấm bi đỏ */
}

.box-2 {
  background-color: lightsalmon;
  margin-top: 60px; /* Cách hộp 1 60px */
  margin-left: 100px; /* Cách mép trái màn hình 100px */
  padding: 25px 50px; /* Cú pháp viết tắt 2 giá trị */
}
```
