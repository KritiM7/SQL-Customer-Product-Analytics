/*Group customers into three segments based on their spending behavior:
- VIP: Customers with at least 12 months of history and spending more than €5,000.
- Regular: Customers with at least 12 months of history but spending €5,000 or less
- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group*/

WITH customer_spending AS 
(
SELECT
c.customer_key,
SUM(s.sales_amount) AS total_spending,
MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
TIMESTAMPDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
FROM gold_fact_sales s
LEFT JOIN gold_dim_customers c
ON s.customer_key = c.customer_key
GROUP BY c.customer_key)
SELECT
CASE WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
ELSE 'New'
END customer_segment,
COUNT(customer_key) AS total_customers
FROM customer_spending
GROUP BY customer_segment
