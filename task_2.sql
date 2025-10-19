-- Create and select the database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Drop existing tables (in correct dependency order)
DROP TABLE IF EXISTS ORDER_DETAILS;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS BOOKS;
DROP TABLE IF EXISTS AUTHORS;
DROP TABLE IF EXISTS CUSTOMERS;

-- ======================================
-- TABLE: AUTHORS
-- ======================================
CREATE TABLE AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
) ENGINE=INNODB;

-- ======================================
-- TABLE: BOOKS
-- ======================================
CREATE TABLE BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id)
        REFERENCES AUTHORS(author_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=INNODB;

-- ======================================
-- TABLE: CUSTOMERS
-- ======================================
CREATE TABLE CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
) ENGINE=INNODB;

-- ======================================
-- TABLE: ORDERS
-- ======================================
CREATE TABLE ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    FOREIGN KEY (customer_id)
        REFERENCES CUSTOMERS(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=INNODB;

-- ======================================
-- TABLE: ORDER_DETAILS
-- ======================================
CREATE TABLE ORDER_DETAILS (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES ORDERS(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id)
        REFERENCES BOOKS(book_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=INNODB;
