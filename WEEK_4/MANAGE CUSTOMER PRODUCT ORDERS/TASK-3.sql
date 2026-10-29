
-- 3. MANAGE CUSTOMER PRODUCT ORDERS

-- STEP 1: SELECT DATABASE
USE ecommerce_data_base;

-- STEP 2: VIEW AVAILABLE CUSTOMERS
SELECT * FROM Customer;

-- STEP 3: VIEW AVAILABLE PRODUCTS
SELECT * FROM Product;


-- STEP 4: CREATE A NEW ORDER
-- Automatically selects an existing customer

INSERT INTO Orders
    (Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
SELECT
    5001,
    Customer_ID,
    CURDATE(),
    0.00,
    'Pending'
FROM Customer
ORDER BY Customer_ID
LIMIT 1;


-- STEP 5: ADD TWO PRODUCTS TO THE ORDER
-- Automatically selects existing products and their prices

INSERT INTO Order_Details
    (Order_ID, Product_ID, Quantity, Price)
SELECT
    5001,
    Product_ID,
    CASE
        WHEN rn = 1 THEN 1
        ELSE 2
    END,
    Price
FROM (
    SELECT
        Product_ID,
        Price,
        ROW_NUMBER() OVER (ORDER BY Product_ID) AS rn
    FROM Product
) AS P
WHERE rn <= 2;


-- STEP 6: CALCULATE TOTAL ORDER AMOUNT
UPDATE Orders
SET Total_Amount = (
    SELECT SUM(Quantity * Price)
    FROM Order_Details
    WHERE Order_ID = 5001
)
WHERE Order_ID = 5001;


-- STEP 7: UPDATE ORDER STATUS
UPDATE Orders
SET Order_Status = 'Shipped'
WHERE Order_ID = 5001;


-- STEP 8: DISPLAY COMPLETE ORDER DETAILS
SELECT
    C.Customer_Name,
    O.Order_ID,
    O.Order_Date,
    P.Product_Name,
    OD.Quantity,
    OD.Price,
    (OD.Quantity * OD.Price) AS Subtotal,
    O.Total_Amount,
    O.Order_Status
FROM Orders O
JOIN Customer C
    ON O.Customer_ID = C.Customer_ID
JOIN Order_Details OD
    ON O.Order_ID = OD.Order_ID
JOIN Product P
    ON OD.Product_ID = P.Product_ID
WHERE O.Order_ID = 5001;
