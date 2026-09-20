-- SQLBook: Code
SELECT * FROM retail_transactions
-- SQLBook: Code
-- LOAD CLEAN CSV INTO POSTGRESQL

TRUNCATE TABLE retail_transactions;

COPY retail_transactions (
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country,
    revenue
)
FROM '/Users/golden_horde/sql-ecommerce-analytics/data/online_retail_II_cleaned.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    QUOTE '"'
);
-- SQLBook: Code
SELECT * FROM retail_transactions LIMIT 10;
-- SQLBook: Code
--Check the date range of the transactions in the dataset
SELECT
    MIN(invoice_date) AS first_transaction,
    MAX(invoice_date) AS last_transaction
FROM retail_transactions;
-- SQLBook: Code
-- TOTAL REVENUE 
SELECT  SUM(revenue) AS total_revenue
FROM retail_transactions;

-- SQLBook: Code
-- MISSING CUSTOMER IDs

SELECT
    COUNT(*) AS missing_customer_id
FROM retail_transactions
WHERE customer_id IS NULL;

-- SQLBook: Code
-- INVALID QUANTITIES

SELECT
    COUNT(*) AS invalid_quantity_rows
FROM retail_transactions
WHERE quantity <= 0;
-- SQLBook: Code
-- INVALID PRICES

SELECT
    COUNT(*) AS invalid_price_rows
FROM retail_transactions
WHERE unit_price <= 0;
-- SQLBook: Code
-- CANCELLATION INVOICES
SELECT
    COUNT(*) AS cancellation_rows
FROM retail_transactions
WHERE invoice_no LIKE 'C%';
-- SQLBook: Code
-- DISTINCT CUSTOMERS

SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_transactions;
-- SQLBook: Code
-- DISTINCT PRODUCTS

SELECT
    COUNT(DISTINCT stock_code) AS unique_products
FROM retail_transactions;
-- SQLBook: Code
-- DISTINCT COUNTRIES

SELECT
    COUNT(DISTINCT country) AS unique_countries
FROM retail_transactions;
-- SQLBook: Code
SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(*) FILTER (WHERE quantity <= 0) AS invalid_quantity,
    COUNT(*) FILTER (WHERE unit_price <= 0) AS invalid_price,
    COUNT(*) FILTER (WHERE invoice_no LIKE 'C%') AS cancellations
FROM retail_transactions;