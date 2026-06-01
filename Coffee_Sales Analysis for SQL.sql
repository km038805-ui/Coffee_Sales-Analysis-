 -- Q1 : What is the total revenue generated from coffee sales?
 
SELECT 
    round(SUM([Final_Sales]),2) AS Total_Revenue 
FROM Class.dbo.Coffee_Sales 


-- Q2 : What is the total number of orders and total quantity of coffee beans sold?
SELECT 
    COUNT(*) AS Total_Orders, 
    SUM(Quantity) AS Total_Quantity_Sold 
FROM Class.dbo.Coffee_Sales;
    


    -- Q3 : Which cities generated the highest revenue?
SELECT 
    City, 
    round(SUM([Final_Sales]),2) AS Total_Revenue 
FROM 
    Class.dbo.Coffee_Sales 
GROUP BY 
    City 
ORDER BY 
    Total_Revenue DESC;


    
    -- Q4 : What is the Average Order Value (AOV) for each city?
SELECT 
    City, 
    round(AVG([Final_Sales]),2) AS Average_Order_Value 
FROM 
    Class.dbo.Coffee_Sales 
GROUP BY 
    City 
ORDER BY 
    Average_Order_Value DESC;


    -- Q5 : What are the top-selling coffee products based on total revenue?
 
SELECT 
    Product, 
    SUM([Final_Sales]) AS Total_Revenue,
    SUM(Quantity) AS Total_Quantity
FROM 
    Class.dbo.Coffee_Sales 
GROUP BY 
    Product 
ORDER BY 
    Total_Revenue DESC;


-- Q6 : How does applying a discount affect the total revenue and number of orders?
SELECT 
    Used_Discount, 
    COUNT(*) AS Total_Orders, 
    SUM([Final_Sales]) AS Total_Revenue 
FROM 
    Class.dbo.Coffee_Sales 
GROUP BY 
    Used_Discount;


    -- Q7 : Which city received the highest amount of discount?
SELECT 
    City, 
    SUM(Discount_Amount) AS Total_Discount_Given 
FROM 
    Class.dbo.Coffee_Sales 
GROUP BY 
    City 
ORDER BY 
    Total_Discount_Given DESC;


    -- Q8 : What is the monthly sales trend for the years 2023 and 2024?
SELECT 
    YEAR(Date) AS Sales_Year, 
    MONTH(Date) AS Sales_Month, 
    SUM([Final_Sales]) AS Monthly_Revenue 
FROM 
    Class.dbo.Coffee_Sales 
GROUP BY 
    YEAR(Date), 
    MONTH(Date) 
ORDER BY 
    Sales_Year, 
    Sales_Month;
