-- ============================================================
-- Pagila SQL Course
-- Phase 1 - Week 1
-- Day 6 - Rental Exploration
-- ============================================================

-- ------------------------------------------------------------
-- Q51
-- How many rentals exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS rental_count
FROM rental;


-- ------------------------------------------------------------
-- Q52
-- How many rentals occurred per day?
-- ------------------------------------------------------------

SELECT
    DATE(rental_date) AS rental_day,
    COUNT(*) AS rental_count
FROM rental
GROUP BY DATE(rental_date)
ORDER BY rental_day;


-- ------------------------------------------------------------
-- Q53
-- Find the earliest rental.
-- ------------------------------------------------------------

SELECT *
FROM rental
ORDER BY rental_date
LIMIT 1;


-- ------------------------------------------------------------
-- Q54
-- Find the latest rental.
-- ------------------------------------------------------------

SELECT *
FROM rental
ORDER BY rental_date DESC
LIMIT 1;


-- ------------------------------------------------------------
-- Q55
-- Find the customer with the most rentals.
-- ------------------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(*) AS rental_count
FROM customer c
JOIN rental r
    ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    rental_count DESC,
    c.customer_id
LIMIT 1;


-- ------------------------------------------------------------
-- Q56
-- Find the customer with the fewest rentals.
-- ------------------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(*) AS rental_count
FROM customer c
JOIN rental r
    ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    rental_count ASC,
    c.customer_id
LIMIT 1;


-- ------------------------------------------------------------
-- Q57
-- Find the most rented film.
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title,
    COUNT(*) AS rental_count
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id,
    f.title
ORDER BY
    rental_count DESC,
    f.title
LIMIT 1;


-- ------------------------------------------------------------
-- Q58
-- Find the least rented film.
-- ------------------------------------------------------------

SELECT
    f.film_id,
    f.title,
    COUNT(*) AS rental_count
FROM film f
JOIN inventory i
    ON f.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id,
    f.title
ORDER BY
    rental_count ASC,
    f.title
LIMIT 1;


-- ------------------------------------------------------------
-- Q59
-- Count rentals per store.
-- ------------------------------------------------------------

SELECT
    i.store_id,
    COUNT(*) AS rental_count
FROM rental r
JOIN inventory i
    ON r.inventory_id = i.inventory_id
GROUP BY
    i.store_id
ORDER BY
    i.store_id;


-- ------------------------------------------------------------
-- Q60
-- Find rentals that have not been returned.
-- ------------------------------------------------------------

SELECT
    rental_id,
    rental_date,
    inventory_id,
    customer_id
FROM rental
WHERE return_date IS NULL
ORDER BY rental_date;