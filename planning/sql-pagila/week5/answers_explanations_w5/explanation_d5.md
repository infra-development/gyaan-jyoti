# Day 5 - Set Operations

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand what Set Operations are.
- Explain the difference between `UNION` and `UNION ALL`.
- Understand when to use `INTERSECT`.
- Understand when to use `EXCEPT`.
- Compare multiple datasets using SQL.
- Choose the appropriate Set Operation based on the business requirement.

---

# Introduction

Until now, every SQL query you've written has retrieved data from one or more tables.

For example,

- Retrieve customers
- Join payments
- Calculate revenue
- Rank films
- Build reports

All of these operations worked **vertically** by processing rows inside tables.

Today you'll learn a different way of thinking.

Instead of processing rows,

you'll begin processing **entire result sets**.

Imagine having two complete reports.

Instead of joining them,

you may simply want to:

- Combine them.
- Find their common records.
- Find their differences.

These problems are solved using **Set Operations**.

---

# What Are Set Operations?

A Set Operation combines or compares the results of two or more SQL queries.

Think of every query as producing a collection of rows.

```
Query A

↓

Result Set A
```

```
Query B

↓

Result Set B
```

Set Operations work directly on these result sets.

---

# Concept 1 - UNION (Q41)

Business Question

> Display every customer appearing in either the Payment table or the Rental table.

Thinking process

```
Payment Customers

+

Rental Customers

↓

One Combined List

↓

Remove Duplicates
```

`UNION` combines two result sets and automatically removes duplicate rows.

This is similar to creating one master list.

---

# Business Uses

Examples include:

- Customers from multiple systems.
- Products from multiple warehouses.
- Employees from multiple departments.
- Combined monthly reports.

Whenever duplicate rows should appear only once,

think:

```
UNION
```

---

# Concept 2 - UNION ALL (Q42)

Sometimes duplicates are important.

Example

```
Store A Sales

+

Store B Sales

↓

Keep Every Transaction
```

Unlike `UNION`,

`UNION ALL` keeps every row.

Nothing is removed.

This usually performs faster because PostgreSQL does not spend time eliminating duplicates.

---

# When to Use UNION ALL

Use it whenever duplicate rows have business meaning.

Examples

- Transaction history
- Sales records
- Log files
- Audit records
- Event streams

---

# Concept 3 - INTERSECT (Q43)

Business Question

> Which customers appear in both Payment and Rental?

Thinking

```
Payment Customers

∩

Rental Customers

↓

Common Customers
```

`INTERSECT` returns only rows appearing in both result sets.

---

# Business Uses

Examples include:

- Customers appearing in two databases.
- Products available in two stores.
- Employees assigned to multiple projects.
- Users existing in multiple applications.

Whenever you need common records,

think:

```
INTERSECT
```

---

# Concept 4 - EXCEPT (Q44 & Q45)

Business Question

> Which customers rented films but never made a payment?

Thinking

```
Rental Customers

-

Payment Customers

↓

Customers Missing
Payments
```

`EXCEPT` returns rows from the first query that do not exist in the second.

---

# Business Uses

Examples include:

- Customers without orders.
- Products never sold.
- Films never rented.
- Stores without inventory.
- Employees without managers.

Whenever you're looking for missing information,

think:

```
EXCEPT
```

---

# Concept 5 - Thinking in Sets

Until now, SQL has focused on individual rows.

Week 5 introduces another perspective.

Instead of asking:

```
How do these rows join?
```

Ask:

```
How do these datasets relate?
```

Possible relationships include:

```
Combine

↓

UNION
```

```
Keep Everything

↓

UNION ALL
```

```
Common Records

↓

INTERSECT
```

```
Missing Records

↓

EXCEPT
```

Thinking in terms of datasets is an important analytical skill.

---

# Concept 6 - Choosing the Right Set Operation (Q46–Q50)

Professional developers begin with the business requirement.

Ask yourself:

## Need one combined list?

↓

`UNION`

---

## Need every row?

↓

`UNION ALL`

---

## Need only common rows?

↓

`INTERSECT`

---

## Need rows missing from another dataset?

↓

`EXCEPT`

The business question determines the SQL operation.

---

# Set Operation Workflow

```
Business Requirement

↓

Two Result Sets

↓

Need Combined Data?

↓

UNION

or

UNION ALL

--------------------

Need Common Data?

↓

INTERSECT

--------------------

Need Missing Data?

↓

EXCEPT

↓

Business Result
```

---

# Comparison of Set Operations

| Operation | Removes Duplicates | Purpose |
|------------|-------------------|---------|
| `UNION` | Yes | Combine result sets |
| `UNION ALL` | No | Combine while preserving duplicates |
| `INTERSECT` | Yes | Return common rows |
| `EXCEPT` | Yes | Return rows only in the first query |

---

# Requirements for Set Operations

Before using any Set Operation, both queries must return:

- The same number of columns.
- Compatible data types.
- Columns in the same order.

Otherwise PostgreSQL cannot combine or compare the result sets.

---

# Common Business Applications

| Business Requirement | SQL Technique |
|----------------------|---------------|
| Merge customer lists | `UNION` |
| Merge transaction history | `UNION ALL` |
| Find common customers | `INTERSECT` |
| Find customers without payments | `EXCEPT` |
| Compare inventory | `EXCEPT` |
| Data reconciliation | `INTERSECT` / `EXCEPT` |

---

# Common Mistakes

❌ Using `UNION` when duplicate rows should be preserved.

❌ Using `UNION ALL` when duplicate rows should be removed.

❌ Forgetting that both queries must return the same number of columns.

❌ Returning incompatible data types.

❌ Thinking Set Operations replace JOINs.

Set Operations compare complete result sets.

JOINs combine related rows using relationships.

They solve different business problems.

---

# Day 5 Summary

Today you learned:

- Set Operations work on entire result sets instead of individual rows.
- `UNION` combines result sets and removes duplicates.
- `UNION ALL` combines result sets while preserving duplicates.
- `INTERSECT` returns only common rows.
- `EXCEPT` returns rows present in the first query but missing from the second.
- Choosing the correct Set Operation depends entirely on the business requirement.

---

# What's Next?

In **Day 6**, you'll learn one of the most important professional SQL skills:

**Choosing the Right Query Construction Technique.**

You'll solve the same business problems using different approaches, including:

- Subqueries
- Derived Tables
- Common Table Expressions (CTEs)
- Correlated Subqueries

Rather than learning new SQL syntax, you'll learn **how experienced SQL developers decide which technique is the best fit** for a given business problem.