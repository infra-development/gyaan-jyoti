-- =====================================================
-- Week 2 - Day 1
-- Understanding Relationship Paths
-- Answers: Q1 - Q10
-- =====================================================

-- -----------------------------------------------------
-- Q1
-- Show every customer together with the store they belong to.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    s.store_id
FROM customer AS c
INNER JOIN store AS s
    ON c.store_id = s.store_id
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q2
-- Show every customer together with their address.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.address
FROM customer AS c
INNER JOIN address AS a
    ON c.address_id = a.address_id
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q3
-- Show every customer together with their city.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    ci.city
FROM customer AS c
INNER JOIN address AS a
    ON c.address_id = a.address_id
INNER JOIN city AS ci
    ON a.city_id = ci.city_id
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q4
-- Show every customer together with their country.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    co.country
FROM customer AS c
INNER JOIN address AS a
    ON c.address_id = a.address_id
INNER JOIN city AS ci
    ON a.city_id = ci.city_id
INNER JOIN country AS co
    ON ci.country_id = co.country_id
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q5
-- Show every inventory item together with its film title.
-- -----------------------------------------------------

SELECT
    i.inventory_id,
    f.film_id,
    f.title
FROM inventory AS i
INNER JOIN film AS f
    ON i.film_id = f.film_id
ORDER BY
    i.inventory_id;


-- -----------------------------------------------------
-- Q6
-- Show every film together with its language.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title,
    l.name AS language
FROM film AS f
INNER JOIN language AS l
    ON f.language_id = l.language_id
ORDER BY
    f.title;


-- -----------------------------------------------------
-- Q7
-- Show every film together with its category.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title,
    c.name AS category
FROM film AS f
INNER JOIN film_category AS fc
    ON f.film_id = fc.film_id
INNER JOIN category AS c
    ON fc.category_id = c.category_id
ORDER BY
    f.title,
    c.name;


-- -----------------------------------------------------
-- Q8
-- Show every actor together with the films they appear in.
-- -----------------------------------------------------

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    f.title
FROM actor AS a
INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
INNER JOIN film AS f
    ON fa.film_id = f.film_id
ORDER BY
    a.last_name,
    a.first_name,
    f.title;


-- -----------------------------------------------------
-- Q9
-- Show every film together with all its actors.
-- -----------------------------------------------------

SELECT
    f.film_id,
    f.title,
    a.actor_id,
    a.first_name,
    a.last_name
FROM film AS f
INNER JOIN film_actor AS fa
    ON f.film_id = fa.film_id
INNER JOIN actor AS a
    ON fa.actor_id = a.actor_id
ORDER BY
    f.title,
    a.last_name,
    a.first_name;


-- -----------------------------------------------------
-- Q10
-- Draw the relationship path required to answer each of
-- the above questions before writing SQL.
-- -----------------------------------------------------

/*

Q1

Customer
    ↓
Store


Q2

Customer
    ↓
Address


Q3

Customer
    ↓
Address
    ↓
City


Q4

Customer
    ↓
Address
    ↓
City
    ↓
Country


Q5

Inventory
    ↓
Film


Q6

Film
    ↓
Language


Q7

Film
    ↓
Film_Category
    ↓
Category


Q8

Actor
    ↓
Film_Actor
    ↓
Film


Q9

Film
    ↓
Film_Actor
    ↓
Actor

*/