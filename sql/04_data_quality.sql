-- SQLBook: Code
--Total transactions
SELECT
    COUNT(*) AS total_transactions
FROM retail_transactions;
-- SQLBook: Code
-- Number of unique orders
SELECT
    COUNT(DISTINCT invoice_no) AS total_orders
FROM retail_transactions;
-- SQLBook: Code
-- Number of unique customers
SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_transactions
WHERE customer_id IS NOT NULL;
-- SQLBook: Code
-- number of unique products
SELECT
    COUNT(DISTINCT stock_code) AS unique_products
FROM retail_transactions;
-- SQLBook: Code
-- Number of unique countries
SELECT
    COUNT(DISTINCT country) AS unique_countries
FROM retail_transactions;
-- SQLBook: Code
-- Check quality of data in retail_transactions table
SELECT
    COUNT(*) AS total_rows,

    COUNT(*) FILTER (
        WHERE quantity <= 0
    ) AS invalid_quantity,

    COUNT(*) FILTER (
        WHERE unit_price <= 0
    ) AS invalid_price,

    COUNT(*) FILTER (
        WHERE invoice_no LIKE 'C%'
    ) AS cancellation_rows,

    COUNT(*) FILTER (
        WHERE customer_id IS NULL
    ) AS missing_customer_id
FROM retail_transactions;
-- SQLBook: Code
-- Check revenue calculation
SELECT
    COUNT(*) AS incorrect_revenue_rows
FROM retail_transactions
WHERE revenue <> quantity * unit_price;
-- SQLBook: Code
-- Check null values in retail_transactions table
SELECT
    COUNT(*) FILTER (WHERE invoice_no IS NULL) AS missing_invoice_no,
    COUNT(*) FILTER (WHERE stock_code IS NULL) AS missing_stock_code,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS missing_quantity,
    COUNT(*) FILTER (WHERE invoice_date IS NULL) AS missing_invoice_date,
    COUNT(*) FILTER (WHERE unit_price IS NULL) AS missing_unit_price,
    COUNT(*) FILTER (WHERE country IS NULL) AS missing_country
FROM retail_transactions;