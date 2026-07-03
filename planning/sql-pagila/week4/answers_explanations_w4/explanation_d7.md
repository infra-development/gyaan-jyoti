# Day 7 - Building Complete Analytical Reports

## Learning Objectives

By the end of this lesson, you should be able to:

- Combine multiple Window Functions in a single SQL query.
- Build complete business reports for different departments.
- Choose the appropriate Window Function for each analytical requirement.
- Explain your analytical thinking before writing SQL.
- Design reports similar to those used in Business Intelligence and Data Analytics.

---

# Introduction

Throughout Week 4, you've learned Window Functions one concept at a time.

Day 1

↓

Understanding Window Functions

---

Day 2

↓

PARTITION BY

---

Day 3

↓

ORDER BY

---

Day 4

↓

Ranking Functions

---

Day 5

↓

LAG(), LEAD(), NTILE()

---

Day 6

↓

FIRST_VALUE(), LAST_VALUE(), Moving Averages

---

Today, everything comes together.

Real business reports rarely use just one Window Function.

Instead, they combine several analytical calculations into a single report.

---

# From SQL Queries to Business Dashboards

Consider a manager reviewing customer performance.

The manager doesn't want separate reports for:

- Customer Revenue
- Customer Rank
- Running Revenue
- Previous Payment

Instead, they want one report containing all of this information.

For example:

| Customer | Revenue | Rank | Running Revenue | Previous Payment |
|----------|--------:|-----:|----------------:|-----------------:|
| Mary | 186.55 | 2 | 186.55 | 7.99 |
| John | 152.43 | 5 | 152.43 | 5.99 |

Professional SQL combines multiple Window Functions to produce these reports.

---

# Concept 1 - Customer Revenue Dashboard (Q61)

Business wants to know:

- Total revenue
- Overall customer rank
- Store rank

Thinking process

```
Customer

↓

Revenue

↓

Ranking

↓

Global

+

Store

↓

Dashboard
```

This report combines:

- Aggregation
- PARTITION BY
- RANK()

---

# Concept 2 - Store Performance Dashboard (Q62)

Businesses compare stores using several metrics.

Example:

| Store | Revenue | Average Revenue | Rank |
|-------:|--------:|----------------:|-----:|
| 1 | 34000 | 33708 | 1 |
| 2 | 33417 | 33708 | 2 |

One report answers multiple management questions.

---

# Concept 3 - Film Popularity Dashboard (Q63)

Management wants to identify:

- Most rented films
- Film rankings
- Popular titles

Instead of multiple reports,

one analytical report provides all the answers.

This combines:

- Aggregation
- Ranking
- Ordering

---

# Concept 4 - Revenue Trend Reports (Q64)

Businesses monitor revenue over time.

Example

| Month | Revenue | Running Revenue | Moving Average |
|-------|---------:|----------------:|---------------:|
| Jan | 4200 | 4200 | 4200 |
| Feb | 4500 | 8700 | 4350 |
| Mar | 4700 | 13400 | 4467 |

Notice that several analytical calculations appear together.

---

# Concept 5 - Multiple Rankings (Q65)

Businesses often require more than one ranking.

Example

Customer

↓

Global Rank

↓

Store Rank

One customer can have:

- Global Rank = 5
- Store Rank = 2

Window Functions make this simple.

---

# Concept 6 - Trend Analysis (Q66 & Q67)

Trend reports often combine:

- Running totals
- Previous values
- Next values
- Customer activity

Instead of showing isolated events,

they reveal business behaviour over time.

---

# Concept 7 - Combining Window Functions (Q68)

One SQL query may contain:

```sql
SUM() OVER()

AVG() OVER()

ROW_NUMBER()

RANK()

LAG()

LEAD()

FIRST_VALUE()

LAST_VALUE()
```

Every Window Function answers a different business question.

Together they produce rich analytical reports.

---

# Concept 8 - Thinking Like an Analyst (Q69)

Professional SQL developers never begin by writing SQL.

They begin by understanding the business.

Their thinking process is:

```
Business Question

↓

Business Entity

↓

Business Metric

↓

Should Every Row Stay?

↓

Window Function

↓

Need Groups?

↓

PARTITION BY

↓

Need Sequence?

↓

ORDER BY

↓

Choose Analytical Function

↓

Business Dashboard
```

Notice that SQL is almost the final step.

Business thinking comes first.

---

# Concept 9 - Choosing the Right Window Function (Q70)

Every Window Function has a specific purpose.

| Requirement | Window Function |
|-------------|-----------------|
| Preserve rows | `OVER()` |
| Analyze groups | `PARTITION BY` |
| Chronological analysis | `ORDER BY` |
| Unique numbering | `ROW_NUMBER()` |
| Competition ranking | `RANK()` |
| Continuous ranking | `DENSE_RANK()` |
| Previous value | `LAG()` |
| Next value | `LEAD()` |
| Customer segmentation | `NTILE()` |
| First event | `FIRST_VALUE()` |
| Latest event | `LAST_VALUE()` |
| Running analysis | Running Total |
| Trend analysis | Moving Average |

Understanding the business requirement allows you to choose the correct function naturally.

---

# Complete Analytical Workflow

Professional SQL development follows this process.

```
Business Requirement

↓

Business Entity

↓

Business Metric

↓

Retrieve Data

↓

JOIN Tables

↓

Transform Data

↓

Need Every Row?

↓

Window Functions

↓

PARTITION BY

↓

ORDER BY

↓

Ranking / Comparison / Trends

↓

Business Dashboard
```

---

# Real-World Example

Imagine a Sales Director asks:

> "Show me each customer's revenue, ranking, previous payment, running total, and average payment."

A beginner thinks:

```
Which SQL function should I use?
```

An experienced SQL developer thinks:

```
Revenue

↓

Ranking

↓

Running Total

↓

Previous Payment

↓

Average

↓

Combine Window Functions

↓

One Dashboard
```

The focus is always on solving the business problem.

---

# Common Mistakes

❌ Creating separate queries for every business metric.

❌ Choosing Window Functions before understanding the requirement.

❌ Forgetting that multiple Window Functions can be used in one query.

❌ Building reports that answer only one business question.

❌ Writing technically correct SQL that is difficult for business users to understand.

---

# Week 4 Summary

This week you learned how to:

- Perform analytical calculations without reducing rows.
- Partition data into logical business groups.
- Build running totals.
- Rank business entities.
- Compare previous and next rows.
- Segment customers.
- Analyze trends.
- Combine multiple Window Functions into complete business reports.

You can now build analytical SQL reports similar to those used in real organizations.

---

# Looking Ahead to Week 5

Week 5 introduces another major shift in SQL thinking.

Until now, each problem has been solved with a single query.

From Week 5 onward, you'll learn how to break large business problems into smaller, reusable components using:

- Subqueries
- Correlated Subqueries
- Common Table Expressions (CTEs)
- Recursive CTEs
- UNION
- UNION ALL
- INTERSECT
- EXCEPT

These techniques allow you to write SQL that is cleaner, more modular, easier to debug, and closer to production-quality code.

---

# Congratulations!

You have completed **Week 4 – Window Functions & Analytical SQL**.

Your SQL journey has progressed from:

```
Week 1
Retrieve Data

        ✓

↓

Week 2
Connect Data

        ✓

↓

Week 3
Transform Data

        ✓

↓

Week 4
Analyze Data

        ✓

↓

Week 5
Build Complex SQL Solutions
```

You are now thinking beyond SQL syntax.

You are beginning to think like a professional SQL developer who understands business problems, selects the appropriate analytical technique, and builds meaningful reports that help organizations make better decisions.