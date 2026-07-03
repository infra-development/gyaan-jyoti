# Day 2 - Correlated Subqueries

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand what a Correlated Subquery is.
- Explain how Correlated Subqueries differ from ordinary Subqueries.
- Understand how the outer query and inner query work together.
- Use `EXISTS` and `NOT EXISTS` confidently.
- Solve row-by-row business comparison problems.
- Identify situations where Correlated Subqueries are appropriate.

---

# Introduction

In Day 1, you learned that an ordinary subquery is executed independently.

For example,

```
Calculate Average Rental Rate

↓

Compare Every Film

↓

Result
```

The inner query has no knowledge of the outer query.

It simply produces a value (or a set of values), and the outer query uses that result.

Business problems are not always this simple.

Sometimes every row needs its own calculation.

Consider the following question.

> Is this customer's payment greater than **their own** average payment?

Notice the difference.

Each customer has a different average.

A single average is no longer sufficient.

The calculation must change for every customer.

This introduces the Correlated Subquery.

---

# Why Do We Need Correlated Subqueries?

Imagine three customers.

| Customer | Average Payment |
|----------|----------------:|
| Mary | 5.82 |
| John | 7.34 |
| Lisa | 4.15 |

Now suppose we examine Mary's payment.

SQL must compare it with **Mary's** average.

When examining John,

SQL must compare it with **John's** average.

The inner query changes depending on the current outer row.

That dependency is the defining characteristic of a Correlated Subquery.

---

# Concept 1 - Row-by-Row Thinking (Q11)

Business Question

> Display customers who have made at least one payment greater than their own average payment.

Thinking process

```
Customer

↓

Customer's Payments

↓

Customer's Average

↓

Compare

↓

Result
```

Notice that the average is recalculated for every customer.

This is impossible using a simple scalar subquery.

---

# Concept 2 - Comparing Within Business Groups (Q12)

Business Question

> Display films whose rental rate is greater than the average rental rate within the same rating.

Example

| Rating | Average Rental Rate |
|---------|--------------------:|
| G | 2.45 |
| PG | 3.12 |
| PG-13 | 2.98 |

Each film is compared only with films having the same rating.

The comparison changes for every row.

---

# Concept 3 - Maximum Per Group (Q14 & Q15)

Businesses frequently ask questions like:

- Highest payment per customer
- Most expensive film in each rating
- Largest order per supplier
- Highest salary in each department

Thinking process

```
Current Row

↓

Current Group

↓

Maximum Value

↓

Comparison
```

The inner query depends on the current row.

---

# Concept 4 - EXISTS (Q16)

Sometimes the business does not need data.

It only needs to know whether matching rows exist.

Example

```
Customer

↓

Rental Exists?

↓

Yes

↓

Display Customer
```

`EXISTS` answers only one question.

> Does at least one matching row exist?

If yes,

the condition is true.

---

## Business Uses

- Customers with rentals
- Products with sales
- Employees with projects
- Stores with inventory

---

# Concept 5 - NOT EXISTS (Q17)

`NOT EXISTS` performs the opposite check.

Business Question

> Which customers have never rented a film?

Thinking

```
Customer

↓

Rental Exists?

↓

No

↓

Display Customer
```

This pattern is extremely common in business reporting.

---

## Business Uses

- Customers without orders
- Products never sold
- Employees without managers
- Films never rented

---

# Concept 6 - Ordinary vs Correlated Subqueries (Q18 & Q19)

Although both contain nested SQL,

their execution is very different.

### Ordinary Subquery

```
Execute Once

↓

Return Result

↓

Outer Query Uses Result
```

---

### Correlated Subquery

```
Outer Row

↓

Inner Query

↓

Uses Outer Row

↓

Comparison

↓

Next Row

↓

Repeat
```

The inner query executes once for every row in the outer query.

---

# Concept 7 - Thinking Before Writing SQL (Q20)

Professional developers never begin with SQL syntax.

Instead they ask:

```
Does every row require
its own calculation?

↓

Yes

↓

Correlated Subquery

↓

Need Only Existence?

↓

EXISTS

or

NOT EXISTS

↓

Final Query
```

Understanding the business logic comes first.

---

# Correlated Subquery Workflow

```
Business Requirement

↓

Need Row-by-Row Comparison?

↓

Yes

↓

Outer Query

↓

Inner Query

↓

Uses Outer Row

↓

Business Result
```

---

# Ordinary vs Correlated Subqueries

| Ordinary Subquery | Correlated Subquery |
|-------------------|---------------------|
| Executes once | Executes once per outer row |
| Independent | Depends on the outer query |
| General calculations | Row-by-row calculations |
| Often faster | Can be more expensive |

---

# EXISTS vs NOT EXISTS

| Requirement | Technique |
|-------------|-----------|
| Matching rows exist | `EXISTS` |
| Matching rows do not exist | `NOT EXISTS` |

---

# Common Business Applications

| Business Question | SQL Technique |
|-------------------|---------------|
| Payment above customer's average | Correlated Subquery |
| Film above rating average | Correlated Subquery |
| Highest payment per customer | Correlated Subquery |
| Customer has rentals | `EXISTS` |
| Customer has no rentals | `NOT EXISTS` |

---

# Common Mistakes

❌ Thinking correlated subqueries execute only once.

❌ Forgetting that the inner query references the outer query.

❌ Using a correlated subquery when a JOIN or Window Function would be simpler.

❌ Using `NOT IN` when `NOT EXISTS` is safer.

❌ Choosing SQL syntax before understanding the business requirement.

---

# Day 2 Summary

Today you learned:

- A Correlated Subquery depends on the current row of the outer query.
- The inner query executes once for every outer row.
- `EXISTS` checks whether matching rows exist.
- `NOT EXISTS` finds missing business records.
- Correlated Subqueries are ideal for row-by-row business comparisons.
- Business thinking should always come before SQL syntax.

---

# What's Next?

In **Day 3**, you'll learn **Common Table Expressions (CTEs)**.

Instead of nesting queries inside one another, you'll learn how to:

- Give intermediate calculations meaningful names.
- Break complex SQL into reusable building blocks.
- Replace deeply nested queries with clean, readable SQL.

This is one of the most valuable techniques used in production SQL because it dramatically improves readability, maintainability, and collaboration.