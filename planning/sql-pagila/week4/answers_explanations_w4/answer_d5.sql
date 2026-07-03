-- =====================================================
-- Week 4 - Day 5
-- Comparing Rows
-- Answers: Q41 - Q50
-- =====================================================

-- -----------------------------------------------------
-- Q41
-- Display every payment together with the
-- previous payment made by the same customer.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date, payment_id
    ) AS previous_payment
FROM payment
ORDER BY
    customer_id,
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q42
-- Display every payment together with the
-- next payment made by the same customer.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    LEAD(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date, payment_id
    ) AS next_payment
FROM payment
ORDER BY
    customer_id,
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q43
-- Calculate the difference between
-- consecutive payments for each customer.
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
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q44
-- Display every customer's
-- previous rental date.
-- -----------------------------------------------------

SELECT
    rental_id,
    customer_id,
    rental_date,
    LAG(rental_date) OVER (
        PARTITION BY customer_id
        ORDER BY rental_date, rental_id
    ) AS previous_rental_date
FROM rental
ORDER BY
    customer_id,
    rental_date,
    rental_id;


-- -----------------------------------------------------
-- Q45
-- Display every customer's
-- next rental date.
-- -----------------------------------------------------

SELECT
    rental_id,
    customer_id,
    rental_date,
    LEAD(rental_date) OVER (
        PARTITION BY customer_id
        ORDER BY rental_date, rental_id
    ) AS next_rental_date
FROM rental
ORDER BY
    customer_id,
    rental_date,
    rental_id;


-- -----------------------------------------------------
-- Q46
-- Divide customers into four
-- spending groups using NTILE().
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
    NTILE(4) OVER (
        ORDER BY total_revenue DESC
    ) AS spending_group
FROM customer_revenue
ORDER BY
    spending_group,
    total_revenue DESC;


-- -----------------------------------------------------
-- Q47
-- Explain the purpose of LAG().
-- -----------------------------------------------------

/*

LAG()

Returns a value from
a previous row.

Business Uses

• Compare previous payment

• Compare previous rental

• Trend analysis

• Growth calculations

*/


-- -----------------------------------------------------
-- Q48
-- Explain the purpose of LEAD().
-- -----------------------------------------------------

/*

LEAD()

Returns a value from
a following row.

Business Uses

• Next payment

• Next rental

• Future scheduling

• Sequence analysis

*/


-- -----------------------------------------------------
-- Q49
-- Explain the purpose of NTILE().
-- -----------------------------------------------------

/*

NTILE()

Divides rows into
approximately equal groups.

Business Uses

• Customer Segmentation

• Spending Groups

• Performance Bands

• Quartile Analysis

*/


-- -----------------------------------------------------
-- Q50
-- Draw the thinking process
-- before comparing rows.
-- -----------------------------------------------------

/*

Business Question

        ↓

Need Every Row?

        ↓

Yes

        ↓

Need Previous Row?

↓

LAG()

------------------------

Need Next Row?

↓

LEAD()

------------------------

Need Equal Groups?

↓

NTILE()

        ↓

Business Report

*/