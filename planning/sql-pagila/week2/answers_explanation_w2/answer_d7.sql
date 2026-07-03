-- =====================================================
-- Week 2 - Day 7
-- Integrated Business Reporting
-- Answers: Q61 - Q70
-- =====================================================

-- -----------------------------------------------------
-- Q61
-- Build a report showing every customer's
-- total rentals and total spending.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_spending
FROM customer AS c
INNER JOIN rental AS r
    ON c.customer_id = r.customer_id
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_spending DESC;


-- -----------------------------------------------------
-- Q62
-- Build a report showing every film's
-- inventory count and rental count.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title,
    COUNT(DISTINCT i.inventory_id) AS inventory_count,
    COUNT(r.rental_id) AS rental_count
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
LEFT JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id,
    f.title
ORDER BY
    rental_count DESC,
    f.title;


-- -----------------------------------------------------
-- Q63
-- Build a report showing category revenue
-- and rental count.
-- -----------------------------------------------------

SELECT
    c.category_id,
    c.name AS category,
    COUNT(r.rental_id) AS rental_count,
    SUM(p.amount) AS total_revenue
FROM category AS c
INNER JOIN film_category AS fc
    ON c.category_id = fc.category_id
INNER JOIN film AS f
    ON fc.film_id = f.film_id
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
INNER JOIN payment AS p
    ON r.rental_id = p.rental_id
GROUP BY
    c.category_id,
    c.name
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q64
-- Build a report showing store revenue
-- and customer count.
-- -----------------------------------------------------

SELECT
    s.store_id,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    SUM(p.amount) AS total_revenue
FROM store AS s
INNER JOIN customer AS c
    ON s.store_id = c.store_id
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
GROUP BY
    s.store_id
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q65
-- Find the Top 10 customers by revenue.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_revenue
FROM customer AS c
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_revenue DESC
LIMIT 10;


-- -----------------------------------------------------
-- Q66
-- Find the Top 10 rented films.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id,
    f.title
ORDER BY
    rental_count DESC
LIMIT 10;


-- -----------------------------------------------------
-- Q67
-- Find the Top 10 actors by film appearances.
-- -----------------------------------------------------

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM actor AS a
INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY
    film_count DESC
LIMIT 10;


-- -----------------------------------------------------
-- Q68
-- Build a complete film performance report.
-- -----------------------------------------------------

SELECT
    f.title,
    c.name AS category,
    l.name AS language,
    COUNT(DISTINCT i.inventory_id) AS inventory_count,
    COUNT(r.rental_id) AS rental_count
FROM film AS f
INNER JOIN language AS l
    ON f.language_id = l.language_id
INNER JOIN film_category AS fc
    ON f.film_id = fc.film_id
INNER JOIN category AS c
    ON fc.category_id = c.category_id
LEFT JOIN inventory AS i
    ON f.film_id = i.film_id
LEFT JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY
    f.title,
    c.name,
    l.name
ORDER BY
    rental_count DESC,
    f.title;


-- -----------------------------------------------------
-- Q69
-- Build a customer activity report.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    ci.city,
    co.country,
    COUNT(DISTINCT r.rental_id) AS rentals,
    COUNT(DISTINCT p.payment_id) AS payments,
    SUM(p.amount) AS revenue
FROM customer AS c
INNER JOIN address AS a
    ON c.address_id = a.address_id
INNER JOIN city AS ci
    ON a.city_id = ci.city_id
INNER JOIN country AS co
    ON ci.country_id = co.country_id
LEFT JOIN rental AS r
    ON c.customer_id = r.customer_id
LEFT JOIN payment AS p
    ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    ci.city,
    co.country
ORDER BY
    revenue DESC NULLS LAST;


-- -----------------------------------------------------
-- Q70
-- Business Analysis Template
-- -----------------------------------------------------

/*

For every business report, identify:

1. Business Objective

Example:
Find the highest revenue customers.

-----------------------------------------

2. Business Entities

Customer
Payment

-----------------------------------------

3. Relationship Path

Customer
    ↓
Payment

-----------------------------------------

4. Thinking Pattern

Relationship Path
        ↓
JOIN
        ↓
GROUP BY
        ↓
Aggregate
        ↓
ORDER BY

-----------------------------------------

5. SQL Concepts

- INNER JOIN
- LEFT JOIN (if required)
- GROUP BY
- COUNT()
- SUM()
- DISTINCT
- ORDER BY
- LIMIT

-----------------------------------------

6. Write SQL

Always follow the same process:

Business Question
        ↓
Business Entities
        ↓
Relationship Path
        ↓
JOIN
        ↓
GROUP BY
        ↓
Aggregate
        ↓
ORDER BY
        ↓
Final Report

*/