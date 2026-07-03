# Common SQL Mistakes

## Week 4 - Window Functions & Analytical SQL

---

# Purpose

Window Functions are one of the most powerful features in SQL.

They are also one of the most misunderstood.

Most mistakes occur because developers think of Window Functions as replacements for `GROUP BY`.

They are not.

This guide highlights the most common mistakes and teaches the correct analytical thinking behind each one.

---

# Mistake 1 — Using GROUP BY Instead of a Window Function

Business asks:

> Show every payment together with the customer's average payment.

Many beginners write:

```sql
SELECT
    customer_id,
    AVG(amount)
FROM payment
GROUP BY customer_id;
```

Although this calculates the average correctly,

it returns **one row per customer**.

The business asked to display **every payment**.

---

## Better Solution

Use a Window Function.

```sql
AVG(amount)
OVER (
    PARTITION BY customer_id
)
```

---

## Remember

Ask yourself:

```
Should every row remain?

↓

Yes

↓

Window Function
```

---

# Mistake 2 — Forgetting the OVER() Clause

A Window Function is incomplete without `OVER()`.

Incorrect

```sql
ROW_NUMBER()
```

Correct

```sql
ROW_NUMBER()
OVER (...)
```

Every Window Function must define its analytical window.

---

# Mistake 3 — Confusing PARTITION BY with GROUP BY

Many students think:

```
PARTITION BY

=

GROUP BY
```

They are completely different.

---

## GROUP BY

```
Input

100 rows

↓

Output

10 rows
```

Rows are collapsed.

---

## PARTITION BY

```
Input

100 rows

↓

Output

100 rows
```

Rows remain.

Only the calculation changes.

---

# Mistake 4 — Forgetting ORDER BY

Some Window Functions depend on sequence.

Example:

Running Total

Without:

```sql
ORDER BY
```

the calculation becomes meaningless.

Whenever order affects the result,

include `ORDER BY` inside the `OVER()` clause.

---

# Mistake 5 — Using ROW_NUMBER() When Ties Exist

Suppose two customers spend exactly the same amount.

Using:

```sql
ROW_NUMBER()
```

produces unique numbers.

```
1

2
```

The tie disappears.

If equal values should share the same rank,

use:

```
RANK()

or

DENSE_RANK()
```

instead.

---

# Mistake 6 — Choosing the Wrong Ranking Function

Each ranking function serves a different purpose.

### ROW_NUMBER()

Every row gets a unique number.

---

### RANK()

Equal values receive the same rank.

Gaps appear afterwards.

---

### DENSE_RANK()

Equal values receive the same rank.

No gaps appear.

Choose the function that matches the business requirement.

---

# Mistake 7 — Forgetting PARTITION BY

Business asks:

> Rank customers within each store.

Some beginners write:

```sql
RANK()
OVER (
    ORDER BY revenue DESC
)
```

This creates a global ranking.

The ranking never restarts.

Instead:

```
Store

↓

Ranking

↓

Restart

↓

Store

↓

Ranking
```

Use:

```sql
PARTITION BY store_id
```

---

# Mistake 8 — Using LAG() Without ORDER BY

Previous compared to what?

Without an order,

there is no previous row.

Always define the sequence.

Example:

```
Payment Date

↓

Previous Payment
```

---

# Mistake 9 — Using LAST_VALUE() Incorrectly

Many developers expect:

```sql
LAST_VALUE()
```

to return the last row of the partition.

In PostgreSQL,

the default window frame usually returns the current row instead.

When using `LAST_VALUE()`, explicitly define the window frame if you want the true last value in the partition.

Understanding the window frame is essential for correct results.

---

# Mistake 10 — Ignoring the Window Frame

Some Window Functions use the default frame.

Others require a custom frame.

Example:

Running Total

↓

Current Row

Moving Average

↓

Previous Rows

Current Row

Future Rows

Always think about **which rows should participate in the calculation**.

---

# Mistake 11 — Calculating Moving Averages Incorrectly

A moving average is **not** the same as an ordinary average.

Ordinary Average

```
Entire Dataset
```

Moving Average

```
Small Sliding Window
```

Moving averages reveal trends.

Ordinary averages summarize everything.

---

# Mistake 12 — Using Too Many Window Functions Unnecessarily

Window Functions are powerful,

but every additional calculation increases complexity.

Ask yourself:

```
Does this report actually need another Window Function?
```

Keep queries simple whenever possible.

---

# Mistake 13 — Thinking About SQL Instead of Business Analysis

Business asks:

> Who are the top three customers in each store?

Beginners think:

```
ROW_NUMBER()

RANK()

DENSE_RANK()
```

Professionals think:

```
Business Question

↓

Ranking

↓

Store

↓

Top 3

↓

Choose Ranking Function
```

Business thinking always comes before SQL syntax.

---

# Mistake 14 — Building Reports That Are Difficult to Read

A technically correct report can still be a poor business report.

Good analytical reports should:

- Show meaningful column names.
- Display rankings clearly.
- Present running totals logically.
- Order data naturally.
- Be easy to explain.

SQL is written for people, not just databases.

---

# Week 4 Mental Checklist

Before writing a Window Function query, ask yourself:

□ Should every row remain visible?

□ Does the analysis restart for each business group?

□ Does row order matter?

□ Do I need ranking?

□ Do I need previous or next row comparison?

□ Do I need a running calculation?

□ Am I choosing the correct ranking function?

□ Is the final report easy for business users to understand?

---

# Final Thought

Window Functions are not difficult because of their syntax.

They are difficult because they require analytical thinking.

The best SQL developers don't ask:

> Which Window Function should I use?

They ask:

> What business insight am I trying to produce?

Once that question is answered, selecting the correct Window Function becomes much easier.