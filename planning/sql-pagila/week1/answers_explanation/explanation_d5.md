# Day 5 - Inventory Analysis and Business Thinking

## Learning Objectives

By the end of this lesson, you should be able to:

* Understand what inventory represents.
* Understand the difference between a product and a physical copy.
* Analyze inventory data.
* Use aggregation after joins.
* Understand COUNT(DISTINCT).
* Use HAVING with aggregate values.
* Understand inventory reporting.
* Think about business processes instead of just tables.

---

# Moving from Data to Business

Up to now we have focused on:

* Tables
* Columns
* Relationships
* Joins

Today we begin thinking about business operations.

The Pagila database models a DVD rental business.

One of the most important business concepts is inventory.

---

# What Is Inventory?

Inventory represents items available for use, sale, or rental.

Examples:

A bookstore:

```text
Book Title
```

is not inventory.

The physical copies are inventory.

---

Example:

```text
Harry Potter
```

might have:

```text
Copy 1
Copy 2
Copy 3
Copy 4
```

Inventory tracks the individual copies.

---

# Product vs Inventory

This distinction is extremely important.

---

## Product

Represents the thing itself.

Example:

```text
Film
```

Table:

```text
film
```

---

## Inventory

Represents a specific copy.

Table:

```text
inventory
```

---

Visual Representation

```text
Film
  |
  +---- Copy 1
  +---- Copy 2
  +---- Copy 3
```

The film exists once.

Inventory copies exist many times.

---

# Why Inventory Exists

Suppose:

```text
ACADEMY DINOSAUR
```

has 8 copies.

If one customer rents a copy:

```text
7 copies remain available
```

Without inventory tracking, the business could not manage rentals properly.

---

# Inventory Structure in Pagila

Core relationship:

```text
Film
    |
Inventory
    |
Store
```

Interpretation:

A store owns inventory items.

Each inventory item references a film.

---

Example

```text
Film:
ACADEMY DINOSAUR
```

Inventory:

```text
Inventory ID 1 → Store 1

Inventory ID 2 → Store 1

Inventory ID 3 → Store 2
```

Three physical copies exist.

---

# Understanding One-to-Many Relationships

One film can have many inventory records.

```text
Film
    |
    +---- Inventory
    +---- Inventory
    +---- Inventory
```

This is a one-to-many relationship.

---

# Aggregation After Joins

Question:

> How many copies exist for each film?

Required information:

Film title:

```text
film
```

Inventory count:

```text
inventory
```

Need:

```text
JOIN

GROUP BY

COUNT
```

This is a common analytical pattern.

---

# Understanding Counts

Suppose:

Inventory:

| inventory_id | film_id |
| ------------ | ------- |
| 1            | 100     |
| 2            | 100     |
| 3            | 100     |
| 4            | 200     |

Grouping by film:

| film_id | count |
| ------- | ----- |
| 100     | 3     |
| 200     | 1     |

Film 100 has three copies.

Film 200 has one copy.

---

# Finding Highest and Lowest Values

Business questions:

* Which film has the most copies?
* Which film has the fewest copies?

These follow a familiar pattern:

```text
Aggregate

Sort

Limit
```

---

General Process

```text
GROUP BY

COUNT

ORDER BY

LIMIT
```

This pattern appears throughout analytics.

---

# HAVING Revisited

Recall:

WHERE filters rows.

HAVING filters groups.

---

Example

Question:

> Find films with exactly one copy.

Process:

```text
GROUP BY film

COUNT copies

Keep only groups where count = 1
```

This requires:

```text
HAVING
```

not:

```text
WHERE
```

---

# Understanding COUNT(DISTINCT)

A very important concept.

---

# COUNT

Counts rows.

Example:

Values:

```text
1
1
1
2
2
```

COUNT:

```text
5
```

---

# COUNT(DISTINCT)

Counts unique values.

Same data:

```text
1
1
1
2
2
```

COUNT(DISTINCT):

```text
2
```

Unique values:

```text
1
2
```

---

# Why COUNT(DISTINCT) Matters

Question:

> Which films exist in both stores?

Suppose:

Inventory:

| film_id | store_id |
| ------- | -------- |
| 100     | 1        |
| 100     | 1        |
| 100     | 2        |

Store count:

```text
COUNT(store_id)
```

returns:

```text
3
```

Not useful.

---

Using:

```text
COUNT(DISTINCT store_id)
```

returns:

```text
2
```

Meaning:

Film exists in two stores.

Exactly what we need.

---

# Understanding Store Coverage

Question:

> Is a film available in both stores?

Logic:

```text
Store 1

Store 2
```

Distinct store count:

```text
2
```

Therefore:

```text
Available in both stores
```

This is a common business problem.

---

# Understanding Inventory Distribution

Businesses often ask:

* Which products are stocked everywhere?
* Which products are stocked in one location only?
* Which products need redistribution?

Today's exercises simulate these real-world questions.

---

# MIN and MAX as Business Tools

Suppose a film exists only in Store 1.

Values:

```text
1
1
1
```

Then:

```text
MIN(store_id) = 1

MAX(store_id) = 1
```

---

Suppose a film exists in both stores.

Values:

```text
1
1
2
```

Then:

```text
MIN(store_id) = 1

MAX(store_id) = 2
```

This technique can identify inventory distribution.

---

# Inventory Reporting

A common report:

| Film    | Copies |
| ------- | ------ |
| Movie A | 8      |
| Movie B | 3      |
| Movie C | 1      |

Business users love simple summaries like this.

---

To produce such reports:

```text
JOIN

GROUP BY

COUNT
```

These three concepts appear repeatedly.

---

# Thinking Like a Business Analyst

Question:

> Which film has the most copies?

Technical Thinking:

```text
film

inventory

count
```

---

Business Thinking:

```text
Which movie has the largest stock?
```

Understanding both perspectives is important.

---

# Common Inventory Metrics

Examples:

```text
Inventory Count

Inventory Value

Available Inventory

Out of Stock Items

Store Coverage

Inventory Turnover
```

Today's exercises introduce the simplest version of these analyses.

---

# Common Mistakes

## Counting the Wrong Thing

Question:

> How many copies exist?

Correct:

```text
COUNT(inventory_id)
```

Wrong:

```text
COUNT(film_id)
```

Understand what the business question is measuring.

---

## Forgetting DISTINCT

Question:

> In how many stores is a film available?

Wrong:

```text
COUNT(store_id)
```

Correct:

```text
COUNT(DISTINCT store_id)
```

---

## Using WHERE Instead of HAVING

Wrong:

```text
WHERE COUNT(*) = 1
```

Correct:

```text
HAVING COUNT(*) = 1
```

---

# Business Questions Solved Today

Using today's concepts you can answer:

* How many inventory records exist?
* How many copies exist per film?
* Which film has the most copies?
* Which film has the fewest copies?
* Which films have exactly one copy?
* Which films exist in both stores?
* Which films exist only in one store?

These are real inventory management questions.

---

# Professional SQL Thinking

When you see a question:

Ask:

1. What is being counted?
2. What represents a unique item?
3. Do I need DISTINCT?
4. Do I need GROUP BY?
5. Do I need HAVING?
6. Am I measuring products or inventory?

These questions prevent many analytical mistakes.

---

# Summary

Today you learned:

* Product vs Inventory
* Inventory Modeling
* Aggregation After Joins
* COUNT(DISTINCT)
* Store Coverage Analysis
* Inventory Distribution
* HAVING with Aggregates
* Inventory Reporting
* Business-Oriented Thinking

You are now beginning to move beyond SQL syntax and into business analytics, which is where SQL becomes truly valuable.
