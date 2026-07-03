# SQL Pattern Map
## Week 3 - Data Transformation, Conditional Logic & Advanced JOINs

---

# Purpose

Week 2 taught you how to connect business entities.

Week 3 teaches you how to transform raw business data into meaningful information.

Instead of memorizing SQL syntax, learn to recognize the **pattern** behind each business requirement.

---

# Pattern 1 — Conditional Values

## Business Question

Show meaningful labels instead of raw values.

Examples:

- Active / Inactive
- High / Medium / Low
- Premium / Regular Customer

### SQL Pattern

```sql
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END
```

### Use When

- Replacing codes with labels.
- Categorizing data.
- Applying business rules.

---

# Pattern 2 — Replace Missing Values

## Business Question

Show a default value when data is missing.

Examples:

- Unknown
- Not Available
- No Email

### SQL Pattern

```sql
COALESCE(column, default_value)
```

### Use When

- Displaying reports.
- Cleaning NULL values.
- Improving readability.

---

# Pattern 3 — Ignore Specific Values

## Business Question

Treat certain values as NULL.

Example:

Avoid division by zero.

### SQL Pattern

```sql
NULLIF(value1, value2)
```

### Use When

- Preventing calculation errors.
- Converting unwanted values into NULL.

---

# Pattern 4 — Convert Data Types

## Business Question

Convert data into the required format.

Examples:

- Number → Text
- Timestamp → Date
- Text → Integer

### SQL Pattern

```sql
CAST(expression AS datatype)
```

### Use When

- Formatting reports.
- Matching data types.
- Preparing data for calculations.

---

# Pattern 5 — Format Text

## Business Question

Display text in a business-friendly format.

Examples:

- Uppercase
- Lowercase
- Full Name
- Remove extra spaces

### SQL Patterns

```sql
UPPER(column)
```

```sql
LOWER(column)
```

```sql
TRIM(column)
```

```sql
CONCAT(column1, column2)
```

```sql
REPLACE(column, old, new)
```

```sql
SUBSTRING(column FROM start FOR length)
```

### Use When

- Cleaning names.
- Standardizing text.
- Creating display values.

---

# Pattern 6 — Work with Dates

## Business Question

Extract or format dates.

Examples:

- Rental Year
- Rental Month
- Membership Duration

### SQL Patterns

```sql
CURRENT_DATE
```

```sql
CURRENT_TIMESTAMP
```

```sql
EXTRACT(...)
```

```sql
AGE(...)
```

```sql
DATE_TRUNC(...)
```

```sql
TO_CHAR(...)
```

### Use When

- Date reports.
- Monthly summaries.
- Time-based analysis.

---

# Pattern 7 — SELF JOIN

## Business Question

Compare rows from the same table.

Example:

Employees and Managers

Customers in the same city

Actors appearing together

### SQL Pattern

```sql
table t1
JOIN table t2
```

### Use When

The relationship exists within the same table.

---

# Pattern 8 — USING Clause

## Business Question

Join two tables sharing the same column name.

### SQL Pattern

```sql
JOIN table
USING (column_name)
```

### Use When

Both tables contain the same join column.

---

# Pattern 9 — RIGHT JOIN

## Business Question

Return every row from the right table.

### SQL Pattern

```sql
RIGHT JOIN
```

### Remember

Most RIGHT JOIN queries can be rewritten using LEFT JOIN by changing the table order.

LEFT JOIN is usually preferred because it is easier to read.

---

# Pattern 10 — FULL JOIN

## Business Question

Return every row from both tables.

### SQL Pattern

```sql
FULL JOIN
```

### Use When

You need:

- Matching rows.
- Left-only rows.
- Right-only rows.

---

# Business Thinking Pattern

Before writing SQL ask:

```
What is the business asking?

↓

Do I need to transform data?

↓

Which SQL feature helps?

↓

CASE

COALESCE

CAST

String Function

Date Function

JOIN

↓

Write SQL
```

---

# Week 3 Mental Model

```
Raw Business Data

↓

Transform

↓

Clean

↓

Format

↓

Readable Business Report
```

---

# Choosing the Right SQL Feature

| Business Need | SQL Feature |
|---------------|-------------|
| Categorize data | CASE |
| Replace NULL | COALESCE |
| Ignore specific values | NULLIF |
| Convert data type | CAST |
| Format text | String Functions |
| Format dates | Date Functions |
| Compare rows in same table | SELF JOIN |
| Simpler JOIN syntax | USING |
| Keep all rows from right table | RIGHT JOIN |
| Keep all rows from both tables | FULL JOIN |

---

# Week 3 Summary

By the end of Week 3, you should recognize business patterns instead of memorizing SQL syntax.

When reading a business requirement, you should immediately identify:

- Is this a transformation problem?
- Is this a formatting problem?
- Is this a NULL handling problem?
- Is this a data conversion problem?
- Is this an advanced JOIN problem?

Once you recognize the pattern, choosing the correct SQL becomes much easier.