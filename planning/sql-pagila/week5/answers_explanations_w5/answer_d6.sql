-- =====================================================
-- Week 5 - Day 6
-- Choosing the Right SQL Technique
-- Answers: Q51 - Q60
-- =====================================================

-- -----------------------------------------------------
-- Q51
-- Solve the same business problem using
-- both a Subquery and a CTE.
--
-- Problem:
-- Display customers whose total spending
-- is greater than the average customer spending.
-- -----------------------------------------------------

-- Solution 1 : Subquery

SELECT
    customer_id,
    SUM(amount) AS total_spending
FROM payment
GROUP BY
    customer_id
HAVING
    SUM(amount) >
    (
        SELECT AVG(customer_total)
        FROM
        (
            SELECT
                SUM(amount) AS customer_total
            FROM payment
            GROUP BY customer_id
        ) AS customer_totals
    )
ORDER BY
    total_spending DESC;


-- Solution 2 : CTE

WITH customer_revenue AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM payment
    GROUP BY
        customer_id
)

SELECT
    customer_id,
    total_spending
FROM customer_revenue
WHERE
    total_spending >
    (
        SELECT AVG(total_spending)
        FROM customer_revenue
    )
ORDER BY
    total_spending DESC;


-- -----------------------------------------------------
-- Q52
-- Solve the same problem using
-- a Derived Table and a CTE.
--
-- Problem:
-- Display total revenue for each customer.
-- -----------------------------------------------------

-- Solution 1 : Derived Table

SELECT
    customer_id,
    total_revenue
FROM
(
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM payment
    GROUP BY
        customer_id
) AS customer_revenue
ORDER BY
    total_revenue DESC;


-- Solution 2 : CTE

WITH customer_revenue AS
(
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM payment
    GROUP BY
        customer_id
)

SELECT
    customer_id,
    total_revenue
FROM customer_revenue
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q53
-- Rewrite a correlated subquery
-- using a CTE.
--
-- Problem:
-- Highest payment made by each customer.
-- -----------------------------------------------------

WITH customer_max_payment AS
(
    SELECT
        customer_id,
        MAX(amount) AS highest_payment
    FROM payment
    GROUP BY
        customer_id
)

SELECT
    p.customer_id,
    p.payment_id,
    p.amount
FROM payment AS p
INNER JOIN customer_max_payment AS cmp
    ON p.customer_id = cmp.customer_id
   AND p.amount = cmp.highest_payment
ORDER BY
    p.customer_id;


-- -----------------------------------------------------
-- Q54
-- Rewrite a derived table
-- as a CTE.
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
    *
FROM store_revenue
ORDER BY
    store_id;


-- -----------------------------------------------------
-- Q55
-- Compare the readability of
-- nested subqueries and CTEs.
-- -----------------------------------------------------

/*

Nested Subqueries

• Difficult to read.

• Become harder to maintain
  as complexity grows.

------------------------------------

CTEs

• Logical sections.

• Meaningful names.

• Easier debugging.

• Better readability.

Preferred for
large business reports.

*/


-- -----------------------------------------------------
-- Q56
-- Identify situations where
-- correlated subqueries
-- should be avoided.
-- -----------------------------------------------------

/*

Avoid Correlated Subqueries

• Large tables.

• Performance-sensitive queries.

• Repeated calculations.

Prefer

• JOIN

• CTE

• Window Functions

whenever possible.

*/


-- -----------------------------------------------------
-- Q57
-- Identify situations where
-- CTEs improve maintainability.
-- -----------------------------------------------------

/*

Examples

• Executive Dashboards

• BI Reports

• Customer Analytics

• Financial Reports

• KPI Reports

• Large SQL Queries

CTEs improve readability
and simplify future changes.

*/


-- -----------------------------------------------------
-- Q58
-- Explain how professional SQL
-- developers structure large queries.
-- -----------------------------------------------------

/*

Business Problem

↓

Break into Steps

↓

One CTE Per Step

↓

Combine Results

↓

Final Query

Professional SQL
is built incrementally.

*/


-- -----------------------------------------------------
-- Q59
-- Explain how to break a large
-- business problem into
-- smaller SQL steps.
-- -----------------------------------------------------

/*

Business Question

↓

Business Entities

↓

Business Metrics

↓

Intermediate Results

↓

Reusable Queries

↓

Final Report

*/


-- -----------------------------------------------------
-- Q60
-- Draw the complete SQL
-- design workflow.
-- -----------------------------------------------------

/*

Business Requirement

        ↓

Understand Problem

        ↓

Break Into Steps

        ↓

Choose SQL Technique

        ↓

Build Intermediate Results

        ↓

Combine Results

        ↓

Final SQL

*/