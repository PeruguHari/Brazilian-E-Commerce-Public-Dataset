-- Total Revenue --
SELECT
SUM(payment_value) as TotalValue
FROM sales;

-- Top 10 Cities --
SELECT customer_city,
COUNT(*) AS saless
FROM sales
GROUP BY customer_city
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Monthly Revenue --
SELECT
    MONTH(order_purchase_timestamp) as month,
    SUM(payment_value) AS revenue
FROM sales
GROUP BY MONTH(order_purchase_timestamp)
ORDER BY MONTH(order_purchase_timestamp);

-- Average Order Value --
Select 
avg(payment_value) as AverageOrder
from sales;

-- Top Customers --
select 
	customer_id,
	sum(payment_value) as TotalValue
from sales
group by customer_id
order by sum(payment_value) desc;

-- Window Function --
select
	sum(payment_value) TotalValue,
	rank() over
    (order by sum(payment_value) desc) as ranks
from sales
group by customer_id;

-- Total Orders --
SELECT
COUNT(DISTINCT order_id) as TotalOrders
FROM sales;

-- Total Customers --
SELECT
COUNT(DISTINCT customer_id) as TotalCustomers
FROM sales;

-- Average Order Value (AOV) --
SELECT
SUM(payment_value)
/ COUNT(DISTINCT order_id)
AS avg_order_value
FROM sales;

