# Day 5 - String Functions

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand the purpose of string functions.
- Convert text to uppercase and lowercase.
- Combine multiple strings into a single value.
- Remove unnecessary spaces.
- Replace characters within a string.
- Extract portions of text.
- Measure the length of a string.
- Combine multiple string functions to build business-friendly reports.

---

# Introduction

Businesses store a large amount of textual information.

Examples include:

- Customer names
- Film titles
- Addresses
- Categories
- Languages

Although the data is correct, it is not always presented in the most readable format.

Consider these examples.

```
MARY
```

```
mary
```

```
Mary
```

All three represent the same name.

However, the third version is much easier to read.

String functions help us clean, standardize, and format text for business reports.

---

# What are String Functions?

String functions manipulate text.

They allow us to:

- Change letter case.
- Combine text.
- Remove unwanted spaces.
- Replace characters.
- Extract part of a string.
- Measure text length.

Unlike `CAST`, string functions do not change the datatype.

They change the **content** or **presentation** of the text.

---

# Concept 1 - Changing Letter Case (Q41 & Q42)

## Q41

**Display customer names in uppercase.**

Example:

```
John Smith

↓

JOHN SMITH
```

Use:

```sql
UPPER()
```

Uppercase is commonly used for reports, exports, and standardization.

---

## Q42

**Display customer names in lowercase.**

Example:

```
John Smith

↓

john smith
```

Use:

```sql
LOWER()
```

Lowercase is useful when comparing or standardizing text.

---

# Concept 2 - Combining Strings (Q43)

Business users often prefer one column instead of two.

Instead of:

```
First Name

Last Name
```

display:

```
Full Name
```

Use:

```sql
CONCAT()
```

Example:

```sql
CONCAT(first_name, ' ', last_name)
```

This creates a single readable value.

---

# Concept 3 - Removing Extra Spaces (Q44)

Sometimes text contains unnecessary spaces.

Example:

```
"  John  "
```

Business users should see:

```
John
```

Use:

```sql
TRIM()
```

TRIM removes spaces from the beginning and end of a string.

---

# Concept 4 - Replacing Characters (Q45)

Sometimes one character should be replaced with another.

Example:

```
John Smith

↓

John_Smith
```

Use:

```sql
REPLACE()
```

General syntax:

```sql
REPLACE(text, old_value, new_value)
```

---

# Concept 5 - Extracting Text (Q46)

Sometimes only part of a string is required.

Example:

```
ACADEMY DINOSAUR

↓

ACADE
```

Use:

```sql
SUBSTRING()
```

General syntax:

```sql
SUBSTRING(text FROM start FOR length)
```

---

# Concept 6 - Measuring Text (Q47)

Business reports sometimes need to know:

- Longest title
- Shortest title
- Average title length

Use:

```sql
LENGTH()
```

Example:

```
Film Title

↓

Number of Characters
```

---

# Concept 7 - Combining Functions (Q48 & Q49)

Professional SQL often combines multiple string functions.

Example:

```
john smith

↓

John Smith
```

Possible steps:

```
LOWER()

↓

UPPER()

↓

CONCAT()

↓

TRIM()
```

Each function performs one small transformation.

Together they create a professional report.

---

# Concept 8 - Choosing the Correct Function (Q50)

Before writing SQL,

ask yourself:

## Do I need to...

Convert case?

↓

```
UPPER()

LOWER()
```

---

Combine text?

↓

```
CONCAT()
```

---

Remove spaces?

↓

```
TRIM()
```

---

Replace text?

↓

```
REPLACE()
```

---

Extract text?

↓

```
SUBSTRING()
```

---

Measure text?

↓

```
LENGTH()
```

Choosing the correct function keeps SQL simple and readable.

---

# String Function Flow

```
Raw Text

↓

Identify Problem

↓

Choose String Function

↓

Transform Text

↓

Business-Friendly Output
```

---

# Common String Functions

| Function | Purpose |
|----------|---------|
| `UPPER()` | Convert text to uppercase |
| `LOWER()` | Convert text to lowercase |
| `CONCAT()` | Combine multiple strings |
| `TRIM()` | Remove leading and trailing spaces |
| `REPLACE()` | Replace one string with another |
| `SUBSTRING()` | Extract part of a string |
| `LENGTH()` | Count the number of characters |

---

# Common Mistakes

❌ Using multiple string functions when one is sufficient.

❌ Forgetting to add spaces when concatenating names.

❌ Confusing `SUBSTRING()` with `REPLACE()`.

❌ Using `TRIM()` expecting it to remove spaces inside a string.

❌ Formatting text before understanding the business requirement.

---

# Day 5 Summary

Today you learned:

- String functions transform textual data.
- `UPPER()` and `LOWER()` standardize letter case.
- `CONCAT()` combines multiple strings.
- `TRIM()` removes unnecessary spaces.
- `REPLACE()` substitutes one string for another.
- `SUBSTRING()` extracts part of a string.
- `LENGTH()` measures the number of characters.
- Multiple string functions can be combined to create clean business reports.

---

# What's Next?

In Day 6, you'll learn **Date & Time Functions**.

You'll discover how to:

- Work with the current date and time.
- Extract years and months.
- Format dates for reports.
- Calculate date differences.
- Build time-based business reports.

Time is one of the most important dimensions in business analysis, and SQL provides powerful functions to work with it.