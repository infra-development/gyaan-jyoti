# Day 7 - Revenue Analysis, LEFT JOINs, and Subqueries

## Learning Objectives

By the end of this lesson, you should be able to:

* Understand revenue analysis.
* Work with financial measures.
* Use SUM effectively.
* Analyze customer spending.
* Understand LEFT JOIN.
* Find missing data.
* Understand subqueries.
* Compare values against aggregated results.
* Build business-oriented analytical queries.
* Understand the difference between operational and analytical reporting.

---

# From Operations to Business Intelligence

Up to now we have answered questions such as:

* How many rentals exist?
* Which films are rented most often?
* Which customers are most active?

These are operational questions.

Today we move into:

```text
Money
```

Questions such as:

* How much revenue was generated?
* Who are the best customers?
* Which store generates the most revenue?
* Which customers spend above average?

These are analytical questions.

---

# Understanding Revenue

Revenue is money earned by the business.

In Pagila:

```text
payment
```

stores payment transactions.

Each row represents a financial event.

Example:

| payment_id | customer_id | amount |
| ---------- | ----------- | ------ |
| 1          | 10          | 2.99   |
| 2          | 15          | 4.99   |

---

# Financial Measures

Measures that can be aggregated.

Examples:

```text
amount

revenue

sales

cost

profit
```

In Pagila:

```text
amount
```

is the primary financial measure.

---

# SUM

The most important financial aggregation.

Example:

```text
2.99

4.99

3.99
```

SUM returns:

```text
11.97
```

---

# Why SUM Matters

Business users constantly ask:

* Total revenue
* Revenue by customer
* Revenue by store
* Revenue by month
* Revenue by category

Most of these begin with:

```text
SUM(amount)
```

---

# Revenue by Dimension

Earlier we learned:

```text
Dimension + Measure
```

Examples:

Dimension:

```text
Customer
```

Measure:

```text
Revenue
```

Result:

```text
Customer Revenue
```

---

Dimension:

```text
Store
```

Measure:

```text
Revenue
```

Result:

```text
Store Revenue
```

---

This idea drives most reporting systems.

---

# Revenue by Day

Question:

> How much money did we make each day?

Dimensions:

```text
Date
```

Measure:

```text
Revenue
```

Process:

```text
GROUP BY date

SUM(amount)
```

---

# Revenue by Month

Question:

> How much money did we make each month?

Dimensions:

```text
Year

Month
```

Measure:

```text
Revenue
```

This is one of the most common executive reports.

---

# Understanding Customer Value

Question:

> Who are our best customers?

Business meaning:

```text
Who spends the most money?
```

---

Process:

```text
Customer

↓

Payments

↓

SUM(amount)
```

Then:

```text
ORDER BY revenue DESC
```

---

# Top Customers

A common report:

| Customer | Revenue |
| -------- | ------- |
| Mary     | 210     |
| John     | 195     |
| Sarah    | 188     |

This report helps businesses:

* Reward customers
* Target marketing campaigns
* Analyze customer value

---

# Bottom Customers

Question:

> Which customers spend the least?

Same logic:

```text
SUM

GROUP BY

ORDER BY ASC
```

Different business purpose.

---

# Understanding LEFT JOIN

Until now we mostly used:

```text
INNER JOIN
```

---

# INNER JOIN Behavior

Only matching rows are returned.

Example:

Customer:

| customer_id |
| ----------- |
| 1           |
| 2           |
| 3           |

Payment:

| customer_id |
| ----------- |
| 1           |
| 2           |

Result:

| customer_id |
| ----------- |
| 1           |
| 2           |

Customer 3 disappears.

---

# Why Rows Disappear

INNER JOIN requires matches.

No match:

```text
Row removed
```

This is often desirable.

Sometimes it is not.

---

# LEFT JOIN

LEFT JOIN keeps all rows from the left table.

Example:

Customer:

| customer_id |
| ----------- |
| 1           |
| 2           |
| 3           |

Payment:

| customer_id |
| ----------- |
| 1           |
| 2           |

LEFT JOIN result:

| customer_id | payment |
| ----------- | ------- |
| 1           | Yes     |
| 2           | Yes     |
| 3           | NULL    |

Customer 3 remains.

---

# Why LEFT JOIN Matters

Question:

> Which customers never made a payment?

With INNER JOIN:

```text
Impossible
```

Missing rows disappear.

---

With LEFT JOIN:

```text
Customer remains

Payment columns become NULL
```

Now we can find missing activity.

