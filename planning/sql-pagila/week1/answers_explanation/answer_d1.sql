-- ============================================================
-- Pagila SQL Course
-- Phase 1 - Week 1
-- Day 1 - Discovering the Database
-- ============================================================

-- ------------------------------------------------------------
-- Q1
-- List all tables in the database.
-- ------------------------------------------------------------

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;


-- ------------------------------------------------------------
-- Q2
-- How many tables exist in the database?
-- ------------------------------------------------------------

SELECT COUNT(*) AS table_count
FROM information_schema.tables
WHERE table_schema = 'public';


-- ------------------------------------------------------------
-- Q3
-- List all columns of the customer table.
-- ------------------------------------------------------------

SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'customer'
    AND table_schema = 'public'
ORDER BY ordinal_position;


-- ------------------------------------------------------------
-- Q4
-- List all columns of the film table.
-- ------------------------------------------------------------

SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'film'
    AND table_schema = 'public'
ORDER BY ordinal_position;


-- ------------------------------------------------------------
-- Q5
-- Find the primary key of every table.
-- ------------------------------------------------------------

SELECT
    tc.table_name,
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
WHERE tc.constraint_type = 'PRIMARY KEY'
    AND tc.table_schema = 'public'
ORDER BY
    tc.table_name,
    kcu.ordinal_position;


-- ------------------------------------------------------------
-- Q6
-- Find all foreign key relationships.
-- ------------------------------------------------------------

SELECT
    tc.table_name AS source_table,
    kcu.column_name AS source_column,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage ccu
    ON tc.constraint_name = ccu.constraint_name
    AND tc.table_schema = ccu.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
ORDER BY
    source_table,
    source_column;


-- ------------------------------------------------------------
-- Q7
-- Identify tables that do not contain foreign keys.
-- ------------------------------------------------------------

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'

EXCEPT

SELECT DISTINCT table_name
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY'
    AND table_schema = 'public'

ORDER BY table_name;


-- ------------------------------------------------------------
-- Q8
-- Identify transactional tables.
--
-- Transactional tables typically:
-- - grow continuously
-- - store events
-- - contain timestamps
-- - participate in many relationships
--
-- Use the following query to inspect table structures.
-- ------------------------------------------------------------

SELECT
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY
    table_name,
    ordinal_position;

-- Expected investigation targets:
-- rental
-- payment
-- inventory


-- ------------------------------------------------------------
-- Q9
-- Identify reference/master tables.
--
-- Reference tables are usually:
-- - small
-- - rarely updated
-- - referenced by other tables
--
-- Investigate likely candidates.
-- ------------------------------------------------------------

SELECT *
FROM category;

SELECT *
FROM language;

SELECT *
FROM country;

SELECT *
FROM city
LIMIT 20;


-- ------------------------------------------------------------
-- Q10
-- Create a rough diagram showing relationships.
--
-- SQL cannot directly answer this.
-- Use foreign key information from Q6 and create
-- a diagram manually.
--
-- Suggested starting point:
--
-- customer -> rental -> inventory -> film
--
-- film -> film_actor -> actor
-- film -> film_category -> category
-- store -> inventory
-- store -> customer
-- rental -> payment
-- ------------------------------------------------------------