/*monthly trend analysis of sales, customer volume, 
and quantities to identify seasonal patterns and monitor month-over-month growth performance.*/

SELECT
DATE_FORMAT(order_date, '%b, %Y') as order_date,
YEAR(order_date) as YEAR,
SUM(sales_amount) as total_Sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date), order_date
ORDER BY YEAR(order_date), MONTH(order_date);