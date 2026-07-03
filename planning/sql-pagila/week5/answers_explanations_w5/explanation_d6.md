# Day 6 - Choosing the Right SQL Technique

## Learning Objectives

By the end of this lesson, you should be able to:

- Choose the most appropriate SQL technique for a business problem.
- Compare Subqueries, Derived Tables, Correlated Subqueries, and CTEs.
- Understand the trade-offs between readability, maintainability, and performance.
- Rewrite SQL using different techniques.
- Explain *why* one solution is preferable over another.
- Think like a professional SQL developer when designing complex queries.

---

# Introduction

During this week you've learned several powerful SQL techniques.

- Subqueries
- Derived Tables
- Correlated Subqueries
- Common Table Expressions (CTEs)
- Recursive CTEs
- Set Operations

A common question beginners ask is:

> Which one should I use?

The answer is surprisingly simple.

**It depends on the business problem.**

Professional SQL developers don't choose a technique because it's their favorite.

They choose the technique that makes the solution:

- Easy to understand
- Easy to maintain
- Easy to modify
- Appropriate for the business requirement

Today's lesson is about making that decision.

---

# There Is Rarely One Correct Solution

Suppose the business asks:

> Display customers whose spending is greater than the average customer spending.

There are several valid solutions.

```
Subquery

↓

Derived Table

↓

CTE
```

All of them produce the same result.

The difference is not correctness.

The difference is **design**.

---

# Concept 1 - Multiple Ways to Solve the Same Problem (Q51)

Professional SQL developers know that one business problem can have several valid implementations.

Example

```
Business Problem

↓

Subquery

↓

Correct
```

or

```
Business Problem

↓

CTE

↓

Correct
```

The question becomes:

> Which solution is easier to understand?

---

# Concept 2 - Derived Tables vs CTEs (Q52 & Q54)

Both techniques create intermediate result sets.

Derived Table

```
FROM

(

SELECT ...

)
```

CTE

```
WITH customer_revenue AS
(
    SELECT ...
)
```

For a small calculation,

a Derived Table is perfectly acceptable.

For larger reports,

CTEs usually provide better readability.

---

# Concept 3 - Replacing Correlated Subqueries (Q53)

Correlated Subqueries execute once for every outer row.

For example,

```
Customer

↓

Maximum Payment

↓

Customer

↓

Maximum Payment

↓

Repeat...
```

Sometimes this is necessary.

Often it is not.

Many correlated subqueries can be rewritten using:

- CTEs
- JOINs
- Window Functions

These alternatives are often easier to understand and may perform better.

---

# Concept 4 - Readability Matters (Q55)

Imagine revisiting a query after six months.

Which version would you rather read?

### Nested SQL

```
SELECT

↓

SELECT

↓

SELECT

↓

SELECT
```

or

### CTE

```
customer_revenue

↓

store_revenue

↓

top_customers

↓

final_report
```

The second version clearly communicates the business logic.

Professional SQL prioritizes readability.

---

# Concept 5 - Performance Considerations (Q56)

Not every SQL technique performs the same.

For example,

a Correlated Subquery may execute many times.

```
Outer Row

↓

Inner Query

↓

Repeat
```

On large tables,

this can become expensive.

In many situations,

a JOIN or Window Function may be a better choice.

Always balance:

- Correctness
- Readability
- Performance

---

# Concept 6 - Maintainability (Q57)

Business reports change frequently.

Today the report requires:

```
Customer Revenue
```

Tomorrow the business requests:

```
Customer Revenue

+

Average Revenue

+

Store Revenue

+

Ranking
```

If the SQL is well organized,

adding new requirements is easy.

CTEs are especially valuable because each business calculation is isolated.

---

# Concept 7 - Professional SQL Design (Q58 & Q59)

Professional developers rarely think about SQL first.

Instead they think:

```
Business Question

↓

Business Entities

↓

Business Metrics

↓

Logical Steps

↓

SQL Technique

↓

Final Query
```

The SQL is simply the implementation.

The real work happens during the design phase.

---

# Concept 8 - Complete SQL Design Workflow (Q60)

Every complex SQL solution should follow the same process.

```
Business Requirement

↓

Understand the Business

↓

Identify Entities

↓

Identify Metrics

↓

Break Into Logical Steps

↓

Choose SQL Technique

↓

Build Intermediate Results

↓

Combine Results

↓

Final SQL

↓

Business Report
```

Following this workflow produces SQL that is easier to understand and easier to maintain.

---

# Choosing the Right Technique

| Business Requirement | Recommended Technique |
|----------------------|-----------------------|
| Compare with one calculated value | Scalar Subquery |
| Compare with multiple values | Multi-row Subquery |
| Temporary intermediate result | Derived Table |
| Row-by-row comparison | Correlated Subquery |
| Readable multi-step solution | CTE |
| Recursive problems | Recursive CTE |
| Combine datasets | UNION / UNION ALL |
| Find common records | INTERSECT |
| Find missing records | EXCEPT |

---

# Decision Guide

When approaching a business problem, ask yourself:

```
Need one value?

↓

Scalar Subquery
```

---

```
Need an intermediate table?

↓

Derived Table
```

---

```
Need row-by-row comparison?

↓

Correlated Subquery
```

---

```
Need multiple reusable steps?

↓

CTE
```

---

```
Need recursion?

↓

Recursive CTE
```

---

```
Need to compare datasets?

↓

Set Operations
```

---

# Common Mistakes

❌ Believing there is only one correct SQL solution.

❌ Choosing a technique because it is newer or more advanced.

❌ Using a Correlated Subquery when a JOIN or CTE would be clearer.

❌ Writing deeply nested SQL instead of breaking the problem into logical steps.

❌ Ignoring readability in favor of shorter SQL.

---

# Day 6 Summary

Today you learned:

- Most business problems can be solved using multiple SQL techniques.
- Choosing the right technique depends on the business requirement.
- CTEs generally improve readability and maintainability.
- Correlated Subqueries should be used only when row-by-row logic is required.
- Professional SQL developers focus on design before implementation.
- The best SQL is not the shortest SQL—it is the clearest solution.

---

# What's Next?

In **Day 7**, you'll bring together everything you've learned throughout Week 5.

You'll solve realistic business problems by combining:

- Subqueries
- Correlated Subqueries
- Common Table Expressions (CTEs)
- Recursive CTEs
- Set Operations
- Window Functions

Rather than learning new SQL features, you'll practice **designing complete, production-style SQL solutions** that resemble real Business Intelligence and reporting systems.