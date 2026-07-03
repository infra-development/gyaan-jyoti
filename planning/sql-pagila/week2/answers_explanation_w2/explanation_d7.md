# Day 7 - Integrated Business Reporting

## Learning Objectives

By the end of this lesson, you should be able to:

- Combine all the SQL concepts learned in Week 2.
- Build complete business reports.
- Analyze customer, film, category, and store performance.
- Design reports from a business question.
- Follow a structured approach to solving reporting problems.

---

# Introduction

Throughout Week 2, you've learned:

- Relationship Paths
- INNER JOIN
- LEFT JOIN
- GROUP BY
- COUNT()
- SUM()
- DISTINCT
- Business Process Thinking

Today, you'll combine all of these concepts to build complete business reports.

This is the type of work SQL developers perform every day.

---

# Concept 1 - Customer Reports (Q61)

## Business Question

Show every customer's:

- Total rentals
- Total spending

### Business Thinking

Relationship path:

```
Customer
    ↓
Rental

Customer
    ↓
Payment
```

This report combines two different business activities.

Instead of answering one question, it summarizes a customer's overall activity.

---

## Key Learning

A business report often combines multiple metrics.

Here we calculate:

- Rental Count
- Total Spending

for each customer.

---

# Concept 2 - Film Performance (Q62 & Q68)

## Q62

**Show every film's inventory count and rental count.**

Relationship:

```
Film
    ↓
Inventory
    ↓
Rental
```

This report answers two important questions:

- How many copies do we own?
- How often are they rented?

Both measurements help the business understand film popularity.

---

## Q68

**Build a complete film performance report.**

This report combines information from several tables.

Relationship:

```
Film
    ↓
Language

Film
    ↓
Film_Category
    ↓
Category

Film
    ↓
Inventory
    ↓
Rental
```

This is a good example of a real business dashboard.

---

# Concept 3 - Category and Store Reports (Q63 & Q64)

## Q63

**Show category revenue and rental count.**

Relationship:

```
Category
    ↓
Film_Category
    ↓
Film
    ↓
Inventory
    ↓
Rental
    ↓
Payment
```

This report measures:

- Popularity
- Revenue

for every category.

---

## Q64

**Show store revenue and customer count.**

Relationship:

```
Store
    ↓
Customer
    ↓
Payment
```

Managers use reports like this to compare store performance.

---

# Concept 4 - Top-N Reports (Q65 - Q67)

Business users often ask:

- Top 10 customers
- Top 10 films
- Top 10 actors

The SQL pattern is always the same.

```
JOIN

↓

GROUP BY

↓

Aggregate

↓

ORDER BY DESC

↓

LIMIT
```

Changing the business entity changes the report.

The SQL pattern remains almost identical.

---

# Concept 5 - Customer Activity Report (Q69)

This report combines almost everything learned in Week 2.

Relationship:

```
Customer
    ↓
Address
    ↓
City
    ↓
Country

Customer
    ↓
Rental

Customer
    ↓
Payment
```

The report includes:

- Customer
- City
- Country
- Rentals
- Payments
- Revenue

This is similar to reports used by Customer Success teams.

---

# Concept 6 - Thinking Before SQL (Q70)

The biggest lesson from Week 2 is that SQL should never be the first step.

Before writing SQL, always answer these questions.

## Step 1

What is the business trying to know?

---

## Step 2

Which business entities are involved?

---

## Step 3

What relationship path connects them?

---

## Step 4

What metric is required?

Examples:

- Revenue
- Rentals
- Customers

---

## Step 5

What dimension should the report be grouped by?

Examples:

- Customer
- Film
- Category
- Store

---

## Step 6

Now write the SQL.

Following this process makes even complex reports much easier.

---

# The Week 2 Reporting Pattern

Most reports in this lesson follow the same structure.

```
Business Question

↓

Business Entities

↓

Relationship Path

↓

JOIN

↓

GROUP BY

↓

COUNT() / SUM()

↓

ORDER BY

↓

LIMIT (Optional)
```

Once you understand this pattern, you can solve many different business reporting problems.

---

# Common Mistakes

❌ Writing SQL before understanding the business question.

❌ Forgetting to identify the relationship path.

❌ Choosing the wrong aggregation function.

❌ Counting rows instead of business entities.

❌ Forgetting to group by the correct dimension.

---

# Week 2 Summary

Congratulations!

You can now:

- Read relationship paths.
- Write multi-table JOIN queries.
- Build business reports.
- Use GROUP BY with aggregate functions.
- Find missing information using LEFT JOIN.
- Handle duplicate rows correctly.
- Build Top-N reports.
- Translate business questions into SQL.

These are the core skills required by SQL developers, Data Analysts, and Data Engineers.

---

# Looking Ahead to Week 3

Week 2 focused on combining SQL concepts.

In Week 3, you'll learn more advanced SQL techniques such as:

- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Ranking
- Advanced Business Analytics

These concepts build directly on the foundation you've created during Week 2.

Excellent work! 🎉