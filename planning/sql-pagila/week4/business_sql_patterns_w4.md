# Business SQL Patterns

## Week 4 - Window Functions & Analytical SQL

---

# Purpose

Professional SQL developers rarely begin by thinking:

> Which Window Function should I use?

Instead, they think:

> What business problem am I trying to solve?

This guide teaches you how to translate business requirements into the appropriate Window Function.

---

# Pattern 1 — Show Summary Information Without Losing Rows

## Business Requirement

Show every payment together with the average payment amount.

Example

| Payment | Amount | Average |
|---------|-------:|--------:|
| 1 | 2.99 | 4.20 |
| 2 | 5.99 | 4.20 |
| 3 | 3.99 | 4.20 |

---

## Thinking Process

```
Need every row?

↓

Yes

↓

Need summary value?

↓

Window Function

↓

OVER()
```

---

## SQL Pattern

```sql
Aggregate_Function(...)
OVER()
```

---

# Pattern 2 — Analyze Within Business Groups

## Business Requirement

Show every payment together with the customer's total spending.

Example

| Customer | Payment | Customer Total |
|----------|--------:|---------------:|
| Mary | 2.99 | 74.91 |
| Mary | 4.99 | 74.91 |
| Mary | 5.99 | 74.91 |

---

## Thinking Process

```
Need analysis

↓

Within each customer

↓

PARTITION BY customer
```

---

## SQL Pattern

```sql
...
OVER (
    PARTITION BY customer_id
)
```

---

# Pattern 3 — Running Totals

## Business Requirement

Show revenue accumulated over time.

Example

| Date | Payment | Running Total |
|------|--------:|--------------:|
| Day 1 | 10 | 10 |
| Day 2 | 15 | 25 |
| Day 3 | 20 | 45 |

---

## Thinking Process

```
Order matters?

↓

Yes

↓

Running calculation

↓

ORDER BY
```

---

## SQL Pattern

```sql
SUM(...)
OVER (
    ORDER BY payment_date
)
```

---

# Pattern 4 — Restart Calculations for Every Group

## Business Requirement

Calculate running revenue for every customer separately.

---

## Thinking Process

```
Running Total

↓

Per Customer

↓

PARTITION BY

+

ORDER BY
```

---

## SQL Pattern

```sql
SUM(...)
OVER (
    PARTITION BY customer_id
    ORDER BY payment_date
)
```

---

# Pattern 5 — Ranking

## Business Requirement

Rank customers by revenue.

---

## Thinking Process

```
Need ranking?

↓

Yes

↓

Should ties matter?

↓

Choose Ranking Function
```

---

## SQL Patterns

### Unique Position

```sql
ROW_NUMBER()
```

---

### Competition Ranking

```sql
RANK()
```

---

### Dense Ranking

```sql
DENSE_RANK()
```

---

# Pattern 6 — Top N Per Business Group

## Business Requirement

Find the top three customers in every store.

---

## Thinking Process

```
Need Top N

↓

Within Store

↓

PARTITION BY

↓

Ranking

↓

Filter Rank
```

---

## SQL Pattern

```sql
ROW_NUMBER()

or

RANK()

OVER (
    PARTITION BY store_id
)
```

---

# Pattern 7 — Compare Consecutive Rows

## Business Requirement

Compare today's payment with the previous payment.

---

## Thinking Process

```
Need Previous Row

↓

LAG()
```

---

## SQL Pattern

```sql
LAG(...)
OVER (
    ORDER BY payment_date
)
```

---

# Pattern 8 — Compare with the Next Row

## Business Requirement

Show the next rental for every customer.

---

## Thinking Process

```
Need Next Row

↓

LEAD()
```

---

## SQL Pattern

```sql
LEAD(...)
OVER (
    ORDER BY rental_date
)
```

---

# Pattern 9 — Divide Data into Groups

## Business Requirement

Divide customers into four spending groups.

---

## Thinking Process

```
Need Equal Groups

↓

NTILE()
```

---

## SQL Pattern

```sql
NTILE(4)
OVER (
    ORDER BY total_spending
)
```

---

# Pattern 10 — First and Latest Values

## Business Requirement

Find the first payment made by every customer.

---

## Thinking Process

```
Need First Value

↓

FIRST_VALUE()
```

---

Latest payment?

↓

```
LAST_VALUE()
```

---

## SQL Pattern

```sql
FIRST_VALUE(...)
OVER (
    PARTITION BY customer_id
    ORDER BY payment_date
)
```

---

# Pattern 11 — Moving Average

## Business Requirement

Smooth short-term fluctuations in revenue.

Example

| Day | Revenue | Moving Average |
|----|---------:|---------------:|
| 1 | 100 | 100 |
| 2 | 120 | 110 |
| 3 | 140 | 120 |

---

## Thinking Process

```
Need Trend

↓

Average

↓

Sliding Window

↓

Moving Average
```

---

# Pattern 12 — Analytical Dashboards

## Business Requirement

Build an executive dashboard.

Typical requirements include:

- Revenue
- Ranking
- Running totals
- Previous value
- Trend
- Average

No single Window Function is enough.

Professional dashboards combine several Window Functions in one query.

---

# Choosing the Right Window Function

| Business Requirement | Window Function |
|----------------------|-----------------|
| Summary without collapsing rows | `OVER()` |
| Group analysis | `PARTITION BY` |
| Running calculations | `ORDER BY` |
| Unique ranking | `ROW_NUMBER()` |
| Competition ranking | `RANK()` |
| Dense ranking | `DENSE_RANK()` |
| Previous row | `LAG()` |
| Next row | `LEAD()` |
| Equal-sized groups | `NTILE()` |
| First value | `FIRST_VALUE()` |
| Last value | `LAST_VALUE()` |
| Trend smoothing | Moving Average |

---

# Professional Thinking Process

Every analytical SQL problem should follow this workflow.

```
Business Requirement

↓

Business Entity

↓

Business Metric

↓

Should every row remain?

↓

Yes

↓

Window Function

↓

Should analysis restart?

↓

PARTITION BY

↓

Should order matter?

↓

ORDER BY

↓

Choose Analytical Function

↓

Business Report
```

---

# Final Thought

Window Functions are not just SQL features.

They are analytical tools.

Professional SQL developers don't memorize them.

They recognize business patterns and select the appropriate Window Function to solve the problem.

That is the mindset you should develop throughout Week 4.