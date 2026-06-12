# Day 1 - Understanding the Database

## Learning Objectives

By the end of this lesson, you should be able to:

* Understand what a relational database is.
* Understand the structure of the Pagila database.
* Discover tables and columns using PostgreSQL metadata.
* Understand primary keys and foreign keys.
* Distinguish transactional tables from reference tables.
* Read and draw simple ER diagrams.
* Navigate an unfamiliar database confidently.

---

# Why Database Exploration Matters

Imagine joining a new company.

Someone asks:

> "Can you tell me who our top customers are?"

You cannot answer immediately because you do not know:

* Which table contains customers?
* Which table contains payments?
* How are they connected?

Before writing business queries, you must understand the database structure.

This process is called **schema exploration**.

Professional SQL developers spend significant time understanding a database before writing complex queries.

---

# What Is a Relational Database?

A relational database stores data in tables.

Example:

## Customer Table

| customer_id | first_name | last_name |
| ----------- | ---------- | --------- |
| 1           | Mary       | Smith     |
| 2           | John       | Brown     |

Each row represents an entity.

Each column represents an attribute of that entity.

---

# Basic Database Terminology

## Database

A collection of related data.

Example:

```text
pagila
```

---

## Schema

A logical container that holds tables.

In PostgreSQL the default schema is:

```text
public
```

Think of a schema as a folder.

```text
Database
│
└── Schema
      │
      ├── customer
      ├── rental
      ├── payment
      └── film
```

---

## Table

A collection of related rows.

Examples:

```text
customer
film
payment
rental
```

---

## Row

A single record.

Example:

| customer_id | first_name |
| ----------- | ---------- |
| 1           | Mary       |

This entire line is one row.

---

## Column

A property of an entity.

Example:

| customer_id | first_name | last_name |
| ----------- | ---------- | --------- |

Columns:

* customer_id
* first_name
* last_name

---

# What Is Metadata?

Metadata means:

> Data about data.

The customer table stores customer information.

Metadata stores information about the customer table itself.

Examples:

* Table names
* Column names
* Data types
* Constraints
* Keys

---

# PostgreSQL Metadata

PostgreSQL exposes metadata through:

```sql
information_schema
```

Think of it as a database describing itself.

Examples of useful metadata:

```sql
information_schema.tables
```

Contains information about tables.

```sql
information_schema.columns
```

Contains information about columns.

```sql
information_schema.table_constraints
```

Contains information about constraints.

---

# Primary Keys

A primary key uniquely identifies a row.

Example:

| customer_id | first_name |
| ----------- | ---------- |
| 1           | Mary       |
| 2           | John       |

customer_id is unique.

Therefore:

```text
customer_id
```

is the primary key.

---

## Characteristics of a Primary Key

A primary key:

* Must be unique
* Cannot be NULL
* Identifies exactly one row

Examples in Pagila:

```text
customer.customer_id

film.film_id

actor.actor_id

payment.payment_id

rental.rental_id
```

---

# Why Primary Keys Matter

Suppose there are two customers named:

```text
John Smith
John Smith
```

Names are not guaranteed to be unique.

Primary keys solve this problem.

```text
customer_id = 101

customer_id = 205
```

Now we can distinguish them.

---

# Foreign Keys

A foreign key creates a relationship between tables.

Example:

Customer Table

| customer_id |
| ----------- |
| 1           |
| 2           |

Rental Table

| rental_id | customer_id |
| --------- | ----------- |
| 100       | 1           |
| 101       | 2           |

The rental table references the customer table.

The column:

```text
rental.customer_id
```

is a foreign key.

---

# Why Foreign Keys Matter

Without relationships:

```text
customer
payment
rental
film
```

would be isolated tables.

Foreign keys connect them into a meaningful system.

---

# Understanding Relationships

## One-to-Many

One customer can have many rentals.

```text
Customer
    |
    |
    +------ Rental
```

Examples:

* One customer → many rentals
* One store → many customers
* One film → many inventory copies

---

## Many-to-Many

One actor can appear in many films.

One film can contain many actors.

```text
Actor
   |
   |
Film_Actor
   |
   |
Film
```

This requires a bridge table.

In Pagila:

```text
film_actor
```

is the bridge table.

---

# Transaction Tables

Transaction tables record business events.

Characteristics:

* Grow continuously
* Contain timestamps
* Store business activity

Examples:

```text
rental
payment
inventory
```

---

## Rental Example

```text
Customer rents a movie
```

This is an event.

Therefore:

```text
rental
```

is a transaction table.

---

# Reference Tables

Reference tables contain relatively stable data.

Characteristics:

* Small
* Rarely change
* Used for lookup purposes

Examples:

```text
category
language
country
city
```

---

## Example

Category Table

| category_id | name   |
| ----------- | ------ |
| 1           | Action |
| 2           | Comedy |
| 3           | Drama  |

These values rarely change.

Therefore this is reference data.

---

# Understanding the Pagila Database

Pagila models a DVD rental business.

Major entities:

```text
Customer
Film
Actor
Category
Inventory
Rental
Payment
Store
```

---

# Core Business Flow

The most important relationship chain is:

```text
Customer
    |
Rental
    |
Inventory
    |
Film
```

Interpretation:

1. Customer rents something.
2. Rental references inventory.
3. Inventory references a film.

This chain appears repeatedly throughout the course.

---

# Simplified ER Diagram

```text
Customer
    |
    +------ Rental
                |
                +------ Inventory
                            |
                            +------ Film
                                        |
                                        +------ Film_Actor
                                        |           |
                                        |           +------ Actor
                                        |
                                        +------ Film_Category
                                                    |
                                                    +------ Category

Customer
    |
    +------ Payment
```

You do not need to memorize this yet.

You only need to become comfortable reading it.

---

# How Professionals Explore New Databases

When encountering a new database:

Step 1

List all tables.

Step 2

Inspect important tables.

Step 3

Identify primary keys.

Step 4

Identify foreign keys.

Step 5

Draw relationship diagrams.

Step 6

Identify transaction tables.

Step 7

Identify reference tables.

Only then start writing business queries.

---

# Summary

Today you learned:

* Database
* Schema
* Table
* Row
* Column
* Metadata
* information_schema
* Primary keys
* Foreign keys
* One-to-many relationships
* Many-to-many relationships
* Transaction tables
* Reference tables
* Basic ER diagrams
* Pagila business model

These concepts form the foundation for every SQL query you will write in the future.
