# Day 3 - Common Table Expressions (CTEs)

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand what a Common Table Expression (CTE) is.
- Explain why CTEs improve SQL readability.
- Create single and multiple CTEs.
- Replace derived tables with CTEs when appropriate.
- Organize complex SQL into logical building blocks.
- Think like a professional SQL developer when designing large queries.

---

# Introduction

In Day 1, you learned Subqueries.

In Day 2, you learned Correlated Subqueries.

Both techniques allow SQL to solve complex business problems.

However, as business requirements grow, SQL can quickly become difficult to read.

Consider a query containing several nested subqueries.

```
SELECT ...

FROM
(
    SELECT ...

    FROM
    (
        SELECT ...
    )
)
```

The SQL works.

But after a few months, it becomes difficult to understand.

Professional developers solve this problem using **Common Table Expressions (CTEs).**

---

# Why Do We Need CTEs?

Imagine a manager asks:

> Build a report showing customer revenue, store revenue, and the highest-paying customer in every store.

There are multiple independent calculations.

Instead of writing one enormous SQL query,

professional developers divide the problem.

```
Customer Revenue

↓

Store Revenue

↓

Customer Ranking

↓

Final Report
```

Each step becomes its own CTE.

---

# What is a CTE?

A Common Table Expression is a **named temporary result set**.

It exists only while the query is executing.

General syntax:

```sql
WITH cte_name AS
(
    SELECT ...
)

SELECT ...
FROM cte_name;
```

Think of a CTE as giving a meaningful name to an intermediate calculation.

---

# Concept 1 - Single CTE (Q21–Q23)

Business Question

> Calculate customer revenue.

Instead of nesting the calculation,

create a named result.

```
Customer Revenue

↓

customer_revenue

↓

Final Query
```

The SQL becomes much easier to read.

The same approach works for:

- Store revenue
- Film rental counts
- Monthly sales
- Product performance

---

# Concept 2 - Multiple CTEs (Q24)

Large reports often require several independent calculations.

Example

```
Customer Revenue

↓

Store Revenue

↓

Join Together

↓

Business Report
```

Instead of deeply nested SQL,

each calculation has its own logical section.

This makes the report much easier to understand.

---

# Concept 3 - Reusing Intermediate Results (Q25)

One of the biggest advantages of CTEs is reusability.

Suppose customer revenue has already been calculated.

Now you need:

- Average customer revenue
- Customers above average

Instead of recalculating customer revenue,

reuse the existing CTE.

```
Customer Revenue

↓

Average Revenue

↓

Comparison
```

This reduces duplication.

---

# Concept 4 - Building SQL Step by Step (Q26)

Professional SQL developers rarely write the final query first.

Instead they build it incrementally.

Example

```
Step 1

Customer Revenue

↓

Step 2

Rank Customers

↓

Step 3

Keep Rank 1

↓

Final Report
```

Each step becomes one CTE.

The final query becomes very small.

---

# Concept 5 - Why CTEs Improve Readability (Q27)

Compare these approaches.

### Nested Subqueries

```
Query

↓

Subquery

↓

Subquery

↓

Subquery
```

Finding the business logic becomes difficult.

---

### CTEs

```
Customer Revenue

↓

Store Revenue

↓

Rank Customers

↓

Final Report
```

The names explain the business logic.

SQL becomes self-documenting.

---

# Concept 6 - Derived Tables vs CTEs (Q28)

Both solve similar problems.

The difference is organization.

### Derived Table

```
FROM

(

SELECT ...

)
```

Useful for small calculations.

---

### CTE

```
WITH

customer_revenue AS (...)

store_revenue AS (...)

```

Better for larger reports.

CTEs are usually easier to maintain.

---

# Concept 7 - When Multiple CTEs Are Helpful (Q29)

Large business reports often require many intermediate calculations.

Examples include:

- Executive dashboards
- Customer analytics
- Store performance
- Revenue reports
- Business Intelligence dashboards

Each calculation becomes one CTE.

This produces clean, modular SQL.

---

# Concept 8 - Thinking Before Using CTEs (Q30)

Professional developers think like this.

```
Business Question

↓

Large Problem?

↓

Yes

↓

Break Into Steps

↓

One CTE Per Step

↓

Combine Results

↓

Business Report
```

Notice that SQL is almost the final step.

The design comes first.

---

# CTE Workflow

```
Business Requirement

↓

Break Into Logical Steps

↓

Name Each Step

↓

Create CTEs

↓

Combine Results

↓

Final Query
```

---

# Derived Table vs CTE

| Derived Table | CTE |
|--------------|-----|
| Exists only in `FROM` | Defined using `WITH` |
| Best for small calculations | Best for large reports |
| Harder to reuse | Easy to reuse |
| Can become deeply nested | Flat and readable |
| Limited readability | High readability |

---

# Common Business Applications

| Business Requirement | CTE |
|----------------------|-----|
| Customer Revenue | ✓ |
| Store Revenue | ✓ |
| Monthly Sales | ✓ |
| Executive Dashboard | ✓ |
| Business Intelligence Reports | ✓ |
| Multi-step Analysis | ✓ |

---

# Common Mistakes

❌ Giving CTEs meaningless names like `cte1` or `temp`.

❌ Creating one enormous CTE instead of several logical ones.

❌ Using a CTE when a simple query is sufficient.

❌ Repeating calculations instead of reusing an existing CTE.

❌ Thinking CTEs automatically improve performance—they primarily improve readability and maintainability.

---

# Day 3 Summary

Today you learned:

- A CTE is a named temporary result set.
- CTEs organize SQL into logical building blocks.
- Multiple CTEs simplify large business reports.
- CTEs reduce nesting and improve readability.
- Professional SQL developers design reports one logical step at a time.
- Clear SQL structure is just as important as correct SQL syntax.

---

# What's Next?

In **Day 4**, you'll learn **Recursive CTEs**.

You'll discover how SQL can solve problems that require repetition, including:

- Generating number sequences.
- Creating calendar tables.
- Traversing hierarchical data.
- Understanding recursion through the Anchor Member and Recursive Member.

Recursive CTEs introduce a completely different style of SQL thinking and are one of the most powerful features available in PostgreSQL.