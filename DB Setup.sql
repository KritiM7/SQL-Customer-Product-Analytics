USE datawarehouseanalytics;
CREATE TABLE `gold_fact_sales` (
  `order_number` varchar(50) DEFAULT NULL,
  `product_key` int DEFAULT NULL,
  `customer_key` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_amount` int DEFAULT NULL,
  `quantity` tinyint DEFAULT NULL,
  `price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

USE datawarehouseanalytics;
CREATE TABLE `gold_dim_customers` (
  `customer_key` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_number` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `create_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

USE datawarehouseanalytics;
CREATE TABLE `gold_dim_products` (
  `product_key` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `product_number` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `subcategory` varchar(50) DEFAULT NULL,
  `maintenance` varchar(50) DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `product_line` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
