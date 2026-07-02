DROP DATABASE IF EXISTS salesdb;
CREATE DATABASE salesdb;
USE salesdb;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) DEFAULT 0,
    status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE audit_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50),
    action_type VARCHAR(20),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE deleted_orders (
    deleted_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    total_amount DECIMAL(10,2),
    status VARCHAR(30),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers (name, email, phone)
VALUES
('Ali Khan', 'ali@gmail.com', '03001234567'),
('Sara Ahmed', 'sara@gmail.com', '03111234567'),
('Usman Raza', 'usman@gmail.com', '03221234567');

INSERT INTO products (product_name, price, stock)
VALUES
('Keyboard', 2500, 20),
('Mouse', 1200, 35),
('Monitor', 25000, 10),
('USB Cable', 500, 50);

INSERT INTO orders (customer_id, total_amount, status)
VALUES
(1, 2500, 'Pending'),
(2, 1200, 'Completed'),
(3, 25000, 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, price, subtotal)
VALUES
(1, 1, 1, 2500, 2500),
(2, 2, 1, 1200, 1200),
(3, 3, 1, 25000, 25000);

DELIMITER $$

CREATE TRIGGER before_product_insert
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    SET NEW.product_name = TRIM(NEW.product_name);

    IF NEW.price <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product price must be greater than 0';
    END IF;

    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product stock cannot be negative';
    END IF;
END$$

CREATE TRIGGER after_product_insert
AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, action_type, description)
    VALUES (
        'products',
        'INSERT',
        CONCAT(
            'New product added: ',
            NEW.product_name,
            ', Price: ',
            NEW.price,
            ', Stock: ',
            NEW.stock
        )
    );
END$$

CREATE TRIGGER before_product_update
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    SET NEW.product_name = TRIM(NEW.product_name);

    IF NEW.price <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Updated price must be greater than 0';
    END IF;

    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Updated stock cannot be negative';
    END IF;

    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER after_product_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, action_type, description)
    VALUES (
        'products',
        'UPDATE',
        CONCAT(
            'Product updated: ',
            NEW.product_name,
            '. Old Price: ',
            OLD.price,
            ', New Price: ',
            NEW.price,
            '. Old Stock: ',
            OLD.stock,
            ', New Stock: ',
            NEW.stock
        )
    );
END$$

CREATE TRIGGER before_order_delete
BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO deleted_orders (order_id, customer_id, total_amount, status)
    VALUES (
        OLD.order_id,
        OLD.customer_id,
        OLD.total_amount,
        OLD.status
    );
END$$

CREATE TRIGGER after_product_delete
AFTER DELETE ON products
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (table_name, action_type, description)
    VALUES (
        'products',
        'DELETE',
        CONCAT(
            'Product deleted: ',
            OLD.product_name,
            ', Price was: ',
            OLD.price,
            ', Stock was: ',
            OLD.stock
        )
    );
END$$

DELIMITER ;