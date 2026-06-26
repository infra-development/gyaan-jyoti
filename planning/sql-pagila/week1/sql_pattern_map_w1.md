# SQL Pattern Map
## Week 1

> This is not a syntax cheat sheet.
>
> It is a **thinking cheat sheet**.
>
> Read the business question first.
> Recognize the pattern.
> Then think about SQL.

---

# Step 1 — Understand the Business Question

Don't ask:

❌ Which SQL clause should I use?

Ask:

✅ What is the business trying to achieve?

---

# Step 2 — Recognize the Pattern

```
Business Question
        │
        ▼
Business Objective
        │
        ▼
Pattern
        │
        ▼
SQL Concept
```

---

# Pattern 1 — Retrieve Information

## Recognition Signals

- Show
- List
- Display
- Retrieve
- Find

Business Examples

- Show all customers.
- List all films.
- Display all stores.

Think

```
Business wants to see information.

↓

Retrieve
```

SQL Concept

```
SELECT
```

Remember

> No calculations.
> No comparisons.
> No analysis.

---

# Pattern 2 — Filter Information

## Recognition Signals

- Only
- Active
- Before
- After
- Between
- Greater than
- Less than

Business Examples

- Active customers
- Payments above $10
- Films longer than 120 minutes

Think

```
Business wants only relevant rows.

↓

Filter
```

SQL Concept

```
WHERE
```

Remember

Filtering removes rows.

It does not calculate anything.

---

# Pattern 3 — Sort Information

## Recognition Signals

- Highest
- Lowest
- Top
- Bottom
- Newest
- Oldest
- Alphabetically

Business Examples

- Highest payment
- Top customers
- Latest rentals

Think

```
Business cares about order.

↓

Sort
```

SQL Concept

```
ORDER BY
```

Remember

Sorting changes presentation.

Not data.

---

# Pattern 4 — Summarize Information

## Recognition Signals

- Total
- Count
- Average
- Maximum
- Minimum
- Overall
- How many
- How much

Business Examples

- Total revenue
- Number of rentals
- Average payment

Think

```
Business wants one metric.

↓

Summarize
```

SQL Concepts

```
SUM

COUNT

AVG

MAX

MIN
```

Remember

One overall business metric.

---

# Pattern 5 — Compare Business Performance

## Recognition Signals

- By
- Per
- Each
- Every

Business Examples

- Revenue by Store
- Customers by Country
- Rentals by Month

Think

```
Metric

+

Dimension
```

Ask

```
What is being measured?

↓

Metric

Who or what is it measured for?

↓

Dimension
```

SQL Concept

```
GROUP BY
```

Remember

GROUP BY creates

One Metric

Per Dimension

---

# Pattern 6 — Combine Business Information

## Recognition Signals

Business question mentions multiple entities.

Examples

Customer + City

Film + Category

Customer + Address

Think

```
Can one table answer this?

↓

No

↓

Need another business entity
```

SQL Concept

```
JOIN
```

Remember

JOIN connects business entities.

It is not simply "combining tables."

---

# Week 1 Decision Matrix

| Business Question | Pattern | SQL Concept |
|-------------------|---------|-------------|
| Show all customers | Retrieve | SELECT |
| Active customers | Retrieve + Filter | SELECT + WHERE |
| Highest payments | Retrieve + Sort | SELECT + ORDER BY |
| Total revenue | Summarize | SUM |
| Revenue by Store | Summarize + Group | SUM + GROUP BY |
| Customer with City | Retrieve + Join | JOIN |

---

# Week 1 Mental Checklist

Before writing SQL ask yourself:

□ What is the business objective?

□ Which business entity is involved?

□ Do I need all rows?

□ Do I need to filter?

□ Do I need one metric?

□ Do I need one metric per dimension?

□ Is information missing from another table?

Only after answering these questions should you write SQL.

---

# The Six Thinking Patterns

```
Show
        ↓
SELECT

Only
        ↓
WHERE

Highest
        ↓
ORDER BY

Total
        ↓
Aggregate

By
        ↓
GROUP BY

Customer + City
        ↓
JOIN
```

---

# Final Rule

Don't memorize SQL.

Recognize business patterns.

Business Pattern

↓

Thinking Pattern

↓

SQL

Professional SQL developers think in this order every time.