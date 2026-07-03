-- =====================================================
-- Week 5 - Day 7
-- Integration Challenge
-- Answers: Q61 - Q70
-- =====================================================

-- -----------------------------------------------------
-- Q61
-- Build a customer revenue report
-- using multiple CTEs.
-- -----------------------------------------------------

WITH customer_revenue AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM payment
    GROUP BY
        customer_id
),

customer_details AS
(
    SELECT
        customer_id,
        first_name,
        last_name,
        store_id
    FROM customer
)

SELECT
    cd.customer_id,
    cd.first_name,
    cd.last_name,
    cd.store_id,
    cr.total_revenue
FROM customer_details AS cd
INNER JOIN customer_revenue AS cr
    ON cd.customer_id = cr.customer_id
ORDER BY
    cr.total_revenue DESC;


-- -----------------------------------------------------
-- Q62
-- Build a store performance report
-- using CTEs and Window Functions.
-- -----------------------------------------------------

WITH store_revenue AS
(
    SELECT
        c.store_id,
        SUM(p.amount) AS total_revenue
    FROM customer AS c
    INNER JOIN payment AS p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.store_id
)

SELECT
    store_id,
    total_revenue,
    RANK() OVER
    (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM store_revenue
ORDER BY
    revenue_rank;


-- -----------------------------------------------------
-- Q63
-- Build a film popularity report
-- using subqueries and ranking.
-- -----------------------------------------------------

WITH film_rentals AS
(
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
)

SELECT
    film_id,
    title,
    rental_count,
    RANK() OVER
    (
        ORDER BY rental_count DESC
    ) AS popularity_rank
FROM film_rentals
ORDER BY
    popularity_rank,
    title;


-- -----------------------------------------------------
-- Q64
-- Build a monthly revenue report
-- using CTEs and Window Functions.
-- -----------------------------------------------------

WITH monthly_revenue AS
(
    SELECT
        DATE_TRUNC('month', payment_date)::DATE AS month,
        SUM(amount) AS revenue
    FROM payment
    GROUP BY
        DATE_TRUNC('month', payment_date)
)

SELECT
    month,
    revenue,

    SUM(revenue) OVER
    (
        ORDER BY month
    ) AS running_revenue,

    AVG(revenue) OVER
    (
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average
FROM monthly_revenue
ORDER BY
    month;


-- -----------------------------------------------------
-- Q65
-- Build a customer segmentation report
-- combining multiple CTEs.
-- -----------------------------------------------------

WITH customer_revenue AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM payment
    GROUP BY
        customer_id
),

customer_segments AS
(
    SELECT
        customer_id,
        total_revenue,
        NTILE(4) OVER
        (
            ORDER BY total_revenue DESC
        ) AS segment
    FROM customer_revenue
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    cs.total_revenue,
    cs.segment
FROM customer AS c
INNER JOIN customer_segments AS cs
    ON c.customer_id = cs.customer_id
ORDER BY
    cs.segment,
    cs.total_revenue DESC;


-- -----------------------------------------------------
-- Q66
-- Rewrite a complex nested query
-- into readable CTEs.
-- -----------------------------------------------------

WITH customer_revenue AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM payment
    GROUP BY
        customer_id
),

average_revenue AS
(
    SELECT
        AVG(total_revenue) AS avg_revenue
    FROM customer_revenue
)

SELECT
    customer_id,
    total_revenue
FROM customer_revenue
WHERE
    total_revenue >
    (
        SELECT
            avg_revenue
        FROM average_revenue
    )
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q67
-- Combine UNION, INTERSECT,
-- and EXCEPT in business scenarios.
-- -----------------------------------------------------

-- UNION

SELECT customer_id
FROM payment

UNION

SELECT customer_id
FROM rental;

--------------------------------------------------------

-- INTERSECT

SELECT customer_id
FROM payment

INTERSECT

SELECT customer_id
FROM rental;

--------------------------------------------------------

-- EXCEPT

SELECT customer_id
FROM rental

EXCEPT

SELECT customer_id
FROM payment;


-- -----------------------------------------------------
-- Q68
-- Use a Recursive CTE together
-- with business reporting.
-- -----------------------------------------------------

WITH RECURSIVE calendar AS
(
    SELECT
        MIN(payment_date)::DATE AS report_date
    FROM payment

    UNION ALL

    SELECT
        report_date + 1
    FROM calendar
    WHERE
        report_date <
        (
            SELECT
                MAX(payment_date)::DATE
            FROM payment
        )
),

daily_revenue AS
(
    SELECT
        payment_date::DATE AS report_date,
        SUM(amount) AS revenue
    FROM payment
    GROUP BY
        payment_date::DATE
)

SELECT
    c.report_date,
    COALESCE(dr.revenue, 0) AS revenue
FROM calendar AS c
LEFT JOIN daily_revenue AS dr
    ON c.report_date = dr.report_date
ORDER BY
    c.report_date;


-- -----------------------------------------------------
-- Q69
-- Explain the complete thought process
-- before writing a complex SQL query.
-- -----------------------------------------------------

/*

Business Requirement

        ↓

Understand Business

        ↓

Identify Entities

        ↓

Identify Metrics

        ↓

Break Into Logical Steps

        ↓

Choose SQL Techniques

        ↓

Build Intermediate Results

        ↓

Combine Results

        ↓

Business Report

*/


-- -----------------------------------------------------
-- Q70
-- List every query construction
-- technique learned during Week 5
-- and explain the business problem
-- each one solves.
-- -----------------------------------------------------

/*

Technique                  Purpose

--------------------------------------------

Scalar Subquery

↓

Single Calculated Value

--------------------------------------------

Multi-row Subquery

↓

List Comparison

--------------------------------------------

Derived Table

↓

Intermediate Result Set

--------------------------------------------

Correlated Subquery

↓

Row-by-Row Comparison

--------------------------------------------

EXISTS

↓

Check Existence

--------------------------------------------

NOT EXISTS

↓

Find Missing Records

--------------------------------------------

CTE

↓

Readable SQL

--------------------------------------------

Recursive CTE

↓

Recursive Problems

--------------------------------------------

UNION

↓

Combine Unique Rows

--------------------------------------------

UNION ALL

↓

Combine All Rows

--------------------------------------------

INTERSECT

↓

Common Rows

--------------------------------------------

EXCEPT

↓

Missing Rows

--------------------------------------------

Window Functions

↓

Analytical Reporting

--------------------------------------------

Together these techniques allow developers
to build clean, modular, maintainable,
production-quality SQL solutions.

*/