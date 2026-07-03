# Day 4 - CAST and Data Conversion

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand why data type conversion is necessary.
- Convert values using `CAST`.
- Distinguish between explicit and implicit casting.
- Format numeric values for reports.
- Convert timestamps into business-friendly dates.
- Choose the correct data type before performing calculations.

---

# Introduction

Every value stored in a database has a **data type**.

Examples include:

- Integer
- Numeric
- Text
- Date
- Timestamp
- Boolean

Different data types serve different purposes.

Sometimes the stored data type is not suitable for reporting or calculations.

This is where **CAST** becomes useful.

---

# What is CAST?

`CAST` converts a value from one data type into another.

General syntax:

```sql
CAST(expression AS datatype)
```

Example:

```sql
CAST(customer_id AS TEXT)
```

This converts an integer into text.

The original data stored in the database does **not** change.

Only the displayed result changes.

---

# Concept 1 - Converting Numeric Values (Q31)

## Business Question

Convert payment amounts into whole numbers.

Example:

```
9.99

↓

10
```

Using:

```sql
CAST(amount AS INTEGER)
```

The decimal portion is removed.

This is useful when business reports require whole numbers.

---

# Concept 2 - Converting Timestamps (Q32)

A timestamp contains:

```
2026-07-03 14:35:22
```

Sometimes the business only needs:

```
2026-07-03
```

Instead of showing unnecessary time information,

convert the timestamp into a date.

Example:

```sql
CAST(rental_date AS DATE)
```

---

# Concept 3 - Converting Numbers into Text (Q33)

Sometimes numbers need to behave like text.

Example:

```
Customer ID

101
```

becomes

```
"101"
```

Using:

```sql
CAST(customer_id AS TEXT)
```

This is useful when:

- Concatenating strings.
- Creating customer codes.
- Building formatted reports.

---

# Concept 4 - Formatting Numeric Values (Q34 & Q37)

Business users prefer neatly formatted numbers.

Instead of:

```
4.990000
```

display:

```
4.99
```

Using:

```sql
TO_CHAR(amount, 'FM9990.00')
```

Formatting improves readability without changing the stored value.

---

# Concept 5 - Formatting Dates (Q35)

Business users rarely want to read timestamps.

Instead of:

```
2005-05-24 22:53:30
```

display:

```
24-May-2005
```

Using:

```sql
TO_CHAR(rental_date, 'DD-Mon-YYYY')
```

Formatting dates makes reports much easier to understand.

---

# Concept 6 - Explicit vs Implicit Casting (Q36)

## Explicit Casting

You clearly tell PostgreSQL what conversion to perform.

Example:

```sql
CAST(customer_id AS TEXT)
```

Advantages:

- Clear
- Easy to read
- Recommended

---

## Implicit Casting

Sometimes PostgreSQL performs the conversion automatically.

Example:

```sql
customer_id || ''
```

The integer is automatically converted into text.

Although convenient,

explicit casting is usually preferred because it is easier to understand.

---

# Concept 7 - CAST Inside Reports (Q39)

Data conversion is often performed directly inside reports.

Example:

```
Customer ID

↓

Text

↓

Customer Code
```

The business sees a formatted value,

while the database keeps the original datatype.

---

# Concept 8 - Thinking Before Converting (Q40)

Before using CAST,

always ask:

### What is the current datatype?

Example:

```
Timestamp
```

---

### What datatype do I need?

Example:

```
Date
```

---

### Which SQL feature performs the conversion?

Example:

```
CAST()
```

Thinking first prevents unnecessary conversions.

---

# Data Conversion Flow

```
Original Datatype

↓

Business Requirement

↓

Required Datatype

↓

CAST()

↓

Business Report
```

---

# Common Conversions

| Current Type | Required Type | SQL |
|--------------|---------------|-----|
| Integer | Text | `CAST(... AS TEXT)` |
| Numeric | Integer | `CAST(... AS INTEGER)` |
| Timestamp | Date | `CAST(... AS DATE)` |
| Numeric | Formatted String | `TO_CHAR()` |

---

# Common Mistakes

❌ Using CAST when no conversion is required.

❌ Confusing formatting with conversion.

❌ Assuming CAST changes the stored data.

❌ Using implicit casting without understanding it.

❌ Performing formatting before calculations.

---

# Day 4 Summary

Today you learned:

- Every database value has a datatype.
- `CAST` converts values between datatypes.
- Explicit casting is preferred over implicit casting.
- `TO_CHAR` formats numbers and dates for reports.
- Data conversion improves report quality without changing stored data.

---

# What's Next?

In Day 5, you'll learn **String Functions**.

You'll discover how to:

- Convert text to uppercase and lowercase.
- Concatenate multiple strings.
- Remove unwanted spaces.
- Replace characters.
- Extract parts of strings.

These functions help produce clean and professional business reports.