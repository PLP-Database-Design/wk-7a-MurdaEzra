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


2.Write an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

  -- Step 1: Create Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- Step 2: Insert unique orders
INSERT INTO Orders
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Step 3: Create OrderItems table
CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert item data
INSERT INTO OrderItems
SELECT OrderID, Product, Quantity
FROM OrderDetails;

