# Week 2 - Hints

## Relationship Thinking

Before writing any SQL, always ask:

1. Which business entity contains the information I need?
2. Can one table answer this question?
3. If not, which table should I visit next?
4. How are the tables connected?
5. What is the complete relationship path?

---

## Useful Relationship Paths in Pagila

### Customer Location

Customer

↓

Address

↓

City

↓

Country

---

### Customer Rentals

Customer

↓

Rental

---

### Customer Payments

Customer

↓

Payment

---

### Customer → Film

Customer

↓

Rental

↓

Inventory

↓

Film

---

### Film Categories

Film

↓

Film_Category

↓

Category

---

### Film Actors

Film

↓

Film_Actor

↓

Actor

---

### Store Inventory

Store

↓

Inventory

↓

Film

---

### Rental Process

Customer

↓

Rental

↓

Inventory

↓

Film

---

### Revenue Process

Customer

↓

Payment

---

## Useful JOIN Types

### INNER JOIN

Use when you only want matching records.

Think:

```
Only records that exist in both tables.
```

---

### LEFT JOIN

Use when missing information is important.

Think:

```
Keep everything on the left.

Missing matches become NULL.
```

---

## Useful Clauses

SELECT

FROM

JOIN

ON

WHERE

GROUP BY

HAVING

ORDER BY

LIMIT

DISTINCT

---

## Useful Aggregate Functions

COUNT()

COUNT(DISTINCT)

SUM()

AVG()

MIN()

MAX()

---

## Common Business Patterns

### Show Information

Think:

```
SELECT
```

---

### Combine Information

Think:

```
JOIN
```

---

### Filter Rows

Think:

```
WHERE
```

---

### Filter Groups

Think:

```
HAVING
```

---

### Compare Groups

Think:

```
GROUP BY
```

---

### Find Missing Information

Think:

```
LEFT JOIN

+

IS NULL
```

---

### Remove Duplicates

Think:

```
DISTINCT
```

---

### Find Top Results

Think:

```
ORDER BY DESC

LIMIT
```

---

### Find Bottom Results

Think:

```
ORDER BY ASC

LIMIT
```

---

## Helpful Questions

For every problem ask yourself:

### Step 1

What is the business trying to know?

---

### Step 2

Which business entities are involved?

---

### Step 3

Can one table answer this?

---

### Step 4

If not,

What relationship path connects them?

---

### Step 5

Do I need:

- JOIN
- GROUP BY
- HAVING
- DISTINCT
- LEFT JOIN
- ORDER BY

---

### Step 6

Am I counting:

- Rows?
- Customers?
- Films?
- Rentals?
- Payments?
- Unique values?

---

### Step 7

Will joining create duplicate rows?

If yes,

Should I use:

```
DISTINCT
```

or

```
COUNT(DISTINCT ...)
```

---

## Golden Rules

✓ Think about the business before SQL.

✓ Draw the relationship path first.

✓ JOIN tables because of relationships, not because they look useful.

✓ GROUP BY creates one metric per business dimension.

✓ DISTINCT removes duplicate values, not duplicate business facts.

✓ LEFT JOIN is for finding missing information.

✓ Always verify what you are counting.