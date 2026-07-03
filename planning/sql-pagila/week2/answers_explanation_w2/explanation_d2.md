# Day 2 - Multi-Table JOIN Practice

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand how multiple tables work together.
- Follow relationship paths confidently.
- Read multi-table JOIN queries.
- Determine how many joins a business question requires.
- Choose the correct intermediate tables.

---

# Introduction

In Day 1, we learned how tables are connected.

Today, we'll use those connections to answer real business questions.

Instead of asking:

> Which table contains the answer?

Start asking:

> How do I reach the answer?

Every JOIN follows a relationship path.

---

# Concept 1 - Customer and Rental (Q11)

## Business Question

Show every rental together with the customer name.

### Business Thinking

The rental table stores `customer_id`.

The customer table stores the customer's name.

Relationship path:

```
Rental
    ↓
Customer
```

Only one JOIN is required.

### SQL Walkthrough

```sql
FROM rental r
INNER JOIN customer c
    ON r.customer_id = c.customer_id
```

The JOIN matches each rental with the customer who made it.

---

# Concept 2 - Rental to Film (Q12)

## Business Question

Show every rental together with the rented film title.

### Business Thinking

The rental table does not store the film title.

It stores the inventory item.

The inventory item tells us which film was rented.

Relationship path:

```
Rental
    ↓
Inventory
    ↓
Film
```

Two JOINs are required.

### Key Learning

Never skip intermediate tables.

Every JOIN follows an actual business relationship.

---

# Concept 3 - Payment Relationships (Q13 & Q14)

## Q13

Show every payment together with the customer name.

Relationship:

```
Payment
    ↓
Customer
```

The payment table stores `customer_id`.

One JOIN is enough.

---

## Q14

Show every payment together with the staff member who received it.

Relationship:

```
Payment
    ↓
Staff
```

Every payment records which staff member processed it.

Again, only one JOIN is needed.

---

# Concept 4 - Finding the Correct Path (Q15 & Q16)

## Q15

Show every rental together with the store from which it was rented.

Many beginners try:

```
Rental
    ↓
Store
```

There is no direct relationship.

Correct path:

```
Rental
    ↓
Inventory
    ↓
Store
```

The rental references an inventory item.

The inventory belongs to a store.

---

## Q16

Show every customer together with every film they have rented.

Relationship path:

```
Customer
    ↓
Rental
    ↓
Inventory
    ↓
Film
```

This is one of the most important relationship paths in the Pagila database.

Remember it.

---

# Concept 5 - Multiple Business Processes (Q17 - Q19)

## Q17

Customer and Payments

```
Customer
    ↓
Payment
```

Simple one-to-many relationship.

---

## Q18

Actor and Category

This question combines two bridge tables.

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

This is a good example of why relationship thinking is more important than memorizing SQL.

---

## Q19

Category and Film

```
Category
    ↓
Film_Category
    ↓
Film
```

Again, the bridge table connects the two entities.

---

# Concept 6 - Counting JOINs (Q20)

One useful habit is counting the number of joins before writing SQL.

Example:

```
Customer
    ↓
Rental
    ↓
Inventory
    ↓
Film
```

Number of JOINs:

```
3
```

As a general rule:

```
Number of tables - 1

=

Number of JOINs
```

Examples:

```
2 tables

↓

1 JOIN
```

```
3 tables

↓

2 JOINs
```

```
5 tables

↓

4 JOINs
```

This quick check helps verify that your query follows the complete relationship path.

---

# Common Mistakes

❌ Trying to join unrelated tables directly.

❌ Skipping intermediate tables like `inventory`.

❌ Forgetting bridge tables.

❌ Guessing the JOIN condition instead of following foreign keys.

❌ Thinking more JOINs always mean a better query.

---

# Day 2 Summary

Today you learned:

- Every JOIN follows a relationship.
- Multi-table queries are simply longer relationship paths.
- Intermediate tables are often required.
- Bridge tables connect many-to-many relationships.
- Counting relationship steps helps determine the number of JOINs.

---

# What's Next?

In Day 3, you'll combine JOINs with:

- GROUP BY
- COUNT()
- SUM()
- Aggregation

to build real business reports.