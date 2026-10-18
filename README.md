# Báo Cáo Thực Hành: Tuyệt Chiêu Căn Giữa Hoàn Hảo Chỉ Với 3 Dòng CSS

## 1. Mục Tiêu Đạt Được
- [x] Nắm vững và áp dụng 3 dòng CSS cốt lõi của Flexbox để căn giữa hoàn hảo một phần tử theo cả hai trục: ngang (Main Axis) và dọc (Cross Axis).
- [x] Xây dựng khung chứa `.container` với `min-height: 100vh` đảm bảo chiếm trọn chiều cao khung nhìn của màn hình.
- [x] Tạo khối hiển thị thông báo `.center-card` với phong cách thiết kế hiện đại, bo góc mềm mại và đổ bóng tinh tế.
- [x] Kiểm nghiệm tính chất responsive khi co giãn cửa sổ trình duyệt: thẻ card luôn duy trì vị trí chính giữa màn hình mà không cần định vị absolute hay tính toán margin thủ công.

---

## 2. Ba Dòng CSS Cốt Lõi Căn Giữa Bằng Flexbox

```css
.container {
  display: flex;           /* 1. Kích hoạt môi trường Flexbox */
  justify-content: center; /* 2. Căn giữa phần tử con theo trục chính (trục ngang) */
  align-items: center;     /* 3. Căn giữa phần tử con theo trục vuông góc (trục dọc) */
}
```

---

## 3. Mã Nguồn Hoàn Chỉnh

### Tệp `index.html`
```html
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tuyệt chiêu căn giữa hoàn hảo chỉ với 3 dòng CSS</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="center-card">
            <h3>Căn giữa hoàn hảo!</h3>
            <p>Phần tử này nằm chính giữa khung nhìn màn hình.</p>
        </div>
    </div>
</body>
</html>
```

### Tệp `style.css`
```css
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}

.container {
    min-height: 100vh;
    display: flex;
    justify-content: center; /* Căn giữa theo trục ngang */
    align-items: center;     /* Căn giữa theo trục dọc */
    background-color: #f0f2f5;
    padding: 20px;
}

.center-card {
    padding: 30px 40px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    text-align: center;
    max-width: 400px;
    width: 100%;
}

.center-card h3 {
    color: #1e293b;
    font-size: 1.5rem;
    margin-bottom: 10px;
}

.center-card p {
    color: #64748b;
    font-size: 1rem;
    line-height: 1.5;
}
```
