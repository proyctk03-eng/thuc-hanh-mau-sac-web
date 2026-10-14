<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Thêm Sản Phẩm Mới</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            padding: 40px 20px;
        }
        .form-card {
            max-width: 550px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }
        h2 {
            font-size: 22px;
            margin-bottom: 20px;
            color: #212529;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 12px;
        }
        .form-group {
            margin-bottom: 18px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            font-size: 14px;
            color: #495057;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            font-size: 14px;
        }
        input:focus {
            outline: none;
            border-color: #86b7fe;
            box-shadow: 0 0 0 3px rgba(13, 110, 253, 0.15);
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }
        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            text-align: center;
        }
        .btn-success {
            background-color: #198754;
            color: white;
            flex: 1;
        }
        .btn-success:hover {
            background-color: #157347;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5c636a;
        }
    </style>
</head>
<body>
<div class="form-card">
    <h2>Thêm Sản Phẩm Mới</h2>
    <form action="products" method="post">
        <input type="hidden" name="action" value="create" />

        <div class="form-group">
            <label for="name">Tên Sản Phẩm:</label>
            <input type="text" id="name" name="name" placeholder="Ví dụ: Laptop ThinkPad X1 Carbon" required />
        </div>

        <div class="form-group">
            <label for="price">Đơn Giá ($):</label>
            <input type="number" id="price" name="price" step="0.01" min="0" placeholder="Ví dụ: 1299.99" required />
        </div>

        <div class="form-group">
            <label for="quantity">Số Lượng:</label>
            <input type="number" id="quantity" name="quantity" min="0" placeholder="Ví dụ: 20" required />
        </div>

        <div class="btn-group">
            <button type="submit" class="btn btn-success">Lưu Sản Phẩm</button>
            <a href="products" class="btn btn-secondary">Hủy bỏ</a>
        </div>
    </form>
</div>
</body>
</html>
