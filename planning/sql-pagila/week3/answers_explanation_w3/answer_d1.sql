-- =====================================================
-- Week 3 - Day 1
-- Advanced JOIN Concepts
-- Answers: Q1 - Q10
-- =====================================================

-- -----------------------------------------------------
-- Q1
-- Show every staff member together with their manager.
-- (Assume a manager relationship exists.)
-- -----------------------------------------------------

/*
NOTE:

The standard Pagila database does not contain a manager_id
column in the staff table.

The following demonstrates how a SELF JOIN would work
if such a relationship existed.
*/

SELECT
    s.staff_id,
    s.first_name AS staff_first_name,
    s.last_name  AS staff_last_name,
    m.staff_id   AS manager_id,
    m.first_name AS manager_first_name,
    m.last_name  AS manager_last_name
FROM staff AS s
LEFT JOIN staff AS m
    ON s.manager_id = m.staff_id
ORDER BY
    s.staff_id;


-- -----------------------------------------------------
-- Q2
-- Find actors who have acted together in the same film.
-- -----------------------------------------------------

SELECT DISTINCT
    a1.actor_id,
    a1.first_name,
    a1.last_name,
    a2.actor_id AS co_actor_id,
    a2.first_name AS co_actor_first_name,
    a2.last_name AS co_actor_last_name,
    f.title
FROM film_actor AS fa1
INNER JOIN film_actor AS fa2
    ON fa1.film_id = fa2.film_id
   AND fa1.actor_id < fa2.actor_id
INNER JOIN actor AS a1
    ON fa1.actor_id = a1.actor_id
INNER JOIN actor AS a2
    ON fa2.actor_id = a2.actor_id
INNER JOIN film AS f
    ON fa1.film_id = f.film_id
ORDER BY
    f.title,
    a1.last_name,
    a2.last_name;


-- -----------------------------------------------------
-- Q3
-- Find customers living in the same city.
-- -----------------------------------------------------

SELECT
    c1.customer_id,
    c1.first_name,
    c1.last_name,
    c2.customer_id AS other_customer_id,
    c2.first_name AS other_first_name,
    c2.last_name AS other_last_name,
    ci.city
FROM customer AS c1
INNER JOIN address AS a1
    ON c1.address_id = a1.address_id
INNER JOIN customer AS c2
    ON c1.customer_id < c2.customer_id
INNER JOIN address AS a2
    ON c2.address_id = a2.address_id
INNER JOIN city AS ci
    ON a1.city_id = ci.city_id
WHERE
    a1.city_id = a2.city_id
ORDER BY
    ci.city,
    c1.customer_id;


-- -----------------------------------------------------
-- Q4
-- Rewrite a simple INNER JOIN using USING.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    address
FROM customer
INNER JOIN address
USING (address_id)
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q5
-- Rewrite a LEFT JOIN using USING.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    payment_id,
    amount
FROM customer
LEFT JOIN payment
USING (customer_id)
ORDER BY
    customer_id,
    payment_id;


-- -----------------------------------------------------
-- Q6
-- Compare INNER JOIN and RIGHT JOIN
-- using customer and payment.
-- -----------------------------------------------------

-- INNER JOIN

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.payment_id,
    p.amount
FROM customer AS c
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id;

--------------------------------------------------------

-- RIGHT JOIN

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.payment_id,
    p.amount
FROM customer AS c
RIGHT JOIN payment AS p
    ON c.customer_id = p.customer_id;


-- -----------------------------------------------------
-- Q7
-- Compare LEFT JOIN and FULL JOIN conceptually.
-- -----------------------------------------------------

-- LEFT JOIN

SELECT
    c.customer_id,
    p.payment_id
FROM customer AS c
LEFT JOIN payment AS p
    ON c.customer_id = p.customer_id;

--------------------------------------------------------

-- FULL JOIN

SELECT
    c.customer_id,
    p.payment_id
FROM customer AS c
FULL JOIN payment AS p
    ON c.customer_id = p.customer_id;


-- -----------------------------------------------------
-- Q8
-- Explain when SELF JOIN should be preferred
-- over a normal JOIN.
-- -----------------------------------------------------

/*

Use SELF JOIN when rows from the same table
must be compared.

Examples

Staff
    ↓
Manager

Actor
    ↓
Co-Actor

Customer
    ↓
Other Customers
living in the same city

A normal JOIN is used when different
tables are involved.

*/


-- -----------------------------------------------------
-- Q9
-- Explain why RIGHT JOIN is rarely used.
-- -----------------------------------------------------

/*

Most RIGHT JOIN queries can be rewritten
as LEFT JOIN queries simply by reversing
the table order.

Example

A RIGHT JOIN B

is equivalent to

B LEFT JOIN A

Because LEFT JOIN is easier to read and
more commonly used, most SQL developers
prefer it.

*/


-- -----------------------------------------------------
-- Q10
-- Draw the relationship path before
-- writing each query.
-- -----------------------------------------------------

/*

Q1

Staff
    ↓
Manager (Staff)

----------------------

Q2

Actor
    ↓
Film_Actor
    ↓
Film
    ↓
Film_Actor
    ↓
Actor

----------------------

Q3

Customer
    ↓
Address
    ↓
City
    ↑
Address
    ↑
Customer

----------------------

Q4

Customer
    ↓
Address

----------------------

Q5

Customer
    ↓
Payment

----------------------

Q6

Customer
    ↓
Payment

----------------------

Q7

Customer
    ↓
Payment

*/