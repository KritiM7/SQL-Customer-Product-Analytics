/* Analyze the yearly performance of products by comparing their sales
to both the average sales performance of the product and the previous year's sales */

SELECT 
    YEAR(s.order_date) AS order_year,
    p.product_name,
    SUM(s.sales_amount) AS current_sales,
    LAG(SUM(s.sales_amount)) OVER (PARTITION BY p.product_name ORDER BY YEAR(s.order_date)) AS prev_year_sales,
    AVG(SUM(s.sales_amount)) OVER (PARTITION BY p.product_name) AS avg_sales,
    CASE 
        WHEN SUM(s.sales_amount) > LAG(SUM(s.sales_amount)) OVER (PARTITION BY p.product_name ORDER BY YEAR(s.order_date)) THEN '▲ Improved'
        WHEN SUM(s.sales_amount) < LAG(SUM(s.sales_amount)) OVER (PARTITION BY p.product_name ORDER BY YEAR(s.order_date)) THEN '▼ Declined'
        ELSE 'No Change'
    END AS yearly_change
FROM gold_fact_sales s
JOIN gold_dim_products p ON s.product_key = p.product_key
GROUP BY order_year, p.product_name
ORDER BY p.product_name, order_year;

-- Which categories contribute the most to overall sales?
SELECT 
    category,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS category_rank,
    ROUND((total_sales / SUM(total_sales) OVER()) * 100, 2) AS pct_contribution
FROM (
    SELECT 
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_products p ON f.product_key = p.product_key
    GROUP BY p.category
) AS category_summary
ORDER BY total_sales DESC;

/*Segment products into cost ranges and count how many products fall into each segment*/
SELECT 
    cost_range,
    COUNT(product_key) AS total_products
FROM (
    SELECT 
        s.product_key, 
        CASE 
            WHEN s.price < 100 THEN 'Low Cost (<100)'
            WHEN s.price BETWEEN 100 AND 500 THEN 'Mid Cost (100-500)'
            WHEN s.price > 500 THEN 'High Cost (>500)'
            ELSE 'Other'
        END AS cost_range
    FROM gold_fact_sales s
    JOIN gold_dim_products p ON s.product_key = p.product_key
) AS product_segment 
GROUP BY cost_range
ORDER BY total_products DESC;