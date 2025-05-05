1. Write an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order

-- Step 1: Create the original table
CREATE TABLE ProductDetail (
  OrderID INT,
  CustomerName VARCHAR(100),
  Products TEXT
);

-- Step 2: Insert sample data
INSERT INTO ProductDetail VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Step 3: Convert to 1NF (PostgreSQL example)
SELECT 
  OrderID,
  CustomerName,
  TRIM(value) AS Product
FROM ProductDetail,
LATERAL unnest(string_to_array(Products, ',')) AS value;


2.
