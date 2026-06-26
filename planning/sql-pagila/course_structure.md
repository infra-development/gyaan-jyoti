# SQL From Intermediate to Master

## Course Structure & Learning Roadmap

---

# Course Vision

This course is designed to teach **SQL as a problem-solving language**, not merely a query language.

By the end of the course, students should be able to:

* Understand a business requirement.
* Identify the required data.
* Determine the correct SQL approach before writing any SQL.
* Write clean, readable and maintainable SQL.
* Debug incorrect queries.
* Optimize slow queries.
* Explain their SQL during technical interviews.
* Build real-world reports and analytical solutions.

The objective is not simply to learn SQL syntax, but to think like an SQL professional.

---

# Target Audience

This course is intended for:

* Software Engineers
* Backend Developers
* Data Engineers
* Data Analysts
* BI Developers
* Students preparing for SQL interviews
* Anyone wanting to master SQL using practical business scenarios

---

# Prerequisites

Students should have:

* Basic computer knowledge
* PostgreSQL installed
* Pagila database imported
* No prior SQL knowledge is required

---

# Learning Philosophy

Every SQL topic in this course answers three questions.

## 1. What is this SQL feature?

Covered in:

* explanation_d1.md
* explanation_d2.md
* ...

These files explain syntax and concepts.

---

## 2. When should I use this SQL feature?

Covered in:

business_sql_patterns_wX.md

These files teach SQL decision making and business thinking.

---

## 3. How is this used in real business?

Covered in:

* questions_wX.md
* answer_dX.sql
* weekX_final_challenge.md

Students solve realistic business problems using SQL.

---

# Course Design Principles

## Principle 1

One database throughout the entire course.

Database used:

**Pagila**

No other databases will be introduced.

Students should become experts in navigating one schema rather than repeatedly learning new schemas.

---

## Principle 2

Business Problem First.

SQL Syntax Second.

Students should always ask:

> What is the business asking?

before asking:

> Which SQL should I write?

---

## Principle 3

Increase Problem Complexity.

Not Schema Complexity.

The database remains the same.

Only the difficulty of the business problems increases.

---

## Principle 4

Teach SQL Through Business Scenarios.

Every SQL feature exists because it solves a business problem.

The course never introduces syntax without explaining its practical purpose.

---

## Principle 5

Avoid Repetition.

Once a concept has been fully explained, later lessons build upon it instead of repeating it.

---

## Principle 6

Everything Builds Upon Previous Weeks.

Every week assumes complete understanding of previous weeks.

Nothing is taught in isolation.

---

## Principle 7

Teach Thinking Before Coding.

Students should be able to identify the required SQL concepts before writing a single line of SQL.

---

# Learning Roadmap

Week 1

↓

SQL Foundations & Business Thinking

↓

Week 2

↓

Advanced Joins & Multi-table Reporting

↓

Week 3

↓

Data Transformation & Conditional Logic

↓

Week 4

↓

Window Functions & Analytical SQL

↓

Week 5

↓

Advanced Query Construction

↓

Week 6

↓

Business Analytics & Reporting

↓

Week 7

↓

Performance & Query Optimization

↓

Week 8

↓

Real-world Projects & Interview Preparation

---

# Weekly Deliverables

Every week follows exactly the same structure.

```
Week X

├── explanation_d1.md
├── explanation_d2.md
├── explanation_d3.md
├── explanation_d4.md
├── explanation_d5.md
├── explanation_d6.md
├── explanation_d7.md

├── questions_wX.md

├── answer_d1.sql
├── answer_d2.sql
├── answer_d3.sql
├── answer_d4.sql
├── answer_d5.sql
├── answer_d6.sql
├── answer_d7.sql

├── hint_wX.md

├── business_sql_patterns_wX.md

├── weekX_final_challenge.md

└── weekX_cheatsheet.md
```

This consistency makes navigation easy throughout the course.

---

# Week 1

## Theme

SQL Foundations & Business Thinking

### Goal

Understand relational databases and answer simple business questions.

### Major Topics

* Database Exploration
* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* Aggregate Functions
* INNER JOIN
* LEFT JOIN
* NULL
* Basic Subqueries

### Business Focus

