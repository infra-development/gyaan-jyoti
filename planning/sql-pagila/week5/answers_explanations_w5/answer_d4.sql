-- =====================================================
-- Week 5 - Day 4
-- Recursive CTEs
-- Answers: Q31 - Q40
-- =====================================================

-- -----------------------------------------------------
-- Q31
-- Generate numbers from 1 to 10
-- using a Recursive CTE.
-- -----------------------------------------------------

WITH RECURSIVE numbers AS
(
    SELECT
        1 AS number

    UNION ALL

    SELECT
        number + 1
    FROM numbers
    WHERE
        number < 10
)

SELECT
    number
FROM numbers;


-- -----------------------------------------------------
-- Q32
-- Generate numbers from 1 to 100.
-- -----------------------------------------------------

WITH RECURSIVE numbers AS
(
    SELECT
        1 AS number

    UNION ALL

    SELECT
        number + 1
    FROM numbers
    WHERE
        number < 100
)

SELECT
    number
FROM numbers;


-- -----------------------------------------------------
-- Q33
-- Generate a calendar containing
-- the next 30 days.
-- -----------------------------------------------------

WITH RECURSIVE calendar AS
(
    SELECT
        CURRENT_DATE AS calendar_date

    UNION ALL

    SELECT
        calendar_date + INTERVAL '1 day'
    FROM calendar
    WHERE
        calendar_date < CURRENT_DATE + INTERVAL '29 days'
)

SELECT
    calendar_date::DATE
FROM calendar;


-- -----------------------------------------------------
-- Q34
-- Generate the first day of every
-- month in the current year.
-- -----------------------------------------------------

WITH RECURSIVE months AS
(
    SELECT
        DATE_TRUNC('year', CURRENT_DATE)::DATE AS month_start

    UNION ALL

    SELECT
        (month_start + INTERVAL '1 month')::DATE
    FROM months
    WHERE
        month_start <
        (
            DATE_TRUNC('year', CURRENT_DATE)
            + INTERVAL '11 months'
        )::DATE
)

SELECT
    month_start
FROM months;


-- -----------------------------------------------------
-- Q35
-- Display numbers from 10 down to 1.
-- -----------------------------------------------------

WITH RECURSIVE countdown AS
(
    SELECT
        10 AS number

    UNION ALL

    SELECT
        number - 1
    FROM countdown
    WHERE
        number > 1
)

SELECT
    number
FROM countdown;


-- -----------------------------------------------------
-- Q36
-- Explain the structure
-- of a Recursive CTE.
-- -----------------------------------------------------

/*

Recursive CTE

Consists of:

1. Anchor Member

↓

Starting Point

----------------------

2. Recursive Member

↓

Generates New Rows

----------------------

3. Stopping Condition

↓

Ends Recursion

*/


-- -----------------------------------------------------
-- Q37
-- Explain the purpose
-- of the Anchor Member.
-- -----------------------------------------------------

/*

Anchor Member

• Produces the first row(s).

• Starts recursion.

Without the Anchor Member,

the Recursive CTE
has no starting point.

*/


-- -----------------------------------------------------
-- Q38
-- Explain the purpose
-- of the Recursive Member.
-- -----------------------------------------------------

/*

Recursive Member

• Uses previous rows.

• Generates new rows.

• Repeats until the
stopping condition
becomes false.

*/


-- -----------------------------------------------------
-- Q39
-- Identify business situations
-- where Recursive CTEs are useful.
-- -----------------------------------------------------

/*

Examples

• Calendar Generation

• Date Series

• Number Generation

• Employee Hierarchies

• Organization Charts

• Folder Structures

• Bill of Materials

• Family Trees

*/


-- -----------------------------------------------------
-- Q40
-- Draw the recursive
-- thinking process.
-- -----------------------------------------------------

/*

Business Question

        ↓

Need Repetition?

        ↓

Yes

        ↓

Anchor Member

        ↓

Recursive Member

        ↓

Stopping Condition

        ↓

Final Result

*/