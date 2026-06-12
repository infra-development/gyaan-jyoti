-- ============================================================
-- Pagila SQL Course
-- Phase 1 - Week 1
-- Day 7 - Payment Exploration
-- ============================================================

-- ------------------------------------------------------------
-- Q61
-- How many payments exist?
-- ------------------------------------------------------------

SELECT COUNT(*) AS payment_count
FROM payment;


-- ------------------------------------------------------------
-- Q62
-- What is total revenue?
-- ------------------------------------------------------------

SELECT SUM(amount) AS total_revenue
FROM payment;


-- ------------------------------------------------------------
-- Q63
-- What is average payment amount?
-- ------------------------------------------------------------

SELECT ROUND(AVG(amount), 2) AS average_payment
FROM payment;


-- ------------------------------------------------------------
-- Q64
-- What is maximum payment amount?
-- ------------------------------------------------------------

SELECT MAX(amount) AS maximum_payment
FROM payment;


-- ------------------------------------------------------------
-- Q65
-- What is minimum payment amount?
-- ------------------------------------------------------------

SELECT MIN(amount) AS minimum_payment
FROM payment;


-- ------------------------------------------------------------
-- Q66
-- Revenue by day.
-- ------------------------------------------------------------

SELECT
    DATE(payment_date) AS payment_day,
    SUM(amount) AS daily_revenue
FROM payment
GROUP BY DATE(payment_date)
ORDER BY payment_day;


-- ------------------------------------------------------------
-- Q67
-- Revenue by month.
-- ------------------------------------------------------------

SELECT
    EXTRACT(YEAR FROM payment_date) AS year,
    EXTRACT(MONTH FROM payment_date) AS month,
    SUM(amount) AS monthly_revenue
FROM payment
GROUP BY
    EXTRACT(YEAR FROM payment_date),
    EXTRACT(MONTH FROM payment_date)
ORDER BY
    year,
    month;


-- ------------------------------------------------------------
-- Q68
-- Revenue by store.
-- ------------------------------------------------------------

SELECT
    c.store_id,
    SUM(p.amount) AS revenue
FROM payment p
JOIN customer c
    ON p.customer_id = c.customer_id
GROUP BY c.store_id
ORDER BY c.store_id;


-- ------------------------------------------------------------
-- Q69
-- Top 10 customers by payment amount.
-- ------------------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_spent DESC,
    c.customer_id
LIMIT 10;


-- ------------------------------------------------------------
-- Q70
-- Bottom 10 customers by payment amount.
-- ------------------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_spent ASC,
    c.customer_id
LIMIT 10;


-- ------------------------------------------------------------
-- Q71
-- Find customers who never made a payment.
-- ------------------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
LEFT JOIN payment p
    ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL
ORDER BY
    c.customer_id;


-- ------------------------------------------------------------
-- Q72
-- Find payments greater than the average payment amount.
-- ------------------------------------------------------------

SELECT
    payment_id,
    customer_id,
    amount,
    payment_date
FROM payment
WHERE amount >
(
    SELECT AVG(amount)
    FROM payment
)
ORDER BY
    amount DESC;


-- ------------------------------------------------------------
-- Q73
-- Find customers whose total payment exceeds 100.
-- ------------------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(p.amount) > 100
ORDER BY
    total_spent DESC;


-- ------------------------------------------------------------
-- Q74
-- Count payments by amount.
-- ------------------------------------------------------------

SELECT
    amount,
    COUNT(*) AS payment_count
FROM payment
GROUP BY amount
ORDER BY amount;


-- ------------------------------------------------------------
-- Q75
-- Create your own ER diagram from everything learned
-- this week.
--
-- Manual Exercise
-- ------------------------------------------------------------