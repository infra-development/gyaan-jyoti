-- =====================================================
-- Week 4 - Day 7
-- Integration Challenge
-- Answers: Q61 - Q70
-- =====================================================

-- -----------------------------------------------------
-- Q61
-- Build a customer revenue dashboard
-- using multiple Window Functions.
-- -----------------------------------------------------

WITH customer_revenue AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.store_id,
        SUM(p.amount) AS total_revenue
    FROM customer AS c
    INNER JOIN payment AS p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.store_id
)

SELECT
    customer_id,
    customer_name,
    store_id,
    total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS overall_rank,
    DENSE_RANK() OVER (
        PARTITION BY store_id
        ORDER BY total_revenue DESC
    ) AS store_rank
FROM customer_revenue
ORDER BY
    overall_rank;


-- -----------------------------------------------------
-- Q62
-- Build a store performance dashboard
-- showing rankings, totals and averages.
-- -----------------------------------------------------

WITH store_revenue AS (
    SELECT
        c.store_id,
        SUM(p.amount) AS revenue
    FROM customer c
    JOIN payment p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.store_id
)

SELECT
    store_id,
    revenue,
    AVG(revenue) OVER () AS average_store_revenue,
    RANK() OVER (
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM store_revenue
ORDER BY
    revenue_rank;


-- -----------------------------------------------------
-- Q63
-- Build a film popularity dashboard
-- using rankings and rental counts.
-- -----------------------------------------------------

WITH film_stats AS (
    SELECT
        f.film_id,
        f.title,
        COUNT(*) AS rental_count
    FROM rental r
    JOIN inventory i
        ON r.inventory_id = i.inventory_id
    JOIN film f
        ON i.film_id = f.film_id
    GROUP BY
        f.film_id,
        f.title
)

SELECT
    film_id,
    title,
    rental_count,
    RANK() OVER (
        ORDER BY rental_count DESC
    ) AS popularity_rank
FROM film_stats
ORDER BY
    popularity_rank;


-- -----------------------------------------------------
-- Q64
-- Build a monthly revenue trend report.
-- -----------------------------------------------------

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', payment_date) AS month,
        SUM(amount) AS revenue
    FROM payment
    GROUP BY
        DATE_TRUNC('month', payment_date)
)

SELECT
    month,
    revenue,
    SUM(revenue) OVER (
        ORDER BY month
    ) AS cumulative_revenue,
    AVG(revenue) OVER (
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average
FROM monthly_revenue
ORDER BY
    month;


-- -----------------------------------------------------
-- Q65
-- Build a customer ranking report
-- showing global rank and store rank.
-- -----------------------------------------------------

WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.store_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(p.amount) AS revenue
    FROM customer c
    JOIN payment p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id,
        c.store_id,
        c.first_name,
        c.last_name
)

SELECT
    customer_name,
    store_id,
    revenue,

    RANK() OVER (
        ORDER BY revenue DESC
    ) AS global_rank,

    RANK() OVER (
        PARTITION BY store_id
        ORDER BY revenue DESC
    ) AS store_rank

FROM customer_revenue
ORDER BY
    global_rank;


-- -----------------------------------------------------
-- Q66
-- Build a payment trend report
-- comparing each payment with
-- the previous payment.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,

    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date, payment_id
    ) AS previous_payment,

    amount -
    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date, payment_id
    ) AS payment_difference

FROM payment
ORDER BY
    customer_id,
    payment_date;


-- -----------------------------------------------------
-- Q67
-- Build a rental activity dashboard
-- showing customer trends over time.
-- -----------------------------------------------------

SELECT
    rental_id,
    customer_id,
    rental_date,

    COUNT(*) OVER (
        PARTITION BY customer_id
        ORDER BY rental_date
    ) AS running_rentals,

    LAG(rental_date) OVER (
        PARTITION BY customer_id
        ORDER BY rental_date
    ) AS previous_rental,

    LEAD(rental_date) OVER (
        PARTITION BY customer_id
        ORDER BY rental_date
    ) AS next_rental

FROM rental
ORDER BY
    customer_id,
    rental_date;


-- -----------------------------------------------------
-- Q68
-- Build a report combining
-- multiple Window Functions.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,

    SUM(amount) OVER (
        PARTITION BY customer_id
    ) AS customer_total,

    AVG(amount) OVER (
        PARTITION BY customer_id
    ) AS customer_average,

    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS payment_number,

    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS previous_payment,

    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS running_total

FROM payment
ORDER BY
    customer_id,
    payment_date;


-- -----------------------------------------------------
-- Q69
-- Explain the complete analytical
-- workflow before writing SQL.
-- -----------------------------------------------------

/*

Business Question

        ↓

Business Entity

        ↓

Business Metric

        ↓

Need Every Row?

        ↓

Window Function

        ↓

Need Groups?

↓

PARTITION BY

        ↓

Need Order?

↓

ORDER BY

        ↓

Choose Analytical Function

        ↓

Business Report

*/


-- -----------------------------------------------------
-- Q70
-- List every Window Function
-- learned during Week 4 and
-- explain its business purpose.
-- -----------------------------------------------------

/*

OVER()

Defines the analytical window.

-------------------------------------

PARTITION BY

Creates logical analytical groups.

-------------------------------------

ORDER BY

Introduces sequence.

-------------------------------------

ROW_NUMBER()

Unique numbering.

-------------------------------------

RANK()

Competition ranking.

-------------------------------------

DENSE_RANK()

Continuous ranking.

-------------------------------------

LAG()

Previous row comparison.

-------------------------------------

LEAD()

Next row comparison.

-------------------------------------

NTILE()

Customer segmentation.

-------------------------------------

FIRST_VALUE()

First value in a partition.

-------------------------------------

LAST_VALUE()

Latest value in a partition.

-------------------------------------

Running Totals

Cumulative analysis.

-------------------------------------

Moving Average

Trend analysis.

*/