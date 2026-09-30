-- ============================================================
-- Restaurant Orders SQL Analysis
-- File: 02_order_analysis.sql
-- Order-level analysis
-- ============================================================

USE restaurant_db;


-- ============================================================
-- 1. View the order_details table
-- ============================================================

SELECT *
FROM order_details;


-- ============================================================
-- 2. Find the date range of the orders
-- ============================================================

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM order_details;


-- ============================================================
-- 3. Count the total number of unique orders
-- ============================================================

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM order_details;


-- ============================================================
-- 4. Count the total number of items ordered
-- ============================================================

SELECT
    COUNT(*) AS total_items_ordered
FROM order_details;


-- ============================================================
-- 5. Find the orders containing the most items
-- ============================================================

SELECT
    order_id,
    COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;


-- ============================================================
-- 6. Find the number of orders containing more than 12 items
-- ============================================================

SELECT
    COUNT(*) AS orders_with_more_than_12_items
FROM (
    SELECT
        order_id,
        COUNT(item_id) AS num_items
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
) AS large_orders;
