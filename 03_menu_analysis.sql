-- ============================================================
-- Restaurant Orders SQL Analysis
-- File: 03_menu_analysis.sql
-- Menu-level analysis
-- ============================================================

USE restaurant_db;


-- ============================================================
-- 1. View the menu_items table
-- ============================================================

SELECT *
FROM menu_items;


-- ============================================================
-- 2. Count the total number of menu items
-- ============================================================

SELECT
    COUNT(*) AS total_menu_items
FROM menu_items;


-- ============================================================
-- 3. Find the least expensive menu item
-- ============================================================

SELECT
    item_name,
    category,
    price
FROM menu_items
ORDER BY price ASC
LIMIT 1;


-- ============================================================
-- 4. Find the most expensive menu item
-- ============================================================

SELECT
    item_name,
    category,
    price
FROM menu_items
ORDER BY price DESC
LIMIT 1;


-- ============================================================
-- 5. Count the number of Italian dishes
-- ============================================================

SELECT
    COUNT(*) AS italian_dishes
FROM menu_items
WHERE category = 'Italian';


-- ============================================================
-- 6. Find the least expensive Italian dish
-- ============================================================

SELECT
    item_name,
    category,
    price
FROM menu_items
WHERE category = 'Italian'
ORDER BY price ASC
LIMIT 1;


-- ============================================================
-- 7. Find the most expensive Italian dish
-- ============================================================

SELECT
    item_name,
    category,
    price
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC
LIMIT 1;


-- ============================================================
-- 8. Count the number of dishes in each category
-- ============================================================

SELECT
    category,
    COUNT(*) AS num_dishes
FROM menu_items
GROUP BY category
ORDER BY num_dishes DESC;


-- ============================================================
-- 9. Find the average price of dishes in each category
-- ============================================================

SELECT
    category,
    ROUND(AVG(price), 2) AS avg_price
FROM menu_items
GROUP BY category
ORDER BY avg_price DESC;
