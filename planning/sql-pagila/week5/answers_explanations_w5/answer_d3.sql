-- =====================================================
-- Week 5 - Day 3
-- Common Table Expressions (CTEs)
-- Answers: Q21 - Q30
-- =====================================================

-- -----------------------------------------------------
-- Q21
-- Create a CTE that calculates customer
-- revenue and display all customers.
-- -----------------------------------------------------

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
    c.customer_id,
    c.first_name,
    c.last_name,
    cr.total_revenue
FROM customer AS c
INNER JOIN customer_revenue AS cr
    ON c.customer_id = cr.customer_id
ORDER BY
    cr.total_revenue DESC;


-- -----------------------------------------------------
-- Q22
-- Create a CTE that calculates
-- store revenue.
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
    total_revenue
FROM store_revenue
ORDER BY
    store_id;


-- -----------------------------------------------------
-- Q23
-- Create a CTE that calculates
-- film rental counts.
-- -----------------------------------------------------

WITH film_rentals AS
(
    SELECT
        f.film_id,
        f.title,
        COUNT(*) AS rental_count
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
    rental_count
FROM film_rentals
ORDER BY
    rental_count DESC,
    title;


-- -----------------------------------------------------
-- Q24
-- Using multiple CTEs, display
-- customer revenue together with
-- store revenue.
-- -----------------------------------------------------

WITH customer_revenue AS
(
    SELECT
        customer_id,
        SUM(amount) AS customer_revenue
    FROM payment
    GROUP BY
        customer_id
),

store_revenue AS
(
    SELECT
        c.store_id,
        SUM(p.amount) AS store_revenue
    FROM customer AS c
    INNER JOIN payment AS p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.store_id
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.store_id,
    cr.customer_revenue,
    sr.store_revenue
FROM customer AS c
INNER JOIN customer_revenue AS cr
    ON c.customer_id = cr.customer_id
INNER JOIN store_revenue AS sr
    ON c.store_id = sr.store_id
ORDER BY
    c.store_id,
    cr.customer_revenue DESC;


-- -----------------------------------------------------
-- Q25
-- Display customers whose revenue
-- is greater than the overall
-- average revenue using a CTE.
-- -----------------------------------------------------

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
WHERE
    total_revenue >
    (
        SELECT
            AVG(total_revenue)
        FROM customer_revenue
    )
ORDER BY
    total_revenue DESC;


-- -----------------------------------------------------
-- Q26
-- Display the highest revenue
-- customer in every store using CTEs.
-- -----------------------------------------------------

WITH customer_revenue AS
(
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
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
),

ranked_customers AS
(
    SELECT
        *,
        RANK() OVER
        (
            PARTITION BY store_id
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM customer_revenue
)

SELECT
    customer_id,
    first_name,
    last_name,
    store_id,
    total_revenue
FROM ranked_customers
WHERE
    revenue_rank = 1
ORDER BY
    store_id;


-- -----------------------------------------------------
-- Q27
-- Explain why CTEs improve readability.
-- -----------------------------------------------------

/*

CTEs

• Divide large queries
  into logical sections.

• Assign meaningful names
  to intermediate results.

• Reduce nesting.

• Improve readability.

• Improve debugging.

• Improve maintainability.

*/


-- -----------------------------------------------------
-- Q28
-- Compare Derived Tables and CTEs.
-- -----------------------------------------------------

/*

Derived Table

• Exists only inside
  the FROM clause.

• Good for small,
  temporary calculations.

-------------------------------------

CTE

• Defined using WITH.

• Can be referenced
  multiple times.

• Easier to read.

• Better for large reports.

*/


-- -----------------------------------------------------
-- Q29
-- Identify situations where
-- multiple CTEs improve SQL design.
-- -----------------------------------------------------

/*

Examples

• Executive Dashboards

• Customer Revenue Reports

• Sales Reports

• Store Performance

• Monthly Analytics

• Business Intelligence Reports

Whenever multiple
intermediate calculations
are required,
multiple CTEs improve
clarity.

*/


-- -----------------------------------------------------
-- Q30
-- Draw the thinking process
-- before using CTEs.
-- -----------------------------------------------------

/*

Business Question

        ↓

Large Problem?

        ↓

Yes

        ↓

Break Into Steps

        ↓

Create One CTE
Per Step

        ↓

Combine CTEs

        ↓

Final Report

*/