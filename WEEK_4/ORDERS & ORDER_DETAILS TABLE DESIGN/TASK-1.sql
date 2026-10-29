-- E-COMMERCE ORDER MANAGEMENT DATABASE SYSTEM
-- WEEK 4: ORDER MANAGEMENT SYSTEM


-- 1. Design Orders and Order_Details Tables

-- Step 1: Select Existing Database
USE ecommerce_data_base;


-- Step 2: Create Orders Table
CREATE TABLE Orders (
    Order_ID        INT             PRIMARY KEY,
    Customer_ID     INT             NOT NULL,
    Order_Date      DATE            NOT NULL,
    Total_Amount    DECIMAL(10,2)   NOT NULL,
    Order_Status    VARCHAR(20)     NOT NULL,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_total_amount
        CHECK (Total_Amount >= 0),

    CONSTRAINT chk_order_status
        CHECK (Order_Status IN
        ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);


-- Step 3: Create Order_Details Table
CREATE TABLE Order_Details (
    Order_Detail_ID INT             PRIMARY KEY AUTO_INCREMENT,
    Order_ID        INT             NOT NULL,
    Product_ID      INT             NOT NULL,
    Quantity        INT             NOT NULL,
    Price           DECIMAL(10,2)   NOT NULL,

    CONSTRAINT fk_order_details_order
        FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_order_details_product
        FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_order_quantity
        CHECK (Quantity > 0),

    CONSTRAINT chk_order_price
        CHECK (Price >= 0)
);


-- Step 4: View Tables
SHOW TABLES;

DESC Orders;
DESC Order_Details;

