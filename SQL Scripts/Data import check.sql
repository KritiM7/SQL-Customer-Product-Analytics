USE datawarehouseanalytics;
SELECT 'customers' as table_name, COUNT(*) FROM gold_dim_customers
UNION
-- Check Product count
SELECT 'products', COUNT(*) FROM gold_dim_products
UNION
-- Check Sales count
SELECT 'sales', COUNT(*) FROM gold_fact_sales;
