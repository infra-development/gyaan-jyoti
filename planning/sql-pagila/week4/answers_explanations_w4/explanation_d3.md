# Day 3 - ORDER BY Inside Window Functions

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand the purpose of `ORDER BY` inside a Window Function.
- Explain why ordering changes analytical calculations.
- Calculate running totals.
- Calculate running counts.
- Build cumulative business reports.
- Combine `PARTITION BY` and `ORDER BY` to perform group-wise chronological analysis.

---

# Introduction

In Day 2, you learned how `PARTITION BY` divides data into logical business groups.

However, the calculations inside each partition were still static.

For example:

- Customer Total Revenue
- Customer Average Payment
- Customer Payment Count

Every row in the partition displayed the same value.

Businesses often need something different.

Instead of asking:

> What is the customer's total revenue?

they ask:

> How has the customer's revenue grown over time?

To answer this question, the order of rows becomes important.

That is why Window Functions support `ORDER BY`.

---

# Why ORDER BY Matters

Imagine four payments.

| Payment Date | Amount |
|--------------|-------:|
| Day 1 | 5.99 |
| Day 2 | 2.99 |
| Day 3 | 7.99 |
| Day 4 | 4.99 |

Without ordering,

SQL sees only four rows.

With ordering,

SQL understands the sequence.

Now calculations can grow step by step.

---

# Concept 1 - Running Totals (Q21)

## Business Question

How much revenue has been collected so far?

Instead of displaying:

| Payment | Amount |
|---------|-------:|
| 1 | 5.99 |
| 2 | 2.99 |
| 3 | 7.99 |

display:

| Payment | Amount | Running Total |
|---------|-------:|--------------:|
| 1 | 5.99 | 5.99 |
| 2 | 2.99 | 8.98 |
| 3 | 7.99 | 16.97 |

Notice how every new payment increases the total.

This is called a **running total**.

---

# Concept 2 - Running Counts (Q22)

Businesses also track growth by counting events.

Example:

| Payment | Running Count |
|---------|--------------:|
| 1 | 1 |
| 2 | 2 |
| 3 | 3 |
| 4 | 4 |

Instead of counting all rows at once,

the count grows one row at a time.

---

# Concept 3 - Cumulative Revenue (Q23)

Finance departments frequently ask:

> How much revenue has been collected up to this point?

The report grows continuously.

```
Payment

↓

Revenue

↓

Running Revenue
```

Every payment contributes to the cumulative total.

---

# Concept 4 - Cumulative Rentals (Q24)

The same idea applies to rentals.

Instead of reporting:

```
Total Rentals
```

we report:

```
Rentals So Far
```

This helps businesses monitor activity throughout a day, week, or month.

---

# Concept 5 - Running Totals Within Groups (Q25 & Q26)

Until now,

the running total included every payment.

Businesses often need separate running totals.

Examples:

- Revenue for each customer.
- Revenue for each store.

This combines two ideas:

```
PARTITION BY

+

ORDER BY
```

The calculation:

- Restarts for every partition.
- Grows according to the specified order.

---

# Concept 6 - Why ORDER BY Changes the Result (Q27)

Without `ORDER BY`:

Every row sees the same group.

Example:

```
Customer Revenue

↓

74.91

74.91

74.91
```

With `ORDER BY`:

Each row only includes rows that come before it.

Example:

```
2.99

↓

8.98

↓

13.97

↓

18.96
```

The calculation becomes cumulative.

---

# Concept 7 - Aggregate vs Running Total (Q28)

These calculations answer different business questions.

### Aggregate SUM()

```
Total Revenue

↓

67,416.51
```

One answer.

---

### Running Total

```
Payment

↓

Revenue So Far
```

Many answers.

Each row represents the business at that moment.

---

# Concept 8 - Business Applications (Q29 & Q30)

Running calculations are used everywhere.

Examples:

- Daily revenue dashboards.
- Bank account balances.
- Monthly sales growth.
- Customer lifetime spending.
- Inventory movement.
- Website visitor counts.

Whenever businesses ask:

> "How has this changed over time?"

ordered Window Functions are usually involved.

---

# ORDER BY Workflow

```
Business Question

↓

Does Sequence Matter?

↓

Yes

↓

ORDER BY

↓

Need Separate Groups?

↓

Optional

↓

PARTITION BY

↓

Running Analysis

↓

Business Report
```

---

# Running Total vs Aggregate

| Aggregate Function | Running Calculation |
|--------------------|--------------------|
| One final answer | One answer per row |
| Ignores sequence | Depends on sequence |
| Summary reporting | Trend analysis |
| Static result | Progressive result |

---

# Common Mistakes

❌ Forgetting `ORDER BY` when calculating running totals.

❌ Ordering by a column that doesn't represent the business sequence.

❌ Assuming `SUM()` automatically creates a running total.

❌ Forgetting to use `PARTITION BY` when separate running totals are required.

❌ Confusing cumulative values with final totals.

---

# Day 3 Summary

Today you learned:

- `ORDER BY` introduces sequence into Window Functions.
- Running totals grow as new rows are processed.
- Running counts track progressive activity.
- `PARTITION BY` and `ORDER BY` work together to create group-wise running calculations.
- Ordered Window Functions are essential for trend analysis and financial reporting.

---

# What's Next?

In Day 4, you'll learn **Ranking Functions**.

You'll discover how to:

- Assign unique row numbers.
- Rank customers by revenue.
- Handle ties correctly.
- Find the Top N records within business groups.

Ranking functions are among the most frequently used Window Functions in reporting, dashboards, and SQL interviews.