# Business SQL Patterns

## Week 5 - Advanced Query Construction

---

# Purpose

Professional SQL developers don't solve complex business problems by writing one enormous SQL query.

Instead, they break the problem into smaller, logical pieces.

Week 5 teaches the design patterns used to organize SQL into maintainable, reusable, and readable solutions.

Instead of asking:

> Which SQL keyword should I use?

Ask:

> How should I structure this business problem?

---

# Pattern 1 — Scalar Subquery

## Business Requirement

Display films whose rental rate is higher than the average rental rate.

---

## Thinking Process

```
Need one value

↓

Average Rental Rate

↓

Compare Every Film

↓

Scalar Subquery
```

---

## SQL Pattern

```sql
SELECT ...
FROM ...

WHERE column >
(
    SELECT ...
)
```

---

# Pattern 2 — Multi-row Subquery

## Business Requirement

Display all customers who belong to a selected list of customer IDs.

---

## Thinking Process

```
Need Multiple Values

↓

Compare Against List

↓

IN
```

---

## SQL Pattern

```sql
WHERE column IN
(
    SELECT ...
)
```

---

# Pattern 3 — Derived Table (Inline View)

## Business Requirement

Calculate customer revenue first.

Then calculate the average revenue.

---

## Thinking Process

```
Intermediate Result

↓

Temporary Table

↓

Final Query
```

---

## SQL Pattern

```sql
SELECT ...
FROM
(
    SELECT ...
) AS derived_table
```

---

# Pattern 4 — Correlated Subquery

## Business Requirement

Find customers whose payment is greater than their own average payment.

---

## Thinking Process

```
Outer Row

↓

Inner Query

↓

Depends on Outer Row

↓

Correlated Subquery
```

---

## SQL Pattern

```sql
SELECT ...

WHERE value >
(
    SELECT ...
    WHERE outer.id = inner.id
)
```

---

# Pattern 5 — EXISTS

## Business Requirement

Find customers who have rented at least one film.

---

## Thinking Process

```
Need to Know

Does a Row Exist?

↓

EXISTS
```

---

## SQL Pattern

```sql
WHERE EXISTS
(
    SELECT 1
    ...
)
```

---

# Pattern 6 — NOT EXISTS

## Business Requirement

Find customers who have never rented a film.

---

## Thinking Process

```
Need Missing Records

↓

NOT EXISTS
```

---

## SQL Pattern

```sql
WHERE NOT EXISTS
(
    SELECT 1
    ...
)
```

---

# Pattern 7 — Common Table Expression (CTE)

## Business Requirement

Break a large report into logical sections.

---

## Thinking Process

```
Large Problem

↓

Small Queries

↓

Name Each Step

↓

Final Query
```

---

## SQL Pattern

```sql
WITH cte_name AS
(
    SELECT ...
)

SELECT ...
FROM cte_name;
```

---

# Pattern 8 — Multiple CTEs

## Business Requirement

Calculate:

- Customer Revenue
- Store Revenue
- Film Rentals

Combine them into one report.

---

## Thinking Process

```
Business Problem

↓

Independent Calculations

↓

Multiple CTEs

↓

Join Results
```

---

## SQL Pattern

```sql
WITH
cte1 AS (...),

cte2 AS (...),

cte3 AS (...)

SELECT ...
```

---

# Pattern 9 — Recursive CTE

## Business Requirement

Generate a calendar.

Generate numbers.

Traverse hierarchies.

---

## Thinking Process

```
Start

↓

Repeat

↓

Stop
```

---

## SQL Pattern

```sql
WITH RECURSIVE cte AS
(
    Anchor Query

    UNION ALL

    Recursive Query
)
```

---

# Pattern 10 — UNION

## Business Requirement

Combine customers from two different result sets.

Remove duplicates.

---

## Thinking Process

```
Dataset A

+

Dataset B

↓

Unique Rows
```

---

## SQL Pattern

```sql
SELECT ...

UNION

SELECT ...
```

---

# Pattern 11 — UNION ALL

## Business Requirement

Combine all records.

Keep duplicates.

---

## Thinking Process

```
Need Every Row

↓

UNION ALL
```

---

## SQL Pattern

```sql
SELECT ...

UNION ALL

SELECT ...
```

---

# Pattern 12 — INTERSECT

## Business Requirement

Find customers appearing in both datasets.

---

## Thinking Process

```
Dataset A

∩

Dataset B

↓

Common Rows
```

---

## SQL Pattern

```sql
SELECT ...

INTERSECT

SELECT ...
```

---

# Pattern 13 — EXCEPT

## Business Requirement

Find customers existing in one dataset but not another.

---

## Thinking Process

```
Dataset A

-

Dataset B

↓

Remaining Rows
```

---

## SQL Pattern

```sql
SELECT ...

EXCEPT

SELECT ...
```

---

# Pattern 14 — Breaking Large Business Problems

## Business Requirement

Create an executive dashboard.

---

## Thinking Process

```
Business Question

↓

Identify Metrics

↓

Break into Steps

↓

Solve Each Step

↓

Combine Results

↓

Final Dashboard
```

---

# Choosing the Right Technique

| Business Requirement | SQL Technique |
|----------------------|---------------|
| One comparison value | Scalar Subquery |
| Compare against many values | Multi-row Subquery |
| Intermediate calculation | Derived Table |
| Row-by-row comparison | Correlated Subquery |
| Check existence | EXISTS |
| Find missing records | NOT EXISTS |
| Organize complex SQL | CTE |
| Multiple reusable calculations | Multiple CTEs |
| Recursive generation | Recursive CTE |
| Combine datasets | UNION |
| Combine while keeping duplicates | UNION ALL |
| Common records | INTERSECT |
| Difference between datasets | EXCEPT |

---

# Professional Thinking Workflow

Every complex SQL problem should follow this sequence.

```
Business Requirement

↓

Understand the Goal

↓

Can it be solved directly?

↓

No

↓

Break into Smaller Problems

↓

Choose SQL Technique

↓

Build Reusable Components

↓

Combine Components

↓

Business Report
```

---

# Final Thought

Week 5 is not about memorizing Subqueries, CTEs, or Set Operations.

It is about learning how to **design SQL solutions**.

Professional SQL developers don't write the longest query.

They write the clearest, most maintainable solution by breaking large business problems into logical, reusable steps.