# Day 3 - Handling NULL Values

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand what `NULL` represents.
- Replace missing values using `COALESCE`.
- Use `NULLIF` to prevent calculation errors.
- Choose between `CASE` and `COALESCE`.
- Build cleaner and more user-friendly business reports.

---

# Introduction

In databases, not every piece of information is always available.

Examples:

- A customer may not have provided an email address.
- A phone number may be missing.
- A product may not yet have a supplier.

When information is unknown or missing, SQL stores it as:

```
NULL
```

One of the most common mistakes beginners make is treating `NULL` like an empty string or the number zero.

It is neither.

`NULL` simply means:

> **The value is unknown or missing.**

---

# What is NULL?

Suppose we have the following data.

| Customer | Email |
|----------|--------|
| John | john@email.com |
| Mary | NULL |
| David | david@email.com |

The database is not saying Mary has an empty email.

It is saying:

> The email is unknown.

Business users usually don't want to see NULL.

Instead they prefer:

```
Unknown

Not Available

No Email
```

This is where **COALESCE** becomes useful.

---

# Concept 1 - Replacing NULL Values (Q21 - Q23)

## Q21

**Replace NULL phone numbers with "Not Available".**

Business users prefer meaningful values.

Instead of:

```
NULL
```

display:

```
Not Available
```

The SQL pattern is:

```sql
COALESCE(phone, 'Not Available')
```

---

## Q22

**Replace NULL emails with "Unknown".**

Again,

the goal is improving readability.

Instead of displaying NULL,

the report displays:

```
Unknown
```

---

## Q23

**Display a default value using COALESCE.**

General syntax:

```sql
COALESCE(value1, value2)
```

Meaning:

> Return the first value that is **not NULL**.

Examples:

```
Email exists

↓

Display Email

----------------

Email is NULL

↓

Display Default Value
```

---

# Concept 2 - NULLIF (Q24)

## Business Question

Avoid division by zero.

Suppose we calculate:

```
Revenue

÷

Quantity
```

If quantity is zero,

the calculation fails.

Instead we write:

```sql
NULLIF(quantity, 0)
```

If quantity equals zero,

`NULLIF` returns:

```
NULL
```

The calculation safely returns NULL instead of producing an error.

---

# Concept 3 - CASE vs COALESCE (Q25)

Both queries produce similar results.

Example using CASE:

```sql
CASE
    WHEN email IS NULL
        THEN 'Unknown'
    ELSE email
END
```

Using COALESCE:

```sql
COALESCE(email, 'Unknown')
```

The second solution is:

- Shorter
- Easier to read
- Easier to maintain

Professionals usually choose the simpler solution.

---

# Concept 4 - Finding Missing Information (Q26 & Q27)

## Q26

Sometimes we don't want to replace NULL values.

Instead,

we want to find them.

Example:

```
WHERE email IS NULL
```

This helps identify incomplete records.

---

## Q27

Sometimes we simply want better presentation.

Instead of:

```
NULL
```

display:

```
No Email Provided
```

Again,

`COALESCE` is the simplest solution.

---

# Concept 5 - Understanding NULLIF (Q28)

General syntax:

```sql
NULLIF(value1, value2)
```

Meaning:

```
If both values are equal

↓

Return NULL

Otherwise

↓

Return value1
```

Common uses:

- Prevent division by zero.
- Ignore unwanted values.
- Simplify calculations.

---

# Concept 6 - Choosing COALESCE (Q29 & Q30)

## Q29

When should COALESCE be used?

Whenever you want to display a default value instead of NULL.

Examples:

```
Unknown

Not Available

No Email

No Phone
```

---

## Q30

Many CASE expressions can be simplified.

Instead of:

```sql
CASE
    WHEN email IS NULL
        THEN 'Unknown'
    ELSE email
END
```

simply write:

```sql
COALESCE(email, 'Unknown')
```

Less code.

Same result.

Better readability.

---

# Choosing Between CASE, COALESCE and NULLIF

| Business Need | SQL Feature |
|---------------|-------------|
| Replace NULL values | COALESCE |
| Apply business rules | CASE |
| Avoid division by zero | NULLIF |

---

# NULL Thinking Pattern

```
Missing Value

↓

Should it be displayed?

↓

Yes

↓

COALESCE

-----------------

No

↓

Find NULL records

↓

IS NULL
```

---

# Common Mistakes

❌ Thinking NULL means zero.

❌ Thinking NULL means an empty string.

❌ Using CASE when COALESCE is enough.

❌ Forgetting that calculations involving NULL often return NULL.

❌ Ignoring NULL values in business reports.

---

# Day 3 Summary

Today you learned:

- NULL represents unknown or missing information.
- COALESCE replaces NULL values with meaningful defaults.
- NULLIF safely converts specific values into NULL.
- COALESCE is often simpler than CASE.
- Handling NULL values improves report quality and readability.

---

# What's Next?

In Day 4, you'll learn how to **convert data types** using `CAST`.

You'll discover how to:

- Convert numbers into text.
- Convert timestamps into dates.
- Prepare data for calculations.
- Format values for business reports.