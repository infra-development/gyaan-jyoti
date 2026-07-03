-- =====================================================
-- Week 3 - Day 7
-- Integration Challenge
-- Answers: Q61 - Q70
-- =====================================================

-- -----------------------------------------------------
-- Q61
-- Build a customer profile report using
-- CASE, COALESCE and string functions.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    UPPER(CONCAT(c.first_name, ' ', c.last_name)) AS display_name,
    COALESCE(c.email, 'Unknown') AS email,
    CASE
        WHEN c.active = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS customer_status
FROM customer AS c
ORDER BY
    c.customer_id;


-- -----------------------------------------------------
-- Q62
-- Build a film report with formatted
-- titles and rental categories.
-- -----------------------------------------------------

SELECT
    f.film_id,
    INITCAP(LOWER(f.title)) AS formatted_title,
    f.length,
    CASE
        WHEN f.length < 60 THEN 'Short'
        WHEN f.length <= 120 THEN 'Medium'
        ELSE 'Long'
    END AS film_category
FROM film AS f
ORDER BY
    formatted_title;


-- -----------------------------------------------------
-- Q63
-- Build a payment report with formatted
-- dates and revenue categories.
-- -----------------------------------------------------

SELECT
    p.payment_id,
    p.customer_id,
    p.amount,
    TO_CHAR(p.payment_date, 'DD-Mon-YYYY') AS payment_date,
    CASE
        WHEN p.amount < 3 THEN 'Low'
        WHEN p.amount <= 6 THEN 'Medium'
        ELSE 'High'
    END AS revenue_category
FROM payment AS p
ORDER BY
    p.payment_date;


-- -----------------------------------------------------
-- Q64
-- Build a store performance report.
-- -----------------------------------------------------

SELECT
    s.store_id,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(p.payment_id) AS total_payments,
    SUM(p.amount) AS total_revenue
FROM store AS s
INNER JOIN customer AS c
    ON s.store_id = c.store_id
LEFT JOIN payment AS p
    ON c.customer_id = p.customer_id
GROUP BY
    s.store_id
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q65
-- Build a customer activity dashboard.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT r.rental_id) AS total_rentals,
    COUNT(DISTINCT p.payment_id) AS total_payments,
    SUM(p.amount) AS total_spent,
    CASE
        WHEN SUM(p.amount) < 75 THEN 'Bronze'
        WHEN SUM(p.amount) <= 150 THEN 'Silver'
        ELSE 'Gold'
    END AS customer_level
FROM customer AS c
LEFT JOIN rental AS r
    ON c.customer_id = r.customer_id
LEFT JOIN payment AS p
    ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_spent DESC NULLS LAST;


-- -----------------------------------------------------
-- Q66
-- Build a monthly business summary.
-- -----------------------------------------------------

SELECT
    TO_CHAR(payment_date, 'Mon YYYY') AS month,
    COUNT(payment_id) AS total_payments,
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_payment
FROM payment
GROUP BY
    TO_CHAR(payment_date, 'Mon YYYY'),
    DATE_TRUNC('month', payment_date)
ORDER BY
    DATE_TRUNC('month', payment_date);


-- -----------------------------------------------------
-- Q67
-- Build a report combining JOINs
-- and transformation functions.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    INITCAP(f.title) AS film_title,
    TO_CHAR(r.rental_date, 'DD-Mon-YYYY') AS rental_date
FROM customer AS c
INNER JOIN rental AS r
    ON c.customer_id = r.customer_id
INNER JOIN inventory AS i
    ON r.inventory_id = i.inventory_id
INNER JOIN film AS f
    ON i.film_id = f.film_id
ORDER BY
    c.customer_id,
    r.rental_date;


-- -----------------------------------------------------
-- Q68
-- Clean and format messy business data.
-- -----------------------------------------------------

SELECT
    customer_id,
    TRIM(
        CONCAT(
            INITCAP(first_name),
            ' ',
            INITCAP(last_name)
        )
    ) AS customer_name,
    COALESCE(email, 'Not Available') AS email
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q69
-- Explain the transformation steps
-- before writing SQL.
-- -----------------------------------------------------

/*

Business Question

        ↓

Identify Required Data

        ↓

Retrieve Data

        ↓

Transform Data

        ↓

Clean NULL Values

        ↓

Format Text

        ↓

Format Dates

        ↓

Apply Business Rules

        ↓

Generate Business Report

*/


-- -----------------------------------------------------
-- Q70
-- Identify all SQL concepts required
-- before solving each report.
-- -----------------------------------------------------

/*

Week 3 SQL Concepts

✓ JOIN

✓ CASE

✓ COALESCE

✓ NULLIF

✓ CAST

✓ UPPER

✓ LOWER

✓ CONCAT

✓ TRIM

✓ REPLACE

✓ SUBSTRING

✓ LENGTH

✓ CURRENT_DATE

✓ CURRENT_TIMESTAMP

✓ AGE

✓ EXTRACT

✓ DATE_TRUNC

✓ TO_CHAR

----------------------------------------

Professional Thinking Process

Business Requirement

        ↓

Business Entities

        ↓

JOIN (if required)

        ↓

Transformation

        ↓

Formatting

        ↓

Business Rules

        ↓

Final Report

*/