Understanding business data.

### Outcome

Students can answer straightforward business questions using SQL.

---

# Week 2

## Theme

Advanced Joins & Multi-table Reporting

### Goal

Become comfortable navigating relationships across multiple tables.

### Major Topics

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN
* CROSS JOIN
* SELF JOIN
* USING
* Multi-table joins
* Relationship traversal
* Reporting queries

### Business Focus

Operational reporting.

### Outcome

Students can create reports spanning multiple related entities.

---

# Week 3

## Theme

Data Transformation & Conditional Logic

### Goal

Prepare raw data for reporting.

### Major Topics

* CASE
* COALESCE
* NULLIF
* CAST
* String Functions
* Date Functions
* Formatting
* Data Cleaning

### Business Focus

Preparing business-ready data.

### Outcome

Students can clean and transform operational data.

---

# Week 4

## Theme

Window Functions & Analytical SQL

### Goal

Solve advanced analytical problems.

### Major Topics

* OVER
* PARTITION BY
* ORDER BY
* ROW_NUMBER
* RANK
* DENSE_RANK
* NTILE
* LAG
* LEAD
* FIRST_VALUE
* LAST_VALUE
* Running Totals
* Moving Averages

### Business Focus

Analytical reporting.

### Outcome

Students can solve ranking and trend analysis problems.

---

# Week 5

## Theme

Advanced Query Construction

### Goal

Break complex problems into smaller reusable components.

### Major Topics

* Subqueries
* Correlated Subqueries
* CTE
* Recursive CTE
* UNION
* UNION ALL
* INTERSECT
* EXCEPT

### Business Focus

Complex business logic.

### Outcome

Students can write modular, maintainable SQL.

---

# Week 6

## Theme

Business Analytics & Reporting

### Goal

Develop Business Intelligence style reporting skills.

### Major Topics

* Conditional Aggregation
* Pivot Techniques
* Crosstab Concepts
* Cohort Analysis
* Funnel Analysis
* Time Series Analysis
* Gap & Island Problems
* Customer Segmentation
* Revenue Trends

### Business Focus

Executive dashboards.

### Outcome

Students can build realistic business reports.

---

# Week 7

## Theme

Performance & Query Optimization

### Goal

Write production-quality SQL.

### Major Topics

* Indexes
* EXPLAIN
* EXPLAIN ANALYZE
* Execution Plans
* EXISTS
* IN
* ANY
* ALL
* Query Optimization
* Materialized Views
* Common Performance Anti-patterns

### Business Focus

Scalable SQL systems.

### Outcome

Students can analyze and improve query performance.

---

# Week 8

## Theme

Real-world Projects & Interview Preparation

### Goal

Become confident solving real-world SQL problems.

### Major Topics

* End-to-end Reporting
* Dashboard Queries
* Interview Questions
* Mixed SQL Challenges
* Optimization Challenges
* Debugging Exercises
* Capstone Projects

### Business Focus

Production systems and technical interviews.

### Outcome

Students can independently solve complex SQL problems.

---

# Business Skill Progression

| Week   | Business Skill                      |
| ------ | ----------------------------------- |
| Week 1 | Understand business data            |
| Week 2 | Build operational reports           |
| Week 3 | Transform and clean data            |
| Week 4 | Analyze trends and rankings         |
| Week 5 | Solve complex business logic        |
| Week 6 | Build BI reports                    |
| Week 7 | Optimize production SQL             |
| Week 8 | Deliver complete business solutions |

---

# Difficulty Progression

```
Week 1
Foundation

Week 2
Intermediate

Week 3
Intermediate+

Week 4
Advanced

Week 5
Advanced+

Week 6
Expert

Week 7
Senior SQL Developer

Week 8
Production & Interview Ready
```

---

# End Goal

After completing this course, students should be able to:

* Understand unfamiliar business requirements.
* Navigate the Pagila database without assistance.
* Determine which SQL concepts solve a given business problem.
* Write clean, readable, maintainable SQL.
* Optimize SQL for production systems.
* Explain SQL solutions confidently during interviews.
* Build complete business reports and analytical dashboards.

The student will not only know SQL syntax but also possess the problem-solving skills expected from an experienced SQL professional.
