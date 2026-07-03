-- =====================================================
-- Week 2 - Day 3
-- Business Reporting with GROUP BY
-- Answers: Q21 - Q30
-- =====================================================

-- -----------------------------------------------------
-- Q21
-- How many customers belong to each country?
-- -----------------------------------------------------

SELECT
    co.country,
    COUNT(c.customer_id) AS customer_count
FROM customer AS c
INNER JOIN address AS a
    ON c.address_id = a.address_id
INNER JOIN city AS ci
    ON a.city_id = ci.city_id
INNER JOIN country AS co
    ON ci.country_id = co.country_id
GROUP BY
    co.country
ORDER BY
    customer_count DESC,
    co.country;


-- -----------------------------------------------------
-- Q22
-- How many customers belong to each city?
-- -----------------------------------------------------

SELECT
    ci.city,
    COUNT(c.customer_id) AS customer_count
FROM customer AS c
INNER JOIN address AS a
    ON c.address_id = a.address_id
INNER JOIN city AS ci
    ON a.city_id = ci.city_id
GROUP BY
    ci.city
ORDER BY
    customer_count DESC,
    ci.city;


-- -----------------------------------------------------
-- Q23
-- How many films belong to each language?
-- -----------------------------------------------------

SELECT
    l.name AS language,
    COUNT(f.film_id) AS film_count
FROM film AS f
INNER JOIN language AS l
    ON f.language_id = l.language_id
GROUP BY
    l.name
ORDER BY
    film_count DESC,
    language;


-- -----------------------------------------------------
-- Q24
-- How many films belong to each category?
-- -----------------------------------------------------

SELECT
    c.name AS category,
    COUNT(f.film_id) AS film_count
FROM category AS c
INNER JOIN film_category AS fc
    ON c.category_id = fc.category_id
INNER JOIN film AS f
    ON fc.film_id = f.film_id
GROUP BY
    c.name
ORDER BY
    film_count DESC,
    category;


-- -----------------------------------------------------
-- Q25
-- How many films has each actor appeared in?
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
    film_count DESC,
    a.last_name,
    a.first_name;


-- -----------------------------------------------------
-- Q26
-- How many rentals has each customer made?
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS rental_count
FROM customer AS c
INNER JOIN rental AS r
    ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    rental_count DESC,
    c.last_name,
    c.first_name;


-- -----------------------------------------------------
-- Q27
-- How much revenue has each customer generated?
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
    total_revenue DESC,
    c.last_name,
    c.first_name;


-- -----------------------------------------------------
-- Q28
-- How much revenue has each staff member collected?
-- -----------------------------------------------------

SELECT
    s.staff_id,
    s.first_name,
    s.last_name,
    SUM(p.amount) AS total_revenue
FROM staff AS s
INNER JOIN payment AS p
    ON s.staff_id = p.staff_id
GROUP BY
    s.staff_id,
    s.first_name,
    s.last_name
ORDER BY
    total_revenue DESC,
    s.last_name,
    s.first_name;


-- -----------------------------------------------------
-- Q29
-- How many rentals occurred in each store?
-- -----------------------------------------------------

SELECT
    s.store_id,
    COUNT(r.rental_id) AS rental_count
FROM store AS s
INNER JOIN inventory AS i
    ON s.store_id = i.store_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY
    s.store_id
ORDER BY
    rental_count DESC,
    s.store_id;


-- -----------------------------------------------------
-- Q30
-- Which categories generate the highest number of rentals?
-- -----------------------------------------------------

SELECT
    c.name AS category,
    COUNT(r.rental_id) AS rental_count
FROM category AS c
INNER JOIN film_category AS fc
    ON c.category_id = fc.category_id
INNER JOIN film AS f
    ON fc.film_id = f.film_id
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY
    c.name
ORDER BY
    rental_count DESC,
    category;