-- ============================================================
-- Pagila SQL Course
-- Phase 1 - Week 1
-- Day 2 - Understanding Customers
-- ============================================================

-- ------------------------------------------------------------
-- Q11
-- How many customers exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS customer_count
FROM customer;


-- ------------------------------------------------------------
-- Q12
-- How many active customers exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS active_customer_count
FROM customer
WHERE active = 1;


-- ------------------------------------------------------------
-- Q13
-- How many inactive customers exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS inactive_customer_count
FROM customer
WHERE active = 0;


-- ------------------------------------------------------------
-- Q14
-- List customers ordered by last name.
-- ------------------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customer
ORDER BY last_name, first_name;


-- ------------------------------------------------------------
-- Q15
-- Find customers whose first name starts with 'A'.
-- ------------------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name
FROM customer
WHERE first_name LIKE 'A%'
ORDER BY first_name, last_name;


-- ------------------------------------------------------------
-- Q16
-- Find customers whose last name ends with 'SON'.
-- ------------------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name
FROM customer
WHERE UPPER(last_name) LIKE '%SON'
ORDER BY last_name;


-- ------------------------------------------------------------
-- Q17
-- Count customers by active status.
-- ------------------------------------------------------------

SELECT
    active,
    COUNT(*) AS customer_count
FROM customer
GROUP BY active
ORDER BY active DESC;


-- ------------------------------------------------------------
-- Q18
-- Count customers per store.
-- ------------------------------------------------------------

SELECT
    store_id,
    COUNT(*) AS customer_count
FROM customer
GROUP BY store_id
ORDER BY store_id;


-- ------------------------------------------------------------
-- Q19
-- Find duplicate first names.
-- ------------------------------------------------------------

SELECT
    first_name,
    COUNT(*) AS occurrence_count
FROM customer
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC,
         first_name;


-- ------------------------------------------------------------
-- Q20
-- Find the most common first names.
-- ------------------------------------------------------------

SELECT
    first_name,
    COUNT(*) AS occurrence_count
FROM customer
GROUP BY first_name
ORDER BY occurrence_count DESC,
         first_name
LIMIT 10;