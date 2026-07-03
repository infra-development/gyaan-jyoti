# Week 4 Checklist

## Window Functions & Analytical SQL

---

# Purpose

This checklist helps you verify that you've mastered every important concept from Week 4 before moving to Week 5.

Don't rush through it.

Window Functions are one of the most important SQL topics you'll learn.

Take the time to ensure you understand both the SQL syntax and the analytical thinking behind it.

---

# Day 1 – Understanding Window Functions

## I can...

□ Explain why Window Functions were introduced.

□ Explain the difference between `GROUP BY` and Window Functions.

□ Explain why Window Functions preserve every row.

□ Use the `OVER()` clause correctly.

□ Calculate totals without reducing rows.

□ Calculate averages without reducing rows.

□ Identify when a Window Function should be preferred over `GROUP BY`.

□ Explain the analytical thinking process before writing SQL.

---

# Day 2 – PARTITION BY

## I can...

□ Explain what `PARTITION BY` does.

□ Partition data by customer.

□ Partition data by store.

□ Partition data by film rating.

□ Calculate totals within each partition.

□ Calculate averages within each partition.

□ Count rows within each partition.

□ Explain the difference between `GROUP BY` and `PARTITION BY`.

---

# Day 3 – ORDER BY Inside Window Functions

## I can...

□ Explain why ordering matters in Window Functions.

□ Calculate running totals.

□ Calculate running counts.

□ Calculate cumulative revenue.

□ Calculate running totals within each customer.

□ Calculate running totals within each store.

□ Explain the difference between a running total and an aggregate total.

□ Identify reports that require ordered analysis.

---

# Day 4 – Ranking Functions

## I can...

□ Use `ROW_NUMBER()` correctly.

□ Use `RANK()` correctly.

□ Use `DENSE_RANK()` correctly.

□ Explain the differences between the three ranking functions.

□ Rank customers by revenue.

□ Rank data within partitions.

□ Find the Top N records in each group.

□ Choose the correct ranking function for a business requirement.

---

# Day 5 – Comparing Rows

## I can...

□ Use `LAG()` correctly.

□ Use `LEAD()` correctly.

□ Use `NTILE()` correctly.

□ Compare consecutive rows.

□ Compare payments over time.

□ Compare rentals over time.

□ Divide data into equal-sized analytical groups.

□ Explain when each comparison function should be used.

---

# Day 6 – Advanced Analytical Functions

## I can...

□ Use `FIRST_VALUE()` correctly.

□ Use `LAST_VALUE()` correctly.

□ Calculate moving averages.

□ Explain moving averages.

□ Identify trends over time.

□ Combine multiple analytical calculations.

□ Understand the effect of ordering on analytical results.

□ Explain the business value of advanced Window Functions.

---

# Day 7 – Integration

## I can...

□ Combine multiple Window Functions in one query.

□ Build customer dashboards.

□ Build store dashboards.

□ Build payment trend reports.

□ Build film analytics reports.

□ Build executive dashboards.

□ Explain every analytical calculation I perform.

□ Write clean and readable analytical SQL.

---

# Analytical Thinking Checklist

Before writing SQL, I naturally ask:

□ What is the business trying to analyze?

□ What business metric is important?

□ Should every row remain visible?

□ Does the calculation restart for each business group?

□ Does row order matter?

□ Do I need ranking?

□ Do I need previous or next row comparison?

□ Do I need running calculations?

□ Which Window Function best solves the problem?

---

# Window Functions Mastered

## Foundation

□ `OVER()`

□ `PARTITION BY`

□ `ORDER BY`

---

## Ranking

□ `ROW_NUMBER()`

□ `RANK()`

□ `DENSE_RANK()`

---

## Row Comparison

□ `LAG()`

□ `LEAD()`

□ `NTILE()`

---

## Advanced Analytics

□ `FIRST_VALUE()`

□ `LAST_VALUE()`

□ Running Totals

□ Moving Averages

---

# Professional SQL Habits

I now:

□ Think about business analysis before SQL syntax.

□ Choose Window Functions only when every row must remain visible.

□ Use `PARTITION BY` appropriately.

□ Use `ORDER BY` only when sequence matters.

□ Select the correct ranking function.

□ Build reports that are easy for business users to understand.

□ Write maintainable analytical SQL.

□ Explain the business purpose of every Window Function I use.

---

# Ready for Week 5?

You are ready to move forward if you can confidently:

✓ Explain why Window Functions exist.

✓ Choose between `GROUP BY` and Window Functions.

✓ Analyze data without collapsing rows.

✓ Rank business entities correctly.

✓ Compare previous and next rows.

✓ Build running totals.

✓ Calculate moving averages.

✓ Combine multiple Window Functions in a single report.

✓ Explain your analytical thinking before writing SQL.

---

# Week 4 Achievement

Congratulations!

You have completed another major milestone.

Your SQL journey now looks like this:

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

Solve Complex SQL Problems
```

Week 5 introduces a different style of thinking.

Instead of solving problems in one query, you'll learn how to **break complex business requirements into smaller, reusable SQL components** using:

- Subqueries
- Correlated Subqueries
- Common Table Expressions (CTEs)
- Recursive CTEs
- UNION
- INTERSECT
- EXCEPT

These techniques are essential for writing modular, maintainable, and production-quality SQL.