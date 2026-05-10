USE data_analytics;

SELECT COUNT(*) FROM sales_data;

SELECT SUM(Sales) AS Total_Sales
FROM sales_data;

SELECT SUM(Profit) AS Total_Profit
FROM sales_data;

SELECT Region,
SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region;