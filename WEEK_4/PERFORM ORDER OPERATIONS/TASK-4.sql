
-- 4. PERFORM ORDER OPERATIONS

-- STEP 1: SELECT DATABASE
USE ecommerce_data_base;


-- A. INSERT OPERATION

-- STEP 2: INSERT A NEW ORDER
INSERT INTO Orders
    (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
SELECT
    5002,
    Customer_ID,
    CURDATE(),
    0.00,
    'Pending'
FROM Customer
ORDER BY Customer_ID
LIMIT 1;


-- STEP 3: INSERT PURCHASED PRODUCTS
INSERT INTO Order_Details
    (Order_ID, Product_ID, Quantity, Price)
SELECT
    5002,
    Product_ID,
    2,
    Price
FROM Product
ORDER BY Product_ID
LIMIT 1;


-- STEP 4: UPDATE TOTAL ORDER AMOUNT
UPDATE Orders
SET Total_Amount = (
    SELECT SUM(Quantity * Price)
    FROM Order_Details
    WHERE Order_ID = 5002
)
WHERE Order_ID = 5002;


-- B. UPDATE OPERATION

-- STEP 5: UPDATE ORDER STATUS
UPDATE Orders
SET Order_Status = 'Delivered'
WHERE Order_ID = 5002;


-- STEP 6: UPDATE PRODUCT QUANTITY
UPDATE Order_Details
SET Quantity = 3
WHERE Order_ID = 5002;


-- STEP 7: RECALCULATE TOTAL ORDER AMOUNT
UPDATE Orders
SET Total_Amount = (
    SELECT SUM(Quantity * Price)
    FROM Order_Details
    WHERE Order_ID = 5002
)
WHERE Order_ID = 5002;


-- C. DELETE OPERATION

-- STEP 8: CREATE A CANCELLED ORDER FOR DEMONSTRATION
INSERT INTO Orders
    (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
SELECT
    5003,
    Customer_ID,
    CURDATE(),
    0.00,
    'Cancelled'
FROM Customer
ORDER BY Customer_ID
LIMIT 1;


-- STEP 9: DELETE THE TEST CANCELLED ORDER

DELETE FROM Orders
WHERE Order_ID = 5003
  AND Order_Status = 'Cancelled';

-- STEP 10: DISPLAY REMAINING ORDERS

SELECT * FROM Orders;

SELECT * FROM Order_Details;
