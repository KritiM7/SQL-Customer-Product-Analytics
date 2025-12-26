/*cumulative revenue growth and progress toward annual sales targets*/

SELECT 
    order_year,
    order_month,
    monthly_sales,
    SUM(monthly_sales) OVER (
        PARTITION BY order_year 
        ORDER BY sort_date
    ) AS yearly_cumulative_sales
FROM (
    SELECT 
        YEAR(order_date) AS order_year,
        DATE_FORMAT(order_date, '%b') AS order_month,
        SUM(sales_amount) AS monthly_sales,
        MIN(order_date) AS sort_date
    FROM gold_fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY order_year, order_month
) AS monthly_summary
ORDER BY sort_date;