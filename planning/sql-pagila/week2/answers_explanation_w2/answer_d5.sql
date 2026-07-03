-- =====================================================
-- Week 2 - Day 5
-- Finding Missing Information
-- Answers: Q41 - Q50
-- =====================================================

-- -----------------------------------------------------
-- Q41
-- Find customers who have never rented a movie.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer AS c
LEFT JOIN rental AS r
    ON c.customer_id = r.customer_id
WHERE
    r.rental_id IS NULL
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q42
-- Find customers who have never made a payment.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer AS c
LEFT JOIN payment AS p
    ON c.customer_id = p.customer_id
WHERE
    p.payment_id IS NULL
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q43
-- Find films that have never been rented.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title
FROM film AS f
LEFT JOIN inventory AS i
    ON f.film_id = i.film_id
LEFT JOIN rental AS r
    ON i.inventory_id = r.inventory_id
WHERE
    r.rental_id IS NULL
ORDER BY
    f.title;


-- -----------------------------------------------------
-- Q44
-- Find actors who have never appeared in a rented film.
-- -----------------------------------------------------

SELECT
    a.actor_id,
    a.first_name,
    a.last_name
FROM actor AS a
LEFT JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
LEFT JOIN inventory AS i
    ON fa.film_id = i.film_id
LEFT JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
HAVING
    COUNT(r.rental_id) = 0
ORDER BY
    a.last_name,
    a.first_name;


-- -----------------------------------------------------
-- Q45
-- Find categories with no rentals.
-- -----------------------------------------------------

SELECT
    c.category_id,
    c.name AS category
FROM category AS c
LEFT JOIN film_category AS fc
    ON c.category_id = fc.category_id
LEFT JOIN inventory AS i
    ON fc.film_id = i.film_id
LEFT JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY
    c.category_id,
    c.name
HAVING
    COUNT(r.rental_id) = 0
ORDER BY
    c.name;


-- -----------------------------------------------------
-- Q46
-- Find inventory items that have never been rented.
-- -----------------------------------------------------

SELECT
    i.inventory_id,
    f.title
FROM inventory AS i
INNER JOIN film AS f
    ON i.film_id = f.film_id
LEFT JOIN rental AS r
    ON i.inventory_id = r.inventory_id
WHERE
    r.rental_id IS NULL
ORDER BY
    i.inventory_id;


-- -----------------------------------------------------
-- Q47
-- Find customers who rented movies but never made payments.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer AS c
INNER JOIN rental AS r
    ON c.customer_id = r.customer_id
LEFT JOIN payment AS p
    ON c.customer_id = p.customer_id
WHERE
    p.payment_id IS NULL
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q48
-- Find stores without inventory.
-- -----------------------------------------------------

SELECT
    s.store_id
FROM store AS s
LEFT JOIN inventory AS i
    ON s.store_id = i.store_id
WHERE
    i.inventory_id IS NULL
ORDER BY
    s.store_id;


-- -----------------------------------------------------
-- Q49
-- Find staff members who have never processed a payment.
-- -----------------------------------------------------

SELECT
    s.staff_id,
    s.first_name,
    s.last_name
FROM staff AS s
LEFT JOIN payment AS p
    ON s.staff_id = p.staff_id
WHERE
    p.payment_id IS NULL
ORDER BY
    s.staff_id;


-- -----------------------------------------------------
-- Q50
-- Identify which JOIN type is required before writing SQL.
-- -----------------------------------------------------

/*

Q41
Customer
    ↓
Rental

JOIN Type:
LEFT JOIN


Q42
Customer
    ↓
Payment

JOIN Type:
LEFT JOIN


Q43
Film
    ↓
Inventory
    ↓
Rental

JOIN Type:
LEFT JOIN


Q44
Actor
    ↓
Film_Actor
    ↓
Inventory
    ↓
Rental

JOIN Type:
LEFT JOIN


Q45
Category
    ↓
Film_Category
    ↓
Inventory
    ↓
Rental

JOIN Type:
LEFT JOIN


Q46
Inventory
    ↓
Rental

JOIN Type:
LEFT JOIN


Q47
Customer
    ↓
Rental
Customer
    ↓
Payment

JOIN Types:
INNER JOIN + LEFT JOIN


Q48
Store
    ↓
Inventory

JOIN Type:
LEFT JOIN


Q49
Staff
    ↓
Payment

JOIN Type:
LEFT JOIN


Rule:

Whenever the business asks for:

- Never
- No
- Without
- Missing

Think:

LEFT JOIN

+

IS NULL

*/