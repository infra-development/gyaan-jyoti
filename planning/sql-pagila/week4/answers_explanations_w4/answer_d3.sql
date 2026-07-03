-- =====================================================
-- Week 4 - Day 3
-- ORDER BY Inside Window Functions
-- Answers: Q21 - Q30
-- =====================================================

-- -----------------------------------------------------
-- Q21
-- Calculate a running total of payment amounts.
-- -----------------------------------------------------

SELECT
    payment_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        ORDER BY payment_date, payment_id
    ) AS running_total
FROM payment
ORDER BY
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q22
-- Calculate a running count of payments.
-- -----------------------------------------------------

SELECT
    payment_id,
    payment_date,
    COUNT(*) OVER (
        ORDER BY payment_date, payment_id
    ) AS running_payment_count
FROM payment
ORDER BY
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q23
-- Display cumulative revenue over time.
-- -----------------------------------------------------

SELECT
    payment_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        ORDER BY payment_date, payment_id
    ) AS cumulative_revenue
FROM payment
ORDER BY
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q24
-- Display cumulative rentals
-- ordered by rental date.
-- -----------------------------------------------------

SELECT
    rental_id,
    rental_date,
    COUNT(*) OVER (
        ORDER BY rental_date, rental_id
    ) AS cumulative_rentals
FROM rental
ORDER BY
    rental_date,
    rental_id;


-- -----------------------------------------------------
-- Q25
-- Calculate a running total of
-- revenue for each customer.
-- -----------------------------------------------------

SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date, payment_id
    ) AS customer_running_revenue
FROM payment
ORDER BY
    customer_id,
    payment_date,
    payment_id;


-- -----------------------------------------------------
-- Q26
-- Calculate a running total of
-- revenue for each store.
-- -----------------------------------------------------

SELECT
    p.payment_id,
    c.store_id,
    p.payment_date,
    p.amount,
    SUM(p.amount) OVER (
        PARTITION BY c.store_id
        ORDER BY p.payment_date, p.payment_id
    ) AS store_running_revenue
FROM payment AS p
INNER JOIN customer AS c
    ON p.customer_id = c.customer_id
ORDER BY
    c.store_id,
    p.payment_date,
    p.payment_id;


-- -----------------------------------------------------
-- Q27
-- Explain why ORDER BY changes
-- Window Function results.
-- -----------------------------------------------------

/*

Without ORDER BY

• Every row sees the same window.

-------------------------------------

With ORDER BY

• Rows are processed sequentially.
• Calculations become cumulative.
• Previous rows affect current rows.

ORDER BY introduces
chronological analysis.

*/


-- -----------------------------------------------------
-- Q28
-- Compare a running total
-- with an ordinary SUM().
-- -----------------------------------------------------

-- Aggregate SUM()

SELECT
    SUM(amount) AS total_revenue
FROM payment;

--------------------------------------------------------

-- Running Total

SELECT
    payment_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        ORDER BY payment_date, payment_id
    ) AS running_total
FROM payment
ORDER BY
    payment_date,
    payment_id;

--------------------------------------------------------

/*

Aggregate SUM()

• One final total.

-------------------------------------

Running Total

• Total grows with each row.

*/


-- -----------------------------------------------------
-- Q29
-- Identify business reports
-- that require running totals.
-- -----------------------------------------------------

/*

Examples

• Daily Revenue Dashboard

• Monthly Sales Trend

• Running Account Balance

• Cumulative Customer Spending

• Progressive Rental Count

• Revenue Growth Analysis

*/


-- -----------------------------------------------------
-- Q30
-- Draw the thinking process
-- before writing running
-- total queries.
-- -----------------------------------------------------

/*

Business Question

        ↓

Need Every Row?

        ↓

Yes

        ↓

Need Chronological Analysis?

        ↓

Yes

        ↓

ORDER BY

        ↓

Need Separate Groups?

        ↓

Optional

↓

PARTITION BY

        ↓

Running Calculation

↓

Business Report

*/