# Day 2 - CASE Expressions

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand why `CASE` is used.
- Convert technical values into business-friendly labels.
- Write simple and nested CASE expressions.
- Use `CASE` inside `SELECT`, `ORDER BY`, and `GROUP BY`.
- Translate business rules into SQL logic.

---

# Introduction

So far, we've learned how to:

- Retrieve data.
- Join tables.
- Build reports.

Now we'll learn how to **transform data**.

Businesses rarely want to see raw database values.

Instead of:

```
1

0
```

they prefer:

```
Active

Inactive
```

Instead of:

```
45

95

160
```

they prefer:

```
Short

Medium

Long
```

This transformation is performed using the **CASE expression**.

---

# What is CASE?

A CASE expression allows SQL to make decisions.

Think of it like an **IF...ELSE** statement in programming.

General syntax:

```sql
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END
```

SQL evaluates each condition from top to bottom.

The first matching condition is returned.

---

# Concept 1 - Simple CASE Expressions (Q11 - Q13)

## Q11

**Display customer status as "Active" or "Inactive".**

Business stores:

```
1

0
```

Business users want:

```
Active

Inactive
```

CASE translates technical values into meaningful business labels.

---

## Q12

**Classify films based on their length.**

Business rule:

```
Less than 60

↓

Short

-----------------

60–120

↓

Medium

-----------------

More than 120

↓

Long
```

Notice that SQL is applying business rules, not calculations.

---

## Q13

**Display payment amounts as Low, Medium or High.**

Business rule:

```
Amount

↓

Category
```

Instead of displaying raw numbers,

the report becomes easier to understand.

---

# Concept 2 - CASE with Business Reports (Q14 & Q15)

## Q14

**Categorize customers based on total rentals.**

First calculate:

```
COUNT(rental_id)
```

Then classify customers.

Example:

```
5 Rentals

↓

Occasional

-----------------

28 Rentals

↓

Regular

-----------------

45 Rentals

↓

Frequent
```

CASE often works together with aggregate functions.

---

## Q15

**Categorize rental duration.**

Relationship:

```
Film

↓

Rental Duration

↓

Business Label
```

Again,

we convert numbers into business language.

---

# Concept 3 - CASE Beyond SELECT (Q16 & Q17)

Many beginners think CASE only works inside SELECT.

It can also be used elsewhere.

---

## Q16

**CASE inside ORDER BY**

CASE controls how rows are sorted.

Example:

```
Active Customers

↓

First

Inactive Customers

↓

Last
```

CASE lets us define our own sorting rules.

---

## Q17

**CASE inside GROUP BY**

Instead of grouping by numeric values:

```
1

0
```

we group by:

```
Active

Inactive
```

This produces reports that are much easier to read.

---

# Concept 4 - Multiple WHEN Conditions (Q18)

CASE can evaluate several conditions.

Example:

```
Replacement Cost

↓

Low Cost

↓

Medium Cost

↓

High Cost

↓

Premium Cost
```

Conditions are checked from top to bottom.

The first matching condition is returned.

Order matters.

---

# Concept 5 - Nested CASE (Q19)

Sometimes one decision depends on another.

Example:

```
Customer

↓

Is Active?

↓

Yes

↓

Which Store?

↓

Store 1

or

Store 2
```

One CASE expression can contain another CASE expression.

Nested CASE should only be used when a single CASE cannot express the business rule clearly.

---

# Concept 6 - Business Thinking Before SQL (Q20)

Before writing CASE,

write the business rule.

Example:

```
Active = 1

↓

Active

Else

↓

Inactive
```

Then convert the rule into SQL.

Think:

```
Business Rule

↓

CASE

↓

Business Report
```

Professionals define the business logic first.

SQL simply implements it.

---

# CASE Decision Flow

```
Business Requirement

↓

Business Rule

↓

CASE Expression

↓

Business-Friendly Output
```

---

# Common Mistakes

❌ Forgetting the `ELSE` clause.

❌ Writing conditions in the wrong order.

❌ Using CASE when `COALESCE()` is more appropriate.

❌ Making CASE expressions unnecessarily complex.

❌ Writing SQL before understanding the business rule.

---

# Day 2 Summary

Today you learned:

- CASE translates technical values into business language.
- CASE works like an IF...ELSE statement.
- CASE can be used in `SELECT`, `ORDER BY`, and `GROUP BY`.
- CASE can contain multiple `WHEN` conditions.
- CASE expressions can be nested.
- Business rules should be defined before writing SQL.

---

# What's Next?

In Day 3, you'll learn how to handle **NULL values** using:

- `COALESCE`
- `NULLIF`

You'll discover how to replace missing values, avoid calculation errors, and build cleaner business reports.