-- =====================================================
-- Week 3 - Day 2
-- CASE Expressions
-- Answers: Q11 - Q20
-- =====================================================

-- -----------------------------------------------------
-- Q11
-- Display customer status as "Active" or "Inactive".
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    CASE
        WHEN active = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS customer_status
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q12
-- Classify films as Short, Medium or Long
-- based on length.
-- -----------------------------------------------------

SELECT
    film_id,
    title,
    length,
    CASE
        WHEN length < 60 THEN 'Short'
        WHEN length <= 120 THEN 'Medium'
        ELSE 'Long'
    END AS film_category
FROM film
ORDER BY
    length;


-- -----------------------------------------------------
-- Q13
-- Display payment amounts as
-- Low, Medium or High.
-- -----------------------------------------------------

SELECT
    payment_id,
    amount,
    CASE
        WHEN amount < 3 THEN 'Low'
        WHEN amount <= 6 THEN 'Medium'
        ELSE 'High'
    END AS payment_category
FROM payment
ORDER BY
    amount;


-- -----------------------------------------------------
-- Q14
-- Categorize customers based on total rentals.
-- -----------------------------------------------------

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals,
    CASE
        WHEN COUNT(r.rental_id) < 20 THEN 'Occasional'
        WHEN COUNT(r.rental_id) <= 35 THEN 'Regular'
        ELSE 'Frequent'
    END AS customer_category
FROM customer AS c
INNER JOIN rental AS r
    ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_rentals DESC;


-- -----------------------------------------------------
-- Q15
-- Show different rental labels
-- based on rental duration.
-- -----------------------------------------------------

SELECT
    film_id,
    title,
    rental_duration,
    CASE
        WHEN rental_duration <= 3 THEN 'Short Rental'
        WHEN rental_duration <= 6 THEN 'Standard Rental'
        ELSE 'Long Rental'
    END AS rental_label
FROM film
ORDER BY
    rental_duration;


-- -----------------------------------------------------
-- Q16
-- Use CASE inside ORDER BY.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    active
FROM customer
ORDER BY
    CASE
        WHEN active = 1 THEN 1
        ELSE 2
    END,
    last_name;


-- -----------------------------------------------------
-- Q17
-- Use CASE inside GROUP BY.
-- -----------------------------------------------------

SELECT
    CASE
        WHEN active = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS customer_status,
    COUNT(*) AS total_customers
FROM customer
GROUP BY
    CASE
        WHEN active = 1 THEN 'Active'
        ELSE 'Inactive'
    END;


-- -----------------------------------------------------
-- Q18
-- Use multiple WHEN conditions.
-- -----------------------------------------------------

SELECT
    film_id,
    title,
    replacement_cost,
    CASE
        WHEN replacement_cost < 15 THEN 'Low Cost'
        WHEN replacement_cost < 20 THEN 'Medium Cost'
        WHEN replacement_cost < 25 THEN 'High Cost'
        ELSE 'Premium Cost'
    END AS replacement_category
FROM film
ORDER BY
    replacement_cost;


-- -----------------------------------------------------
-- Q19
-- Write a nested CASE expression.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    active,
    CASE
        WHEN active = 1 THEN
            CASE
                WHEN store_id = 1 THEN 'Active - Store 1'
                ELSE 'Active - Store 2'
            END
        ELSE 'Inactive'
    END AS customer_group
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q20
-- Explain your CASE logic before writing SQL.
-- -----------------------------------------------------

/*

Business Rule

Raw Data

↓

Business Categories

↓

CASE Expression

-----------------------------------------

Example 1

Active = 1

↓

Active

Else

↓

Inactive

-----------------------------------------

Example 2

Length

↓

Short

Medium

Long

-----------------------------------------

Example 3

Payment Amount

↓

Low

Medium

High

-----------------------------------------

General Pattern

CASE

↓

Business Rule

↓

Business Label

END

*/