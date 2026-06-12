# Day 2 - Filtering, Sorting and Aggregation

## Learning Objectives

By the end of this lesson, you should be able to:

* Retrieve data from tables.
* Filter rows using conditions.
* Sort results.
* Search text using patterns.
* Count records.
* Group records.
* Understand the difference between WHERE and HAVING.
* Understand how SQL processes a query.

---

# From Database Structure to Data Analysis

On Day 1 we learned:

* What tables exist
* How tables are related
* What primary keys and foreign keys are

Today we begin answering business questions.

Examples:

* How many customers exist?
* How many active customers exist?
* Which customers belong to each store?
* What are the most common customer names?

These questions introduce the foundation of analytical SQL.

---

# The SELECT Statement

The most basic SQL statement is:

```sql
SELECT *
FROM customer;
```

Meaning:

> Return all columns from the customer table.

---

## Selecting Specific Columns

Instead of all columns:

```sql
SELECT
    customer_id,
    first_name,
    last_name
FROM customer;
```

This is usually preferred.

Reasons:

* Easier to read
* Faster
* Returns only needed information

---

# Filtering Data with WHERE

Often we do not want all rows.

Example:

```sql
SELECT *
FROM customer
WHERE active = 1;
```

Meaning:

> Return only active customers.

---

## Comparison Operators

### Equal

```sql
WHERE active = 1
```

---

### Not Equal

```sql
WHERE active <> 1
```

or

```sql
WHERE active != 1
```

---

### Greater Than

```sql
WHERE customer_id > 100
```

---

### Less Than

```sql
WHERE customer_id < 100
```

---

### Greater Than or Equal

```sql
WHERE customer_id >= 100
```

---

### Less Than or Equal

```sql
WHERE customer_id <= 100
```

---

# Combining Conditions

## AND

Both conditions must be true.

```sql
WHERE active = 1
AND store_id = 1
```

---

## OR

At least one condition must be true.

```sql
WHERE store_id = 1
OR store_id = 2
```

---

## Parentheses

Use parentheses to control evaluation.

```sql
WHERE
(
    active = 1
    AND store_id = 1
)
OR
(
    active = 1
    AND store_id = 2
)
```

---

# Sorting Results

Without ORDER BY:

```sql
SELECT *
FROM customer;
```

The order is not guaranteed.

---

## Ascending Order

```sql
ORDER BY last_name ASC
```

ASC means ascending.

Smallest to largest.

A to Z.

---

## Descending Order

```sql
ORDER BY last_name DESC
```

DESC means descending.

Largest to smallest.

Z to A.

---

## Multiple Sort Columns

```sql
ORDER BY
    last_name,
    first_name
```

SQL sorts by:

1. last_name
2. first_name when last names are equal

---

# Pattern Matching with LIKE

Suppose we want customers whose names begin with A.

```sql
WHERE first_name LIKE 'A%'
```

---

## Wildcards

### %

Represents zero or more characters.

Examples:

```sql
'A%'
```

Starts with A.

```sql
'%A'
```

Ends with A.

```sql
'%A%'
```

Contains A.

---

## Examples

Starts with A:

```sql
LIKE 'A%'
```

Ends with SON:

```sql
LIKE '%SON'
```

Contains JOHN:

```sql
LIKE '%JOHN%'
```

---

# Case Sensitivity

Sometimes:

```sql
LIKE
```

is case sensitive.

To avoid issues:

```sql
UPPER(last_name)
```

or

```sql
LOWER(last_name)
```

can be used.

Example:

```sql
WHERE UPPER(last_name) LIKE '%SON'
```

---

# Aggregate Functions

Aggregate functions operate on multiple rows.

Instead of returning individual rows, they return summary information.

---

## COUNT

Counts rows.

```sql
SELECT COUNT(*)
FROM customer;
```

Result:

```text
599
```

Meaning:

599 customer rows exist.

---

## COUNT(column)

Counts non-null values.

```sql
COUNT(email)
```

Null values are ignored.

---

# GROUP BY

GROUP BY creates groups of rows.

Consider:

| active |
| ------ |
| 1      |
| 1      |
| 1      |
| 0      |
| 0      |

---

Query:

```sql
SELECT
    active,
    COUNT(*)
FROM customer
GROUP BY active;
```

Result:

| active | count |
| ------ | ----- |
| 1      | 3     |
| 0      | 2     |

---

# Why GROUP BY Is Powerful

Without GROUP BY:

```sql
SELECT COUNT(*)
FROM customer;
```

One result.

---

With GROUP BY:

```sql
SELECT
    store_id,
    COUNT(*)
FROM customer
GROUP BY store_id;
```

Multiple summaries.

One per store.

---

# Logical Query Processing Order

SQL is written:

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
```

But executed logically as:

```text
FROM

WHERE

GROUP BY

HAVING

SELECT

ORDER BY
```

Understanding this prevents many mistakes.

---

# HAVING

HAVING filters groups.

WHERE filters rows.

This distinction is critical.

---

## WHERE Example

```sql
SELECT *
FROM customer
WHERE active = 1;
```

Rows are filtered before grouping.

---

## HAVING Example

```sql
SELECT
    first_name,
    COUNT(*)
FROM customer
GROUP BY first_name
HAVING COUNT(*) > 1;
```

Groups are filtered after grouping.

---

# WHERE vs HAVING

Wrong:

```sql
WHERE COUNT(*) > 1
```

COUNT does not exist yet.

---

Correct:

```sql
HAVING COUNT(*) > 1
```

Because grouping has already occurred.

---

# Finding Duplicate Values

Suppose we want duplicate first names.

Concept:

1. Group by first_name
2. Count each group
3. Keep groups larger than one

This pattern appears frequently in real systems.

---

# Top-N Analysis

Business users often ask:

* Top customers
* Top products
* Top categories

General approach:

1. Aggregate
2. Sort
3. Limit results

Example:

```sql
GROUP BY first_name

ORDER BY COUNT(*) DESC

LIMIT 10
```

This pattern appears constantly in analytics.

---

# Common Mistakes

## Forgetting GROUP BY

Wrong:

```sql
SELECT
    first_name,
    COUNT(*)
FROM customer;
```

SQL does not know how to combine detailed rows with aggregate results.

---

## Using WHERE Instead of HAVING

Wrong:

```sql
WHERE COUNT(*) > 1
```

Correct:

```sql
HAVING COUNT(*) > 1
```

---

## Assuming Result Order

Wrong:

```sql
SELECT *
FROM customer;
```

Never assume row order.

Use:

```sql
ORDER BY
```

explicitly.

---

# Business Questions Solved Today

Using today's concepts, you can answer:

* How many customers exist?
* How many active customers exist?
* How many customers per store?
* Which names are duplicated?
* Which names are most common?
* Which customers match a pattern?

These are foundational analytical queries.

---

# Summary

Today you learned:

* SELECT
* WHERE
* AND
* OR
* ORDER BY
* LIKE
* Wildcards
* COUNT
* GROUP BY
* HAVING
* Query processing order
* Top-N analysis
* Duplicate detection

These concepts form the core of everyday SQL work and are used in almost every analytical query.
