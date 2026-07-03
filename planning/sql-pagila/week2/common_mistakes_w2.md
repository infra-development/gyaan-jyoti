# Common SQL Mistakes
## Week 2

> As SQL queries become more complex, mistakes become less about syntax
> and more about understanding relationships.
>
> Week 2 teaches you how to recognize these mistakes before they become bugs.

---

# Mistake 1 — Joining Tables Without Understanding the Relationship

## Business Question

> Show customers together with the films they rented.

Many beginners immediately write:

```sql
FROM customer
JOIN film
```

❌ Incorrect thinking.

---

## Why?

Customer and Film are not directly related.

The relationship is:

```
Customer

↓

Rental

↓

Inventory

↓

Film
```

Every JOIN should represent a real business relationship.

---

## Correct Thinking

Ask yourself:

> Which tables connect these business entities?

Never guess.

Always follow the relationship path.

---

## Remember

```
Business Relationship

↓

JOIN

Not

Table Names

↓

JOIN
```

---

# Mistake 2 — Joining Too Many Tables

Some students believe:

> More JOINs mean a better query.

Wrong.

Every JOIN should answer one business need.

Unnecessary JOINs:

- Make queries slower.
- Make SQL harder to read.
- Increase the chance of duplicate rows.

---

## Correct Thinking

Only join tables that provide information required by the business question.

---

# Mistake 3 — Choosing the Wrong Starting Table

Business Question

> Show every customer together with their payments.

Some students start from:

```sql
payment
```

This removes customers without payments.

---

## Correct Thinking

Ask:

> Which entity should always appear in the result?

If every customer should appear,

start with:

```text
Customer
```

---

## Remember

The first table often determines what appears in the final result.

---

# Mistake 4 — Thinking Duplicate Rows Mean the JOIN Is Wrong

Example

One customer rents five films.

After joining:

```
Mary

Mary

Mary

Mary

Mary
```

Many beginners think:

> SQL duplicated my data.

Wrong.

The customer genuinely has five rental records.

---

## Correct Thinking

JOIN returns one row for every valid relationship.

Duplicate values are often expected.

---

# Mistake 5 — Using DISTINCT to Hide Problems

Many beginners solve duplicate rows by writing:

```sql
SELECT DISTINCT ...
```

without understanding why duplicates appeared.

This may hide the real issue.

---

## Correct Thinking

First ask:

```
Why are duplicates appearing?
```

Only use DISTINCT when the business requires unique values.

---

# Mistake 6 — Counting Rows Instead of Business Entities

Business asks:

> How many customers rented Action films?

Students write:

```sql
COUNT(*)
```

If a customer rented ten Action films,

they are counted ten times.

---

## Correct Thinking

Ask:

> Am I counting rentals?

or

> Am I counting customers?

Sometimes you need:

```sql
COUNT(DISTINCT customer_id)
```

---

# Mistake 7 — Forgetting Bridge Tables

Business Question

> Which actors appear in Comedy films?

Many beginners try:

```sql
actor

↓

film
```

But the relationship is:

```
Actor

↓

Film_Actor

↓

Film

↓

Film_Category

↓

Category
```

Bridge tables are part of the business model.

Never skip them.

---

# Mistake 8 — Using INNER JOIN When Missing Data Matters

Business asks:

> Show customers who never rented a movie.

Students write:

```sql
INNER JOIN
```

Customers without rentals disappear.

---

## Correct Thinking

When missing information is important,

think:

```
LEFT JOIN
```

---

# Mistake 9 — Filtering After the Wrong JOIN

Sometimes students write filters that accidentally remove rows introduced by a LEFT JOIN.

Example:

```sql
LEFT JOIN payment

WHERE payment.amount > 0
```

The WHERE clause removes NULL rows,

turning the LEFT JOIN into an INNER JOIN.

---

## Correct Thinking

Understand when filters affect joined results.

Think carefully about whether the condition belongs in:

- ON
- WHERE
- HAVING

---

# Mistake 10 — Following the Wrong Relationship Path

Business asks:

> Revenue by Country.

Some students think:

```
Country

↓

Film

↓

Payment
```

There is no such relationship.

The correct path is:

```
Country

↓

City

↓

Address

↓

Customer

↓

Payment
```

---

## Correct Thinking

Draw the relationship path before writing SQL.

---

# Mistake 11 — Thinking SQL Before Business

Business asks:

> Which store performs best?

Students think:

```
GROUP BY

JOIN

ORDER BY
```

Professionals think:

```
Business Goal

↓

Measure

↓

Dimension

↓

Relationship Path

↓

SQL
```

---

## Correct Thinking

SQL is the final step,

not the first.

---

# Mistake 12 — Forgetting Why the Report Exists

A report is not successful because it runs.

It is successful because it answers the business question.

Always ask:

```
Does this report help someone make a decision?
```

If the answer is no,

rethink the query.

---

# Week 2 Mental Checklist

Before executing your query ask yourself:

□ Did I identify the correct business entities?

□ Did I follow the correct relationship path?

□ Is every JOIN necessary?

□ Will the JOIN naturally create multiple rows?

□ Am I counting rows or business entities?

□ Do I really need DISTINCT?

□ Should missing information remain in the result?

□ Does this query answer the business question?

---

# Final Thought

Most SQL bugs are not syntax errors.

They are thinking errors.

The best SQL developers spend more time understanding the business than writing the query.

As your SQL skills improve, your greatest advantage will not be typing faster.

It will be thinking more clearly.