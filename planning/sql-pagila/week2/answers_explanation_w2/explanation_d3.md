# Day 3 - Business Reporting with GROUP BY

## Learning Objectives

By the end of this lesson, you should be able to:

- Combine JOINs with `GROUP BY`.
- Build simple business reports.
- Identify dimensions and measures.
- Use `COUNT()` and `SUM()` correctly.
- Read and understand aggregated reports.

---

# Introduction

So far, we've learned how to retrieve information from multiple tables.

Now we'll answer a different type of question.

Instead of asking:

> Which customer rented which film?

we'll ask:

> How many customers are in each country?

> Which category has the most films?

> Which customer generated the most revenue?

These are called **business reports**.

Business reports summarize data instead of showing individual records.

---

# Concept 1 - Counting Customers (Q21 & Q22)

## Q21

**How many customers belong to each country?**

### Business Thinking

Customer information is stored in the `customer` table.

Country information is stored in the `country` table.

Relationship path:

```
Customer
    ↓
Address
    ↓
City
    ↓
Country
```

After connecting the tables, group customers by country.

### SQL Pattern

```
JOIN

↓

GROUP BY Country

↓

COUNT(Customer)
```

---

## Q22

**How many customers belong to each city?**

Relationship path:

```
Customer
    ↓
Address
    ↓
City
```

Instead of grouping by country, group by city.

The overall approach remains exactly the same.

---

# Concept 2 - Counting Related Records (Q23 - Q26)

## Q23

**How many films belong to each language?**

Relationship:

```
Film
    ↓
Language
```

Group films by language and count them.

---

## Q24

**How many films belong to each category?**

Relationship:

```
Category
    ↓
Film_Category
    ↓
Film
```

Notice that the bridge table is still required.

---

## Q25

**How many films has each actor appeared in?**

Relationship:

```
Actor
    ↓
Film_Actor
```

Each row in `film_actor` represents one appearance.

Counting those rows gives the number of films for each actor.

---

## Q26

**How many rentals has each customer made?**

Relationship:

```
Customer
    ↓
Rental
```

Every rental belongs to one customer.

Group by customer and count rentals.

---

# Concept 3 - Summing Values (Q27 & Q28)

Until now we counted records.

Now we'll calculate totals.

## Q27

**How much revenue has each customer generated?**

Relationship:

```
Customer
    ↓
Payment
```

Instead of:

```sql
COUNT()
```

we use:

```sql
SUM(amount)
```

because we want total revenue.

---

## Q28

**How much revenue has each staff member collected?**

Relationship:

```
Staff
    ↓
Payment
```

Again,

group by staff member and calculate:

```
SUM(amount)
```

---

# Concept 4 - Building Larger Reports (Q29 & Q30)

## Q29

**How many rentals occurred in each store?**

Relationship:

```
Store
    ↓
Inventory
    ↓
Rental
```

Notice that rentals are connected to stores through inventory.

---

## Q30

**Which categories generate the highest number of rentals?**

Relationship:

```
Category
    ↓
Film_Category
    ↓
Film
    ↓
Inventory
    ↓
Rental
```

This is our longest relationship path so far.

Although there are several joins, the thinking process is still the same.

Follow the relationship.

Then group.

Then count.

---

# Business Reporting Pattern

Almost every report in this lesson follows the same structure.

```
Business Question

↓

Relationship Path

↓

JOIN

↓

GROUP BY

↓

COUNT() or SUM()

↓

ORDER BY
```

Once you recognize this pattern, writing reports becomes much easier.

---

# Common Mistakes

❌ Forgetting to use `GROUP BY`.

❌ Grouping by the wrong column.

❌ Using `COUNT()` when `SUM()` is required.

❌ Skipping bridge tables.

❌ Forgetting that every selected non-aggregated column must appear in the `GROUP BY` clause.

---

# Day 3 Summary

Today you learned:

- Business reports summarize data.
- `GROUP BY` creates one result for each group.
- `COUNT()` counts records.
- `SUM()` adds numeric values.
- Every report begins by identifying the relationship path.
- Most business reports follow the same SQL pattern.

---

# What's Next?

In Day 4, we'll explore duplicate rows, `DISTINCT`, and why JOINs sometimes produce more records than expected.