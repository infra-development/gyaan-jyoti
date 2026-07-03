-- =====================================================
-- Week 5 - Day 2
-- Correlated Subqueries
-- Answers: Q11 - Q20
-- =====================================================

-- -----------------------------------------------------
-- Q11
-- Display customers who have made at least
-- one payment greater than their own
-- average payment.
-- -----------------------------------------------------

SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer AS c
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
WHERE
    p.amount >
    (
        SELECT
            AVG(p2.amount)
        FROM payment AS p2
        WHERE
            p2.customer_id = c.customer_id
    )
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q12
-- Display films whose rental rate is greater
-- than the average rental rate within
-- the same rating.
-- -----------------------------------------------------

SELECT
    film_id,
    title,
    rating,
    rental_rate
FROM film AS f
WHERE
    rental_rate >
    (
        SELECT
            AVG(f2.rental_rate)
        FROM film AS f2
        WHERE
            f2.rating = f.rating
    )
ORDER BY
    rating,
    rental_rate DESC;


-- -----------------------------------------------------
-- Q13
-- Display customers who have rented more
-- films than the average customer.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer AS c
WHERE
(
    SELECT COUNT(*)
    FROM rental AS r
    WHERE
        r.customer_id = c.customer_id
)
>
(
    SELECT AVG(rental_count)
    FROM
    (
        SELECT
            COUNT(*) AS rental_count
        FROM rental
        GROUP BY
            customer_id
    ) AS customer_rentals
)
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q14
-- Display the highest payment made
-- by each customer.
-- -----------------------------------------------------

SELECT
    p.customer_id,
    p.payment_id,
    p.payment_date,
    p.amount
FROM payment AS p
WHERE
    p.amount =
    (
        SELECT
            MAX(p2.amount)
        FROM payment AS p2
        WHERE
            p2.customer_id = p.customer_id
    )
ORDER BY
    p.customer_id,
    p.payment_id;


-- -----------------------------------------------------
-- Q15
-- Display the most expensive film
-- within each rating.
-- -----------------------------------------------------

SELECT
    film_id,
    title,
    rating,
    replacement_cost
FROM film AS f
WHERE
    replacement_cost =
    (
        SELECT
            MAX(f2.replacement_cost)
        FROM film AS f2
        WHERE
            f2.rating = f.rating
    )
ORDER BY
    rating,
    title;


-- -----------------------------------------------------
-- Q16
-- Use EXISTS to display customers
-- who have rented at least one film.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name
FROM customer AS c
WHERE EXISTS
(
    SELECT 1
    FROM rental AS r
    WHERE
        r.customer_id = c.customer_id
)
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q17
-- Use NOT EXISTS to display customers
-- who have never rented a film.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name
FROM customer AS c
WHERE NOT EXISTS
(
    SELECT 1
    FROM rental AS r
    WHERE
        r.customer_id = c.customer_id
)
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q18
-- Explain the purpose
-- of correlated subqueries.
-- -----------------------------------------------------

/*

Correlated Subqueries

• Depend on values
  from the outer query.

• Execute once for
  every outer row.

• Used for row-by-row
  comparisons.

Examples

• Customer vs Customer Average

• Film vs Rating Average

• Highest Payment Per Customer

*/


-- -----------------------------------------------------
-- Q19
-- Explain the difference between
-- ordinary and correlated subqueries.
-- -----------------------------------------------------

/*

Ordinary Subquery

• Executes independently.

• Usually runs once.

-------------------------------------

Correlated Subquery

• Depends on outer query.

• Executes once
  for every outer row.

-------------------------------------

Ordinary Subqueries

↓

General Calculations

-------------------------------------

Correlated Subqueries

↓

Row-by-Row Business Logic

*/


-- -----------------------------------------------------
-- Q20
-- Draw the analytical workflow before
-- writing correlated subqueries.
-- -----------------------------------------------------

/*

Business Question

        ↓

Need Row-by-Row Comparison?

        ↓

Yes

        ↓

Outer Query

        ↓

Inner Query

↓

Uses Outer Row

        ↓

Comparison

        ↓

Business Result

*/