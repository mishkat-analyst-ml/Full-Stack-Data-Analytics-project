SELECT *  FROM daraz_clean_dataset;

SELECT COUNT(*)  FROM daraz_clean_dataset;

SELECT  count(distinct Customer_Name) 
AS TOTAL_CUSTOMER 
FROM  daraz_clean_dataset;

SELECT SUM(sales) AS total_revenue
FROM daraz_clean_dataset;

SELECT Product_Name,SUM(sales) as revenue
from daraz_clean_dataset
group by Product_Name
order by revenue DESC
limit 10;

SELECT Category,sum(sales) as revenue
from daraz_clean_dataset
group by Category
order by revenue desc;


SELECT monthname(Order_Date) AS MONTH ,
 sum(sales) AS REVENUE
FROM daraz_clean_dataset
group by  monthname(Order_Date)
order by MONTH(Order_Date) desc;


SELECT year(Order_Date) as year , sum(sales) as revenue
from daraz_clean_dataset
group by year(Order_Date) ;

select Customer_Name , sum(sales) as revenue
from daraz_clean_dataset
group by Customer_Name
limit 10;

select Seller_Name,sum(sales) as revenue
from daraz_clean_dataset
group by Seller_Name;

SELECT Payment_Method,
       COUNT(*) AS total_orders,
       SUM(sales) AS revenue
FROM daraz_clean_dataset
GROUP BY Payment_Method;

select Customer_Name, sum(sales) as spending,
   CASE
           WHEN sum(sales) > 10000 then "premium"
           when sum(sales) > 6000 then "Gold"
           else 
              "Regular"
   end as customer
from daraz_clean_dataset
group by   Customer_Name
order by spending desc;
              
 with AvgSales AS (
       SELECT AVG(sales) as avg_sales
       from daraz_clean_dataset
 )    
 select Product_Name, sales
 from daraz_clean_dataset
 where sales > (select avg_sales 
 from AvgSales
 );
select Product_Name,
sales,
row_number() over(order by sales desc) as row_n
from daraz_clean_dataset;

select Product_Name ,
sales ,
rank() over(order by sales desc) as rank_num
from daraz_clean_dataset;

select Order_Date,sales,
sum(sales) over(order by sales desc) as running_total
from daraz_clean_dataset;

select Order_Date,sales,
LAG(sales) over(order by sales ) as previous_sales
from daraz_clean_dataset;