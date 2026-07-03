-- =====================================================
-- Week 4 - Day 6
-- Advanced Analytical Functions
-- Answers: Q51 - Q60
-- =====================================================

-- -----------------------------------------------------
-- Q51
-- Display the first payment made
-- by every customer.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    FIRST_VALUE(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date, payment_id
    ) AS first_payment
FROM payment
ORDER BY
    customer_id,
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q52
-- Display the latest payment made
-- by every customer.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    LAST_VALUE(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date, payment_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS latest_payment
FROM payment
ORDER BY
    customer_id,
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q53
-- Display the first rental made
-- by every customer.
-- -----------------------------------------------------

SELECT
    rental_id,
    customer_id,
    rental_date,
    FIRST_VALUE(rental_date) OVER (
        PARTITION BY customer_id
        ORDER BY rental_date, rental_id
    ) AS first_rental_date
FROM rental
ORDER BY
    customer_id,
    rental_date,
    rental_id;


-- -----------------------------------------------------
-- Q54
-- Display the latest rental made
-- by every customer.
-- -----------------------------------------------------

SELECT
    rental_id,
    customer_id,
    rental_date,
    LAST_VALUE(rental_date) OVER (
        PARTITION BY customer_id
        ORDER BY rental_date, rental_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS latest_rental_date
FROM rental
ORDER BY
    customer_id,
    rental_date,
    rental_id;


-- -----------------------------------------------------
-- Q55
-- Calculate a moving average
-- of payment amounts.
-- -----------------------------------------------------

SELECT
    payment_id,
    payment_date,
    amount,
    AVG(amount) OVER (
        ORDER BY payment_date, payment_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average
FROM payment
ORDER BY
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q56
-- Calculate a moving average
-- of daily revenue.
-- -----------------------------------------------------

WITH daily_revenue AS (
    SELECT
        DATE(payment_date) AS payment_day,
        SUM(amount) AS daily_revenue
    FROM payment
    GROUP BY
        DATE(payment_date)
)

SELECT
    payment_day,
    daily_revenue,
    AVG(daily_revenue) OVER (
        ORDER BY payment_day
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average_revenue
FROM daily_revenue
ORDER BY
    payment_day;


-- -----------------------------------------------------
-- Q57
-- Compare moving averages
-- with ordinary averages.
-- -----------------------------------------------------

WITH daily_revenue AS (
    SELECT
        DATE(payment_date) AS payment_day,
        SUM(amount) AS daily_revenue
    FROM payment
    GROUP BY
        DATE(payment_date)
)

SELECT
    payment_day,
    daily_revenue,

    AVG(daily_revenue) OVER () AS overall_average,

    AVG(daily_revenue) OVER (
        ORDER BY payment_day
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average

FROM daily_revenue
ORDER BY
    payment_day;


-- -----------------------------------------------------
-- Q58
-- Explain the purpose
-- of FIRST_VALUE().
-- -----------------------------------------------------

/*

FIRST_VALUE()

Returns the first value
within a window.

Business Uses

• First payment

• First rental

• Customer onboarding

• Initial transaction

*/


-- -----------------------------------------------------
-- Q59
-- Explain the purpose
-- of LAST_VALUE().
-- -----------------------------------------------------

/*

LAST_VALUE()

Returns the last value
within a window.

Requires an explicit
window frame to return
the actual last row.

Business Uses

• Latest payment

• Latest rental

• Most recent activity

• Latest customer event

*/


-- -----------------------------------------------------
-- Q60
-- Draw the thinking process
-- before writing advanced
-- analytical queries.
-- -----------------------------------------------------

/*

Business Question

        ↓

Need Every Row?

        ↓

Yes

        ↓

Need First Value?

↓

FIRST_VALUE()

------------------------

Need Last Value?

↓

LAST_VALUE()

------------------------

Need Trend Analysis?

↓

Moving Average

↓

Choose Window Frame

↓

Business Report

*/