# Day 4 - DISTINCT and Duplicate Thinking

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand why duplicate rows appear after JOINs.
- Know when to use `DISTINCT`.
- Use `COUNT(DISTINCT ...)` correctly.
- Find common and exclusive records.
- Analyze many-to-many relationships confidently.

---

# Introduction

One of the biggest surprises for beginners is seeing duplicate rows after writing a JOIN.

Many people immediately think:

> "My JOIN is wrong."

Most of the time, it isn't.

Duplicate rows usually appear because of the **relationships between the tables**, not because of incorrect SQL.

Today's lesson helps you understand **why duplicates occur** and **how to handle them correctly**.

---

# Concept 1 - Counting Unique Values (Q31 & Q32)

## Q31

**How many unique customers have rented movies?**

### Business Thinking

The `rental` table contains one row for every rental.

A customer can rent many movies.

If we simply count rows, the same customer will be counted many times.

Instead, we count unique customer IDs.

```sql
COUNT(DISTINCT customer_id)
```

---

## Q32

**How many unique films have been rented?**

### Relationship Path

```
Rental
    ↓
Inventory
    ↓
Film
```

A film can be rented many times.

We want to count each film only once.

Again, `DISTINCT` removes duplicates before counting.

---

# Concept 2 - COUNT(DISTINCT) with Multiple Tables (Q33 - Q35)

## Q33

**How many different categories has each customer rented from?**

Relationship path:

```
Customer
    ↓
Rental
    ↓
Inventory
    ↓
Film
    ↓
Film_Category
    ↓
Category
```

A customer may rent several films from the same category.

Without `DISTINCT`, the same category would be counted multiple times.

---

## Q34

**How many different actors appear in each category?**

Relationship path:

```
Category
    ↓
Film_Category
    ↓
Film
    ↓
Film_Actor
    ↓
Actor
```

The same actor may appear in several films of one category.

Use `COUNT(DISTINCT actor_id)` to count each actor only once.

---

## Q35

**How many different films are available in each store?**

Relationship:

```
Store
    ↓
Inventory
    ↓
Film
```

A store may have multiple copies of the same film.

We count unique films, not inventory copies.

---

# Concept 3 - Comparing Stores (Q36 - Q38)

These questions compare film availability between stores.

---

## Q36

**Find films available in both stores.**

A film must exist in:

- Store 1
- Store 2

The query groups by film and checks that both stores are present.

---

## Q37

**Find films available only in Store 1.**

The film must appear in only one store.

That store must be Store 1.

---

## Q38

**Find films available only in Store 2.**

Same logic as Q37.

Only Store 2 should contain the film.

---

# Concept 4 - Self JOIN Thinking (Q39)

## Business Question

Which actor has acted with the largest number of different co-actors?

Relationship:

```
Actor
      ↘
    Film_Actor
      ↗
Film
      ↘
    Film_Actor
      ↗
Other Actor
```

This is called a **Self JOIN**.

The `film_actor` table is joined to itself to compare actors appearing in the same film.

This is one of the first advanced JOIN patterns you'll encounter.

Don't worry if it feels difficult.

We'll revisit Self JOINs in more detail later in the course.

---

# Concept 5 - Why Duplicates Appear (Q40)

Duplicate rows are usually caused by:

- One customer having many rentals.
- One film belonging to many categories.
- One actor appearing in many films.
- One store having multiple inventory copies.

The database is not creating duplicate data.

It is showing every valid relationship.

Always ask:

> Am I counting rows?

or

> Am I counting unique business entities?

The answer determines whether `DISTINCT` is needed.

---

# Common Mistakes

❌ Using `DISTINCT` without understanding why duplicates appear.

❌ Counting rows instead of business entities.

❌ Forgetting that one-to-many relationships naturally create multiple rows.

❌ Assuming duplicate rows always indicate a bad JOIN.

❌ Counting inventory copies when the business asks for films.

---

# Day 4 Summary

Today you learned:

- Duplicate rows are usually expected.
- `DISTINCT` removes duplicate values.
- `COUNT(DISTINCT ...)` counts unique business entities.
- One-to-many and many-to-many relationships naturally create duplicates.
- Always understand **what** the business wants you to count.

---

# What's Next?

In Day 5, you'll learn how to find **missing information** using `LEFT JOIN`.

Examples include:

- Customers who never rented a movie.
- Films that were never rented.
- Categories with no rentals.
- Inventory items that have never been used.