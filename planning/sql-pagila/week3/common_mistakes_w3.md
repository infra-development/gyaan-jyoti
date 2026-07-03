# Common SQL Mistakes
## Week 3

> Week 3 is not about retrieving more data.
>
> It is about presenting data correctly.
>
> Most mistakes this week happen because developers transform data incorrectly, choose the wrong function, or make reports harder to read.

---

# Mistake 1 — Using CASE When COALESCE Is Simpler

Many beginners write:

```sql
CASE
    WHEN email IS NULL
        THEN 'Unknown'
    ELSE email
END
```

Although correct, this is unnecessarily long.

---

## Better Solution

```sql
COALESCE(email, 'Unknown')
```

---

## Remember

Use:

- `COALESCE()` for replacing NULL values.
- `CASE` for business decisions.

---

# Mistake 2 — Forgetting the ELSE Clause

Example

```sql
CASE
    WHEN amount > 10 THEN 'High'
END
```

What happens if the amount is 5?

The result becomes NULL.

---

## Better Solution

Always include an `ELSE` unless you intentionally want NULL.

```sql
CASE
    WHEN amount > 10 THEN 'High'
    ELSE 'Low'
END
```

---

# Mistake 3 — Writing CASE for Every Problem

CASE is powerful.

But it is not always the best solution.

Examples:

Replace NULL?

Use:

```
COALESCE()
```

Convert datatype?

Use:

```
CAST()
```

Format text?

Use:

```
UPPER()

LOWER()

TRIM()
```

Choose the simplest SQL feature.

---

# Mistake 4 — Ignoring NULL Values

Business reports often contain NULL values.

Leaving them unchanged can confuse users.

Example

```
Phone

NULL
```

Business users prefer:

```
Not Available
```

Always think about how the report will be read.

---

# Mistake 5 — Formatting Data Too Early

Sometimes students write:

```sql
TO_CHAR(payment_date, ...)
```

before completing calculations.

This converts the value into text.

Text cannot always be used for later calculations.

---

## Correct Thinking

```
Retrieve

↓

Calculate

↓

Transform

↓

Format
```

Formatting should usually be the final step.

---

# Mistake 6 — Converting Data Without Understanding Why

Don't use CAST simply because it exists.

Always ask:

> Why am I converting this value?

Examples

- Display report
- Match datatypes
- Perform calculations

Every conversion should have a purpose.

---

# Mistake 7 — Misusing SELF JOIN

Many beginners think every comparison requires a SELF JOIN.

Not true.

A SELF JOIN is only needed when rows from the **same table** must be compared.

Examples

- Employees and Managers
- Customers in the same city
- Products with similar prices

If different tables are involved,

a normal JOIN is usually enough.

---

# Mistake 8 — Treating RIGHT JOIN as Different from LEFT JOIN

Many beginners try to memorize both.

In reality,

most RIGHT JOIN queries can be rewritten as LEFT JOIN by reversing the table order.

Professional developers generally prefer LEFT JOIN because it is easier to read.

---

# Mistake 9 — Forgetting Readability

This query works:

```sql
SELECT
UPPER(TRIM(first_name))
FROM customer;
```

But adding proper formatting makes it easier to maintain.

```sql
SELECT
    UPPER(TRIM(first_name))
FROM customer;
```

SQL is read more often than it is written.

Always write for people.

---

# Mistake 10 — Using Complex SQL for Simple Problems

Business asks:

> Display customer names in uppercase.

Some beginners immediately combine:

- CASE
- CAST
- CONCAT

Only one function is needed.

```sql
UPPER(first_name)
```

The simplest solution is usually the best.

---

# Mistake 11 — Thinking About Functions Instead of Business Requirements

Business asks:

> Display customer-friendly statuses.

Beginners think:

```
CASE
```

Professionals think:

```
Business Requirement

↓

Business Labels

↓

CASE
```

The business requirement always comes first.

---

# Mistake 12 — Forgetting That Reports Are for Humans

A technically correct report is not always a useful report.

Ask yourself:

- Is the report easy to read?
- Are values meaningful?
- Are dates formatted clearly?
- Are NULL values handled?
- Would a business user understand this immediately?

If the answer is no,

improve the presentation.

---

# Week 3 Mental Checklist

Before executing your query ask yourself:

□ Do I really need CASE?

□ Would COALESCE be simpler?

□ Have I handled NULL values?

□ Am I formatting the result for business users?

□ Am I using the simplest SQL function?

□ Is the SQL readable?

□ Am I solving the business problem instead of showing raw database values?

---

# Final Thought

Week 3 teaches an important lesson.

The database stores information for computers.

Your SQL prepares that information for people.

The best SQL developers don't just retrieve data.

They make data understandable.