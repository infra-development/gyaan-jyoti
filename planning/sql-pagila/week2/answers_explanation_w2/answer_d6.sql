-- =====================================================
-- Week 2 - Day 6
-- Business Process Analysis
-- Answers: Q51 - Q60
-- =====================================================

-- -----------------------------------------------------
-- Q51
-- Which customers generated the highest revenue?
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
    total_revenue DESC;


-- -----------------------------------------------------
-- Q52
-- Which customers rented the most films?
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
    rental_count DESC;


-- -----------------------------------------------------
-- Q53
-- Which films generated the highest revenue?
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title,
    SUM(p.amount) AS total_revenue
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
INNER JOIN payment AS p
    ON r.rental_id = p.rental_id
GROUP BY
    f.film_id,
    f.title
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q54
-- Which categories generated the highest revenue?
-- -----------------------------------------------------

SELECT
    c.category_id,
    c.name AS category,
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
-- Q55
-- Which actors appear in the most rented films?
-- -----------------------------------------------------

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(r.rental_id) AS rental_count
FROM actor AS a
INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
INNER JOIN film AS f
    ON fa.film_id = f.film_id
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY
    rental_count DESC;


-- -----------------------------------------------------
-- Q56
-- Which store generated the highest revenue?
-- -----------------------------------------------------

SELECT
    s.store_id,
    SUM(p.amount) AS total_revenue
FROM store AS s
INNER JOIN inventory AS i
    ON s.store_id = i.store_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
INNER JOIN payment AS p
    ON r.rental_id = p.rental_id
GROUP BY
    s.store_id
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q57
-- Which city generated the highest revenue?
-- -----------------------------------------------------

SELECT
    ci.city,
    SUM(p.amount) AS total_revenue
FROM city AS ci
INNER JOIN address AS a
    ON ci.city_id = a.city_id
INNER JOIN customer AS c
    ON a.address_id = c.address_id
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
GROUP BY
    ci.city
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q58
-- Which country generated the highest revenue?
-- -----------------------------------------------------

SELECT
    co.country,
    SUM(p.amount) AS total_revenue
FROM country AS co
INNER JOIN city AS ci
    ON co.country_id = ci.country_id
INNER JOIN address AS a
    ON ci.city_id = a.city_id
INNER JOIN customer AS c
    ON a.address_id = c.address_id
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
GROUP BY
    co.country
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q59
-- Which day recorded the highest number of rentals?
-- -----------------------------------------------------

SELECT
    DATE(rental_date) AS rental_day,
    COUNT(*) AS rental_count
FROM rental
GROUP BY
    DATE(rental_date)
ORDER BY
    rental_count DESC;


-- -----------------------------------------------------
-- Q60
-- Draw the business process followed by each report
-- before writing SQL.
-- -----------------------------------------------------

/*

Q51

Customer
    ↓
Payment


Q52

Customer
    ↓
Rental


Q53

Film
    ↓
Inventory
    ↓
Rental
    ↓
Payment


Q54

Category
    ↓
Film_Category
    ↓
Film
    ↓
Inventory
    ↓
Rental
    ↓
Payment


Q55

Actor
    ↓
Film_Actor
    ↓
Film
    ↓
Inventory
    ↓
Rental


Q56

Store
    ↓
Inventory
    ↓
Rental
    ↓
Payment


Q57

City
    ↓
Address
    ↓
Customer
    ↓
Payment


Q58

Country
    ↓
City
    ↓
Address
    ↓
Customer
    ↓
Payment


Q59

Rental

Business Process:

Customer
    ↓
Rental
    ↓
Rental Date

*/