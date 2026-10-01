USE orders_db;

-- Insertar datos de prueba para Carrito
INSERT INTO carts (user_id) VALUES (1);
INSERT INTO cart_items (cart_id, product_id, quantity, price) VALUES (1, 101, 2, 250.00);

-- Insertar datos de prueba para ordenes
INSERT INTO orders (user_id, total, status) VALUES (1, 500.00, 'CREATED');
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (1, 101, 2, 250.00);