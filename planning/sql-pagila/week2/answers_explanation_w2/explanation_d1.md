# Day 1 - Understanding Relationship Paths

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand why data is spread across multiple tables.
- Follow relationship paths between tables.
- Identify direct and indirect relationships.
- Understand the purpose of bridge tables.
- Read multi-table SQL queries confidently.

---

# Introduction

In Week 1, most of our queries used a single table or simple joins.

Real business questions are different.

Information is usually spread across multiple tables because each table stores a specific business entity.

For example:

- Customers are stored in the **customer** table.
- Stores are stored in the **store** table.
- Films are stored in the **film** table.
- Rentals are stored in the **rental** table.

To answer business questions, we must understand **how these tables are connected**.

This connection is called a **relationship path**.

---

# Concept 1 - Direct Relationships (Q1 & Q2)

## Q1

**Show every customer together with the store they belong to.**

### Business Thinking

Each customer belongs to one store.

The `customer` table already contains `store_id`.

Relationship path:

```
Customer
    ↓
Store
```

Only one join is required.

---

## SQL Walkthrough

```sql
FROM customer c
INNER JOIN store s
    ON c.store_id = s.store_id
```

The `store_id` in the customer table points directly to the matching record in the store table.

---

## Q2

**Show every customer together with their address.**

### Business Thinking

Customer information and address information are stored separately.

Relationship path:

```
Customer
    ↓
Address
```

---

## SQL Walkthrough

```sql
FROM customer c
INNER JOIN address a
    ON c.address_id = a.address_id
```

The customer table stores only the `address_id`. The complete address is retrieved from the `address` table.

---

# Concept 2 - Multi-Level Relationships (Q3 & Q4)

## Q3

**Show every customer together with their city.**

### Business Thinking

The customer table does not contain the city.

We must follow the relationship.

```
Customer
    ↓
Address
    ↓
City
```

Two joins are required.

---

## SQL Walkthrough

First join the customer to the address.

Then join the address to the city.

Every join follows one relationship.

---

## Q4

**Show every customer together with their country.**

### Business Thinking

The country is even further away.

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

Each table helps us move one step closer to the required information.

---

## Key Idea

Never guess joins.

Always follow the relationship path.

---

# Concept 3 - Reference Tables (Q5 & Q6)

## Q5

**Show every inventory item together with its film title.**

### Business Thinking

An inventory item represents a **physical copy** of a film.

Relationship:

```
Inventory
    ↓
Film
```

The inventory table stores `film_id`, which links directly to the film table.

---

## Q6

**Show every film together with its language.**

### Business Thinking

A film stores only `language_id`.

The language name exists in another table.

Relationship:

```
Film
    ↓
Language
```

Tables like `language` are called **reference tables** because they store lookup information used by many other tables.

---

# Concept 4 - Bridge Tables (Q7, Q8 & Q9)

## Q7

**Show every film together with its category.**

Relationship path:

```
Film
    ↓
Film_Category
    ↓
Category
```

A film can belong to multiple categories.

A category can contain many films.

This is called a **many-to-many relationship**, so a bridge table (`film_category`) is required.

---

## Q8

**Show every actor together with the films they appear in.**

Relationship path:

```
Actor
    ↓
Film_Actor
    ↓
Film
```

One actor appears in many films.

One film contains many actors.

Again, a bridge table is needed.

---

## Q9

**Show every film together with all its actors.**

This is the same relationship viewed from the opposite direction.

```
Film
    ↓
Film_Actor
    ↓
Actor
```

Understanding relationships is more important than memorizing SQL.

---

# Concept 5 - Relationship Thinking (Q10)

Before writing SQL, always draw the relationship path.

For example:

```
Customer
    ↓
Rental
    ↓
Inventory
    ↓
Film
```

Once the path is clear, writing the JOINs becomes much easier.

Professional SQL developers spend more time understanding the relationships than typing the query.

---

# Common Mistakes

❌ Joining tables because their column names look similar.

❌ Skipping bridge tables like `film_actor` or `film_category`.

❌ Trying to join unrelated tables directly.

❌ Writing SQL before identifying the relationship path.

---

# Day 1 Summary

Today you learned:

- Every table represents a business entity.
- Tables are connected through relationships.
- A relationship path shows how to move from one entity to another.
- Direct relationships need one join.
- Multi-level relationships need multiple joins.
- Many-to-many relationships require bridge tables.
- Drawing the relationship path first makes SQL much easier to write.

---

# What's Next?

In Day 2, you'll use these relationship paths to answer real business questions involving rentals, payments, customers, films, and categories using multiple joins.