# Thinking in SQL

## Week 5 - Advanced Query Construction

---

# Purpose

Weeks 1 through 4 taught you individual SQL skills.

- Retrieve data
- Connect data
- Transform data
- Analyze data

Week 5 teaches something different.

It teaches you **how to design SQL solutions**.

Instead of solving a business problem with one large SQL query, you'll learn how to divide it into smaller, reusable pieces.

This is one of the biggest differences between intermediate SQL developers and senior SQL developers.

---

# The Biggest Mental Shift

Before Week 5 your thinking looked like this.

```
Business Question

↓

Write SQL

↓

Business Report
```

That works for small problems.

Large business problems require another step.

```
Business Question

↓

Break into Smaller Problems

↓

Solve Each Problem

↓

Combine Results

↓

Business Report
```

This is the mindset of professional SQL development.

---

# Step 1 - Understand the Business Problem

Never begin by writing SQL.

First understand what the business actually needs.

Example

```
Find customers whose spending is above
the average customer spending.
```

This is actually two problems.

Problem 1

Calculate customer spending.

Problem 2

Compare each customer with the average.

Immediately you should recognize that the problem can be divided.

---

# Step 2 - Identify Intermediate Results

Many business problems require calculations that are used later.

Examples

```
Customer Revenue

Store Revenue

Rental Count

Average Revenue

Top Customers
```

Instead of calculating everything at once,

create intermediate results.

---

# Step 3 - Decide How to Organize the Solution

Ask yourself

```
Is this just one value?

↓

Scalar Subquery
```

---

```
Do I need
a temporary table?

↓

Derived Table
```

---

```
Should this intermediate
result have a name?

↓

CTE
```

---

```
Does the inner query depend
on the outer row?

↓

Correlated Subquery
```

Choosing the correct structure makes SQL easier to understand.

---

# Step 4 - Think in Layers

Professional SQL is built layer by layer.

Example

```
Payments

↓

Customer Revenue

↓

Average Revenue

↓

Customers Above Average

↓

Final Report
```

Every layer solves one small problem.

---

# Step 5 - Name Logical Steps

Imagine reading this query six months later.

Which is easier?

Nested SQL

or

```
customer_revenue

↓

store_revenue

↓

top_customers
```

Meaningful names make SQL self-documenting.

This is one of the biggest advantages of CTEs.

---

# Step 6 - Choose the Right Technique

Every SQL technique solves a different problem.

## Need one value?

Think

```
Scalar Subquery
```

---

## Need many values?

Think

```
Multi-row Subquery
```

---

## Need an intermediate table?

Think

```
Derived Table
```

---

## Need reusable query blocks?

Think

```
CTE
```

---

## Need recursion?

Think

```
Recursive CTE
```

---

## Need to combine datasets?

Think

```
UNION

UNION ALL

INTERSECT

EXCEPT
```

---

# Step 7 - Build the Final Query

Only after every logical step has been solved should you write the final query.

Professional SQL grows from small reusable components.

Not from one enormous statement.

---

# Thinking Example 1

Business asks

```
Which customers spend more
than the average customer?
```

Thinking

```
Customer Revenue

↓

Average Revenue

↓

Compare

↓

Result
```

Not

```
SELECT...

FROM...

WHERE...
```

---

# Thinking Example 2

Business asks

```
Which customers never rented
a film?
```

Thinking

```
Customer

↓

Rental Exists?

↓

NOT EXISTS

↓

Result
```

---

# Thinking Example 3

Business asks

```
Build a store performance report.
```

Thinking

```
Store Revenue

↓

Customer Revenue

↓

Store Ranking

↓

Final Dashboard
```

---

# Thinking Example 4

Business asks

```
Generate the next
30 calendar dates.
```

Thinking

```
Start Date

↓

Repeat

↓

Stop

↓

Recursive CTE
```

---

# SQL Design Workflow

Professional SQL development follows this sequence.

```
Business Question

↓

Business Entities

↓

Business Metrics

↓

Can it be solved directly?

↓

No

↓

Break into Smaller Steps

↓

Choose SQL Technique

↓

Build Intermediate Results

↓

Combine Results

↓

Business Report
```

---

# Choosing the Right Technique

| Requirement | Technique |
|-------------|-----------|
| One calculated value | Scalar Subquery |
| List of values | Multi-row Subquery |
| Temporary result | Derived Table |
| Row-by-row comparison | Correlated Subquery |
| Reusable query blocks | CTE |
| Recursive logic | Recursive CTE |
| Combine datasets | UNION |
| Find common rows | INTERSECT |
| Find differences | EXCEPT |

---

# Common Beginner Thinking

```
Today's Topic

↓

CTE

↓

Let's write one.
```

This is backwards.

---

# Professional Thinking

```
Business Problem

↓

How many logical steps?

↓

Which SQL technique
best represents each step?

↓

Write SQL
```

---

# Questions Every SQL Developer Should Ask

Before writing SQL, ask yourself:

□ What is the business trying to solve?

□ Can this be divided into smaller problems?

□ Which calculations can be reused?

□ Should I use a Subquery or a CTE?

□ Does the inner query depend on the outer query?

□ Do I need to combine multiple datasets?

□ Will another developer understand this query six months from now?

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

Design SQL Solutions

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

Week 5 is where SQL stops being a collection of commands and starts becoming a design discipline.

Experienced SQL developers don't begin by asking:

> Which SQL keyword should I use?

They ask:

> How should I structure this problem so that the solution is simple, readable, reusable, and easy to maintain?

Once you learn to think this way, writing complex SQL becomes significantly easier.