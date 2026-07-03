# Day 5 - Finding Missing Information

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand why `LEFT JOIN` is used.
- Find records with no matching data.
- Use `IS NULL` correctly.
- Combine `INNER JOIN` and `LEFT JOIN`.
- Answer business questions involving missing information.

---

# Introduction

Until now, every query showed records that **had matching data**.

Today we'll answer a different type of business question.

Businesses often ask questions like:

- Which customers never rented a movie?
- Which films were never rented?
- Which inventory items have never been used?

These questions are about **missing information**.

To answer them, `INNER JOIN` is not enough.

We need `LEFT JOIN`.

---

# Concept 1 - Finding Missing Customers (Q41 & Q42)

## Q41

**Find customers who have never rented a movie.**

### Business Thinking

Start with every customer.

Then check whether a matching rental exists.

Relationship:

```
Customer
    ↓
Rental
```

If no rental exists, the rental columns become `NULL`.

The query filters those rows using:

```sql
WHERE r.rental_id IS NULL
```

---

## Q42

**Find customers who have never made a payment.**

Relationship:

```
Customer
    ↓
Payment
```

Again, start with every customer.

Use a `LEFT JOIN` and keep only those without matching payments.

---

# Concept 2 - Finding Missing Activity (Q43 - Q46)

## Q43

**Find films that have never been rented.**

Relationship:

```
Film
    ↓
Inventory
    ↓
Rental
```

Some films may exist in inventory but have never been rented.

If no matching rental exists, the rental columns will be `NULL`.

---

## Q44

**Find actors who have never appeared in a rented film.**

Relationship:

```
Actor
    ↓
Film_Actor
    ↓
Inventory
    ↓
Rental
```

This question follows a longer relationship path.

If none of an actor's films have rentals, the rental count will be zero.

---

## Q45

**Find categories with no rentals.**

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

Even if a category contains films, those films may never have been rented.

---

## Q46

**Find inventory items that have never been rented.**

Relationship:

```
Inventory
    ↓
Rental
```

Every inventory item should be checked.

If no rental exists, it has never been rented.

---

# Concept 3 - Combining JOIN Types (Q47)

## Business Question

Find customers who rented movies but never made payments.

This question requires two different ideas.

Relationship:

```
Customer
    ↓
Rental

Customer
    ↓
Payment
```

The customer **must have rentals**, so we use an `INNER JOIN`.

The customer **must not have payments**, so we use a `LEFT JOIN` and filter `NULL` values.

Sometimes one query needs multiple JOIN types.

---

# Concept 4 - Missing Records in Other Tables (Q48 & Q49)

## Q48

**Find stores without inventory.**

Relationship:

```
Store
    ↓
Inventory
```

Every store should appear.

If no inventory exists, the inventory columns become `NULL`.

---

## Q49

**Find staff members who have never processed a payment.**

Relationship:

```
Staff
    ↓
Payment
```

The logic is exactly the same.

Start with all staff.

Keep only those without matching payments.

---

# Concept 5 - Choosing the Correct JOIN (Q50)

One of the easiest ways to choose the correct JOIN is by looking at the wording.

If the question contains words like:

- Never
- No
- Without
- Missing
- Not Yet

Think:

```
LEFT JOIN

+

IS NULL
```

If the question asks only for matching records,

think:

```
INNER JOIN
```

This simple rule solves many SQL problems.

---

# INNER JOIN vs LEFT JOIN

| INNER JOIN | LEFT JOIN |
|------------|-----------|
| Returns only matching rows | Returns all rows from the left table |
| Missing rows disappear | Missing rows become NULL |
| Used for existing relationships | Used for finding missing relationships |

---

# Common Mistakes

❌ Using `INNER JOIN` when searching for missing records.

❌ Forgetting to check `IS NULL`.

❌ Starting from the wrong table.

❌ Assuming missing records are errors.

❌ Forgetting that `LEFT JOIN` keeps every row from the left table.

---

# Day 5 Summary

Today you learned:

- `LEFT JOIN` keeps all rows from the left table.
- Missing matches appear as `NULL`.
- `IS NULL` helps identify missing relationships.
- Some queries require both `INNER JOIN` and `LEFT JOIN`.
- Business questions containing "never", "without", or "missing" usually require a `LEFT JOIN`.

---

# What's Next?

In Day 6, we'll combine everything we've learned so far to perform real business analysis.

You'll build reports that measure:

- Revenue
- Customer value
- Film popularity
- Store performance
- Business trends