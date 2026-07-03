-- =====================================================
-- Week 3 - Day 5
-- String Functions
-- Answers: Q41 - Q50
-- =====================================================

-- -----------------------------------------------------
-- Q41
-- Display customer names in uppercase.
-- -----------------------------------------------------

SELECT
    customer_id,
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q42
-- Display customer names in lowercase.
-- -----------------------------------------------------

SELECT
    customer_id,
    LOWER(first_name) AS first_name,
    LOWER(last_name) AS last_name
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q43
-- Concatenate first and last names.
-- -----------------------------------------------------

SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q44
-- Remove leading and trailing spaces.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    TRIM(first_name) AS trimmed_first_name,
    last_name,
    TRIM(last_name) AS trimmed_last_name
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q45
-- Replace spaces with underscores.
-- -----------------------------------------------------

SELECT
    customer_id,
    REPLACE(
        CONCAT(first_name, ' ', last_name),
        ' ',
        '_'
    ) AS customer_name
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q46
-- Display the first five characters
-- of each film title.
-- -----------------------------------------------------

SELECT
    film_id,
    title,
    SUBSTRING(title FROM 1 FOR 5) AS short_title
FROM film
ORDER BY
    film_id;


-- -----------------------------------------------------
-- Q47
-- Display the length of every film title.
-- -----------------------------------------------------

SELECT
    film_id,
    title,
    LENGTH(title) AS title_length
FROM film
ORDER BY
    title_length DESC,
    title;


-- -----------------------------------------------------
-- Q48
-- Build formatted customer names.
-- -----------------------------------------------------

SELECT
    customer_id,
    CONCAT(
        UPPER(LEFT(first_name, 1)),
        LOWER(SUBSTRING(first_name FROM 2)),
        ' ',
        UPPER(LEFT(last_name, 1)),
        LOWER(SUBSTRING(last_name FROM 2))
    ) AS formatted_name
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q49
-- Combine multiple string functions.
-- -----------------------------------------------------

SELECT
    customer_id,
    UPPER(
        TRIM(
            CONCAT(first_name, ' ', last_name)
        )
    ) AS formatted_customer_name
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q50
-- Explain which string function
-- best solves each question.
-- -----------------------------------------------------

/*

UPPER()

Convert text to uppercase.

---------------------------------

LOWER()

Convert text to lowercase.

---------------------------------

CONCAT()

Combine multiple strings.

---------------------------------

TRIM()

Remove leading and trailing spaces.

---------------------------------

REPLACE()

Replace one string with another.

---------------------------------

SUBSTRING()

Extract part of a string.

---------------------------------

LENGTH()

Count the number of characters.

---------------------------------

General Thinking

Business Requirement

↓

Choose Appropriate
String Function

↓

Transform Text

↓

Readable Report

*/