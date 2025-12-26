# SQL-Customer-Product-Analytics

# Project Overview
This project was created to see how raw retail data can be transformed into meaningful business insights. I built a reporting layer on top of a Star Schema database to help answer real-world questions like: "Who are our most loyal customers?" and "Which product categories are actually driving our revenue?"

I focused on moving data from a "raw" state into a structured schema, where I used advanced SQL techniques to create a set of views that are ready for a BI tool like Power BI or Tableau.

# Tech Stack & Skills
Database: MySQL
Concepts: Data Modeling, ETL logic, Star Schema
SQL Highlights: * Common Table Expressions (CTEs): Used to organize complex multi-step logic into readable blocks.
Window Functions: Applied LAG and AVG OVER to track Year-over-Year (YoY) performance and compare products against the average.
Subqueries: Used for data segmentation and pre-aggregating numbers before final calculations.
Date Arithmetic: Leveraged TIMESTAMPDIFF and DATEDIFF to calculate customer age and the "lifespan" of a customer relationship.

# Analysis Deep-Dive
1. Customer Segmentation
I didn't just want to know how much a customer spent, I wanted to know their value so I calculated a "lifespan" (months between their first and last order) and combined it with total spending to categorize them into VIP, Regular, and New segments.

2. Product Performance
I built a report_products view that calculates "Recency" (how many months since the last sale) and "Average Monthly Revenue". This helps identify "High-Performers" versus "Low-Performers" that might need a marketing push.

3. Category Contribution
Using Window Functions, I calculated the percentage contribution of each category to the grand total. This reveals exactly where the bulk of the company's money is coming from.

# What I Learned
During this project, I ran into some classic SQL hurdles—like handling division by zero when calculating average order revenue and figuring out the syntax errors. Solving these taught me the importance of writing "defensive" code (like using NULLIF) to ensure the reporting layer never breaks.
