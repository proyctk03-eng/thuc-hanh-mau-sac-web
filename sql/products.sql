-- =======================================================
-- BÀI KIỂM TRA CUỐI MODULE: PHÁT TRIỂN ỨNG DỤNG WEB JSP & SERVLET
-- CƠ SỞ DỮ LIỆU: product_management
-- BẢNG DỮ LIỆU: products
-- =======================================================

CREATE DATABASE IF NOT EXISTS product_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE product_management;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    price DOUBLE NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id)
);

-- Dữ liệu khởi tạo mẫu
INSERT INTO products (name, price, quantity) VALUES
('Laptop Dell XPS 15', 1850.00, 15),
('iPhone 15 Pro Max', 1199.99, 25),
('Samsung Galaxy S24 Ultra', 1099.50, 20),
('Bàn phím cơ Keychron K2', 89.00, 50),
('Chuột Logitech MX Master 3S', 99.99, 40),
('Màn hình LG UltraWide 34 inch', 450.00, 12),
('Tai nghe Sony WH-1000XM5', 348.00, 30);
