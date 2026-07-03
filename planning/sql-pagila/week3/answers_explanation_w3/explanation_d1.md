# Day 1 - Advanced JOIN Concepts

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand what a SELF JOIN is.
- Recognize situations where a SELF JOIN is required.
- Use the `USING` clause correctly.
- Understand the difference between `INNER`, `LEFT`, `RIGHT`, and `FULL` JOINs.
- Choose the most appropriate JOIN for a business problem.

---

# Introduction

During Week 2, we learned how to combine **different tables**.

Examples:

```
Customer
    ↓
Rental
```

```
Film
    ↓
Inventory
```

```
Customer
    ↓
Payment
```

Week 3 begins with a different challenge.

Sometimes the relationship does **not** exist between different tables.

Sometimes the relationship exists **within the same table**.

This is where **SELF JOIN** becomes useful.

We'll also complete our understanding of SQL JOINs by learning about:

- USING
- RIGHT JOIN
- FULL JOIN

---

# Concept 1 - SELF JOIN (Q1 - Q3)

## What is a SELF JOIN?

A SELF JOIN joins a table with itself.

Instead of comparing rows from different tables,

it compares rows within the **same table**.

The same table is simply given two different aliases.

---

## Q1

**Show every staff member together with their manager.**

Business relationship:

```
Staff
    ↓
Manager
```

Both people belong to the same table.

One represents the employee.

The other represents the manager.

Although the standard Pagila database does not contain a manager relationship, this question demonstrates one of the most common SELF JOIN patterns used in business applications.

---

## Q2

**Find actors who have acted together in the same film.**

Relationship:

```
Actor
    ↓
Film_Actor
    ↓
Film
    ↓
Film_Actor
    ↓
Actor
```

Notice what happens.

The `film_actor` table appears twice.

The first copy represents one actor.

The second copy represents another actor.

This allows us to compare actors appearing in the same film.

---

## Q3

**Find customers living in the same city.**

Relationship:

```
Customer
    ↓
Address
    ↓
City
    ↑
Address
    ↑
Customer
```

Again, two customers are compared.

Instead of joining different tables,

we compare different rows from the same table.

---

# Concept 2 - USING Clause (Q4 & Q5)

Normally we write joins like this:

```sql
ON customer.address_id = address.address_id
```

If both tables have the same column name,

PostgreSQL allows a shorter syntax.

```sql
USING (address_id)
```

Both queries produce the same result.

The difference is only readability.

---

## Q4

Rewrite an INNER JOIN using `USING`.

Instead of:

```sql
ON customer.address_id = address.address_id
```

we write:

```sql
USING (address_id)
```

---

## Q5

Rewrite a LEFT JOIN using `USING`.

The same idea applies.

If both tables share the join column,

`USING` makes the query cleaner.

---

# Concept 3 - RIGHT JOIN and FULL JOIN (Q6 & Q7)

## Q6

Compare INNER JOIN and RIGHT JOIN.

### INNER JOIN

Returns only matching rows.

```
Customer

↓

Payment
```

Only customers with payments appear.

---

### RIGHT JOIN

Returns every row from the **right table**.

```
Customer

↓

Payment
```

Even if a customer record were missing,

every payment would still appear.

In practice, this can almost always be rewritten as a LEFT JOIN by reversing the table order.

---

## Q7

Compare LEFT JOIN and FULL JOIN.

### LEFT JOIN

```
All rows from left table

+

Matching rows from right table
```

---

### FULL JOIN

```
All rows from left table

+

All rows from right table

+

Matching rows
```

FULL JOIN returns every row from both tables, matching them where possible.

---

# Concept 4 - Choosing the Correct JOIN (Q8 & Q9)

## Q8

When should SELF JOIN be used?

Ask yourself:

> Am I comparing one row with another row from the same table?

If the answer is **yes**,

consider a SELF JOIN.

Examples include:

- Employees and Managers
- Customers in the same city
- Actors appearing together
- Products with the same price

---

## Q9

Why is RIGHT JOIN rarely used?

Most RIGHT JOIN queries can be rewritten as LEFT JOIN queries simply by reversing the table order.

Example:

```
Customer
RIGHT JOIN
Payment
```

becomes

```
Payment
LEFT JOIN
Customer
```

The result is the same.

Because LEFT JOIN is easier to read, most SQL developers prefer it.

---

# Concept 5 - Relationship Thinking (Q10)

Before writing SQL,

always draw the relationship.

Example:

```
Actor
    ↓
Film_Actor
    ↓
Film
    ↓
Film_Actor
    ↓
Actor
```

Once the path is clear,

the JOINs become much easier to write.

This habit prevents many SQL mistakes.

---

# JOIN Comparison

| JOIN | Returns |
|------|---------|
| INNER JOIN | Only matching rows |
| LEFT JOIN | All left rows + matching right rows |
| RIGHT JOIN | All right rows + matching left rows |
| FULL JOIN | All rows from both tables |
| SELF JOIN | Compares rows within the same table |

---

# Common Mistakes

❌ Using a SELF JOIN when different tables are involved.

❌ Forgetting to assign aliases in a SELF JOIN.

❌ Thinking RIGHT JOIN is fundamentally different from LEFT JOIN.

❌ Using `USING` when column names differ.

❌ Writing SQL before understanding the relationship.

---

# Day 1 Summary

Today you learned:

- A SELF JOIN compares rows within the same table.
- The `USING` clause simplifies JOIN syntax when column names match.
- RIGHT JOIN can usually be rewritten as a LEFT JOIN.
- FULL JOIN returns all rows from both tables.
- Drawing the relationship path before writing SQL makes complex JOINs much easier.

---

# What's Next?

In Day 2, you'll move from connecting tables to **transforming data** using `CASE` expressions.

Instead of displaying raw database values, you'll learn how to present meaningful business information such as:

- Active / Inactive
- Budget / Standard / Premium
- Short / Medium / Long

This is where SQL begins to transform raw data into business-friendly reports.