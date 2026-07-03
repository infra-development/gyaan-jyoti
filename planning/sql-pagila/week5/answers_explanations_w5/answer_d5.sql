-- =====================================================
-- Week 5 - Day 5
-- Set Operations
-- Answers: Q41 - Q50
-- =====================================================

-- -----------------------------------------------------
-- Q41
-- Display all customer IDs appearing in
-- either the payment table or the rental
-- table using UNION.
-- -----------------------------------------------------

SELECT
    customer_id
FROM payment

UNION

SELECT
    customer_id
FROM rental

ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q42
-- Repeat the previous question
-- using UNION ALL.
-- -----------------------------------------------------

SELECT
    customer_id
FROM payment

UNION ALL

SELECT
    customer_id
FROM rental

ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q43
-- Display customer IDs that appear
-- in both payment and rental tables
-- using INTERSECT.
-- -----------------------------------------------------

SELECT
    customer_id
FROM payment

INTERSECT

SELECT
    customer_id
FROM rental

ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q44
-- Display customers who rented films
-- but never made a payment
-- using EXCEPT.
-- -----------------------------------------------------

SELECT
    customer_id
FROM rental

EXCEPT

SELECT
    customer_id
FROM payment

ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q45
-- Display films that exist in inventory
-- but have never been rented.
-- -----------------------------------------------------

SELECT
    film_id
FROM inventory

EXCEPT

SELECT
    i.film_id
FROM inventory AS i
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id

ORDER BY
    film_id;


-- -----------------------------------------------------
-- Q46
-- Explain the difference between
-- UNION and UNION ALL.
-- -----------------------------------------------------

/*

UNION

• Combines two result sets.

• Removes duplicate rows.

• Produces unique results.

-------------------------------------

UNION ALL

• Combines two result sets.

• Keeps duplicate rows.

• Usually performs faster.

*/

-- -----------------------------------------------------
-- Q47
-- Explain the purpose
-- of INTERSECT.
-- -----------------------------------------------------

/*

INTERSECT

Returns only the rows
that appear in
both result sets.

Business Examples

• Customers appearing
  in two systems.

• Products sold
  in two stores.

• Employees working
  on multiple projects.

*/


-- -----------------------------------------------------
-- Q48
-- Explain the purpose
-- of EXCEPT.
-- -----------------------------------------------------

/*

EXCEPT

Returns rows
that exist in
the first query

but not

the second query.

Business Examples

• Customers without orders.

• Products never sold.

• Films never rented.

*/


-- -----------------------------------------------------
-- Q49
-- Identify business situations where
-- Set Operations simplify SQL.
-- -----------------------------------------------------

/*

Examples

• Compare customer lists.

• Compare inventory
  between stores.

• Merge reports
  from different systems.

• Identify missing records.

• Find common customers.

• Data reconciliation.

*/


-- -----------------------------------------------------
-- Q50
-- Draw the thinking process before
-- using Set Operations.
-- -----------------------------------------------------

/*

Business Question

        ↓

Multiple Datasets?

        ↓

Yes

        ↓

Need Everything?

↓

UNION

or

UNION ALL

------------------------

Need Common Rows?

↓

INTERSECT

------------------------

Need Missing Rows?

↓

EXCEPT

        ↓

Business Result

*/