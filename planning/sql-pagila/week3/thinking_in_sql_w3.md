# Thinking in SQL
## Week 3 - Data Transformation & Conditional Thinking

---

# Introduction

In Week 1, you learned to retrieve data.

```
Table

↓

SELECT

↓

Result
```

---

In Week 2, you learned to combine data.

```
Customer

↓

Rental

↓

Inventory

↓

Film
```

---

Week 3 introduces another way of thinking.

Sometimes the required data already exists.

The challenge is making it useful.

Professional SQL developers spend a significant amount of time **transforming** data instead of retrieving it.

---

# Thinking Pattern 1 — Raw Data vs Business Data

Suppose the database stores:

| active |
|---------|
| 1 |
| 0 |
| 1 |

Technically correct.

But a business user prefers:

| Status |
|---------|
| Active |
| Inactive |
| Active |

The information is the same.

Only the presentation changed.

This is called **data transformation**.

---

# Thinking Pattern 2 — SQL Should Speak Business

Computers understand:

```
1

0

NULL
```

Businesses understand:

```
Active

Inactive

Unknown
```

Your SQL should translate technical values into business language.

Think:

```
Raw Data

↓

Business Meaning

↓

SQL
```

---

# Thinking Pattern 3 — Ask "What Should the User See?"

Business asks:

> Show customer status.

Don't think:

```
active column
```

Think:

```
What should appear on the report?

↓

Active

Inactive
```

Then choose the appropriate SQL feature.

Usually:

```
CASE
```

---

# Thinking Pattern 4 — Missing Data Is Still Data

Many beginners see NULL and think:

```
Error
```

Professionals think:

```
Missing Information
```

Business users usually dislike seeing NULL.

Instead they prefer:

```
Not Available

Unknown

No Email

No Phone
```

Think:

```
NULL

↓

Readable Value

↓

COALESCE
```

---

# Thinking Pattern 5 — Formatting Improves Reports

Business users prefer:

```
John Smith
```

instead of

```
JOHN SMITH
```

or

```
john smith
```

Likewise,

```
2025-07-15
```

is often easier to read than

```
2025-07-15 14:53:28
```

Formatting doesn't change the data.

It improves readability.

---

# Thinking Pattern 6 — Categorize Instead of Display

Business asks:

> Show expensive films.

The database stores:

```
0.99

2.99

4.99
```

Business wants:

```
Budget

Standard

Premium
```

Think:

```
Value

↓

Category

↓

CASE
```

---

# Thinking Pattern 7 — Choose the Simplest Solution

Sometimes beginners write:

```sql
CASE
    WHEN phone IS NULL
        THEN 'Not Available'
    ELSE phone
END
```

A professional immediately recognizes:

```
COALESCE(phone, 'Not Available')
```

Same result.

Cleaner SQL.

Always ask:

> Is there a simpler way?

---

# Thinking Pattern 8 — Separate Retrieval from Transformation

Don't mix two questions.

Question 1

```
Where is the data?
```

Week 2.

---

Question 2

```
How should the data look?
```

Week 3.

Example

```
Customer

↓

Payment

↓

Revenue

↓

Format Revenue

↓

Business Report
```

---

# Thinking Pattern 9 — Think in Layers

Professional developers think like this:

```
Retrieve

↓

Transform

↓

Format

↓

Present
```

Not

```
Write SQL

Hope it works
```

---

# Thinking Pattern 10 — Readability Matters

These two queries produce the same result.

Version 1

```sql
CASE
    WHEN amount >= 10 THEN 'High'
    ELSE 'Low'
END
```

Version 2

```sql
CASE
    WHEN amount >= 10
        THEN 'High'
    ELSE 'Low'
END
```

Professionals choose the version that is easier to read.

SQL is written for people first.

Computers second.

---

# Week 3 Mental Model

Think about every report like this.

```
Business Question

↓

Retrieve Data

↓

Transform Data

↓

Clean Data

↓

Format Data

↓

Business Report
```

---

# Week 3 Checklist

Before writing SQL ask yourself:

□ Do I need to change the displayed value?

□ Do I need conditional logic?

□ Do I need to replace NULL values?

□ Do I need to convert a data type?

□ Do I need to format text?

□ Do I need to format dates?

□ Am I making the report easier to understand?

---

# Professional Thinking

A beginner asks:

> How do I display this column?

A professional asks:

> How should the business understand this information?

That small difference produces much better SQL.

---

# Final Thought

Week 1 taught you to retrieve data.

Week 2 taught you to connect data.

Week 3 teaches you to transform data.

Professional SQL developers don't simply return database values.

They present information in a way that helps businesses make better decisions.