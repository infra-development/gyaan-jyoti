-- =====================================================
-- Week 4 - Day 1
-- Understanding Window Functions
-- Answers: Q1 - Q10
-- =====================================================

-- -----------------------------------------------------
-- Q1
-- Display every payment together with the
-- average payment amount across all payments.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    amount,
    AVG(amount) OVER () AS average_payment
FROM payment
ORDER BY
    payment_id;


-- -----------------------------------------------------
-- Q2
-- Display every payment together with the
-- total revenue generated across all payments.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    amount,
    SUM(amount) OVER () AS total_revenue
FROM payment
ORDER BY
    payment_id;


-- -----------------------------------------------------
-- Q3
-- Display every payment together with the
-- total number of payments.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    amount,
    COUNT(*) OVER () AS total_payments
FROM payment
ORDER BY
    payment_id;


-- -----------------------------------------------------
-- Q4
-- Compare GROUP BY and Window Functions
-- when calculating the average payment amount.
-- -----------------------------------------------------

-- GROUP BY

SELECT
    customer_id,
    AVG(amount) AS average_payment
FROM payment
GROUP BY
    customer_id
ORDER BY
    customer_id;

--------------------------------------------------------

-- Window Function

SELECT
    payment_id,
    customer_id,
    amount,
    AVG(amount)
        OVER (
            PARTITION BY customer_id
        ) AS average_payment
FROM payment
ORDER BY
    customer_id,
    payment_id;

--------------------------------------------------------

/*

GROUP BY

• Returns one row per customer.
• Original payment rows disappear.

-------------------------------------

Window Function

• Returns every payment.
• Displays customer average beside
  each payment.

*/


-- -----------------------------------------------------
-- Q5
-- Display every customer together with
-- the total number of customers.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    COUNT(*) OVER () AS total_customers
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q6
-- Display every film together with the
-- average rental rate of all films.
-- -----------------------------------------------------

SELECT
    film_id,
    title,
    rental_rate,
    AVG(rental_rate) OVER () AS average_rental_rate
FROM film
ORDER BY
    film_id;


-- -----------------------------------------------------
-- Q7
-- Explain why GROUP BY reduces rows
-- while Window Functions preserve rows.
-- -----------------------------------------------------

/*

GROUP BY

• Groups rows together.
• Returns one row per group.

-------------------------------------

Window Functions

• Perform calculations.
• Keep every original row.
• Add analytical values to each row.

*/


-- -----------------------------------------------------
-- Q8
-- Identify business situations where
-- Window Functions are preferred.
-- -----------------------------------------------------

/*

Use Window Functions when:

• Ranking customers
• Running totals
• Running averages
• Previous / Next row comparison
• Trend analysis
• Percentile analysis

The original rows remain visible.

*/


-- -----------------------------------------------------
-- Q9
-- Explain the purpose of OVER().
-- -----------------------------------------------------

/*

OVER()

Defines the analytical window.

It tells PostgreSQL:

• Which rows participate
• Whether rows are partitioned
• Whether rows are ordered

Without OVER(),

an aggregate function behaves as
a normal aggregate.

*/


-- -----------------------------------------------------
-- Q10
-- Draw the analytical thinking process
-- before writing Window Function queries.
-- -----------------------------------------------------

/*

Business Question

        ↓

Business Metric

        ↓

Should Every Row Stay?

        ↓

Yes

        ↓

Window Function

        ↓

Need Groups?

↓

PARTITION BY

        ↓

Need Sequence?

↓

ORDER BY

        ↓

Business Report

*/