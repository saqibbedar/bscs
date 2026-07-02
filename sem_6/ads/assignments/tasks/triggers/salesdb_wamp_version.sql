-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 04, 2026 at 06:34 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `salesdb`
--
CREATE DATABASE IF NOT EXISTS `salesdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `salesdb`;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE IF NOT EXISTS `audit_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) DEFAULT NULL,
  `action_type` varchar(20) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`log_id`, `table_name`, `action_type`, `description`, `created_at`) VALUES
(1, 'products', 'INSERT', 'New product added: Headphones, Price: 4500.00, Stock: 25', '2026-06-04 05:50:11'),
(2, 'products', 'UPDATE', 'Product updated: Headphones. Old Price: 5000.00, New Price: 5200.00. Old Stock: 30, New Stock: 28', '2026-06-04 05:55:31'),
(3, 'products', 'INSERT', 'New product added: Temporary Product, Price: 1000.00, Stock: 5', '2026-06-04 06:09:59'),
(4, 'products', 'DELETE', 'Product deleted: Temporary Product, Price was: 1000.00, Stock was: 5', '2026-06-04 06:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `created_at`) VALUES
(1, 'Ali Khan', 'ali@gmail.com', '03001234567', '2026-06-04 05:41:27'),
(2, 'Sara Ahmed', 'sara@gmail.com', '03111234567', '2026-06-04 05:41:27'),
(3, 'Usman Raza', 'usman@gmail.com', '03221234567', '2026-06-04 05:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_orders`
--

CREATE TABLE IF NOT EXISTS `deleted_orders` (
  `deleted_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`deleted_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `deleted_orders`
--

INSERT INTO `deleted_orders` (`deleted_id`, `order_id`, `customer_id`, `total_amount`, `status`, `deleted_at`) VALUES
(1, 1, 1, '2500.00', 'Pending', '2026-06-04 06:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) DEFAULT '0.00',
  `status` varchar(30) DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `status`) VALUES
(2, 1, '2026-06-04 06:08:31', '2500.00', 'Pending');

--
-- Triggers `orders`
--
DROP TRIGGER IF EXISTS `before_order_delete`;
DELIMITER //
CREATE TRIGGER `before_order_delete` BEFORE DELETE ON `orders`
 FOR EACH ROW BEGIN
    INSERT INTO deleted_orders (order_id, customer_id, total_amount, status)
    VALUES (
        OLD.order_id,
        OLD.customer_id,
        OLD.total_amount,
        OLD.status
    );
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Keyboard', '2500.00', 20, '2026-06-04 05:41:27', '2026-06-04 05:41:27'),
(2, 'Mouse', '1200.00', 35, '2026-06-04 05:41:27', '2026-06-04 05:41:27'),
(3, 'Monitor', '25000.00', 10, '2026-06-04 05:41:27', '2026-06-04 05:41:27'),
(4, 'USB Cable', '500.00', 50, '2026-06-04 05:41:27', '2026-06-04 05:41:27'),
(5, 'Laptop Stand', '3000.00', 15, '2026-06-04 05:45:26', '2026-06-04 05:45:26'),
(6, 'Headphones', '5200.00', 28, '2026-06-04 05:50:11', '2026-06-04 05:55:31');

--
-- Triggers `products`
--
DROP TRIGGER IF EXISTS `after_product_delete`;
DELIMITER //
CREATE TRIGGER `after_product_delete` AFTER DELETE ON `products`
 FOR EACH ROW BEGIN
    INSERT INTO audit_logs (table_name, action_type, description)
    VALUES (
        'products',
        'DELETE',
        CONCAT('Product deleted: ', OLD.product_name,
               ', Price was: ', OLD.price,
               ', Stock was: ', OLD.stock)
    );
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_product_insert`;
DELIMITER //
CREATE TRIGGER `after_product_insert` AFTER INSERT ON `products`
 FOR EACH ROW BEGIN
    INSERT INTO audit_logs (table_name, action_type, description)
    VALUES (
        'products',
        'INSERT',
        CONCAT('New product added: ', NEW.product_name, 
               ', Price: ', NEW.price, 
               ', Stock: ', NEW.stock)
    );
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `after_product_update`;
DELIMITER //
CREATE TRIGGER `after_product_update` AFTER UPDATE ON `products`
 FOR EACH ROW BEGIN
    INSERT INTO audit_logs (table_name, action_type, description)
    VALUES (
        'products',
        'UPDATE',
        CONCAT(
            'Product updated: ', NEW.product_name,
            '. Old Price: ', OLD.price,
            ', New Price: ', NEW.price,
            '. Old Stock: ', OLD.stock,
            ', New Stock: ', NEW.stock
        )
    );
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_product_insert`;
DELIMITER //
CREATE TRIGGER `before_product_insert` BEFORE INSERT ON `products`
 FOR EACH ROW BEGIN
    SET NEW.product_name = TRIM(NEW.product_name);

    IF NEW.price <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product price must be greater than 0';
    END IF;

    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product stock cannot be negative';
    END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `before_product_update`;
DELIMITER //
CREATE TRIGGER `before_product_update` BEFORE UPDATE ON `products`
 FOR EACH ROW BEGIN
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
END
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
