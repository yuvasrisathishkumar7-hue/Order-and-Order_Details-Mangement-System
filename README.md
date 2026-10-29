
# E-COMMERCE ORDER MANAGEMENT DATABASE SYSTEM

## WEEK 4: CUSTOMER ORDER HISTORY AND REPORT GENERATION

## PROJECT OVERVIEW

The **E-Commerce Order Management Database System** is designed to organize and manage important information in an e-commerce environment. This project focuses on the **Customer Order History and Report Generation Module** and covers customer order history, product-wise order analysis, customer spending analysis, average order value calculation, and database record verification using SQL queries.

## OBJECTIVES

- Analyze customer order history and purchasing activities.
- Generate customer order history reports.
- Display customer names, order IDs, dates, amounts, and order statuses.
- Generate product-wise order reports.
- Calculate the number of orders and total quantity sold for each product.
- Identify customers with the maximum number of orders.
- Calculate the total spending of each customer.
- Calculate the average order value for each customer.
- Exclude cancelled orders from sales analysis.
- Display all records from the Orders table.
- Display all records from the Order_Details table.
- Verify database operations through SQL execution results.

## ENTITIES IDENTIFIED

The following entities are used for the Week 4 Customer Order History and Report Generation Module:

- **Customer**
- **Orders**
- **Order_Details**
- **Product**

These tables are connected through primary key and foreign key relationships to generate meaningful reports.

## CUSTOMER TABLE

The Customer table stores customer information used to identify customers who have placed orders.

| **Field Name** | **Description** |
|---|---|
| Customer_ID | Unique identifier for each customer |
| Customer_Name | Name of the customer |

## ORDERS TABLE

The Orders table stores information about customer orders.

| **Field Name** | **Data Type** | **Constraint** |
|---|---|---|
| Order_ID | INT | PRIMARY KEY |
| Customer_ID | INT | FOREIGN KEY, NOT NULL |
| Order_Date | DATE | NOT NULL |
| Total_Amount | DECIMAL(10,2) | NOT NULL, CHECK |
| Order_Status | VARCHAR(20) | NOT NULL, CHECK |

## ORDER_DETAILS TABLE

The Order_Details table stores information about products purchased in each order.

| **Field Name** | **Data Type** | **Constraint** |
|---|---|---|
| Order_Detail_ID | INT | PRIMARY KEY, AUTO_INCREMENT |
| Order_ID | INT | FOREIGN KEY, NOT NULL |
| Product_ID | INT | FOREIGN KEY, NOT NULL |
| Quantity | INT | NOT NULL, CHECK |
| Price | DECIMAL(10,2) | NOT NULL, CHECK |

## PRODUCT TABLE

The Product table stores product information required for product-wise order analysis.

| **Field Name** | **Description** |
|---|---|
| Product_ID | Unique identifier for each product |
| Product_Name | Name of the product |
| Price | Price of the product |

## DATABASE OPERATIONS

The project implements the following SQL operations for customer order history and report generation:

- **SELECT** – Retrieves customer, order, and product information.
- **JOIN** – Combines records from related tables.
- **COUNT()** – Calculates the number of orders.
- **SUM()** – Calculates total quantities sold and customer spending.
- **AVG()** – Calculates the average order value.
- **GROUP BY** – Groups records by customer or product.
- **HAVING** – Filters grouped results to identify customers with maximum orders.
- **CASE** – Excludes cancelled orders from spending and average calculations.
- **COALESCE()** – Handles NULL values in report results.
- **ORDER BY** – Sorts report results.
- **Subqueries** – Identify customers with the highest number of orders.

## SQL SCRIPT

The SQL script is organized into the following execution steps:

1. Select Existing Database
2. Generate Customer Order History Report
3. Generate Product-Wise Order Report
4. Calculate the Number of Orders for Each Product
5. Calculate the Total Quantity Sold
6. Identify Customers with Maximum Orders
7. Calculate Total Spending by Each Customer
8. Calculate Average Order Value
9. Display All Orders
10. Display All Order Details

## CUSTOMER ORDER HISTORY REPORT

The Customer Order History Report displays the following information:

- Customer name
- Order ID
- Order date
- Total order amount
- Order status

The report combines the Customer and Orders tables using the `Customer_ID` field. The results are arranged by order date in descending order to display the most recent orders first.

## PRODUCT-WISE ORDER REPORT

The Product-Wise Order Report analyzes product sales using the Product, Order_Details, and Orders tables.

The report displays:

- Product ID
- Product name
- Number of orders
- Total quantity sold

Cancelled orders are excluded from the report to provide a more meaningful analysis of product sales.

## CUSTOMER ORDER ANALYSIS

The project performs customer order analysis to:

- Identify customers who have placed the maximum number of non-cancelled orders.
- Calculate the total spending of each customer.
- Calculate the average value of non-cancelled orders.
- Include customers who have not placed any orders in the spending and average-value reports.
- Arrange customer spending and average order values in descending order.

## DATABASE RECORD VERIFICATION

The following SQL queries are used to display and verify the stored records:

```sql
SELECT * FROM Orders;

SELECT * FROM Order_Details;
```

These queries display all records stored in the Orders and Order_Details tables.

## OUTPUT VERIFICATION

The SQL queries were executed, and the corresponding output screenshots are included in the project report. These outputs help verify customer order history, product-wise sales, customer spending, average order value, and database records.

## ER DIAGRAM

The ER diagram represents the relationships between the Customer, Orders, Order_Details, and Product tables.

- **Customer – Orders:** One customer can place multiple orders.
- **Orders – Order_Details:** One order can contain multiple order detail records.
- **Product – Order_Details:** One product can appear in multiple order detail records.

These relationships help maintain data consistency and support accurate report generation.

## CONCLUSION

The project establishes a structured **Customer Order History and Report Generation Module** for the E-Commerce Order Management Database System. It covers customer order history, product-wise sales analysis, customer spending, average order value, and database record verification. SQL joins, aggregate functions, grouping, sorting, and subqueries are used to generate meaningful reports. The execution results are verified through the corresponding screenshots included in the project report.
