-- ============================================================
-- Pagila SQL Course
-- Phase 1 - Week 1
-- Day 5 - Inventory Analysis
-- ============================================================

-- ------------------------------------------------------------
-- Q41
-- How many inventory records exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS inventory_count
FROM inventory;


-- ------------------------------------------------------------
-- Q42
-- How many copies exist for each film?
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title,
    COUNT(i.inventory_id) AS copy_count
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
ORDER BY
    copy_count DESC,
    f.title;


-- ------------------------------------------------------------
-- Q43
-- Which film has the most copies?
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title,
    COUNT(i.inventory_id) AS copy_count
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
ORDER BY
    copy_count DESC,
    f.title
LIMIT 1;


-- ------------------------------------------------------------
-- Q44
-- Which film has the fewest copies?
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title,
    COUNT(i.inventory_id) AS copy_count
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
ORDER BY
    copy_count ASC,
    f.title
LIMIT 1;


-- ------------------------------------------------------------
-- Q45
-- Find films with only one copy.
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title,
    COUNT(i.inventory_id) AS copy_count
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
HAVING COUNT(i.inventory_id) = 1
ORDER BY
    f.title;


-- ------------------------------------------------------------
-- Q46
-- Count inventory items by store.
-- ------------------------------------------------------------

SELECT
    store_id,
    COUNT(*) AS inventory_count
FROM inventory
GROUP BY store_id
ORDER BY store_id;


-- ------------------------------------------------------------
-- Q47
-- Find films available in both stores.
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
HAVING COUNT(DISTINCT i.store_id) = 2
ORDER BY
    f.title;


-- ------------------------------------------------------------
-- Q48
-- Find films available only in Store 1.
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
HAVING MIN(i.store_id) = 1
   AND MAX(i.store_id) = 1
ORDER BY
    f.title;


-- ------------------------------------------------------------
-- Q49
-- Find films available only in Store 2.
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
HAVING MIN(i.store_id) = 2
   AND MAX(i.store_id) = 2
ORDER BY
    f.title;


-- ------------------------------------------------------------
-- Q50
-- List inventory records with film titles.
-- ------------------------------------------------------------

SELECT
    i.inventory_id,
    i.store_id,
    f.film_id,
    f.title
FROM inventory i
JOIN film f
    ON i.film_id = f.film_id
ORDER BY
    i.inventory_id;