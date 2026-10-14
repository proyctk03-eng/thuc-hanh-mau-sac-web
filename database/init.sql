-- Khoi tao co so du lieu demo va bang users
CREATE DATABASE IF NOT EXISTS demo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE demo;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT(3) NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);

-- Them du lieu mau ban dau
INSERT INTO users(name, email, country) VALUES('Minh', 'minh@codegym.vn', 'Viet Nam');
INSERT INTO users(name, email, country) VALUES('Kante', 'kante@che.uk', 'Kenia');
INSERT INTO users(name, email, country) VALUES('Nguyen Tuan Dat', 'proyctk03@gmail.com', 'Viet Nam');

-- 1. Tao Stored Procedure de lay thong tin User theo ID
DELIMITER $$
DROP PROCEDURE IF EXISTS get_user_by_id$$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users
    WHERE users.id = user_id;
END$$
DELIMITER ;

-- 2. Tao Stored Procedure de them moi mot User
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_user$$
CREATE PROCEDURE insert_user(
    IN user_name VARCHAR(50),
    IN user_email VARCHAR(50),
    IN user_country VARCHAR(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
END$$
DELIMITER ;

-- ==============================================================
-- [BÀI TẬP] GỌI MYSQL STORED PROCEDURES TỪ JDBC
-- ==============================================================

-- 3. Tao Stored Procedure select_all_users (Hiển thị danh sách users)
DELIMITER $$
DROP PROCEDURE IF EXISTS select_all_users$$
CREATE PROCEDURE select_all_users()
BEGIN
    SELECT * FROM users ORDER BY id ASC;
END$$
DELIMITER ;

-- 4. Tao Stored Procedure update_user (Sửa thông tin user)
DELIMITER $$
DROP PROCEDURE IF EXISTS update_user$$
CREATE PROCEDURE update_user(
    IN user_id INT,
    IN user_name VARCHAR(120),
    IN user_email VARCHAR(220),
    IN user_country VARCHAR(120)
)
BEGIN
    UPDATE users
    SET name = user_name, email = user_email, country = user_country
    WHERE id = user_id;
END$$
DELIMITER ;

-- 5. Tao Stored Procedure delete_user (Xóa user)
DELIMITER $$
DROP PROCEDURE IF EXISTS delete_user$$
CREATE PROCEDURE delete_user(IN user_id INT)
BEGIN
    DELETE FROM users WHERE id = user_id;
END$$
DELIMITER ;

-- 6. Tao bang Employee phuc vu thuc hanh JDBC Transaction

CREATE TABLE IF NOT EXISTS Employee (
    id INT(11) AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(15, 2) NOT NULL,
    created_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
