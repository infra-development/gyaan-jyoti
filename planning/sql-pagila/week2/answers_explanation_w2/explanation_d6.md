# Day 6 - Business Process Analysis

## Learning Objectives

By the end of this lesson, you should be able to:

- Analyze complete business processes.
- Combine multiple joins with aggregation.
- Measure business performance.
- Build revenue reports.
- Follow long relationship paths confidently.

---

# Introduction

Until now, we've learned individual SQL concepts:

- JOIN
- GROUP BY
- COUNT()
- SUM()
- DISTINCT
- LEFT JOIN

Today, we'll combine all of them to answer real business questions.

Instead of retrieving data, we'll analyze how the business performs.

Typical business questions include:

- Who are our best customers?
- Which films earn the most money?
- Which categories are most profitable?
- Which store performs best?

These reports help managers make business decisions.

---

# Concept 1 - Customer Analysis (Q51 & Q52)

## Q51

**Which customers generated the highest revenue?**

### Business Thinking

Revenue comes from payments.

Relationship path:

```
Customer
    ↓
Payment
```

Group payments by customer and calculate:

```sql
SUM(amount)
```

Finally, sort the results in descending order to find the highest-paying customers.

---

## Q52

**Which customers rented the most films?**

Relationship:

```
Customer
    ↓
Rental
```

Each rental represents one transaction.

Group by customer and count rentals.

Customers with the highest counts are the most active customers.

---

# Concept 2 - Film and Category Performance (Q53 & Q54)

## Q53

**Which films generated the highest revenue?**

Relationship path:

```
Film
    ↓
Inventory
    ↓
Rental
    ↓
Payment
```

Revenue belongs to payments, not films.

We reach the payments by following the relationship path.

Then we calculate:

```sql
SUM(amount)
```

for each film.

---

## Q54

**Which categories generated the highest revenue?**

Relationship path:

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
    ↓
Payment
```

Although this path is longer, the thinking process remains the same.

Follow the relationships.

Then group and aggregate.

---

# Concept 3 - Actor and Store Performance (Q55 & Q56)

## Q55

**Which actors appear in the most rented films?**

Relationship path:

```
Actor
    ↓
Film_Actor
    ↓
Film
    ↓
Inventory
    ↓
Rental
```

Instead of counting films,

we count rentals.

An actor whose films are rented more often is likely more popular.

---

## Q56

**Which store generated the highest revenue?**

Relationship path:

```
Store
    ↓
Inventory
    ↓
Rental
    ↓
Payment
```

Revenue belongs to payments.

Stores own inventory.

Inventory is rented.

Rentals generate payments.

Following this business process leads us to the answer.

---

# Concept 4 - Geographic Analysis (Q57 & Q58)

## Q57

**Which city generated the highest revenue?**

Relationship:

```
City
    ↓
Address
    ↓
Customer
    ↓
Payment
```

Customers live at addresses.

Addresses belong to cities.

Payments belong to customers.

Group by city and sum the payments.

---

## Q58

**Which country generated the highest revenue?**

Relationship:

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

This is simply an extension of the previous question.

Instead of grouping by city, group by country.

---

# Concept 5 - Time-Based Analysis (Q59)

## Business Question

Which day recorded the highest number of rentals?

Unlike previous questions, this report focuses on **time**.

The `rental_date` contains both the date and time.

For this report, we need only the date.

Example:

```
2005-06-14 15:16:03

↓

2005-06-14
```

Group by the date and count the rentals.

This is a common business report used to identify busy days.

---

# Concept 6 - Thinking in Business Processes (Q60)

Before writing SQL, identify the business process.

For example:

Revenue by Category

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
    ↓
Payment
```

Notice that every report follows the same pattern:

```
Business Question

↓

Business Process

↓

Relationship Path

↓

JOIN

↓

GROUP BY

↓

Aggregate Function

↓

ORDER BY
```

Professional SQL developers think in this order.

---

# Common Mistakes

❌ Starting with SQL instead of understanding the business process.

❌ Using the wrong aggregation function.

❌ Forgetting where revenue actually comes from.

❌ Skipping intermediate tables.

❌ Grouping by the wrong business dimension.

---

# Day 6 Summary

Today you learned:

- Business reports measure performance.
- Revenue is calculated using `SUM()`.
- Activity is measured using `COUNT()`.
- Longer relationship paths follow the same principles as shorter ones.
- Every report begins by understanding the business process.

---

# What's Next?

In Day 7, you'll combine everything you've learned throughout Week 2 to build complete business reports involving customers, films, categories, stores, rentals, and revenue.

This will prepare you for the more advanced SQL topics in Week 3.