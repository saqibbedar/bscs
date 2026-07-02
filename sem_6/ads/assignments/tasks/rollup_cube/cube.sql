
use SalesDB;


SELECT * FROM dbo.sales_dataset;



SELECT 
    Product_Category,
    Region,
    YEAR(Date) AS Year,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity
FROM dbo.sales_dataset
GROUP BY CUBE (Product_Category, Region, YEAR(Date));


