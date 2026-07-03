# Week 3 - README

## Data Transformation, Conditional Logic & Advanced JOINs

---

# Welcome to Week 3

Congratulations on completing Week 2!

During Week 2, you learned how to:

- Navigate relationship paths
- Build multi-table queries
- Create operational reports
- Understand duplicate rows
- Find missing information
- Think in terms of business processes

Those skills allow you to retrieve and analyze business data.

Week 3 takes the next step.

You will learn how to **transform raw data into meaningful business information**.

Real-world data is rarely stored in the exact format required for reports.

As an SQL developer, one of your primary responsibilities is to clean, transform, format, and enrich that data before presenting it to the business.

---

# Week 3 Goal

By the end of this week, you should be able to answer questions like:

- Show "Active" instead of 1 and "Inactive" instead of 0.
- Replace missing phone numbers with "Not Available".
- Display customer names in a consistent format.
- Calculate customer age from date of birth.
- Display rental dates in business-friendly formats.
- Convert values between different data types.
- Compare different JOIN techniques and know when to use them.

Notice something.

The data already exists.

Your job is to make it meaningful, readable, and useful for business users.

That is the focus of Week 3.

---

# Learning Philosophy

Week 2 taught you **where to find data**.

Week 3 teaches you **how to present data**.

Instead of asking:

> Which table contains the information?

Start asking:

> How should this information be transformed before presenting it?

Professional SQL developers spend a significant amount of time transforming data rather than simply retrieving it.

---

# Learning Outcomes

By the end of Week 3 you will be able to:

- Transform raw business data into readable reports.
- Use conditional logic with CASE.
- Handle NULL values correctly using COALESCE and NULLIF.
- Convert between data types using CAST.
- Format strings for business reports.
- Manipulate dates and timestamps.
- Understand SELF JOIN.
- Understand the USING clause.
- Compare INNER, LEFT, RIGHT and FULL JOINs.
- Choose the appropriate JOIN for different business situations.
- Write cleaner and more readable SQL.

---

# Week 3 Topics

## Lesson 1

Advanced JOIN Concepts

Review JOIN thinking and learn:

- SELF JOIN
- USING
- RIGHT JOIN
- FULL JOIN

Understand when each JOIN is useful and why LEFT JOIN is usually preferred.

---

## Lesson 2

Conditional Logic

Learn how to make SQL decisions using:

- CASE
- CASE WHEN
- Nested CASE

Convert raw values into business-friendly information.

---

## Lesson 3

Handling NULL Values

Learn:

- COALESCE
- NULLIF

Handle incomplete and missing data safely.

---

## Lesson 4

Data Type Conversion

Learn:

- CAST
- Type Conversion

Convert numbers, strings, dates, and timestamps into the required formats.

---

## Lesson 5

String Functions

Learn how to:

- CONCAT
- UPPER
- LOWER
- TRIM
- REPLACE
- SUBSTRING
- LENGTH

Prepare text for reports and business applications.

---

## Lesson 6

Date & Time Functions

Learn:

- CURRENT_DATE
- CURRENT_TIMESTAMP
- AGE
- EXTRACT
- DATE_TRUNC
- TO_CHAR

Generate meaningful business reports involving dates and time.

---

## Lesson 7

Week Integration

Combine everything learned this week to clean, transform, and present business-ready information using realistic reporting scenarios.

---

# Repository Structure

```
Week_3/

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
    questions_w3.md
    hint_w3.md
    answer_d1.sql
    answer_d2.sql
    ...
    answer_d7.sql

03_thinking/
    thinking_in_sql_w3.md
    business_sql_patterns_w3.md

04_review/
    common_mistakes_w3.md
    week3_quiz.md
    week3_checklist.md
    week3_final_challenge.md
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

Never read the answers first.

Learning happens when you attempt to solve the problem yourself.

---

# Expected Time

Each lesson requires approximately:

- Reading: 30–45 minutes
- Practice: 45–60 minutes
- Review: 15–20 minutes

Total:

Approximately **2 hours per lesson**

Estimated total for Week 3:

**12–15 hours**

---

# What Makes Week 3 Different?

Week 2 focused on retrieving data.

Week 3 focuses on preparing that data for business users.

A typical Week 3 query might require:

- CASE
- COALESCE
- CAST
- String Functions
- Date Functions
- JOINs
- Formatting

The challenge is no longer finding the data.

The challenge is presenting it clearly.

---

# Before You Start

You should already be comfortable with:

- Relationship Paths
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- COUNT()
- SUM()
- DISTINCT
- Multi-table Reporting

If not, revisit Week 2 before continuing.

---

# Success Criteria

You are ready for Week 4 if you can confidently:

- Transform raw business data.
- Write complex CASE expressions.
- Handle NULL values correctly.
- Convert between data types.
- Format text and dates.
- Understand SELF JOIN.
- Compare different JOIN types.
- Build clean, business-friendly reports.

---

# Final Thought

Retrieving data is only half the job.

The real value comes from transforming raw information into something that businesses can understand and use for decision-making.

Week 3 is where you begin thinking like a professional SQL developer who prepares data—not just queries it.