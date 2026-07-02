USE SalesDB;

SELECT 
    Country,
    Region,
    City,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity
FROM dbo.sales_dataset
GROUP BY ROLLUP (Country, Region, City)
ORDER BY Country, Region, City;