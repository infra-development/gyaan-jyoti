-- ============================================================
-- Pagila SQL Course
-- Phase 1 - Week 1
-- Day 4 - Categories and Actors
-- ============================================================

-- ------------------------------------------------------------
-- Q31
-- How many categories exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS category_count
FROM category;


-- ------------------------------------------------------------
-- Q32
-- List all categories alphabetically.
-- ------------------------------------------------------------

SELECT
    category_id,
    name
FROM category
ORDER BY name;


-- ------------------------------------------------------------
-- Q33
-- How many actors exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS actor_count
FROM actor;


-- ------------------------------------------------------------
-- Q34
-- List actors alphabetically.
-- ------------------------------------------------------------

SELECT
    actor_id,
    first_name,
    last_name
FROM actor
ORDER BY last_name,
         first_name;


-- ------------------------------------------------------------
-- Q35
-- Find actors whose first name starts with 'A'.
-- ------------------------------------------------------------

SELECT
    actor_id,
    first_name,
    last_name
FROM actor
WHERE first_name LIKE 'A%'
ORDER BY first_name,
         last_name;


-- ------------------------------------------------------------
-- Q36
-- Find actors whose last name starts with 'B'.
-- ------------------------------------------------------------

SELECT
    actor_id,
    first_name,
    last_name
FROM actor
WHERE last_name LIKE 'B%'
ORDER BY last_name,
         first_name;


-- ------------------------------------------------------------
-- Q37
-- Count films in each category.
-- ------------------------------------------------------------

SELECT
    c.category_id,
    c.name AS category_name,
    COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc
    ON c.category_id = fc.category_id
GROUP BY
    c.category_id,
    c.name
ORDER BY
    film_count DESC,
    category_name;


-- ------------------------------------------------------------
-- Q38
-- Find categories with more than 50 films.
-- ------------------------------------------------------------

SELECT
    c.category_id,
    c.name AS category_name,
    COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc
    ON c.category_id = fc.category_id
GROUP BY
    c.category_id,
    c.name
HAVING COUNT(fc.film_id) > 50
ORDER BY
    film_count DESC;


-- ------------------------------------------------------------
-- Q39
-- Find actors appearing in the most films.
-- ------------------------------------------------------------

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa
    ON a.actor_id = fa.actor_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY
    film_count DESC,
    a.last_name,
    a.first_name
LIMIT 10;


-- ------------------------------------------------------------
-- Q40
-- Find actors appearing in the fewest films.
-- ------------------------------------------------------------

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa
    ON a.actor_id = fa.actor_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY
    film_count ASC,
    a.last_name,
    a.first_name
LIMIT 10;