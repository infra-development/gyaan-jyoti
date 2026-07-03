-- =====================================================
-- Week 2 - Day 4
-- DISTINCT and Duplicate Thinking
-- Answers: Q31 - Q40
-- =====================================================

-- -----------------------------------------------------
-- Q31
-- How many unique customers have rented movies?
-- -----------------------------------------------------

SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM rental;


-- -----------------------------------------------------
-- Q32
-- How many unique films have been rented?
-- -----------------------------------------------------

SELECT
    COUNT(DISTINCT i.film_id) AS unique_films
FROM rental AS r
INNER JOIN inventory AS i
    ON r.inventory_id = i.inventory_id;


-- -----------------------------------------------------
-- Q33
-- How many different categories has each customer rented from?
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT cat.category_id) AS category_count
FROM customer AS c
INNER JOIN rental AS r
    ON c.customer_id = r.customer_id
INNER JOIN inventory AS i
    ON r.inventory_id = i.inventory_id
INNER JOIN film_category AS fc
    ON i.film_id = fc.film_id
INNER JOIN category AS cat
    ON fc.category_id = cat.category_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    category_count DESC,
    c.last_name,
    c.first_name;


-- -----------------------------------------------------
-- Q34
-- How many different actors appear in each category?
-- -----------------------------------------------------

SELECT
    cat.category_id,
    cat.name AS category,
    COUNT(DISTINCT fa.actor_id) AS actor_count
FROM category AS cat
INNER JOIN film_category AS fc
    ON cat.category_id = fc.category_id
INNER JOIN film_actor AS fa
    ON fc.film_id = fa.film_id
GROUP BY
    cat.category_id,
    cat.name
ORDER BY
    actor_count DESC,
    category;


-- -----------------------------------------------------
-- Q35
-- How many different films are available in each store?
-- -----------------------------------------------------

SELECT
    s.store_id,
    COUNT(DISTINCT i.film_id) AS film_count
FROM store AS s
INNER JOIN inventory AS i
    ON s.store_id = i.store_id
GROUP BY
    s.store_id
ORDER BY
    s.store_id;


-- -----------------------------------------------------
-- Q36
-- Find films available in both stores.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
HAVING
    COUNT(DISTINCT i.store_id) = 2
ORDER BY
    f.title;


-- -----------------------------------------------------
-- Q37
-- Find films available only in Store 1.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
HAVING
    COUNT(DISTINCT i.store_id) = 1
    AND MIN(i.store_id) = 1
ORDER BY
    f.title;


-- -----------------------------------------------------
-- Q38
-- Find films available only in Store 2.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
GROUP BY
    f.film_id,
    f.title
HAVING
    COUNT(DISTINCT i.store_id) = 1
    AND MIN(i.store_id) = 2
ORDER BY
    f.title;


-- -----------------------------------------------------
-- Q39
-- Which actor has acted with the largest number of
-- different co-actors?
-- -----------------------------------------------------

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(DISTINCT fa2.actor_id) AS co_actor_count
FROM actor AS a
INNER JOIN film_actor AS fa1
    ON a.actor_id = fa1.actor_id
INNER JOIN film_actor AS fa2
    ON fa1.film_id = fa2.film_id
WHERE
    fa1.actor_id <> fa2.actor_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY
    co_actor_count DESC
LIMIT 1;


-- -----------------------------------------------------
-- Q40
-- Explain why duplicate rows appear in each query
-- before solving it.
-- -----------------------------------------------------

/*

Duplicate rows appear because of one-to-many and
many-to-many relationships.

Examples:

Q33
Customer
    ↓
Rental
    ↓
Film
    ↓
Category

A customer may rent many films.
Multiple films may belong to the same category.

Use:
COUNT(DISTINCT category_id)

-----------------------------------------

Q34
Category
    ↓
Film
    ↓
Actor

An actor may appear in multiple films within the
same category.

Use:
COUNT(DISTINCT actor_id)

-----------------------------------------

Q35
Store
    ↓
Inventory
    ↓
Film

A store can have multiple copies of the same film.

Use:
COUNT(DISTINCT film_id)

-----------------------------------------

General Rule

Whenever a JOIN multiplies rows, ask:

"Am I counting rows or unique business entities?"

If unique entities are required, use DISTINCT.

*/