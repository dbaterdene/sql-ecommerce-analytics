-- SQLBook: Code
-- CREATE TRANSACTION TABLE

DROP TABLE IF EXISTS retail_transactions;

CREATE TABLE retail_transactions (
    invoice_no      VARCHAR(20),
    stock_code      VARCHAR(30),
    description     TEXT,
    quantity        INTEGER,
    invoice_date    TIMESTAMP,
    unit_price      NUMERIC(12, 2),
    customer_id     FLOAT,
    country         VARCHAR(100),
    revenue         NUMERIC(14, 2)
);