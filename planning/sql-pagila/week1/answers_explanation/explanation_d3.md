# Day 3 - Working with Numeric Data and Aggregate Functions

## Learning Objectives

By the end of this lesson, you should be able to:

* Analyze numeric columns.
* Use aggregate functions effectively.
* Understand measures and dimensions.
* Find minimum and maximum values.
* Calculate averages.
* Perform Top-N analysis.
* Compare values within the same row.
* Search text data.
* Answer basic analytical business questions.

---

# Moving Beyond Simple Counts

On Day 2 we asked questions such as:

* How many customers exist?
* How many customers are active?

Today we start asking:

* What is the longest film?
* What is the shortest film?
* What is the average film length?
* Which films are the most expensive?

These questions require working with numeric data.

---

# Understanding the Film Table

The film table contains information about movies.

Important columns:

```text
film_id
title
length
rental_rate
rental_duration
replacement_cost
rating
```

Example:

| film_id | title   | length | rental_rate | replacement_cost |
| ------- | ------- | ------ | ----------- | ---------------- |
| 1       | Movie A | 120    | 2.99        | 19.99            |
| 2       | Movie B | 90     | 0.99        | 12.99            |

---

# Measures and Dimensions

This concept becomes extremely important later.

---

## Dimension

A dimension describes something.

Examples:

```text
title
rating
category
actor
customer
store
```

Dimensions answer:

> What?

---

## Measure

A measure is something that can be calculated.

Examples:

```text
length
rental_rate
replacement_cost
amount
```

Measures answer:

> How much?

---

## Examples

Dimension:

```text
Comedy
Action
Drama
```

Measure:

```text
Revenue
Film Length
Rental Rate
```

Most analytical queries involve:

```text
Dimension + Measure
```

Example:

```text
Category + Revenue
Store + Revenue
Customer + Revenue
```

---

# Aggregate Functions

Aggregate functions summarize multiple rows.

We already learned:

```sql
COUNT()
```

Today we add:

```sql
MIN()
MAX()
AVG()
```

---

# MIN

Returns the smallest value.

Example:

```sql
MIN(length)
```

Suppose film lengths are:

```text
80
95
110
150
```

Result:

```text
80
```

---

## Business Uses of MIN

Examples:

* Lowest salary
* Cheapest product
* Earliest order
* Shortest film

---

# MAX

Returns the largest value.

Example:

```sql
MAX(length)
```

Values:

```text
80
95
110
150
```

Result:

```text
150
```

---

## Business Uses of MAX

Examples:

* Highest revenue
* Longest film
* Largest payment
* Most expensive product

---

# AVG

Returns the arithmetic average.

Example:

```sql
AVG(length)
```

Values:

```text
100
200
300
```

Result:

```text
200
```

Calculation:

```text
(100 + 200 + 300) / 3
```

---

# Why Averages Matter

Business users often ask:

* Average order value
* Average customer spend
* Average film length
* Average rental amount

AVG is one of the most frequently used analytical functions.

---

# ROUND

AVG often returns many decimal places.

Example:

```text
124.857142857
```

To improve readability:

```sql
ROUND(
    AVG(length),
    2
)
```

Result:

```text
124.86
```

---

# Filtering Numeric Data

We can compare numeric values.

Example:

```sql
WHERE length > 120
```

Meaning:

> Return films longer than 120 minutes.

---

## Common Comparison Operators

Greater than:

```sql
>
```

Less than:

```sql
<
```

Greater than or equal:

```sql
>=
```

Less than or equal:

```sql
<=
```

Equal:

```sql
=
```

Not equal:

```sql
<>
```

---

# Comparing Columns

Conditions do not have to compare against constants.

Example:

```sql
replacement_cost > rental_rate
```

This compares values within the same row.

Example:

| rental_rate | replacement_cost |
| ----------- | ---------------- |
| 2.99        | 19.99            |

Result:

```text
TRUE
```

