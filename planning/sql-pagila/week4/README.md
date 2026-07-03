# Week 4 - README

## Window Functions & Analytical SQL

---

# Welcome to Week 4

Congratulations on completing Week 3!

So far you've learned how to:

- Retrieve data
- Combine multiple tables
- Build business reports
- Transform raw business data
- Format text and dates
- Apply business rules using CASE
- Handle NULL values
- Prepare business-ready reports

Those skills allow you to answer **what happened**.

Week 4 takes SQL to the next level.

You will begin answering questions like:

- Who is the highest-paying customer?
- Which film ranks first in every category?
- How is revenue changing over time?
- What was the previous payment?
- What will the next payment be?
- How does each customer compare to others?

These questions require **analytical SQL**.

This is where **Window Functions** become one of the most powerful features in SQL.

---

# Week 4 Goal

By the end of this week, you should be able to answer questions like:

- Rank customers by total revenue.
- Find the top rented film in every category.
- Calculate running revenue totals.
- Compare today's payment with the previous payment.
- Identify revenue trends.
- Divide customers into spending groups.
- Find the first and latest transaction for every customer.
- Calculate moving averages.

Notice something.

The database already contains the data.

The challenge is no longer retrieving or transforming it.

The challenge is **analyzing** it without losing detail.

That is the focus of Week 4.

---

# Learning Philosophy

Week 3 taught you:

> How should this data be presented?

Week 4 teaches you:

> How should this data be analyzed?

Traditional SQL often groups rows together.

Window Functions allow you to perform calculations while **keeping every individual row**.

This is one of the biggest advantages of modern SQL.

---

# Learning Outcomes

By the end of Week 4 you will be able to:

- Understand the purpose of Window Functions.
- Use the `OVER()` clause confidently.
- Partition data into logical groups.
- Sort data within each partition.
- Rank rows using multiple ranking functions.
- Compare current rows with previous and next rows.
- Calculate running totals.
- Calculate moving averages.
- Identify trends over time.
- Build analytical business reports.

---

# Week 4 Topics

## Lesson 1

Introduction to Window Functions

Learn:

- Why Window Functions exist.
- The `OVER()` clause.
- Difference between GROUP BY and Window Functions.

---

## Lesson 2

PARTITION BY

Learn how to divide data into logical groups while keeping every row.

Examples:

- Revenue by Customer
- Revenue by Store
- Rentals by Category

---

## Lesson 3

ORDER BY Inside Window Functions

Learn how ordering changes analytical calculations.

Examples:

- Running totals
- Sequential numbering
- Ordered analysis

---

## Lesson 4

Ranking Functions

Learn:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()

Understand when each ranking method should be used.

---

## Lesson 5

Comparing Rows

Learn:

- NTILE()
- LAG()
- LEAD()

Compare rows with previous and next values.

---

## Lesson 6

Advanced Analytical Functions

Learn:

- FIRST_VALUE()
- LAST_VALUE()
- Running Totals
- Moving Averages

Build realistic analytical reports.

---

## Lesson 7

Week Integration

Combine every Window Function to solve realistic business analysis problems.

---

# Repository Structure

```
Week_4/

README.md

01_explanation/
    explanation_d1.md
    explanation_d2.md
    explanation_d3.md
    explanation_d4.md
    explanation_d5.md
    explanation_d6.md
    explanation_d7.md

02_practice/
    questions_w4.md
    hint_w4.md
    answer_d1.sql
    answer_d2.sql
    ...
    answer_d7.sql

03_thinking/
    thinking_in_sql_w4.md
    business_sql_patterns_w4.md

04_review/
    common_mistakes_w4.md
    week4_quiz.md
    week4_checklist.md
    week4_final_challenge.md
```

---

# How to Study

For every lesson follow this order.

```
Explanation

↓

Practice Questions

↓

Hints (Only if Needed)

↓

Write SQL

↓

Check Answers

↓

Update Thinking Guide
```

Don't memorize Window Functions.

Instead, understand the business problem each function solves.

---

# Expected Time

Each lesson requires approximately:

- Reading: 35–45 minutes
- Practice: 60–75 minutes
- Review: 15–20 minutes

Total:

Approximately **2 to 2.5 hours per lesson**

Estimated total for Week 4:

**14–17 hours**

Window Functions require more practice than previous topics.

---

# What Makes Week 4 Different?

Week 1 retrieved data.

Week 2 connected data.

Week 3 transformed data.

Week 4 analyzes data.

For the first time, you'll answer analytical questions **without reducing the number of rows**.

For example:

Traditional SQL:

```
GROUP BY

↓

One row per customer
```

Window Functions:

```
Every payment remains visible

+

Customer ranking

+

Running totals

+

Business analytics
```

This is the biggest conceptual shift in SQL so far.

---

# Before You Start

You should already be comfortable with:

- SELECT
- WHERE
- GROUP BY
- HAVING
- Aggregate Functions
- Multi-table JOINs
- CASE
- COALESCE
- CAST
- String Functions
- Date Functions

If not, revisit Weeks 1–3 before continuing.

---

# Success Criteria

You are ready for Week 5 if you can confidently:

- Explain the purpose of Window Functions.
- Use OVER() correctly.
- Partition data effectively.
- Rank rows correctly.
- Compare previous and next rows.
- Calculate running totals.
- Calculate moving averages.
- Build analytical business reports.

---

# Final Thought

Business Intelligence is not about retrieving more data.

It is about discovering patterns within data.

Window Functions allow SQL developers to perform powerful analytical calculations while preserving every individual row.

Week 4 is where you begin thinking like a Data Analyst, Business Intelligence Developer, and Senior SQL Developer.

Welcome to Analytical SQL.