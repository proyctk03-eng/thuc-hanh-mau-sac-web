package com.codegym.dao;

import com.codegym.model.Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ProductDAO implements IProductDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/product_management?useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products (name, price, quantity) VALUES (?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT id, name, price, quantity FROM products WHERE id = ?;";
    private static final String SELECT_ALL_PRODUCTS = "SELECT id, name, price, quantity FROM products ORDER BY id ASC;";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM products WHERE id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE products SET name = ?, price = ?, quantity = ? WHERE id = ?;";
    private static final String SEARCH_PRODUCTS_SQL = "SELECT id, name, price, quantity FROM products WHERE name LIKE ? ORDER BY id ASC;";

    // In-memory fallback map để đảm bảo ứng dụng luôn chạy trơn tru ngay cả khi MySQL chưa khởi động
    private static final Map<Integer, Product> fallbackProducts = new ConcurrentHashMap<>();
    private static int fallbackIdSequence = 1;

    static {
        fallbackProducts.put(fallbackIdSequence, new Product(fallbackIdSequence++, "Laptop Dell XPS 15", 1850.00, 15));
        fallbackProducts.put(fallbackIdSequence, new Product(fallbackIdSequence++, "iPhone 15 Pro Max", 1199.99, 25));
        fallbackProducts.put(fallbackIdSequence, new Product(fallbackIdSequence++, "Samsung Galaxy S24 Ultra", 1099.50, 20));
        fallbackProducts.put(fallbackIdSequence, new Product(fallbackIdSequence++, "Bàn phím cơ Keychron K2", 89.00, 50));
        fallbackProducts.put(fallbackIdSequence, new Product(fallbackIdSequence++, "Chuột Logitech MX Master 3S", 99.99, 40));
    }

    public ProductDAO() {
    }

    public ProductDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // Không ngắt ứng dụng nếu chưa kết nối được MySQL
        }
        return connection;
    }

    @Override
    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        Connection connection = getConnection();
        if (connection != null) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);
                 ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    products.add(new Product(id, name, price, quantity));
                }
                connection.close();
                return products;
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        // Fallback in-memory
        return new ArrayList<>(fallbackProducts.values());
    }

    @Override
    public Product selectProduct(int id) {
        Connection connection = getConnection();
        if (connection != null) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
                preparedStatement.setInt(1, id);
                ResultSet rs = preparedStatement.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    connection.close();
                    return new Product(id, name, price, quantity);
                }
                connection.close();
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        return fallbackProducts.get(id);
    }

    @Override
    public void insertProduct(Product product) throws SQLException {
        Connection connection = getConnection();
        if (connection != null) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
                preparedStatement.setString(1, product.getName());
                preparedStatement.setDouble(2, product.getPrice());
                preparedStatement.setInt(3, product.getQuantity());
                preparedStatement.executeUpdate();
                connection.close();
                return;
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        // Fallback in-memory
        int newId = fallbackIdSequence++;
        product.setId(newId);
        fallbackProducts.put(newId, product);
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        Connection connection = getConnection();
        if (connection != null) {
            try (PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
                statement.setString(1, product.getName());
                statement.setDouble(2, product.getPrice());
                statement.setInt(3, product.getQuantity());
                statement.setInt(4, product.getId());
                boolean rowUpdated = statement.executeUpdate() > 0;
                connection.close();
                return rowUpdated;
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        // Fallback in-memory
        if (fallbackProducts.containsKey(product.getId())) {
            fallbackProducts.put(product.getId(), product);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        Connection connection = getConnection();
        if (connection != null) {
            try (PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
                statement.setInt(1, id);
                boolean rowDeleted = statement.executeUpdate() > 0;
                connection.close();
                return rowDeleted;
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        // Fallback in-memory
        return fallbackProducts.remove(id) != null;
    }

    @Override
    public List<Product> searchByName(String keyword) {
        List<Product> products = new ArrayList<>();
        Connection connection = getConnection();
        if (connection != null) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_PRODUCTS_SQL)) {
                preparedStatement.setString(1, "%" + keyword + "%");
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    products.add(new Product(id, name, price, quantity));
                }
                connection.close();
                return products;
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        // Fallback in-memory
        String lowerKeyword = keyword.toLowerCase();
        for (Product p : fallbackProducts.values()) {
            if (p.getName().toLowerCase().contains(lowerKeyword)) {
                products.add(p);
            }
        }
        return products;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
            }
        }
    }
}
