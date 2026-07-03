# Thinking in SQL

## Week 4 - Window Functions & Analytical SQL

---

# Purpose

Week 1 taught you how to retrieve data.

Week 2 taught you how to connect related business entities.

Week 3 taught you how to transform raw data into business-friendly information.

Week 4 teaches something completely different.

It teaches you how to **analyze data without losing detail**.

This requires a new way of thinking.

---

# The Biggest Mental Shift

Before Week 4 your thinking looked like this:

```
Business Question

↓

Retrieve Data

↓

JOIN Tables

↓

Transform Data

↓

Business Report
```

Now your thinking becomes:

```
Business Question

↓

Retrieve Data

↓

Analyze Every Row

↓

Find Patterns

↓

Business Report
```

Notice something important.

The rows remain.

Only the analysis changes.

---

# Step 1 - Understand the Business Question

Never begin by thinking about SQL.

Start by understanding what the business wants.

Example

```
Which customers spend the most?
```

The business is asking for:

- Comparison
- Ranking

Not simply data retrieval.

---

# Step 2 - Identify the Business Metric

Every analytical question revolves around one or more metrics.

Examples

```
Revenue

Rental Count

Payment Amount

Rental Duration

Replacement Cost
```

Ask yourself:

> What exactly is being analyzed?

---

# Step 3 - Decide Whether Rows Should Stay

This is the most important decision in Week 4.

Ask yourself:

```
Should every row remain visible?
```

If the answer is:

```
No
```

Use:

```
GROUP BY
```

If the answer is:

```
Yes
```

Think:

```
Window Function
```

---

# Step 4 - Identify the Scope of Analysis

Ask yourself:

Should the calculation apply to:

```
Entire Database?
```

or

```
Each Customer?
```

or

```
Each Store?
```

or

```
Each Film Rating?
```

If the calculation restarts for each business group,

think:

```
PARTITION BY
```

---

# Step 5 - Decide Whether Order Matters

Some calculations ignore order.

Others depend on it.

Examples

```
Average Payment
```

Order doesn't matter.

---

```
Running Total
```

Order matters.

---

```
Previous Payment
```

Order matters.

---

```
Customer Ranking
```

Order matters.

Whenever sequence is important,

think:

```
ORDER BY
```

inside the Window Function.

---

# Step 6 - Choose the Analytical Function

Now identify the business requirement.

## Need a ranking?

Think:

```
ROW_NUMBER()

RANK()

DENSE_RANK()
```

---

## Need the previous row?

Think:

```
LAG()
```

---

## Need the next row?

Think:

```
LEAD()
```

---

## Need equal-sized business groups?

Think:

```
NTILE()
```

---

## Need the first value?

Think:

```
FIRST_VALUE()
```

---

## Need the latest value?

Think:

```
LAST_VALUE()
```

---

## Need cumulative analysis?

Think:

```
Running Total
```

---

## Need trend analysis?

Think:

```
Moving Average
```

---

# Step 7 - Build the Business Report

The report should answer the business question directly.

Example

Instead of:

```
Customer

Payment
```

Business prefers:

```
Customer

Payment

Running Total

Customer Rank

Average Payment

Previous Payment
```

One report can answer multiple questions simultaneously.

---

# Professional Thinking Examples

## Example 1

Business asks:

> Rank customers by total revenue.

Thinking:

```
Need Ranking

↓

Revenue

↓

Customer

↓

Rows must remain

↓

Window Function

↓

RANK()
```

---

## Example 2

Business asks:

> Compare today's payment with yesterday's payment.

Thinking:

```
Need Previous Row

↓

Order by Date

↓

LAG()
```

---

## Example 3

Business asks:

> Show cumulative monthly revenue.

Thinking:

```
Need Running Total

↓

Revenue

↓

Chronological Order

↓

SUM()

+

ORDER BY
```

---

## Example 4

Business asks:

> Divide customers into four spending categories.

Thinking:

```
Need Equal Groups

↓

NTILE(4)
```

---

# Analytical Thinking Workflow

Every Window Function problem should follow this sequence.

```
Business Question

↓

Business Entity

↓

Business Metric

↓

Keep Every Row?

↓

Yes

↓

Need Groups?

↓

PARTITION BY

↓

Need Sequence?

↓

ORDER BY

↓

Choose Window Function

↓

Business Report
```

---

# Common Beginner Thinking

```
Today's Topic

↓

ROW_NUMBER()

↓

Let's find a question.
```

This is backwards.

---

# Professional Thinking

```
Business Question

↓

Business Analysis

↓

Choose Window Function

↓

Write SQL
```

SQL is the final step.

Analysis comes first.

---

# Questions Every SQL Developer Should Ask

Before writing a Window Function query, ask yourself:

□ What is the business trying to understand?

□ What is being analyzed?

□ Should every row remain visible?

□ Does the calculation restart for each group?

□ Does the order of rows matter?

□ Which Window Function best matches the requirement?

□ Will the final report help someone make a business decision?

---

# Thinking Progression Across the Course

```
Week 1

Retrieve Data

        ↓

Week 2

Connect Data

        ↓

Week 3

Transform Data

        ↓

Week 4

Analyze Data

        ↓

Week 5

Solve Complex Problems

        ↓

Week 6

Build Business Intelligence

        ↓

Week 7

Optimize SQL

        ↓

Week 8

Think Like a Senior SQL Developer
```

---

# Final Thought

Window Functions are not difficult because of their syntax.

They are difficult because they require a new mindset.

Professional SQL developers don't ask:

> Which Window Function should I use?

They ask:

> What business insight am I trying to uncover?

Once you can answer that question, choosing the correct Window Function becomes much easier.