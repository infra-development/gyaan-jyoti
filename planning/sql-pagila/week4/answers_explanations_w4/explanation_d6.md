# Day 6 - Advanced Analytical Functions

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand the purpose of `FIRST_VALUE()`.
- Understand the purpose of `LAST_VALUE()`.
- Explain why `LAST_VALUE()` often requires an explicit window frame.
- Calculate moving averages.
- Distinguish between ordinary averages and moving averages.
- Perform advanced analytical reporting using Window Functions.

---

# Introduction

During the previous lessons, you learned how to:

- Calculate analytical summaries.
- Partition data into business groups.
- Build running totals.
- Rank business entities.
- Compare rows using `LAG()` and `LEAD()`.

Today's lesson introduces another level of analysis.

Businesses often ask questions such as:

- What was the customer's first payment?
- What is the customer's latest payment?
- How has revenue changed over time?
- What is the underlying trend after removing short-term fluctuations?

These questions require advanced Window Functions.

---

# Concept 1 - FIRST_VALUE() (Q51 & Q53)

## Business Question

What was the customer's first payment?

Instead of searching manually,

SQL can remember the first value in each customer's history.

Example

| Payment Date | Payment | First Payment |
|--------------|--------:|--------------:|
| Jan | 4.99 | 4.99 |
| Feb | 7.99 | 4.99 |
| Mar | 2.99 | 4.99 |

Notice that every row shows the customer's first payment.

General syntax:

```sql
FIRST_VALUE(column)
OVER (
    PARTITION BY ...
    ORDER BY ...
)
```

---

## Business Uses

- First purchase
- First rental
- Customer onboarding
- Initial transaction
- First login

---

# Concept 2 - LAST_VALUE() (Q52 & Q54)

Businesses also ask:

> What is the customer's latest payment?

This sounds simple,

but there is an important detail.

Example

| Payment Date | Payment | Latest Payment |
|--------------|--------:|---------------:|
| Jan | 4.99 | 9.99 |
| Feb | 7.99 | 9.99 |
| Mar | 9.99 | 9.99 |

Every row displays the customer's most recent payment.

---

## Understanding the Window Frame

Unlike `FIRST_VALUE()`,

`LAST_VALUE()` can produce unexpected results if you rely on the default window frame.

By default,

PostgreSQL only considers rows from the beginning of the partition up to the current row.

As a result,

`LAST_VALUE()` often returns the **current row**, not the true last row.

To return the actual last value in the partition,

define the window frame explicitly.

Example:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
```

This tells PostgreSQL to consider the entire partition.

---

# Concept 3 - Moving Average (Q55)

Businesses rarely rely only on daily values.

Daily revenue may fluctuate.

Instead,

they want to understand the overall trend.

Example

| Day | Revenue |
|----|---------:|
| 1 | 100 |
| 2 | 120 |
| 3 | 90 |
| 4 | 140 |

A moving average smooths these fluctuations.

Example

| Day | Moving Average |
|----|---------------:|
| 1 | 100 |
| 2 | 110 |
| 3 | 103.33 |
| 4 | 116.67 |

Instead of reacting to every individual change,

businesses analyze the trend.

---

# Concept 4 - Daily Revenue Trends (Q56)

Businesses often summarize revenue by day.

Once daily revenue is calculated,

a moving average helps answer questions like:

- Is revenue generally increasing?
- Is the business slowing down?
- Are daily changes simply random fluctuations?

Moving averages make long-term trends easier to identify.

---

# Concept 5 - Ordinary Average vs Moving Average (Q57)

These calculations answer different questions.

### Ordinary Average

```
Entire Dataset

↓

One Average
```

Every row receives the same value.

---

### Moving Average

```
Sliding Window

↓

Average Changes

↓

Trend Analysis
```

The moving average changes as the window moves forward.

---

# Concept 6 - Choosing the Correct Function (Q58 & Q59)

Before writing SQL,

ask yourself:

## Need the first value?

↓

```sql
FIRST_VALUE()
```

---

## Need the latest value?

↓

```sql
LAST_VALUE()
```

(Remember the window frame.)

---

## Need to identify trends?

↓

Moving Average

---

# Concept 7 - Thinking Before Advanced Analytics (Q60)

Follow this analytical process.

```
Business Question

↓

Need Every Row?

↓

Yes

↓

Need First Event?

↓

FIRST_VALUE()

--------------------

Need Latest Event?

↓

LAST_VALUE()

--------------------

Need Trend?

↓

Moving Average

↓

Choose Window Frame

↓

Business Report
```

---

# Advanced Analytics Workflow

```
Business Requirement

↓

Business Metric

↓

Historical Analysis

↓

Window Function

↓

Window Frame

↓

Business Insight
```

---

# FIRST_VALUE() vs LAST_VALUE()

| Function | Returns |
|----------|----------|
| `FIRST_VALUE()` | First value in the partition |
| `LAST_VALUE()` | Last value in the partition (requires an appropriate window frame) |

---

# Average vs Moving Average

| Ordinary Average | Moving Average |
|------------------|----------------|
| One value | Many values |
| Entire dataset | Sliding window |
| Summary | Trend analysis |
| Static | Dynamic |

---

# Common Business Applications

| Business Requirement | SQL Feature |
|----------------------|------------|
| Customer's first purchase | `FIRST_VALUE()` |
| Customer's latest purchase | `LAST_VALUE()` |
| First rental | `FIRST_VALUE()` |
| Latest rental | `LAST_VALUE()` |
| Revenue trend | Moving Average |
| Sales trend | Moving Average |

---

# Common Mistakes

❌ Assuming `LAST_VALUE()` automatically returns the last row in the partition.

❌ Forgetting to define the window frame for `LAST_VALUE()`.

❌ Confusing an ordinary average with a moving average.

❌ Using moving averages when a simple average answers the business question.

❌ Ignoring the importance of ordering in trend analysis.

---

# Day 6 Summary

Today you learned:

- `FIRST_VALUE()` returns the first value in a partition.
- `LAST_VALUE()` returns the last value in a partition when the correct window frame is defined.
- Moving averages smooth short-term fluctuations.
- Ordinary averages summarize data, while moving averages reveal trends.
- Advanced analytical reports often combine multiple Window Functions.

---

# What's Next?

In Day 7, you'll combine everything you've learned throughout Week 4.

You'll build complete analytical reports using:

- `OVER()`
- `PARTITION BY`
- `ORDER BY`
- Ranking Functions
- `LAG()`
- `LEAD()`
- `NTILE()`
- `FIRST_VALUE()`
- `LAST_VALUE()`
- Running Totals
- Moving Averages

Day 7 focuses on solving realistic business reporting problems by combining multiple Window Functions in a single query, just as you would in production systems.