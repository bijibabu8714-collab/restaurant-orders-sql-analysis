-- ============================================================
-- Restaurant Orders SQL Analysis
-- File: 01_database_setup.sql
-- Database setup and table creation
-- ============================================================

-- Remove the database if it already exists
DROP DATABASE IF EXISTS restaurant_db;

-- Create the database
CREATE DATABASE restaurant_db;

-- Select the database
USE restaurant_db;


-- ============================================================
-- Table 1: order_details
-- Stores information about individual ordered items
-- ============================================================

CREATE TABLE order_details (
    order_details_id SMALLINT NOT NULL,
    order_id SMALLINT NOT NULL,
    order_date DATE,
    order_time TIME,
    item_id SMALLINT,
    PRIMARY KEY (order_details_id)
);


-- ============================================================
-- Table 2: menu_items
-- Stores information about menu items
-- ============================================================

CREATE TABLE menu_items (
    menu_item_id SMALLINT NOT NULL,
    item_name VARCHAR(45),
    category VARCHAR(45),
    price DECIMAL(5,2),
    PRIMARY KEY (menu_item_id)
);


-- ============================================================
-- Data
-- ============================================================

-- Insert the complete data from the Maven Analytics dataset
-- into the two tables below.

-- INSERT INTO order_details VALUES (...);

-- INSERT INTO menu_items VALUES (...);
