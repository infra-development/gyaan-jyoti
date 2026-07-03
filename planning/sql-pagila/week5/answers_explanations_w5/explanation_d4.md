# Day 4 - Recursive CTEs

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand what recursion means in SQL.
- Explain the structure of a Recursive CTE.
- Understand the purpose of the Anchor Member.
- Understand the purpose of the Recursive Member.
- Understand why every Recursive CTE requires a stopping condition.
- Generate sequences of numbers and dates using recursion.
- Identify business problems that require recursive thinking.

---

# Introduction

During the first three days of Week 5, you learned how to break large SQL problems into smaller pieces using:

- Subqueries
- Correlated Subqueries
- Common Table Expressions (CTEs)

Every query you've written so far had one thing in common.

SQL processed existing rows stored in the database.

Today is different.

Instead of retrieving existing rows,

SQL will begin **creating new rows**.

For example,

instead of asking:

> Show all payments.

we ask:

> Generate the next 30 calendar days.

There is no calendar table.

SQL must create those rows itself.

This introduces one of PostgreSQL's most powerful features:

**Recursive Common Table Expressions (Recursive CTEs).**

---

# What is Recursion?

Recursion simply means:

> Repeat the same operation until a stopping condition is reached.

Think about counting.

```
1

↓

2

↓

3

↓

4

↓

...

↓

10

↓

Stop
```

Each number is generated from the previous number.

The same idea applies in SQL.

---

# Why Do We Need Recursive CTEs?

Imagine a business asks:

- Generate every date for next month.
- Create numbers from 1 to 100.
- Display an employee hierarchy.
- Traverse a folder structure.

These rows do not exist inside a table.

SQL must generate them.

Recursive CTEs make this possible.

---

# Concept 1 - The Three Parts of a Recursive CTE (Q36)

Every Recursive CTE contains exactly three logical components.

```
Anchor Member

↓

Recursive Member

↓

Stopping Condition
```

Understanding these three pieces is far more important than memorizing the syntax.

---

# Concept 2 - The Anchor Member (Q37)

The Anchor Member starts the recursion.

Think of it as the first row.

Example

```
1
```

Without this starting point,

there is nothing to repeat.

Examples

```
Today's Date

January

Employee ID 1

Root Folder
```

Every recursive process begins here.

---

# Concept 3 - The Recursive Member (Q38)

The Recursive Member produces new rows from previous rows.

Example

```
1

↓

2

↓

3

↓

4
```

Each new value depends on the value generated before it.

General idea

```
Previous Row

↓

Generate Next Row
```

This process repeats automatically.

---

# Concept 4 - The Stopping Condition

Every recursion must eventually stop.

Otherwise SQL would continue forever.

Example

```
1

↓

2

↓

3

↓

...

↓

10

↓

Stop
```

The stopping condition tells PostgreSQL when recursion should end.

Without it,

the query would never finish.

---

# Concept 5 - Number Generation (Q31, Q32 & Q35)

Recursive CTEs are commonly used to generate sequences.

Examples

```
1 → 10

1 → 100

10 → 1
```

These examples demonstrate the mechanics of recursion without requiring business tables.

Although simple,

they build the foundation for more advanced recursive queries.

---

# Concept 6 - Calendar Generation (Q33 & Q34)

Businesses frequently require calendar tables.

Examples include:

- Daily sales reports.
- Monthly dashboards.
- Missing date detection.
- Financial reporting.

Instead of storing every possible date,

a Recursive CTE can generate them dynamically.

Example

```
Today

↓

Tomorrow

↓

Next Day

↓

...

↓

30 Days
```

The same approach works for:

- Months
- Weeks
- Years

---

# Concept 7 - Real Business Applications (Q39)

Recursive CTEs are much more than number generators.

Typical business applications include:

### Organization Charts

```
CEO

↓

Director

↓

Manager

↓

Employee
```

---

### Folder Structures

```
Root

↓

Folder

↓

Subfolder

↓

Files
```

---

### Product Assemblies

```
Product

↓

Component

↓

Sub-component
```

---

### Calendar Generation

```
Today

↓

Tomorrow

↓

Next Day
```

Whenever information references itself,

recursion becomes useful.

---

# Concept 8 - Thinking Recursively (Q40)

Before writing SQL,

ask yourself:

```
Can this problem
be solved by repeating
the same operation?

↓

Yes

↓

Recursive CTE
```

Then identify:

```
Starting Point

↓

Repeat

↓

Stop
```

This is the complete recursive thought process.

---

# Recursive Workflow

```
Business Requirement

↓

Need Repetition?

↓

Yes

↓

Anchor Member

↓

Recursive Member

↓

Stopping Condition

↓

Final Result
```

---

# Recursive CTE Structure

| Component | Purpose |
|-----------|----------|
| Anchor Member | Starts recursion |
| Recursive Member | Produces new rows |
| Stopping Condition | Ends recursion |

---

# Common Business Applications

| Business Requirement | Recursive CTE |
|----------------------|---------------|
| Number generation | ✓ |
| Calendar generation | ✓ |
| Date sequences | ✓ |
| Organization charts | ✓ |
| Folder hierarchies | ✓ |
| Product hierarchies | ✓ |
| Bill of Materials | ✓ |

---

# Common Mistakes

❌ Forgetting the stopping condition.

❌ Confusing the Anchor Member with the Recursive Member.

❌ Expecting recursion to work without a starting row.

❌ Using recursion when a simple query is sufficient.

❌ Thinking Recursive CTEs are only useful for generating numbers.

---

# Day 4 Summary

Today you learned:

- Recursion means repeatedly generating new rows until a stopping condition is reached.
- Every Recursive CTE consists of an Anchor Member, a Recursive Member, and a Stopping Condition.
- Recursive CTEs can generate numbers, dates, and hierarchical structures.
- Business hierarchies and calendars are common real-world applications.
- Recursive thinking focuses on defining a starting point, a repeated step, and an ending condition.

---

# What's Next?

In **Day 5**, you'll learn **Set Operations**.

You'll discover how to compare and combine entire result sets using:

- `UNION`
- `UNION ALL`
- `INTERSECT`
- `EXCEPT`

Instead of comparing individual rows, you'll learn how SQL performs operations on complete datasets.

This introduces another important way of solving business problems by thinking in terms of **sets** rather than individual records.