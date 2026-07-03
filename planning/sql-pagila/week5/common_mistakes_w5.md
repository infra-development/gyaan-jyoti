# Common Mistakes

## Week 5 - Advanced Query Construction

---

# Purpose

Week 5 introduces one of the biggest changes in SQL thinking.

Students often focus on writing SQL that works.

Professional developers focus on writing SQL that is:

- Correct
- Readable
- Reusable
- Maintainable

This document highlights the most common mistakes made while learning Subqueries, CTEs, and Set Operations.

---

# Mistake 1

## Solving Everything in One Query

### Incorrect Thinking

```
Large Business Problem

↓

One Huge SQL Query
```

This usually produces SQL that is difficult to understand and maintain.

### Correct Thinking

```
Large Problem

↓

Small Problems

↓

Reusable Components

↓

Final Query
```

---

# Mistake 2

## Using a Subquery When a CTE is Clearer

Deeply nested subqueries become difficult to read.

Instead of writing:

```
SELECT
(
(
(
SELECT...
)
)
)
```

Prefer:

```
WITH

customer_revenue AS (...),

store_revenue AS (...)

SELECT ...
```

If readability improves, a CTE is often the better choice.

---

# Mistake 3

## Using a Correlated Subquery Unnecessarily

Correlated subqueries execute once for every row in the outer query.

Many problems can be solved more efficiently using:

- JOIN
- Derived Table
- CTE
- Window Function

Always ask:

> Does the inner query really depend on the current outer row?

If not, avoid a correlated subquery.

---

# Mistake 4

## Confusing Scalar and Multi-row Subqueries

A scalar subquery returns:

```
One Value
```

A multi-row subquery returns:

```
Many Values
```

Do not compare a single value against a query that returns multiple rows.

Choose the correct operator:

- `=`
- `IN`
- `EXISTS`

---

# Mistake 5

## Forgetting That EXISTS Only Checks for Existence

`EXISTS` does **not** return data.

It only answers one question:

```
Does at least one matching row exist?
```

If yes,

the condition is true.

---

# Mistake 6

## Using NOT IN Instead of NOT EXISTS

`NOT IN` can produce unexpected results when the subquery contains `NULL` values.

In business applications,

`NOT EXISTS` is usually the safer and more reliable option.

---

# Mistake 7

## Writing Meaningless CTE Names

Avoid names like:

```
cte1

cte2

temp

result
```

Prefer descriptive names.

Examples:

```
customer_revenue

store_revenue

film_statistics

monthly_sales
```

Good names make SQL self-documenting.

---

# Mistake 8

## Creating Too Many Nested Queries

Nested queries increase complexity.

If the logic becomes difficult to follow,

consider breaking it into multiple CTEs.

Readable SQL is easier to debug and maintain.

---

# Mistake 9

## Confusing UNION and UNION ALL

Remember:

```
UNION

↓

Removes duplicates
```

```
UNION ALL

↓

Keeps duplicates
```

Choosing the wrong one changes the result.

---

# Mistake 10

## Forgetting That Set Operations Require Compatible Columns

For:

- UNION
- UNION ALL
- INTERSECT
- EXCEPT

Both queries must return:

- The same number of columns
- Compatible data types

Otherwise SQL returns an error.

---

# Mistake 11

## Infinite Recursion

A recursive CTE must always have a stopping condition.

Without one,

the recursion never ends.

Always verify the recursive member eventually stops generating rows.

---

# Mistake 12

## Solving the SQL Before Understanding the Business

Students often begin writing SQL immediately.

Professionals first ask:

- What is the business asking?
- What intermediate results are required?
- Which SQL technique best fits the problem?

SQL should be the final step.

---

# Mistake 13

## Choosing SQL Based on Syntax Instead of Purpose

Avoid thinking:

```
Today's topic is CTE.

I'll use a CTE.
```

Instead think:

```
Today's problem requires
readable reusable logic.

A CTE is appropriate.
```

Always let the business problem drive the SQL technique.

---

# Mistake 14

## Ignoring Maintainability

A query that works today may be difficult to modify later.

Ask yourself:

- Can another developer understand this?
- Can I debug it easily?
- Can I extend it next month?

Maintainability is a key part of professional SQL.

---

# Mistake 15

## Forgetting to Break Problems into Steps

Complex SQL should be developed incrementally.

Think:

```
Business Problem

↓

Step 1

↓

Step 2

↓

Step 3

↓

Final Query
```

Trying to solve everything at once usually leads to errors.

---

# Professional Checklist

Before executing a complex query, ask yourself:

□ Do I fully understand the business requirement?

□ Can the problem be divided into smaller parts?

□ Am I using the correct SQL technique?

□ Would a CTE improve readability?

□ Does the correlated subquery really need to be correlated?

□ Are my CTE names meaningful?

□ Am I using the correct set operator?

□ Will another developer understand this query?

---

# Summary

The most common Week 5 mistakes are not syntax errors.

They are **design mistakes**.

Professional SQL developers succeed because they:

- Break large problems into smaller ones.
- Choose the appropriate SQL technique.
- Write readable SQL.
- Build reusable query components.
- Think about maintainability before writing code.

The goal of Week 5 is not simply to learn new SQL features.

The goal is to develop the design mindset required for writing production-quality SQL.