CREATE DATABASE IF NOT EXISTS orders_db;
USE orders_db;

-- Carritos
CREATE TABLE IF NOT EXISTS carts (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     user_id BIGINT NOT NULL,
                                     created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                                     updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Items del carrito
CREATE TABLE IF NOT EXISTS cart_items (
                                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                          cart_id BIGINT NOT NULL,
                                          product_id BIGINT NOT NULL,
                                          quantity INT NOT NULL,
                                          price DECIMAL(10, 2) NOT NULL
    );

-- Ordenes
CREATE TABLE IF NOT EXISTS orders (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      user_id BIGINT NOT NULL,
                                      total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- Detalles de ordenes
CREATE TABLE IF NOT EXISTS order_items (
                                           id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                           order_id BIGINT NOT NULL,
                                           product_id BIGINT NOT NULL,
                                           quantity INT NOT NULL,
                                           unit_price DECIMAL(10, 2) NOT NULL
    );