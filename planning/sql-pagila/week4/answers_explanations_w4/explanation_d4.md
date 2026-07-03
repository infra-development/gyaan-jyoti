# Day 4 - Ranking Functions

## Learning Objectives

By the end of this lesson, you should be able to:

- Understand why ranking is important in business reporting.
- Use `ROW_NUMBER()` correctly.
- Use `RANK()` correctly.
- Use `DENSE_RANK()` correctly.
- Explain the differences between the three ranking functions.
- Rank data globally and within business groups.
- Build Top-N business reports.

---

# Introduction

Businesses constantly compare performance.

Typical questions include:

- Who is the highest-paying customer?
- Which store generates the most revenue?
- Which film is rented the most?
- Who are the top three customers?

Notice something.

These questions are not asking for totals.

They are asking for **position**.

This is where Ranking Functions become useful.

---

# Why Ranking Functions?

Suppose five customers generated the following revenue.

| Customer | Revenue |
|----------|---------:|
| Mary | 100 |
| John | 95 |
| Lisa | 95 |
| David | 80 |
| Emma | 70 |

The business wants to know:

Who is first?

Who is second?

Who is third?

Ranking Functions answer these questions.

---

# Three Ranking Functions

SQL provides three ranking functions.

```
ROW_NUMBER()

RANK()

DENSE_RANK()
```

Although they look similar,

they solve different business problems.

---

# Concept 1 - ROW_NUMBER() (Q31)

`ROW_NUMBER()` gives every row a unique number.

Example

| Customer | Revenue | Row Number |
|----------|---------:|-----------:|
| Mary | 100 | 1 |
| John | 95 | 2 |
| Lisa | 95 | 3 |
| David | 80 | 4 |

Even though John and Lisa have the same revenue,

they receive different numbers.

There are **no ties**.

---

## Business Uses

- Pagination
- Unique row numbering
- Selecting one record from duplicates
- Report numbering

---

# Concept 2 - RANK() (Q32)

`RANK()` allows ties.

Example

| Customer | Revenue | Rank |
|----------|---------:|-----:|
| Mary | 100 | 1 |
| John | 95 | 2 |
| Lisa | 95 | 2 |
| David | 80 | 4 |

Notice something.

Rank **3** is skipped.

This is called a **competition ranking**.

---

## Business Uses

- Sales competitions
- Sports rankings
- Revenue leaderboards

---

# Concept 3 - DENSE_RANK() (Q33)

`DENSE_RANK()` also allows ties.

However,

no rank numbers are skipped.

Example

| Customer | Revenue | Dense Rank |
|----------|---------:|-----------:|
| Mary | 100 | 1 |
| John | 95 | 2 |
| Lisa | 95 | 2 |
| David | 80 | 3 |

This creates continuous ranking numbers.

---

## Business Uses

- Customer tiers
- Product rankings
- Executive dashboards

---

# Concept 4 - Comparing the Ranking Functions (Q34)

Consider the same data.

| Revenue | ROW_NUMBER() | RANK() | DENSE_RANK() |
|---------:|-------------:|-------:|-------------:|
| 100 | 1 | 1 | 1 |
| 95 | 2 | 2 | 2 |
| 95 | 3 | 2 | 2 |
| 80 | 4 | 4 | 3 |

This table summarizes the entire lesson.

Choose the ranking function based on the business requirement.

---

# Concept 5 - Ranking Within Business Groups (Q35)

Businesses often ask:

> Who is the highest-paying customer in each store?

This introduces another important idea.

The ranking should restart for every store.

Thinking process:

```
Store

↓

PARTITION BY

↓

Revenue

↓

RANK()
```

Every store has its own ranking.

---

# Concept 6 - Ranking Products Within Categories (Q36)

The same idea applies to films.

Business Question:

Which film is rented the most in each category?

Instead of one global ranking,

each category has its own leaderboard.

Example

```
Action

↓

Top Film

----------------

Comedy

↓

Top Film
```

The calculation restarts for every category.

---

# Concept 7 - Top-N Reports (Q37)

Managers rarely need every rank.

They usually ask for:

- Top 5 customers
- Top 10 products
- Top 3 stores

The process is simple.

```
Rank Rows

↓

Filter

↓

Top N
```

Top-N reports are among the most common uses of Ranking Functions.

---

# Concept 8 - Choosing the Correct Ranking Function (Q38–Q40)

Before writing SQL,

ask:

## Does every row need a unique number?

↓

```
ROW_NUMBER()
```

---

## Should equal values share the same rank?

↓

```
RANK()
```

---

## Should equal values share the same rank without gaps?

↓

```
DENSE_RANK()
```

Choosing the correct ranking function is more important than memorizing the syntax.

---

# Ranking Workflow

```
Business Question

↓

Need Ranking?

↓

Yes

↓

Global Ranking?

↓

or

↓

Ranking Within Groups?

↓

PARTITION BY

↓

Choose Ranking Function

↓

Business Report
```

---

# Ranking Function Comparison

| Function | Ties Allowed | Gaps After Ties | Typical Use |
|----------|--------------|-----------------|-------------|
| `ROW_NUMBER()` | No | No | Unique numbering |
| `RANK()` | Yes | Yes | Competition ranking |
| `DENSE_RANK()` | Yes | No | Business ranking |

---

# Common Mistakes

❌ Using `ROW_NUMBER()` when ties should share the same position.

❌ Using `RANK()` when continuous ranking is required.

❌ Forgetting `PARTITION BY` when rankings should restart for each business group.

❌ Assuming all ranking functions behave the same.

❌ Choosing a ranking function before understanding the business requirement.

---

# Day 4 Summary

Today you learned:

- Ranking Functions assign positions to rows.
- `ROW_NUMBER()` always produces unique numbers.
- `RANK()` allows ties and leaves gaps.
- `DENSE_RANK()` allows ties without gaps.
- Rankings can be calculated globally or within partitions.
- Top-N reports are built by combining ranking functions with filtering.

---

# What's Next?

In Day 5, you'll learn how to compare rows using:

- `LAG()`
- `LEAD()`
- `NTILE()`

You'll discover how to:

- Compare each payment with the previous payment.
- Compare each rental with the next rental.
- Divide customers into spending groups.

These functions allow SQL to answer questions about **change over time**, making them essential for trend analysis, financial reporting, and customer behavior analysis.