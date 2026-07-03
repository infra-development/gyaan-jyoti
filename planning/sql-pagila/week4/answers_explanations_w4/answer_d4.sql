-- =====================================================
-- Week 4 - Day 4
-- Ranking Functions
-- Answers: Q31 - Q40
-- =====================================================

-- -----------------------------------------------------
-- Q31
-- Assign a row number to every payment
-- ordered by payment amount.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    amount,
    ROW_NUMBER() OVER (
        ORDER BY amount DESC, payment_id
    ) AS row_number
FROM payment
ORDER BY
    amount DESC,
    payment_id;


-- -----------------------------------------------------
-- Q32
-- Rank customers based on their total
-- payment amount using RANK().
-- -----------------------------------------------------

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM payment
    GROUP BY
        customer_id
)

SELECT
    customer_id,
    total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS customer_rank
FROM customer_revenue
ORDER BY
    customer_rank,
    customer_id;


-- -----------------------------------------------------
-- Q33
-- Rank customers based on their total
-- payment amount using DENSE_RANK().
-- -----------------------------------------------------

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM payment
    GROUP BY
        customer_id
)

SELECT
    customer_id,
    total_revenue,
    DENSE_RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS customer_rank
FROM customer_revenue
ORDER BY
    customer_rank,
    customer_id;


-- -----------------------------------------------------
-- Q34
-- Compare ROW_NUMBER(), RANK()
-- and DENSE_RANK().
-- -----------------------------------------------------

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM payment
    GROUP BY
        customer_id
)

SELECT
    customer_id,
    total_revenue,

    ROW_NUMBER() OVER (
        ORDER BY total_revenue DESC
    ) AS row_number,

    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS rank,

    DENSE_RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS dense_rank

FROM customer_revenue
ORDER BY
    total_revenue DESC,
    customer_id;


-- -----------------------------------------------------
-- Q35
-- Find the highest-paying customer
-- in every store.
-- -----------------------------------------------------

WITH customer_revenue AS (
    SELECT
        c.store_id,
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(p.amount) AS total_revenue
    FROM customer AS c
    INNER JOIN payment AS p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.store_id,
        c.customer_id,
        c.first_name,
        c.last_name
)

SELECT
    store_id,
    customer_id,
    customer_name,
    total_revenue
FROM (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY store_id
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM customer_revenue
) ranked_customers
WHERE
    revenue_rank = 1
ORDER BY
    store_id;


-- -----------------------------------------------------
-- Q36
-- Find the most rented film
-- in every category.
-- -----------------------------------------------------

WITH film_rentals AS (
    SELECT
        c.category_id,
        c.name AS category_name,
        f.film_id,
        f.title,
        COUNT(*) AS rental_count
    FROM rental AS r
    INNER JOIN inventory AS i
        ON r.inventory_id = i.inventory_id
    INNER JOIN film AS f
        ON i.film_id = f.film_id
    INNER JOIN film_category AS fc
        ON f.film_id = fc.film_id
    INNER JOIN category AS c
        ON fc.category_id = c.category_id
    GROUP BY
        c.category_id,
        c.name,
        f.film_id,
        f.title
)

SELECT
    category_name,
    film_id,
    title,
    rental_count
FROM (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY category_id
            ORDER BY rental_count DESC
        ) AS film_rank
    FROM film_rentals
) ranked_films
WHERE
    film_rank = 1
ORDER BY
    category_name;


-- -----------------------------------------------------
-- Q37
-- Find the top three customers
-- in every store.
-- -----------------------------------------------------

WITH customer_revenue AS (
    SELECT
        c.store_id,
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(p.amount) AS total_revenue
    FROM customer AS c
    INNER JOIN payment AS p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.store_id,
        c.customer_id,
        c.first_name,
        c.last_name
)

SELECT
    store_id,
    customer_id,
    customer_name,
    total_revenue,
    revenue_rank
FROM (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY store_id
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM customer_revenue
) ranked_customers
WHERE
    revenue_rank <= 3
ORDER BY
    store_id,
    revenue_rank,
    customer_id;


-- -----------------------------------------------------
-- Q38
-- Explain when ROW_NUMBER()
-- should be preferred.
-- -----------------------------------------------------

/*

Use ROW_NUMBER() when:

• Every row needs
  a unique sequence.

• Ties are not important.

Examples

• Serial numbering

• Pagination

• Selecting one row
  from duplicates

*/


-- -----------------------------------------------------
-- Q39
-- Explain when RANK()
-- should be preferred.
-- -----------------------------------------------------

/*

Use RANK() when:

• Equal values should
  share the same rank.

• Rank gaps are acceptable.

Examples

• Competition rankings

• Sales leaderboards

*/


-- -----------------------------------------------------
-- Q40
-- Explain when DENSE_RANK()
-- should be preferred.
-- -----------------------------------------------------

/*

Use DENSE_RANK() when:

• Equal values should
  share the same rank.

• No rank numbers
  should be skipped.

Examples

• Customer tiers

• Product rankings

• Business dashboards

*/