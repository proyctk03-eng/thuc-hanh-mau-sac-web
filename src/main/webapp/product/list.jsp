<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Quản Lý Sản Phẩm - Bài Kiểm Tra Cuối Module</title>
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
            padding: 30px 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }
        header {
            border-bottom: 2px solid #e9ecef;
            padding-bottom: 20px;
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        h1 {
            font-size: 26px;
            color: #212529;
        }
        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 12px;
        }
        .btn {
            display: inline-block;
            padding: 9px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: background-color 0.2s ease;
        }
        .btn-primary {
            background-color: #0d6efd;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        .btn-edit {
            background-color: #ffc107;
            color: #212529;
            padding: 6px 12px;
            margin-right: 6px;
        }
        .btn-edit:hover {
            background-color: #ffca2c;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
            padding: 6px 12px;
        }
        .btn-delete:hover {
            background-color: #bb2d3b;
        }
        .search-form {
            display: flex;
            gap: 8px;
        }
        .search-form input[type="text"] {
            padding: 8px 12px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            width: 250px;
            font-size: 14px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px 14px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background-color: #f1f3f5;
            color: #495057;
            font-weight: 600;
        }
        tr:hover {
            background-color: #f8f9fa;
        }
        .price-col {
            font-weight: bold;
            color: #198754;
        }
        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            background-color: #e9ecef;
            color: #495057;
        }
        .empty-row {
            text-align: center;
            color: #6c757d;
            padding: 30px;
        }
        footer {
            margin-top: 25px;
            font-size: 13px;
            color: #6c757d;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <div>
            <h1>Hệ Thống Quản Lý Sản Phẩm</h1>
            <p style="color: #6c757d; font-size: 14px; margin-top: 4px;">Bài Kiểm Tra Cuối Module - JSP, Servlet, JDBC & MySQL</p>
        </div>
        <a href="products?action=create" class="btn btn-primary">+ Thêm Sản Phẩm Mới</a>
    </header>

    <div class="toolbar">
        <form action="products" method="get" class="search-form">
            <input type="hidden" name="action" value="search" />
            <input type="text" name="keyword" placeholder="Tìm kiếm theo tên sản phẩm..." value="${keyword}" />
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            <c:if test="${not empty keyword}">
                <a href="products" class="btn" style="background-color: #6c757d; color: white;">Xóa lọc</a>
            </c:if>
        </form>
        <div>
            <span class="badge">Tổng số: ${products.size()} sản phẩm</span>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th style="width: 80px;">ID</th>
            <th>Tên Sản Phẩm</th>
            <th style="width: 140px;">Đơn Giá ($)</th>
            <th style="width: 120px;">Số Lượng</th>
            <th style="width: 180px;">Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>#${product.id}</td>
                <td><strong><c:out value="${product.name}" /></strong></td>
                <td class="price-col">$<c:out value="${product.price}" /></td>
                <td><span class="badge"><c:out value="${product.quantity}" /> chiếc</span></td>
                <td>
                    <a href="products?action=edit&id=${product.id}" class="btn btn-edit">Sửa</a>
                    <a href="products?action=delete&id=${product.id}" class="btn btn-delete"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm \'${product.name}\' không?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty products}">
            <tr>
                <td colspan="5" class="empty-row">Không tìm thấy sản phẩm nào trong hệ thống.</td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <footer>
        <p>&copy; 2026 CodeGym Final Exam - Phát triển ứng dụng Web với JSP & Servlet</p>
    </footer>
</div>
</body>
</html>
