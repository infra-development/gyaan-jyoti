-- ============================================================
-- Pagila SQL Course
-- Phase 1 - Week 1
-- Day 3 - Understanding Films
-- ============================================================

-- ------------------------------------------------------------
-- Q21
-- How many films exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS film_count
FROM film;


-- ------------------------------------------------------------
-- Q22
-- Find the shortest film.
-- ------------------------------------------------------------

SELECT
    film_id,
    title,
    length
FROM film
WHERE length IS NOT NULL
ORDER BY length ASC
LIMIT 1;

-- -----------------------------------------------------------
-- Better alternative to Q22
-- -----------------------------------------------------------
-- Better alternative to Q22

SELECT
    film_id,
    title,
    length
FROM film
WHERE length = (
    SELECT MIN(length)
    FROM film
);

-- ------------------------------------------------------------
-- Q23
-- Find the longest film.
-- ------------------------------------------------------------

SELECT
    film_id,
    title,
    length
FROM film
WHERE length IS NOT NULL
ORDER BY length DESC
LIMIT 1;

-- -----------------------------------------------------------
-- Better alternative to Q23
-- -----------------------------------------------------------


SELECT
    film_id,
    title,
    length
FROM film
WHERE length = (
    SELECT MAX(length)
    FROM film
);

-- ------------------------------------------------------------
-- Q24
-- Find the average film length.
-- ------------------------------------------------------------

SELECT
    ROUND(AVG(length), 2) AS average_length
FROM film;


-- ------------------------------------------------------------
-- Q25
-- List films longer than 120 minutes.
-- ------------------------------------------------------------

SELECT
    film_id,
    title,
    length
FROM film
WHERE length > 120
ORDER BY length DESC,
         title;


-- ------------------------------------------------------------
-- Q26
-- Count films by rating.
-- ------------------------------------------------------------

SELECT
    rating,
    COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;


-- ------------------------------------------------------------
-- Q27
-- Count films by rental duration.
-- ------------------------------------------------------------

SELECT
    rental_duration,
    COUNT(*) AS film_count
FROM film
GROUP BY rental_duration
ORDER BY rental_duration;


-- ------------------------------------------------------------
-- Q28
-- Find films with replacement cost greater than rental rate.
-- ------------------------------------------------------------

SELECT
    film_id,
    title,
    rental_rate,
    replacement_cost
FROM film
WHERE replacement_cost > rental_rate
ORDER BY replacement_cost DESC;


-- ------------------------------------------------------------
-- Q29
-- Find the 10 most expensive films by replacement cost.
-- ------------------------------------------------------------

SELECT
    film_id,
    title,
    replacement_cost
FROM film
ORDER BY replacement_cost DESC,
         title
LIMIT 10;


-- ------------------------------------------------------------
-- Q30
-- Find films whose title contains the word 'LOVE'.
-- ------------------------------------------------------------

SELECT
    film_id,
    title
FROM film
WHERE UPPER(title) LIKE '%LOVE%'
ORDER BY title;

