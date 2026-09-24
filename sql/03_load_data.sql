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