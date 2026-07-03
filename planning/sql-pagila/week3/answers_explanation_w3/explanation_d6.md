# Day 6 - Date & Time Functions

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand SQL date and time data types.
- Retrieve the current date and timestamp.
- Calculate the difference between two dates.
- Extract specific parts of a date.
- Group data by time periods.
- Format dates for business reports.
- Choose the correct date function for different business scenarios.

---

# Introduction

Almost every business stores information related to time.

Examples include:

- Customer registration dates
- Rental dates
- Payment dates
- Order dates
- Shipment dates

Business users frequently ask questions like:

- How many rentals happened this month?
- Which year generated the highest revenue?
- How long has this customer been with us?
- What happened yesterday?

Answering these questions requires SQL Date & Time Functions.

---

# Understanding Date and Time

PostgreSQL stores time in different formats.

Examples:

```
DATE

2005-05-24
```

Contains only the date.

---

```
TIMESTAMP

2005-05-24 22:53:30
```

Contains both date and time.

Choosing the correct datatype depends on the business requirement.

---

# Concept 1 - Current Date & Current Timestamp (Q51 & Q52)

## Q51

**Display today's date.**

Use:

```sql
CURRENT_DATE
```

Example Output

```
2026-07-03
```

Business Uses:

- Daily reports
- Dashboard headers
- Report generation dates

---

## Q52

**Display the current timestamp.**

Use:

```sql
CURRENT_TIMESTAMP
```

Example Output

```
2026-07-03 15:45:28
```

Business Uses:

- Audit logs
- System monitoring
- Recording transactions

---

# Concept 2 - Calculating Date Differences (Q53 & Q58)

## Q53

**Calculate customer rental age.**

Business Question:

How long ago was a movie rented?

Use:

```sql
AGE()
```

Example

```
Rental Date

↓

24-May-2005

↓

Age

↓

21 Years 1 Month ...
```

---

## Q58

**Display customer membership duration.**

Instead of displaying:

```
Create Date

↓

2005-05-24
```

Business users prefer:

```
Member for

21 Years
```

Again,

the `AGE()` function performs the calculation.

---

# Concept 3 - Extracting Date Parts (Q54 & Q55)

Sometimes the complete date is unnecessary.

Business only needs one part.

---

## Q54

Extract the year.

Example:

```
2005-06-14

↓

2005
```

Use:

```sql
EXTRACT(YEAR FROM rental_date)
```

---

## Q55

Extract the month.

Example:

```
2005-06-14

↓

6
```

Use:

```sql
EXTRACT(MONTH FROM rental_date)
```

Business reports often summarize data by year or month.

---

# Concept 4 - Grouping by Time (Q56)

Business Question

How many rentals happened each month?

Instead of grouping by every individual date,

group by the month.

Example

```
Month

↓

Rental Count
```

This allows businesses to identify seasonal trends.

---

# Concept 5 - Formatting Dates (Q57)

Database values are designed for storage.

Business reports are designed for people.

Instead of displaying:

```
2005-05-24 22:53:30
```

display:

```
24-May-2005
```

Use:

```sql
TO_CHAR()
```

Formatting improves readability without changing the stored value.

---

# Concept 6 - Monthly Reports (Q59)

Monthly reporting is one of the most common business requirements.

Business wants:

```
Jan 2025

↓

145 Rentals

----------------

Feb 2025

↓

162 Rentals
```

To build reports like this:

1. Group by month.
2. Count the rentals.
3. Display a readable month name.

---

# Concept 7 - Choosing the Right Date Function (Q60)

Before writing SQL,

ask:

## Do I need today's date?

↓

```
CURRENT_DATE
```

---

## Do I need the current date and time?

↓

```
CURRENT_TIMESTAMP
```

---

## Do I need the difference between two dates?

↓

```
AGE()
```

---

## Do I need only one part of a date?

↓

```
EXTRACT()
```

---

## Do I need to group dates?

↓

```
DATE_TRUNC()
```

---

## Do I need business-friendly formatting?

↓

```
TO_CHAR()
```

Choosing the correct function keeps SQL simple and readable.

---

# Date Function Flow

```
Business Question

↓

What information is needed?

↓

Current Date

Difference

Year

Month

Formatting

Grouping

↓

Choose Date Function

↓

Business Report
```

---

# Common Date Functions

| Function | Purpose |
|----------|---------|
| `CURRENT_DATE` | Current date |
| `CURRENT_TIMESTAMP` | Current date and time |
| `AGE()` | Difference between two dates |
| `EXTRACT()` | Extract year, month, day, etc. |
| `DATE_TRUNC()` | Round dates to a specific unit |
| `TO_CHAR()` | Format dates for reports |

---

# Common Mistakes

❌ Confusing `DATE` with `TIMESTAMP`.

❌ Formatting dates before calculations.

❌ Using `TO_CHAR()` when a DATE value is still required.

❌ Forgetting that `EXTRACT()` returns only one part of the date.

❌ Grouping by formatted text instead of the actual date when chronological ordering is required.

---

# Day 6 Summary

Today you learned:

- SQL stores dates and timestamps differently.
- `CURRENT_DATE` returns today's date.
- `CURRENT_TIMESTAMP` returns the current date and time.
- `AGE()` calculates the difference between two dates.
- `EXTRACT()` retrieves specific parts of a date.
- `DATE_TRUNC()` groups dates into larger time periods.
- `TO_CHAR()` formats dates for business reports.

---

# What's Next?

In Day 7, you'll combine everything you've learned throughout Week 3.

You'll build complete business reports using:

- CASE
- COALESCE
- CAST
- String Functions
- Date Functions
- Advanced JOIN concepts

Day 7 focuses on transforming raw database values into polished, business-ready reports that resemble those used in real production systems.