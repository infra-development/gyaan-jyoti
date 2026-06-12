# Day 6 - Event Data, Transactions, and Multi-Table Analysis

## Learning Objectives

By the end of this lesson, you should be able to:

* Understand event data.
* Understand transaction tables.
* Understand the rental business process.
* Follow multi-table relationship chains.
* Work with dates and timestamps.
* Understand NULL values.
* Perform time-based analysis.
* Analyze customer activity.
* Analyze product usage.
* Think in terms of business events.

---

# Moving Beyond Static Data

So far we have explored:

* Customers
* Films
* Categories
* Actors
* Inventory

These tables describe the business.

Today we focus on something different:

```text
Business Events
```

Events describe what happened.

---

# What Is an Event?

An event represents something that occurred at a specific moment.

Examples:

```text
Customer placed an order

Customer rented a movie

Customer made a payment

Product was shipped
```

These are events.

---

# Event Tables

Event tables store business activities.

Characteristics:

* Grow continuously
* Usually contain timestamps
* Usually reference multiple entities
* Often become the largest tables in a system

Examples in Pagila:

```text
rental

payment
```

---

# Understanding the Rental Process

The most important business process in Pagila is renting a movie.

---

Business Flow

```text
Customer

    ↓

Rental

    ↓

Inventory

    ↓

Film
```

Interpretation:

1. Customer rents something.
2. Rental records the event.
3. Rental references inventory.
4. Inventory references a film.

---

# Why Rental References Inventory

Many beginners ask:

> Why doesn't rental reference film directly?

Because customers rent copies, not titles.

Example:

```text
Film:
ACADEMY DINOSAUR
```

Inventory:

```text
Copy 1

Copy 2

Copy 3
```

Rental must identify which copy was rented.

Therefore:

```text
rental
    →
inventory
```

not:

```text
rental
    →
film
```

---

# Understanding Relationship Chains

Question:

> Which films are rented most often?

Data exists in:

```text
film
```

Rental activity exists in:

```text
rental
```

Relationship path:

```text
film
    |
inventory
    |
rental
```

This is called a join path.

---

# Thinking Through Join Paths

Whenever a question is asked:

Ask:

```text
Where is the information?

How do I reach it?
```

Example:

```text
Need film title

Need rental count
```

Path:

```text
film

↓

inventory

↓

rental
```

---

# Transaction Tables

Transaction tables record events.

Examples:

```text
rental

payment
```

Characteristics:

* Large
* Continuously growing
* Timestamp-based
* Frequently queried

---

# Master Data vs Transaction Data

Master Data:

```text
customer

film

category

actor
```

Describes the business.

---

Transaction Data:

```text
rental

payment
```

Records activity.

---

A useful rule:

```text
Master data changes slowly.

Transaction data changes constantly.
```

---

# Understanding Dates and Timestamps

Most business events occur at a specific time.

Example:

```text
2005-05-24 22:53:30
```

This is a timestamp.

---

Timestamp Contains

```text
Date

+

Time
```

Example:

```text
2005-05-24

22:53:30
```

---

# Why Dates Matter

Business users constantly ask:

* Rentals by day
* Rentals by week
* Rentals by month
* Revenue by quarter

Time-based analysis is one of the most common uses of SQL.

---

# Aggregating by Date

Suppose rentals occurred:

```text
2005-01-01

2005-01-01

2005-01-02
```

Grouping by date produces:

| Date       | Rentals |
| ---------- | ------- |
| 2005-01-01 | 2       |
| 2005-01-02 | 1       |

This allows trend analysis.

---

# Earliest and Latest Events

Common business questions:

* First order
* Latest order
* Earliest rental
* Latest rental

General approach:

```text
Sort

Take first row
```

or

```text
MIN()

MAX()
```

depending on the situation.

---

# Customer Activity Analysis

Question:

> Which customer rents most often?

Relationship:

```text
customer
    |
rental
```

Process:

```text
JOIN

GROUP BY customer

COUNT rentals
```

This pattern appears everywhere.

---

# Product Usage Analysis

Question:

> Which film is rented most often?

Path:

```text
film
    |
inventory
    |
rental
```

Process:

```text
JOIN

GROUP BY film

COUNT rentals
```

This is usage analysis.

---

# What Is NULL?

One of the most important SQL concepts.

NULL means:

```text
Unknown

Missing

Not Yet Available
```

It does NOT mean:

```text
0

Empty String

False
```

These are different values.

---

# Example

Suppose a rental has not been returned.

Return date:

```text
NULL
```

Meaning:

```text
Return date is not known yet.
```

Because the movie is still out.

---

# Why NULL Exists

Without NULL:

How would we represent:

```text
Movie not yet returned
```

There is no return date.

NULL solves this problem.

---

# Testing for NULL

Wrong:

```sql
return_date = NULL
```

This never works.

---

Correct:

```sql
return_date IS NULL
```

---

To find returned rentals:

```sql
return_date IS NOT NULL
```

---

# Why NULL Is Special

Normal comparison:

```text
5 = 5
```

Result:

```text
TRUE
```

---

NULL comparison:

```text
NULL = NULL
```

Result:

```text
UNKNOWN
```

This surprises many SQL developers.

---

# Business Meaning of NULL

Question:

> Which rentals have not been returned?

Business meaning:

```text
Outstanding rentals
```

This is a real operational report.

---

# Event Analysis Pattern

Many analytical questions follow this structure:

Step 1

Identify event table.

Step 2

Join dimensions.

Step 3

Aggregate.

---

Example

Question:

> Most rented film?

Event:

```text
rental
```

Dimension:

```text
film
```

Process:

```text
JOIN

GROUP BY

COUNT
```

---

# Understanding Activity Metrics

Common business metrics:

```text
Rental Count

Order Count

Customer Count

Daily Activity

Monthly Activity
```

Most are event-based.

---

# Real World Examples

E-commerce:

```text
Order Table
```

Stores events.

---

Banking:

```text
Transaction Table
```

Stores events.

---

Healthcare:

```text
Appointment Table
```

Stores events.

---

Social Media:

```text
Like Table

Comment Table
```

Store events.

---

The same SQL patterns apply everywhere.

---

# Common Mistakes

## Ignoring Join Paths

Question:

> Most rented film?

Wrong thinking:

```text
film
    |
rental
```

No direct relationship exists.

---

Correct:

```text
film
    |
inventory
    |
rental
```

---

## Comparing to NULL

Wrong:

```sql
WHERE return_date = NULL
```

---

Correct:

```sql
WHERE return_date IS NULL
```

---

## Counting Wrong Entities

Question:

> Most active customer?

Correct:

```text
Count rentals
```

Not:

```text
Count customers
```

Always identify what is being measured.

---

# Business Questions Solved Today

Using today's concepts you can answer:

* How many rentals exist?
* Rentals per day?
* Earliest rental?
* Latest rental?
* Most active customer?
* Least active customer?
* Most rented film?
* Least rented film?
* Rentals per store?
* Rentals not yet returned?

These are real operational reports.

---

# Professional SQL Thinking

When working with transactional systems:

Ask:

1. What is the event?
2. Which table records it?
3. Which dimensions describe it?
4. What metric is being measured?
5. Do I need date aggregation?
6. Do I need NULL handling?

This framework works in almost every industry.

---

# Summary

Today you learned:

* Event Data
* Transaction Tables
* Rental Business Process
* Join Paths
* Date and Timestamp Analysis
* Activity Metrics
* NULL Values
* IS NULL
* IS NOT NULL
* Customer Activity Analysis
* Product Usage Analysis

These concepts are fundamental to operational reporting, analytics, and data engineering.
