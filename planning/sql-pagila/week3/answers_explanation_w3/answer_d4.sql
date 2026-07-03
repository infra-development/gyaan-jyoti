-- =====================================================
-- Week 3 - Day 4
-- CAST and Data Conversion
-- Answers: Q31 - Q40
-- =====================================================

-- -----------------------------------------------------
-- Q31
-- Convert payment amount to INTEGER.
-- -----------------------------------------------------

SELECT
    payment_id,
    amount,
    CAST(amount AS INTEGER) AS amount_integer
FROM payment
ORDER BY
    payment_id;


-- -----------------------------------------------------
-- Q32
-- Convert rental date to DATE.
-- -----------------------------------------------------

SELECT
    rental_id,
    rental_date,
    CAST(rental_date AS DATE) AS rental_only_date
FROM rental
ORDER BY
    rental_id;


-- -----------------------------------------------------
-- Q33
-- Convert customer ID to TEXT.
-- -----------------------------------------------------

SELECT
    customer_id,
    CAST(customer_id AS TEXT) AS customer_code
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q34
-- Display formatted numeric values.
-- -----------------------------------------------------

SELECT
    payment_id,
    amount,
    TO_CHAR(amount, 'FM9990.00') AS formatted_amount
FROM payment
ORDER BY
    payment_id;


-- -----------------------------------------------------
-- Q35
-- Convert timestamps to readable dates.
-- -----------------------------------------------------

SELECT
    rental_id,
    rental_date,
    TO_CHAR(rental_date, 'DD-Mon-YYYY') AS formatted_date
FROM rental
ORDER BY
    rental_id;


-- -----------------------------------------------------
-- Q36
-- Compare explicit and implicit casting.
-- -----------------------------------------------------

-- Explicit Casting

SELECT
    CAST(customer_id AS TEXT) AS customer_text
FROM customer;

--------------------------------------------------------

-- Implicit Casting

SELECT
    customer_id || '' AS customer_text
FROM customer;

--------------------------------------------------------

/*

Explicit Casting

• Uses CAST()
• Clear and readable
• Recommended

Implicit Casting

• PostgreSQL converts automatically
• Less obvious
• Use only when appropriate

*/


-- -----------------------------------------------------
-- Q37
-- Convert numbers into formatted strings.
-- -----------------------------------------------------

SELECT
    payment_id,
    amount,
    TO_CHAR(amount, 'FM9990.00') AS formatted_amount
FROM payment
ORDER BY
    payment_id;


-- -----------------------------------------------------
-- Q38
-- Explain why CAST is important.
-- -----------------------------------------------------

/*

CAST is used to:

• Convert one datatype into another.

• Prepare data for calculations.

• Match different datatypes.

• Format reports.

Examples

Timestamp

↓

Date

---------------------

Integer

↓

Text

---------------------

Numeric

↓

Formatted String

*/


-- -----------------------------------------------------
-- Q39
-- Use CAST inside a report.
-- -----------------------------------------------------

SELECT
    customer_id,
    CAST(customer_id AS TEXT) AS customer_code,
    first_name,
    last_name,
    active
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q40
-- Explain every conversion
-- before writing SQL.
-- -----------------------------------------------------

/*

Business Requirement

↓

Identify Current Datatype

↓

Identify Required Datatype

↓

Choose Conversion

↓

Apply CAST()

Example

Timestamp

↓

Date

↓

CAST(rental_date AS DATE)

-------------------------

Integer

↓

Text

↓

CAST(customer_id AS TEXT)

-------------------------

Numeric

↓

Formatted String

↓

TO_CHAR(amount, ...)

*/