-- =====================================================
-- Week 3 - Day 6
-- Date & Time Functions
-- Answers: Q51 - Q60
-- =====================================================

-- -----------------------------------------------------
-- Q51
-- Display today's date.
-- -----------------------------------------------------

SELECT
    CURRENT_DATE AS today;


-- -----------------------------------------------------
-- Q52
-- Display the current timestamp.
-- -----------------------------------------------------

SELECT
    CURRENT_TIMESTAMP AS current_timestamp;


-- -----------------------------------------------------
-- Q53
-- Calculate customer rental age.
-- -----------------------------------------------------

SELECT
    rental_id,
    rental_date,
    AGE(CURRENT_DATE, CAST(rental_date AS DATE)) AS rental_age
FROM rental
ORDER BY
    rental_date;


-- -----------------------------------------------------
-- Q54
-- Extract the rental year.
-- -----------------------------------------------------

SELECT
    rental_id,
    rental_date,
    EXTRACT(YEAR FROM rental_date) AS rental_year
FROM rental
ORDER BY
    rental_date;


-- -----------------------------------------------------
-- Q55
-- Extract the rental month.
-- -----------------------------------------------------

SELECT
    rental_id,
    rental_date,
    EXTRACT(MONTH FROM rental_date) AS rental_month
FROM rental
ORDER BY
    rental_date;


-- -----------------------------------------------------
-- Q56
-- Group rentals by month.
-- -----------------------------------------------------

SELECT
    EXTRACT(MONTH FROM rental_date) AS rental_month,
    COUNT(*) AS total_rentals
FROM rental
GROUP BY
    EXTRACT(MONTH FROM rental_date)
ORDER BY
    rental_month;


-- -----------------------------------------------------
-- Q57
-- Format rental dates for business reports.
-- -----------------------------------------------------

SELECT
    rental_id,
    rental_date,
    TO_CHAR(rental_date, 'DD-Mon-YYYY') AS formatted_date
FROM rental
ORDER BY
    rental_date;


-- -----------------------------------------------------
-- Q58
-- Display customer membership duration.
-- -----------------------------------------------------

SELECT
    customer_id,
    first_name,
    last_name,
    create_date,
    AGE(CURRENT_DATE, create_date) AS membership_duration
FROM customer
ORDER BY
    customer_id;


-- -----------------------------------------------------
-- Q59
-- Build a monthly rental report.
-- -----------------------------------------------------

SELECT
    TO_CHAR(rental_date, 'Mon YYYY') AS rental_month,
    COUNT(*) AS total_rentals
FROM rental
GROUP BY
    TO_CHAR(rental_date, 'Mon YYYY'),
    DATE_TRUNC('month', rental_date)
ORDER BY
    DATE_TRUNC('month', rental_date);


-- -----------------------------------------------------
-- Q60
-- Explain the business value
-- of each date function.
-- -----------------------------------------------------

/*

CURRENT_DATE

Returns today's date.

Business Use

• Daily reports
• Business dashboards

-----------------------------------------

CURRENT_TIMESTAMP

Returns the current date and time.

Business Use

• Audit logs
• System monitoring

-----------------------------------------

AGE()

Calculates the difference
between two dates.

Business Use

• Customer membership duration
• Rental age
• Employee experience

-----------------------------------------

EXTRACT()

Extracts part of a date.

Business Use

• Monthly reports
• Yearly summaries
• Quarterly analysis

-----------------------------------------

DATE_TRUNC()

Rounds a timestamp
to a specified precision.

Business Use

• Monthly grouping
• Weekly analysis
• Daily summaries

-----------------------------------------

TO_CHAR()

Formats dates
for business reports.

Business Use

• Executive dashboards
• Printable reports
• User-friendly output

-----------------------------------------

General Thinking

Business Question

        ↓

Date Requirement

        ↓

Choose Appropriate
Date Function

        ↓

Business Report

*/