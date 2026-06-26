# Week 2 - README

## Multi-Table Analysis and Business Reporting

---

# Welcome to Week 2

Congratulations on completing Week 1!

During Week 1, you learned the fundamental building blocks of SQL:

- Retrieving data
- Filtering rows
- Sorting results
- Aggregating data
- Grouping information
- Basic joins

Those skills allow you to answer simple business questions.

Week 2 changes your perspective.

You will no longer think about **tables**.

You will begin thinking about **business processes**.

This is one of the biggest transitions in becoming an SQL developer.

---

# Week 2 Goal

By the end of this week, you should be able to answer questions like:

- Which customers generate the most revenue?
- Which actors appear in the most films?
- Which categories are rented most frequently?
- Which films have never been rented?
- Which store performs better?
- Which customers have never rented a movie?
- Which films exist in both stores?

Notice something.

None of these questions can be answered from a single table.

You must combine information stored across multiple business entities.

That is the focus of Week 2.

---

# Learning Philosophy

Week 1 taught you SQL syntax.

Week 2 teaches you **SQL reasoning**.

Instead of asking:

> Which SQL keyword should I use?

Start asking:

> Which business entities contain the information?

That small change completely changes how experienced SQL developers work.

---

# Learning Outcomes

By the end of Week 2 you will be able to:

- Understand complex table relationships
- Read relationship paths confidently
- Write multi-table JOIN queries
- Use table aliases effectively
- Build business reports
- Combine JOIN, GROUP BY and HAVING
- Understand duplicate rows after joins
- Use DISTINCT correctly
- Find missing information using LEFT JOIN
- Think in terms of business processes instead of isolated tables

---

# Week 2 Topics

## Lesson 1

Relationship Paths

Learn to navigate the Pagila database using relationship chains.

---

## Lesson 2

Advanced Join Thinking

Understand when to use INNER JOIN and LEFT JOIN.

Learn why duplicate rows appear.

---

## Lesson 3

Building Business Reports

Combine joins with grouping and aggregation.

---

## Lesson 4

DISTINCT and Duplicate Thinking

Understand why duplicates occur and how to work with them correctly.

---

## Lesson 5

Business Processes

Learn how rentals, inventory, customers and payments work together.

---

## Lesson 6

Operational and Analytical Reporting

Solve realistic reporting questions used by businesses.

---

## Lesson 7

Week Integration

Apply everything learned through a realistic business case.

---

# Repository Structure

```
Week_2/

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
    questions_w2.md
    hint_w2.md
    answer_d1.sql
    answer_d2.sql
    ...
    answer_d7.sql

03_thinking/
    thinking_in_sql_w2.md
    sql_pattern_map_w2.md

04_review/
    common_mistakes_w2.md
    week2_quiz.md
    week2_checklist.md
    week2_final_challenge.md
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

The struggle is where learning happens.

---

# Expected Time

Each lesson requires approximately:

- Reading: 30–45 minutes
- Practice: 45–60 minutes
- Review: 15–20 minutes

Total:

Approximately **2 hours per lesson**.

Estimated total for Week 2:

**12–15 hours**

---

# What Makes Week 2 Different?

Week 1 focused on individual SQL concepts.

Week 2 focuses on combining those concepts.

For example, a typical Week 2 query might require:

- Multiple JOINs
- GROUP BY
- HAVING
- ORDER BY

The challenge is no longer remembering syntax.

The challenge is understanding the business problem.

---

# Before You Start

You should already be comfortable with:

- SELECT
- WHERE
- ORDER BY
- Aggregate Functions
- GROUP BY
- HAVING
- Basic JOINs

If not, revisit Week 1 before continuing.

---

# Success Criteria

You are ready for Week 3 if you can confidently:

- Read an unfamiliar schema.
- Identify relationship paths.
- Write multi-table reports.
- Explain why duplicates occur.
- Use DISTINCT appropriately.
- Find missing data with LEFT JOIN.
- Translate business questions into multi-table SQL.

---

# Final Thought

Professional SQL developers rarely solve problems using a single table.

They solve problems by understanding how business entities relate to each other.

Week 2 is where you begin making that transition.