---

# Why Column Comparisons Matter

Real-world examples:

```text
salary > target_salary

actual_cost > budget

sales > forecast

inventory_on_hand < reorder_level
```

These comparisons appear constantly in business systems.

---

# Top-N Analysis

One of the most common business questions is:

> Show me the top performers.

Examples:

* Top customers
* Top products
* Top categories
* Most expensive films

---

## General Pattern

Step 1

Sort:

```sql
ORDER BY replacement_cost DESC
```

Step 2

Limit:

```sql
LIMIT 10
```

Result:

Top 10 records.

---

# Bottom-N Analysis

Same idea.

Sort ascending:

```sql
ORDER BY replacement_cost ASC
```

Then:

```sql
LIMIT 10
```

Returns smallest values.

---

# Understanding Sorting

Ascending:

```sql
ORDER BY length ASC
```

Result:

```text
80
90
100
120
```

---

Descending:

```sql
ORDER BY length DESC
```

Result:

```text
120
100
90
80
```

---

# Searching Text

The film table also contains text data.

Example:

```text
ACADEMY DINOSAUR
LOVE SUICIDES
ACTION HERO
```

---

# LIKE Revisited

Contains LOVE:

```sql
LIKE '%LOVE%'
```

Starts with LOVE:

```sql
LIKE 'LOVE%'
```

Ends with LOVE:

```sql
LIKE '%LOVE'
```

---

# Case Sensitivity

Often safer:

```sql
UPPER(title)
```

Example:

```sql
WHERE UPPER(title) LIKE '%LOVE%'
```

This avoids capitalization issues.

---

# Dimensions and Aggregation

Consider ratings:

```text
G
PG
PG-13
R
NC-17
```

These are dimensions.

We can aggregate by them.

Example:

```text
Rating     Film Count
--------------------
G              178
PG             194
R              205
```

This introduces an important idea:

> Grouping by dimensions and calculating measures.

This is the foundation of business analytics.

---

# Common Analytical Questions

Film Analysis:

* Longest film?
* Shortest film?
* Average film length?
* Films longer than average?

Financial Analysis:

* Highest revenue?
* Lowest revenue?
* Average revenue?

Product Analysis:

* Most expensive product?
* Cheapest product?

The same SQL patterns solve all of these.

---

# Common Mistakes

## Forgetting DESC

Wrong:

```sql
ORDER BY replacement_cost
LIMIT 10
```

Returns cheapest films.

---

Correct:

```sql
ORDER BY replacement_cost DESC
LIMIT 10
```

Returns most expensive films.

---

## Confusing COUNT and AVG

COUNT:

```sql
COUNT(*)
```

Counts rows.

AVG:

```sql
AVG(length)
```

Calculates average values.

Different purposes.

---

## Ignoring NULL Values

Aggregate functions generally ignore NULL values.

Example:

```sql
AVG(length)
```

Only uses rows where length exists.

---

# Analytical Thinking

When given a business question:

Ask:

1. What is the dimension?
2. What is the measure?
3. Do I need filtering?
4. Do I need sorting?
5. Do I need aggregation?

Example:

Question:

> Which films are the most expensive?

Dimension:

```text
Film
```

Measure:

```text
Replacement Cost
```

Operation:

```text
Sort descending
```

This thinking process becomes extremely valuable later.

---

# Business Questions Solved Today

Using today's concepts you can answer:

* What is the longest film?
* What is the shortest film?
* What is the average film length?
* Which films are longer than 120 minutes?
* Which films are most expensive?
* Which ratings contain the most films?
* Which rental durations are most common?

---

# Summary

Today you learned:

* Measures and dimensions
* MIN
* MAX
* AVG
* ROUND
* Numeric filtering
* Column comparisons
* Top-N analysis
* Bottom-N analysis
* Text searching
* Analytical thinking

These concepts form the foundation of reporting, analytics, dashboards, and business intelligence systems.
