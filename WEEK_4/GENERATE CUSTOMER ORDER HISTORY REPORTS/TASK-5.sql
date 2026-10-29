
-- 5. GENERATE CUSTOMER ORDER HISTORY REPORTS

-- STEP 1: SELECT DATABASE
USE ecommerce_data_base;


-- REPORT 1: CUSTOMER ORDER HISTORY
-- Display customer name, order ID, date, amount and status

SELECT
    C.Customer_Name,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount,
    O.Order_Status
FROM Customer C
JOIN Orders O
    ON C.Customer_ID = O.Customer_ID
ORDER BY O.Order_Date DESC;


-- REPORT 2: PRODUCT-WISE ORDER REPORT
-- Find number of orders and total quantity sold

SELECT
    P.Product_ID,
    P.Product_Name,
    COUNT(DISTINCT OD.Order_ID) AS Number_Of_Orders,
    SUM(OD.Quantity) AS Total_Quantity_Sold
FROM Product P
JOIN Order_Details OD
    ON P.Product_ID = OD.Product_ID
JOIN Orders O
    ON OD.Order_ID = O.Order_ID
WHERE O.Order_Status <> 'Cancelled'
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Total_Quantity_Sold DESC;


-- REPORT 3A: CUSTOMERS WITH MAXIMUM ORDERS

SELECT
    C.Customer_ID,
    C.Customer_Name,
    COUNT(O.Order_ID) AS Total_Orders
FROM Customer C
JOIN Orders O
    ON C.Customer_ID = O.Customer_ID
WHERE O.Order_Status <> 'Cancelled'
GROUP BY C.Customer_ID, C.Customer_Name
HAVING COUNT(O.Order_ID) = (
    SELECT MAX(Order_Count)
    FROM (
        SELECT COUNT(*) AS Order_Count
        FROM Orders
        WHERE Order_Status <> 'Cancelled'
        GROUP BY Customer_ID
    ) AS Order_Summary
);


-- REPORT 3B: TOTAL SPENDING BY EACH CUSTOMER

SELECT
    C.Customer_ID,
    C.Customer_Name,
    COALESCE(SUM(
        CASE
            WHEN O.Order_Status <> 'Cancelled'
            THEN O.Total_Amount
            ELSE 0
        END
    ), 0) AS Total_Spending
FROM Customer C
LEFT JOIN Orders O
    ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Total_Spending DESC;


-- REPORT 3C: AVERAGE ORDER VALUE

SELECT
    C.Customer_ID,
    C.Customer_Name,
    COALESCE(AVG(
        CASE
            WHEN O.Order_Status <> 'Cancelled'
            THEN O.Total_Amount
        END
    ), 0) AS Average_Order_Value
FROM Customer C
LEFT JOIN Orders O
    ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Average_Order_Value DESC;


-- STEP 2: VIEW ALL ORDERS
SELECT * FROM Orders;

-- STEP 3: VIEW ALL ORDER DETAILS
SELECT * FROM Order_Details;
