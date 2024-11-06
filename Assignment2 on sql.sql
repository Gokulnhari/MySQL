-- 1. Create the database
CREATE DATABASE Sales;

-- 2. Use the database
USE Sales;

-- 3. Create the Orders table with the specified constraints
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(20) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(30) NOT NULL,
    Contact_No VARCHAR(20) UNIQUE NOT NULL
);

-- 4. Add a new column named order_quantity to the Orders table
ALTER TABLE Orders ADD order_quantity INT NOT NULL;

-- 5. Rename the Orders table to sales_orders
ALTER TABLE Orders RENAME TO sales_orders;

-- 6. Insert 10 rows into the sales_orders table
INSERT INTO sales_orders  VALUES
(1, 'Alice Johnson', 'Electronics', 'Laptop', '1234567890', 2),
(2, 'Bob Smith', 'Books', 'Novel', '1234567891', 1),
(3, 'Charlie Brown', 'Clothing', 'T-shirt', '1234567892', 3),
(4, 'Daisy Ridley', 'Home', 'Blender', '1234567893', 1),
(5, 'Ethan Hunt', 'Sports', 'Basketball', '1234567894', 4),
(6, 'Fiona Apple', 'Electronics', 'Headphones', '1234567895', 2),
(7, 'George Michael', 'Books', 'Cookbook', '1234567896', 1),
(8, 'Hannah Montana', 'Clothing', 'Jeans', '1234567897', 2),
(9, 'Ivy Green', 'Home', 'Toaster', '1234567898', 1),
(10, 'Jack Sparrow', 'Sports', 'Football', '1234567899', 3);

-- 7. Retrieve customer_name and Ordered_item from the sales_orders table
SELECT Customer_name, Ordered_item FROM sales_orders;

-- 8. Use the update command to change the name of the product for any row
UPDATE sales_orders SET Ordered_item = 'Smartphone' WHERE Order_Id = 1;

-- 9. Delete the sales_orders table from the database
DROP TABLE sales_orders;
