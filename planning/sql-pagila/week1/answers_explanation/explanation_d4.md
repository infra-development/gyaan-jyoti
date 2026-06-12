# Day 4 - Understanding Relationships and Joins

## Learning Objectives

By the end of this lesson, you should be able to:

* Understand why joins exist.
* Understand table relationships.
* Understand cardinality.
* Identify one-to-one relationships.
* Identify one-to-many relationships.
* Identify many-to-many relationships.
* Understand bridge tables.
* Write and read INNER JOIN queries.
* Follow relationship paths through a database.
* Understand how Pagila models actors, films, and categories.

---

# Why Joins Matter

Most real business questions cannot be answered from a single table.

Consider:

> Which actors appear in the most films?

Actor names exist in:

```text
actor
```

Film participation exists in:

```text
film_actor
```

Film information exists in:

```text
film
```

The answer requires combining data from multiple tables.

This is the purpose of joins.

---

# Thinking About Relationships

Databases are not collections of isolated tables.

They are networks of related tables.

Example:

```text
Customer
    |
Rental
    |
Inventory
    |
Film
```

Each line represents a relationship.

---

# What Creates Relationships?

Relationships are created using foreign keys.

Example:

```text
customer.customer_id
```

Primary key.

Referenced by:

```text
rental.customer_id
```

Foreign key.

This creates a connection.

---

# What Is Cardinality?

Cardinality describes how many records can be related.

Examples:

* One-to-One
* One-to-Many
* Many-to-Many

Understanding cardinality is one of the most important database skills.

---

# One-to-One Relationship

Example:

```text
Person
    |
Passport
```

One person has one passport.

One passport belongs to one person.

These relationships are relatively uncommon.

---

# One-to-Many Relationship

Most common relationship type.

Example:

```text
Store
    |
Customer
```

One store can have many customers.

Each customer belongs to one store.

---

Another example:

```text
Customer
    |
Rental
```

One customer can have many rentals.

Each rental belongs to one customer.

---

Visual Representation

```text
Customer
    |
    +--- Rental 1
    +--- Rental 2
    +--- Rental 3
```

---

# Many-to-Many Relationship

Example:

Actors and Films.

One actor can appear in many films.

One film can contain many actors.

```text
Actor
  ↔
Film
```

Relational databases cannot directly store this relationship.

A bridge table is required.

---

# Bridge Tables

A bridge table resolves a many-to-many relationship.

In Pagila:

```text
film_actor
```

contains:

```text
actor_id
film_id
```

Example:

| actor_id | film_id |
| -------- | ------- |
| 1        | 10      |
| 1        | 15      |
| 2        | 10      |

Interpretation:

Actor 1 appears in films 10 and 15.

Actor 2 appears in film 10.

---

# The Film Actor Relationship

Pagila uses:

```text
actor
    |
film_actor
    |
film
```

Visualized:

```text
Actor
    |
    +------ Film_Actor
                  |
                  +------ Film
```

This pattern appears everywhere in relational databases.

---

# Real World Examples of Bridge Tables

Students and Courses

```text
student
    |
enrollment
    |
course
```

---

Employees and Projects

```text
employee
    |
project_assignment
    |
project
```

---

Users and Roles

```text
user
    |
user_role
    |
role
```

Bridge tables are extremely common.

---

# Understanding JOIN

JOIN combines rows from multiple tables.

Example:

```text
actor
```

contains names.

```text
film_actor
```

contains relationships.

A join combines them.

---

# INNER JOIN

The most commonly used join.

General structure:

```sql
SELECT ...
FROM table1
JOIN table2
    ON ...
```

---

# The ON Clause

The ON clause tells SQL how tables are related.

Example:

```sql
ON actor.actor_id = film_actor.actor_id
```

Meaning:

Match rows where actor IDs are equal.

---

# Visualizing a Join

Actor:

| actor_id | name |
| -------- | ---- |
| 1        | Tom  |
| 2        | John |

Film_Actor:

| actor_id | film_id |
| -------- | ------- |
| 1        | 10      |
| 1        | 15      |

Result:

| actor_id | name | film_id |
| -------- | ---- | ------- |
| 1        | Tom  | 10      |
| 1        | Tom  | 15      |

Rows are combined.

---

# Understanding Join Paths

Many questions require multiple joins.

Example:

> Which actors appear in the most films?

Path:

```text
actor
    |
film_actor
    |
film
```

---

You must learn to think:

```text
Start table

→ relationship

→ next table

→ relationship

→ target table
```

This becomes a critical skill.

---

# Reading a Join Path

Example:

```text
Category
    |
Film_Category
    |
Film
```

Question:

> How many films belong to each category?

Join path:

```text
category
    |
film_category
    |
film
```

This is exactly what we used in Day 4.

---

# Aggregation After Joins

One of the most common analytical patterns.

Step 1

Join tables.

Step 2

Group results.

Step 3

Aggregate.

Example:

```text
Category
    |
Film
```

Question:

> How many films are in each category?

Pattern:

```text
JOIN

GROUP BY

COUNT
```

This pattern appears constantly.

---

# Counting Related Records

Examples:

* Films per category
* Rentals per customer
* Payments per customer
* Films per actor

All follow the same logic.

---

# Understanding Duplicate Rows

A join often increases row count.

Example:

Actor:

| actor_id | name |
| -------- | ---- |
| 1        | Tom  |

Film_Actor:

| actor_id | film_id |
| -------- | ------- |
| 1        | 10      |
| 1        | 15      |
| 1        | 20      |

Joined result:

| actor_id | name | film_id |
| -------- | ---- | ------- |
| 1        | Tom  | 10      |
| 1        | Tom  | 15      |
| 1        | Tom  | 20      |

This is expected.

Many beginners incorrectly think the join is broken.

It is not.

The relationship is producing multiple matching rows.

---

# The Category Relationship

Pagila uses another bridge table:

```text
film
    |
film_category
    |
category
```

This allows a category to contain many films.

---

# Day 4 Business Questions

Today's questions answer:

* How many categories exist?
* How many actors exist?
* How many films belong to each category?
* Which actors appear most frequently?
* Which actors appear least frequently?

These are relationship-based questions.

---

# Common Join Mistakes

## Missing Join Condition

Wrong:

```sql
FROM actor
JOIN film_actor
```

Without ON.

This creates a huge Cartesian product.

---

Correct:

```sql
FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
```

---

## Joining Wrong Columns

Wrong:

```sql
actor.actor_id = film_actor.film_id
```

Different meanings.

Results become incorrect.

Always understand relationships first.

---

## Forgetting the Bridge Table

Wrong thinking:

```text
Actor
    |
Film
```

Direct relationship does not exist.

Correct:

```text
Actor
    |
Film_Actor
    |
Film
```

---

# Professional SQL Thinking

When given a question:

Step 1

Identify starting table.

Step 2

Identify target information.

Step 3

Find relationship path.

Step 4

Perform joins.

Step 5

Aggregate if necessary.

---

Example

Question:

> Which actors appear in the most films?

Process:

```text
Need actors

Need films

Relationship?

actor
    |
film_actor
    |
film
```

Then:

```text
JOIN

GROUP BY actor

COUNT films

ORDER BY count DESC
```

This thinking process is more important than memorizing syntax.

---

# Summary

Today you learned:

* Relationships
* Cardinality
* One-to-One
* One-to-Many
* Many-to-Many
* Bridge Tables
* INNER JOIN
* Join Paths
* Aggregation After Joins
* Counting Related Records
* Relationship-Based Query Design

These concepts form the foundation of almost every real-world SQL query you will write.
