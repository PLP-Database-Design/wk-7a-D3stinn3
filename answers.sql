-- 🛠️ Question 1: Achieving 1NF
-- Original table has multiple values in the Products column (violates 1NF)
-- Transform it so each row has only one product per order

-- First, create a normalized ProductDetail_1NF table
CREATE TABLE ProductDetail_1NF (
  OrderID INT,
  CustomerName VARCHAR(100),
  Product VARCHAR(50)
);

-- Insert normalized rows (1 product per row)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- 🧩 Question 2: Achieving 2NF
-- Original table violates 2NF due to partial dependency: CustomerName depends only on OrderID

-- Step 1: Create separate Customers table
CREATE TABLE Customers (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- Step 2: Create separate OrderItems table for order-product-quantity info
CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(50),
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Step 3: Populate the Customers table
INSERT INTO Customers (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Populate the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

