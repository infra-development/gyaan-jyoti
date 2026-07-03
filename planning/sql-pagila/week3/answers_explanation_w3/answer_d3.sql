-- =====================================================
-- Week 3 - Day 3
-- Handling NULL Values
-- Answers: Q21 - Q30
-- =====================================================

-- -----------------------------------------------------
-- Q21
-- Replace NULL phone numbers with
-- "Not Available".
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(phone, 'Not Available') AS phone
FROM customer
INNER JOIN address
    USING (address_id)
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q22
-- Replace NULL emails with "Unknown".
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(email, 'Unknown') AS email
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q23
-- Use COALESCE to display a default value.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(email, 'Email Not Available') AS email
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q24
-- Use NULLIF to avoid division by zero.
-- -----------------------------------------------------

SELECT
    payment_id,
    amount,
    amount / NULLIF(amount, 0) AS safe_division
FROM payment
ORDER BY
    payment_id;


-- -----------------------------------------------------
-- Q25
-- Compare COALESCE and CASE.
-- -----------------------------------------------------

-- Using COALESCE

SELECT
    customer_id,
    COALESCE(email, 'Unknown') AS email
FROM customer;

--------------------------------------------------------

-- Using CASE

SELECT
    customer_id,
    CASE
        WHEN email IS NULL THEN 'Unknown'
        ELSE email
    END AS email
FROM customer;


-- -----------------------------------------------------
-- Q26
-- Find customers with missing information.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    active
FROM customer
WHERE
    email IS NULL
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q27
-- Display alternative values when NULL exists.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    COALESCE(email, 'No Email Provided') AS email
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q28
-- Explain when NULLIF should be used.
-- -----------------------------------------------------

/*

NULLIF(value1, value2)

Returns:

NULL

when

value1 = value2

Otherwise

returns value1.

Common Uses

• Prevent division by zero

• Convert unwanted values into NULL

• Simplify calculations

Example

amount / NULLIF(quantity, 0)

*/


-- -----------------------------------------------------
-- Q29
-- Explain when COALESCE should be used.
-- -----------------------------------------------------

/*

COALESCE()

returns the first
non-NULL value.

Common Uses

• Replace NULL values

• Display default values

• Improve business reports

Example

COALESCE(email, 'Unknown')

*/


-- -----------------------------------------------------
-- Q30
-- Rewrite a CASE expression
-- using COALESCE.
-- -----------------------------------------------------

-- Original CASE

SELECT
    customer_id,
    CASE
        WHEN email IS NULL
            THEN 'Unknown'
        ELSE email
    END AS email
FROM customer;

--------------------------------------------------------

-- Equivalent COALESCE

SELECT
    customer_id,
    COALESCE(email, 'Unknown') AS email
FROM customer;