---

# Finding Missing Data

One of the most common SQL tasks.

Examples:

```text
Customers without payments

Customers without rentals

Products without sales

Employees without managers
```

These all use similar patterns.

---

# Missing Data Pattern

Step 1

LEFT JOIN

Step 2

Look for NULL values

Example:

```text
LEFT JOIN

WHERE payment_id IS NULL
```

This pattern is extremely important.

---

# What Is a Subquery?

A query inside another query.

Example:

```text
Query

Inside

Query
```

---

# Why Subqueries Exist

Sometimes a query needs information produced by another query.

Example:

Question:

> Which payments are above average?

First we need:

```text
Average payment
```

Then:

```text
Compare each payment
```

A subquery allows this.

---

# Conceptual Example

Step 1

Calculate average:

```text
AVG(amount)
```

Suppose:

```text
4.25
```

---

Step 2

Find payments above:

```text
4.25
```

Result:

Only larger payments remain.

---

# Thinking About Subqueries

Imagine:

```text
Outer Query
```

asks:

> Which rows qualify?

---

```text
Inner Query
```

answers:

> Here is the value to compare against.

The outer query uses the inner query's result.

---

# Types of Questions Solved by Subqueries

Examples:

```text
Above average payments

Above average salary

Highest revenue customers

Most expensive products

Customers spending more than average
```

Subqueries are often the first solution people learn.

---

# Customer Spending Analysis

Question:

> Which customers spent more than 100?

Process:

```text
Customer

↓

Payment

↓

SUM(amount)

↓

HAVING
```

This combines multiple concepts:

* JOIN
* GROUP BY
* SUM
* HAVING

---

# Operational Reporting vs Analytical Reporting

Operational Question:

```text
Show today's rentals
```

Focus:

```text
Individual events
```

---

Analytical Question:

```text
Show revenue by month
```

Focus:

```text
Aggregated trends
```

---

Most business intelligence systems focus on:

```text
Aggregations

Trends

Metrics
```

rather than individual rows.

---

# Common Revenue Metrics

Examples:

```text
Total Revenue

Average Revenue

Revenue per Customer

Revenue per Store

Revenue per Month

Revenue Growth
```

These form the basis of many executive dashboards.

---

# Common Mistakes

## Using INNER JOIN Instead of LEFT JOIN

Question:

> Customers with no payments?

Wrong:

```text
INNER JOIN
```

Missing customers disappear.

---

Correct:

```text
LEFT JOIN
```

Then:

```text
WHERE payment_id IS NULL
```

---

## Confusing WHERE and HAVING

Question:

> Customers spending more than 100

Wrong:

```text
WHERE SUM(amount) > 100
```

---

Correct:

```text
HAVING SUM(amount) > 100
```

---

## Ignoring Business Meaning

Question:

> Top customers

Wrong thinking:

```text
Most rentals
```

Question actually asks:

```text
Most revenue
```

Understand the metric being measured.

---

# Business Questions Solved Today

Using today's concepts you can answer:

* Total revenue?
* Average payment?
* Maximum payment?
* Minimum payment?
* Revenue by day?
* Revenue by month?
* Revenue by store?
* Top customers?
* Bottom customers?
* Customers with no payments?
* Payments above average?
* Customers spending more than a threshold?

These are real executive and management reports.

---

# Week 1 Review

You now understand:

## Database Fundamentals

* Tables
* Rows
* Columns
* Metadata
* Keys

---

## Query Fundamentals

* SELECT
* WHERE
* ORDER BY
* LIKE

---

## Aggregations

* COUNT
* SUM
* AVG
* MIN
* MAX

---

## Grouping

* GROUP BY
* HAVING

---

## Relationships

* One-to-Many
* Many-to-Many
* Bridge Tables

---

## Joins

* INNER JOIN
* LEFT JOIN

---

## Analytics

* Revenue Analysis
* Inventory Analysis
* Customer Analysis
* Activity Analysis

---

## Advanced Foundations

* NULL
* Subqueries
* Missing Data Detection

---

# Summary

Today you learned:

* Revenue Analysis
* Financial Measures
* SUM
* Customer Value Analysis
* LEFT JOIN
* Missing Data Detection
* Subqueries
* Above-Average Analysis
* Operational vs Analytical Reporting

With Week 1 complete, you have moved beyond basic SQL syntax and begun using SQL as a tool for understanding and analyzing a business. This foundation will make Week 2 (joins, multi-table reporting, and more advanced query patterns) much easier to understand.
