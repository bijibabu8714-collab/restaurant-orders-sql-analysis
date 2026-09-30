-- ============================================================
-- Restaurant Orders SQL Analysis
-- File: 04_combined_analysis.sql
-- Combined analysis using JOINs
-- ============================================================

USE restaurant_db;


-- ============================================================
-- 1. Combine order details with menu information
-- ============================================================

SELECT
    od.order_details_id,
    od.order_id,
    od.order_date,
    od.order_time,
    od.item_id,
    mi.item_name,
    mi.category,
    mi.price
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id;


-- ============================================================
-- 2. Find the most ordered menu items
-- ============================================================

SELECT
    mi.item_name,
    mi.category,
    COUNT(od.order_details_id) AS num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY
    mi.item_name,
    mi.category
ORDER BY num_purchases DESC;


-- ============================================================
-- 3. Find the least ordered menu items
-- ============================================================

SELECT
    mi.item_name,
    mi.category,
    COUNT(od.order_details_id) AS num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY
    mi.item_name,
    mi.category
ORDER BY num_purchases ASC;


-- ============================================================
-- 4. Find the top 5 highest-spending orders
-- ============================================================

SELECT
    od.order_id,
    ROUND(SUM(mi.price), 2) AS total_spend
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY total_spend DESC
LIMIT 5;


-- ============================================================
-- 5. Calculate total revenue by category
-- ============================================================

SELECT
    mi.category,
    ROUND(SUM(mi.price), 2) AS total_revenue
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY total_revenue DESC;


-- ============================================================
-- 6. Calculate the number of items ordered by category
-- ============================================================

SELECT
    mi.category,
    COUNT(od.item_id) AS total_items_ordered
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY total_items_ordered DESC;


-- ============================================================
-- 7. Analyze the highest-spending order
-- ============================================================

SELECT
    od.order_id,
    mi.category,
    COUNT(od.item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
WHERE od.order_id = 440
GROUP BY
    od.order_id,
    mi.category
ORDER BY num_items DESC;


-- ============================================================
-- 8. Analyze the top 5 highest-spending orders
-- ============================================================

SELECT
    od.order_id,
    mi.category,
    COUNT(od.item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
WHERE od.order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY
    od.order_id,
    mi.category
ORDER BY
    od.order_id,
    num_items DESC;
