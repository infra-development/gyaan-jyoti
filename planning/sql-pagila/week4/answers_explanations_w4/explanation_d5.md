# Day 5 - Comparing Rows

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand how to compare one row with another.
- Use `LAG()` to access previous rows.
- Use `LEAD()` to access following rows.
- Use `NTILE()` to divide data into equally sized groups.
- Analyze changes over time.
- Perform customer segmentation using Window Functions.

---

# Introduction

Until now, every Window Function analyzed the **current row**.

For example:

- Customer Total Revenue
- Running Revenue
- Customer Rank

Businesses often ask more interesting questions.

Examples include:

- How does today's payment compare with the previous payment?
- When did this customer rent a movie before this rental?
- What is the customer's next scheduled activity?
- Which customers belong to the top 25% of spenders?

These questions require SQL to look beyond the current row.

That is the purpose of:

- `LAG()`
- `LEAD()`
- `NTILE()`

---

# Looking Beyond the Current Row

Imagine the following payments.

| Payment Date | Amount |
|--------------|-------:|
| Day 1 | 2.99 |
| Day 2 | 4.99 |
| Day 3 | 7.99 |
| Day 4 | 5.99 |

Normally SQL only knows the current row.

Window Functions allow SQL to look:

```
Previous Row

← Current Row →

Next Row
```

This opens the door to trend analysis.

---

# Concept 1 - LAG() (Q41)

## Business Question

Display every payment together with the customer's previous payment.

Example

| Current Payment | Previous Payment |
|----------------:|-----------------:|
| 4.99 | 2.99 |
| 7.99 | 4.99 |
| 5.99 | 7.99 |

`LAG()` retrieves information from an earlier row.

General syntax:

```sql
LAG(column)
OVER (
    PARTITION BY ...
    ORDER BY ...
)
```

The order determines what "previous" means.

---

# Concept 2 - LEAD() (Q42)

Businesses sometimes need to know what happens next.

Example

| Current Payment | Next Payment |
|----------------:|-------------:|
| 2.99 | 4.99 |
| 4.99 | 7.99 |
| 7.99 | 5.99 |

`LEAD()` retrieves information from a later row.

General syntax:

```sql
LEAD(column)
OVER (
    PARTITION BY ...
    ORDER BY ...
)
```

Think of `LEAD()` as looking forward.

---

# Concept 3 - Comparing Consecutive Rows (Q43)

Once you know the previous value,

you can compare it with the current one.

Example

| Previous | Current | Difference |
|----------:|--------:|-----------:|
| 2.99 | 4.99 | 2.00 |
| 4.99 | 7.99 | 3.00 |

This is useful for:

- Revenue growth
- Sales increases
- Customer spending changes

Trend analysis often begins with this comparison.

---

# Concept 4 - Previous and Next Rentals (Q44 & Q45)

Businesses frequently analyze customer activity.

Questions include:

- When was the customer's previous rental?
- When was the customer's next rental?

Example

```
Rental

↓

Previous Rental

↓

Current Rental

↓

Next Rental
```

These reports help understand customer behavior over time.

---

# Concept 5 - Customer Segmentation (Q46)

Not every business compares individual rows.

Sometimes businesses divide customers into groups.

Example

```
Top 25%

↓

Group 1

-----------------

Next 25%

↓

Group 2

-----------------

Next 25%

↓

Group 3

-----------------

Bottom 25%

↓

Group 4
```

`NTILE()` creates these groups automatically.

This is widely used for:

- Customer segmentation
- Marketing campaigns
- Loyalty programs
- Risk analysis

---

# Concept 6 - Choosing the Correct Function (Q47–Q49)

Before writing SQL,

ask yourself:

## Need the previous row?

↓

```sql
LAG()
```

---

## Need the next row?

↓

```sql
LEAD()
```

---

## Need equal-sized groups?

↓

```sql
NTILE()
```

The business question determines the function.

---

# Concept 7 - Thinking Before Comparing Rows (Q50)

Follow this thought process.

```
Business Question

↓

Need Every Row?

↓

Yes

↓

Need Previous Row?

↓

LAG()

--------------------

Need Next Row?

↓

LEAD()

--------------------

Need Customer Groups?

↓

NTILE()

↓

Business Report
```

Always begin with the business requirement.

---

# Comparison Workflow

```
Business Requirement

↓

Current Row

↓

Need Previous?

↓

LAG()

-------------------

Need Next?

↓

LEAD()

-------------------

Need Groups?

↓

NTILE()

↓

Business Insight
```

---

# Window Function Summary

| Function | Business Purpose |
|----------|------------------|
| `LAG()` | Compare with previous row |
| `LEAD()` | Compare with next row |
| `NTILE()` | Divide data into equal-sized groups |

---

# Common Business Applications

| Business Requirement | Window Function |
|----------------------|-----------------|
| Compare current payment with previous payment | `LAG()` |
| Compare current rental with next rental | `LEAD()` |
| Identify customer spending quartiles | `NTILE(4)` |
| Build customer segmentation reports | `NTILE()` |
| Analyze changes over time | `LAG()` / `LEAD()` |

---

# Common Mistakes

❌ Forgetting to include `ORDER BY` with `LAG()` or `LEAD()`.

❌ Assuming "previous" exists for the first row.

❌ Assuming "next" exists for the last row.

❌ Using `NTILE()` without ordering the data.

❌ Choosing `LAG()` when the business actually needs the next value.

❌ Thinking these functions change the number of rows.

---

# Day 5 Summary

Today you learned:

- `LAG()` retrieves values from previous rows.
- `LEAD()` retrieves values from following rows.
- `NTILE()` divides data into approximately equal groups.
- Comparing consecutive rows helps identify trends.
- Customer segmentation is a common use case for `NTILE()`.
- Window Functions make time-based and behavioral analysis much easier.

---

# What's Next?

In Day 6, you'll learn advanced analytical Window Functions, including:

- `FIRST_VALUE()`
- `LAST_VALUE()`
- Moving Averages
- Advanced trend analysis

These functions help answer questions such as:

- What was the customer's first payment?
- What is the customer's latest payment?
- How is revenue changing over time after smoothing short-term fluctuations?

Day 6 brings together everything you've learned so far to produce professional analytical reports.