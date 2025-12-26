/* year-over-year (YoY) performance analysis*/

SELECT
YEAR(order_date) as order_year,
SUM(sales_amount) as total_Sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date);