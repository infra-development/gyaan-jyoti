# Common SQL Mistakes
## Week 1

> Every SQL developer makes mistakes.
>
> The goal is not to avoid mistakes completely.
>
> The goal is to recognize them quickly and understand **why** they happen.

---

# Mistake 1 — Using WHERE with Aggregate Functions

## Business Question

> Show customers who have made more than 30 rentals.

Many beginners write:

```sql
SELECT customer_id, COUNT(*)
FROM rental
WHERE COUNT(*) > 30
GROUP BY customer_id;
```

❌ Incorrect.

---

## Why?

SQL processes `WHERE` **before** `GROUP BY`.

At the time `WHERE` executes, `COUNT(*)` does not exist yet.

---

## Correct Thinking

Ask yourself:

> Am I filtering **rows** or **groups**?

If you're filtering groups after aggregation, use:

```sql
HAVING
```

---

## Remember

```
WHERE

↓

Rows

------------------

HAVING

↓

Groups
```

---

# Mistake 2 — Using GROUP BY for One Overall Metric

## Business Question

> What is the total revenue?

Wrong thinking:

> Every aggregate function needs GROUP BY.

Wrong query:

```sql
SELECT SUM(amount)
FROM payment
GROUP BY customer_id;
```

Now you have revenue for every customer.

But the business asked for one overall number.

---

## Correct Thinking

Ask:

> Does the business want one answer?

or

> One answer for each category?

Only use GROUP BY for the second case.

---

## Remember

```
One Answer

↓

No GROUP BY

---------------------

Many Answers

↓

GROUP BY
```

---

# Mistake 3 — Confusing GROUP BY and ORDER BY

Business Question

> Show the highest paying customers.

Many students think:

```
Highest

↓

GROUP BY
```

Wrong.

---

## Difference

GROUP BY

Creates groups.

ORDER BY

Arranges the final results.

---

## Mental Model

```
GROUP BY

creates buckets

----------------

ORDER BY

arranges buckets
```

---

# Mistake 4 — Forgetting the Business Metric

Business asks:

> Revenue by Store.

Some students group correctly.

But then calculate:

```sql
COUNT(*)
```

instead of

```sql
SUM(amount)
```

The grouping is correct.

The metric is wrong.

---

## Correct Thinking

Always identify:

```
Metric

+

Dimension
```

before writing SQL.

---

# Mistake 5 — Joining Before Understanding Relationships

Many beginners immediately start writing:

```sql
JOIN

JOIN

JOIN
```

without asking:

> Which table actually contains the information?

---

## Correct Thinking

Always identify:

Business Entity

↓

Required Information

↓

Relationship

↓

JOIN

---

# Mistake 6 — Joining the Wrong Columns

Example

Wrong

```sql
actor.actor_id = film_actor.film_id
```

The columns have different meanings.

Even though SQL runs, the results are incorrect.

---

## Correct Thinking

Never join because column names "look similar."

Understand the relationship first.

---

# Mistake 7 — Thinking Duplicate Rows Mean the JOIN is Wrong

Example

One actor appears in:

- Film A
- Film B
- Film C

After joining:

```
Tom

Tom

Tom
```

Many beginners think:

> The JOIN duplicated rows.

No.

The actor genuinely appears in three related records.

---

## Remember

JOIN reflects relationships.

It does not randomly create duplicates.

---

# Mistake 8 — Using INNER JOIN When Missing Data Matters

Business asks:

> Show customers who have never rented a movie.

Many beginners write:

```sql
INNER JOIN
```

The customers with no rentals disappear.

---

## Correct Thinking

If you need to keep unmatched rows,

think:

```
LEFT JOIN
```

---

# Mistake 9 — Counting the Wrong Thing

Business asks:

> How many copies exist?

Students write:

```sql
COUNT(film_id)
```

The business actually wants:

```
Inventory Count
```

Always ask:

> What exactly am I counting?

---

# Mistake 10 — Forgetting DISTINCT

Business asks:

> In how many stores is each film available?

Students write:

```sql
COUNT(store_id)
```

If a film has multiple copies in one store,

the count becomes misleading.

Think carefully about whether the business wants:

- Total rows
- Unique values

---

# Mistake 11 — Ignoring NULL

Many beginners assume:

```
NULL

=

0
```

Wrong.

NULL means:

- Unknown
- Missing
- Not yet available

It is not zero.

It is not an empty string.

---

# Mistake 12 — Comparing NULL Incorrectly

Wrong

```sql
WHERE return_date = NULL
```

Correct

```sql
WHERE return_date IS NULL
```

Remember:

NULL cannot be compared using normal comparison operators.

---

# Mistake 13 — Writing SQL Before Understanding the Question

This is the biggest mistake.

Business asks:

> Compare revenue across stores.

Student immediately opens PostgreSQL.

Professional developers pause first.

They identify:

- Business Objective
- Business Entity
- Thinking Pattern
- SQL Concepts

Only then do they start writing SQL.

---

# Week 1 Mistake Checklist

Before executing any query, ask yourself:

□ Am I filtering rows or groups?

□ Do I need one metric or one metric per group?

□ Have I identified the business metric?

□ Have I identified the business dimension?

□ Do I actually need a JOIN?

□ Am I joining the correct columns?

□ Am I counting the correct thing?

□ Does NULL have business meaning here?

□ Did I understand the business problem before writing SQL?

---

# Final Thought

Most SQL bugs are **thinking mistakes**, not syntax mistakes.

Improve your thinking, and your SQL will naturally improve.

Professional SQL developers don't write perfect SQL on the first attempt.

They ask better questions before they start.