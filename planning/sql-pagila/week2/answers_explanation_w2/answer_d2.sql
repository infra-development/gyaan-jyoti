-- =====================================================
-- Week 2 - Day 2
-- Multi-Table JOIN Practice
-- Answers: Q11 - Q20
-- =====================================================

-- -----------------------------------------------------
-- Q11
-- List every rental together with the customer name.
-- -----------------------------------------------------

SELECT
    r.rental_id,
    r.rental_date,
    c.customer_id,
    c.first_name,
    c.last_name
FROM rental AS r
INNER JOIN customer AS c
    ON r.customer_id = c.customer_id
ORDER BY
    r.rental_id;


-- -----------------------------------------------------
-- Q12
-- List every rental together with the rented film title.
-- -----------------------------------------------------

SELECT
    r.rental_id,
    r.rental_date,
    f.film_id,
    f.title
FROM rental AS r
INNER JOIN inventory AS i
    ON r.inventory_id = i.inventory_id
INNER JOIN film AS f
    ON i.film_id = f.film_id
ORDER BY
    r.rental_id;


-- -----------------------------------------------------
-- Q13
-- List every payment together with the customer name.
-- -----------------------------------------------------

SELECT
    p.payment_id,
    p.payment_date,
    p.amount,
    c.customer_id,
    c.first_name,
    c.last_name
FROM payment AS p
INNER JOIN customer AS c
    ON p.customer_id = c.customer_id
ORDER BY
    p.payment_id;


-- -----------------------------------------------------
-- Q14
-- List every payment together with the staff member who received it.
-- -----------------------------------------------------

SELECT
    p.payment_id,
    p.payment_date,
    p.amount,
    s.staff_id,
    s.first_name,
    s.last_name
FROM payment AS p
INNER JOIN staff AS s
    ON p.staff_id = s.staff_id
ORDER BY
    p.payment_id;


-- -----------------------------------------------------
-- Q15
-- Show every rental together with the store from which it was rented.
-- -----------------------------------------------------

SELECT
    r.rental_id,
    r.rental_date,
    s.store_id
FROM rental AS r
INNER JOIN inventory AS i
    ON r.inventory_id = i.inventory_id
INNER JOIN store AS s
    ON i.store_id = s.store_id
ORDER BY
    r.rental_id;


-- -----------------------------------------------------
-- Q16
-- Show every customer together with every film they have rented.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    f.film_id,
    f.title
FROM customer AS c
INNER JOIN rental AS r
    ON c.customer_id = r.customer_id
INNER JOIN inventory AS i
    ON r.inventory_id = i.inventory_id
INNER JOIN film AS f
    ON i.film_id = f.film_id
ORDER BY
    c.customer_id,
    f.title;


-- -----------------------------------------------------
-- Q17
-- Show every customer together with every payment they have made.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.payment_id,
    p.amount,
    p.payment_date
FROM customer AS c
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
ORDER BY
    c.customer_id,
    p.payment_date;


-- -----------------------------------------------------
-- Q18
-- Show every actor together with every category they have acted in.
-- -----------------------------------------------------

SELECT DISTINCT
    a.actor_id,
    a.first_name,
    a.last_name,
    c.category_id,
    c.name AS category
FROM actor AS a
INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
INNER JOIN film AS f
    ON fa.film_id = f.film_id
INNER JOIN film_category AS fc
    ON f.film_id = fc.film_id
INNER JOIN category AS c
    ON fc.category_id = c.category_id
ORDER BY
    a.last_name,
    a.first_name,
    c.name;


-- -----------------------------------------------------
-- Q19
-- Show every category together with all films belonging to it.
-- -----------------------------------------------------

SELECT
    c.category_id,
    c.name AS category,
    f.film_id,
    f.title
FROM category AS c
INNER JOIN film_category AS fc
    ON c.category_id = fc.category_id
INNER JOIN film AS f
    ON fc.film_id = f.film_id
ORDER BY
    c.name,
    f.title;


-- -----------------------------------------------------
-- Q20
-- How many joins are required to answer each question above?
-- -----------------------------------------------------

/*

Q11
Rental
    ↓
Customer

Joins Required: 1


Q12
Rental
    ↓
Inventory
    ↓
Film

Joins Required: 2


Q13
Payment
    ↓
Customer

Joins Required: 1


Q14
Payment
    ↓
Staff

Joins Required: 1


Q15
Rental
    ↓
Inventory
    ↓
Store

Joins Required: 2


Q16
Customer
    ↓
Rental
    ↓
Inventory
    ↓
Film

Joins Required: 3


Q17
Customer
    ↓
Payment

Joins Required: 1


Q18
Actor
    ↓
Film_Actor
    ↓
Film
    ↓
Film_Category
    ↓
Category

Joins Required: 4


Q19
Category
    ↓
Film_Category
    ↓
Film

Joins Required: 2

*/