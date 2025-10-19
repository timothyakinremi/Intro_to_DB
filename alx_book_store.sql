-- 1. Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- 2. Use the database
USE alx_book_store;

-- 3. Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 4. Create Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE(10, 2),
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- 5. Create Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- 6. Create Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- 7. Create Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

