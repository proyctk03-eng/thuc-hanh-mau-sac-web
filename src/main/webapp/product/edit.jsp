<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Cập Nhật Thông Tin Sản Phẩm</title>
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
        .btn-warning {
            background-color: #ffc107;
            color: #212529;
            flex: 1;
        }
        .btn-warning:hover {
            background-color: #ffca2c;
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
    <h2>Cập Nhật Sản Phẩm #${product.id}</h2>
    <form action="products" method="post">
        <input type="hidden" name="action" value="edit" />
        <input type="hidden" name="id" value="<c:out value='${product.id}' />" />

        <div class="form-group">
            <label for="name">Tên Sản Phẩm:</label>
            <input type="text" id="name" name="name" value="<c:out value='${product.name}' />" required />
        </div>

        <div class="form-group">
            <label for="price">Đơn Giá ($):</label>
            <input type="number" id="price" name="price" step="0.01" min="0" value="<c:out value='${product.price}' />" required />
        </div>

        <div class="form-group">
            <label for="quantity">Số Lượng:</label>
            <input type="number" id="quantity" name="quantity" min="0" value="<c:out value='${product.quantity}' />" required />
        </div>

        <div class="btn-group">
            <button type="submit" class="btn btn-warning">Lưu Thay Đổi</button>
            <a href="products" class="btn btn-secondary">Hủy bỏ</a>
        </div>
    </form>
</div>
</body>
</html>
