# Thinking in SQL
## Week 1
### From SQL Syntax to Business Thinking

---

# Purpose of This Guide

Congratulations!

If you've completed the Week 1 explanation files, you now know the syntax of:

- SELECT
- WHERE
- ORDER BY
- Aggregate Functions
- GROUP BY
- HAVING
- Basic JOIN

But knowing SQL syntax and solving business problems are two very different skills.

Consider these two developers.

Developer A knows every SQL keyword.

Developer B knows fewer SQL keywords but understands the business problem before writing SQL.

In real projects, Developer B usually produces better solutions.

Why?

Because SQL is only a language.

Languages don't solve problems.

Thinking solves problems.

This guide teaches **how to think before writing SQL**.

It does **not** replace the explanation files.

Instead, it answers a different question:

> **How do I recognize which SQL concept should solve this business problem?**

Throughout this guide we will use the **Pagila** database.

Instead of memorizing syntax, you will learn to recognize business patterns.

That is the first step toward becoming an SQL professional.

---

# The SQL Thinking Framework

Every SQL problem should be solved using the same thinking process.

```
Business Question
        │
        ▼
Business Objective
        │
        ▼
Business Entity
        │
        ▼
Recognition Pattern
        │
        ▼
SQL Concept
        │
        ▼
Write SQL
```

Notice something important.

SQL appears almost at the end.

Most beginners reverse this process.

```
Business Question

↓

Open SQL Editor

↓

Start Typing
```

This usually leads to:

- unnecessary joins
- incorrect GROUP BY
- wrong aggregate functions
- trial-and-error development

Professional developers don't immediately write SQL.

They first understand the business.

---

# Step 1 — Understand the Business Objective

Every business question exists for a reason.

Your first responsibility is discovering that reason.

For example,

The Finance Manager asks:

> "What was yesterday's revenue?"

Don't think

```
SUM()
```

Think

```
Business Objective

Measure financial performance.
```

---

The Marketing Manager asks:

> "Show customers who haven't rented in three months."

Don't think

```
LEFT JOIN
```

Think

```
Business Objective

Identify inactive customers for a marketing campaign.
```

---

The Operations Manager asks:

> "Show rentals by store."

Don't think

```
GROUP BY
```

Think

```
Business Objective

Compare operational performance between stores.
```

Business objectives determine SQL—not the other way around.

---

# Step 2 — Identify the Business Entity

Every business question revolves around one or more entities.

Examples from Pagila:

Customer

Film

Actor

Store

Rental

Payment

Category

Inventory

Ask yourself:

> **Who or what is this question about?**

Examples

Business Question

> Show all customers.

Business Entity

```
Customer
```

---

Business Question

> Total payments.

Business Entity

```
Payment
```

---

Business Question

> Revenue by Store.

Business Entities

```
Store

Payment
```

Identifying entities early makes the rest of the solution much easier.

---

# Step 3 — Recognize the Pattern

This is the most important skill you'll learn in Week 1.

Every business question belongs to one (or more) of these patterns.

| Business Need | Thinking Pattern |
|--------------|------------------|
| Show information | Retrieve |
| Show only some records | Filter |
| Arrange results | Sort |
| Calculate one metric | Summarize |
| Compare groups | Group |
| Need data from multiple entities | Basic Join |

Your goal is to recognize the pattern before thinking about SQL.

Once the pattern is clear, choosing the SQL concept becomes straightforward.

---

# Pattern Card 1 — Finding Data

## Business Objective

Retrieve existing information.

No calculations.

No comparisons.

No analysis.

Simply display data that already exists.

---

## Recognition Signals

Business users naturally say things like:

- Show
- List
- Display
- Retrieve
- Find

Examples

> Show all customers.

> List all films.

> Display all stores.

These requests have one thing in common.

The business already knows **what** it wants.

It simply wants to see the data.

---

## Mental Model

Imagine walking into a library.

You ask the librarian:

> Show me all books written by George Orwell.

The librarian doesn't count books.

The librarian doesn't calculate averages.

The librarian simply retrieves the requested books.

Retrieval queries work exactly the same way.

---

## Pagila Example

The Customer Support Manager asks:

> "Show all customers."

Thinking process:

```
Business Objective

Retrieve customer information.

↓

Business Entity

Customer

↓

Pattern

Retrieve

↓

SQL Concept

SELECT
```

Notice that SQL is the **last** step.

---

## Common Mistakes

### Mistake 1

Using calculations when none are needed.

Business asks:

> Show customers.

Student thinks:

COUNT

Wrong.

---

### Mistake 2

Adding unnecessary joins.

If all information already exists in one table,

don't complicate the solution.

---

## Remember

Ask yourself one simple question:

> **Is the business asking me to retrieve information or analyze information?**

If the answer is:

Retrieve,

keep the solution simple.

---

# Pattern Card 2 — Filtering Data

## Business Objective

Reduce the result set so that only relevant records remain.

Businesses rarely want every row.

They usually want a meaningful subset.

Examples:

- Active customers
- Films longer than two hours
- Payments above $10
- Rentals from last month

Filtering exists because businesses make decisions using relevant information—not all available information.

---

## Recognition Signals

Watch for words such as:

- only
- active
- inactive
- before
- after
- between
- greater than
- less than
- equals

These words indicate that some rows belong in the result and others do not.

Your brain should immediately think:

```
Need to reduce the rows.
```

Not:

```
Need WHERE.
```

The SQL clause comes later.

---

## Mental Model

Imagine a basket containing 100 apples.

Someone says:

> "Give me only the red apples."

You don't reorganize the basket.

You simply remove every apple that doesn't satisfy the condition.

Filtering works exactly the same way.

Rows that don't satisfy the business condition are excluded.

---

## Pagila Example

The Store Manager asks:

> "Show only active customers."

Thinking process:

```
Business Objective

Work only with active customers.

↓

Business Entity

Customer

↓

Pattern

Filtering

↓

SQL Concept

WHERE
```

---

## Common Mistake

Students often confuse filtering with grouping.

Filtering removes rows.

Grouping combines rows.

These solve completely different business problems.

---

## Remember

The business isn't asking:

> "Can you use WHERE?"

The business is asking:

> "Can you ignore everything that isn't relevant?"

That is the real purpose of filtering.

---

# Pattern Card 3 — Sorting Data

## Business Objective

Present information in a meaningful order.

Sorting does **not** change the data.

It changes **how the business sees the data**.

Imagine reading a sales report containing 5,000 rows.

Would you prefer:

- Random order

or

- Highest revenue first

The information is identical.

Only the order changes.

Sometimes that order is what makes the report useful.

---

## Recognition Signals

Business users rarely say:

> "Sort this data."

Instead they naturally say:

- Highest
- Lowest
- Top
- Bottom
- Newest
- Oldest
- Alphabetically
- Most recent
- Largest
- Smallest

Whenever you hear these words, pause.

Ask yourself:

> **Does the business care about the order of the results?**

If the answer is yes,

you've identified a sorting problem.

---

## Mental Model

Imagine exam results.

Every student has already taken the exam.

The marks already exist.

Sorting doesn't change anyone's marks.

It simply places the highest score at the top.

Sorting is presentation.

Not calculation.

---

## Pagila Example

The Marketing Manager asks:

> "Show the newest customers first."

Thinking process:

```
Business Objective

Present the latest customers first.

↓

Business Entity

Customer

↓

Pattern

Sorting

↓

SQL Concept

ORDER BY
```

---

Another example.

The Finance Manager asks:

> "Show the highest payments first."

Notice that the business isn't asking for a new calculation.

The payment values already exist.

They simply need to be arranged.

---

## Common Mistakes

### Mistake 1

Confusing sorting with filtering.

Business says:

> Highest payments.

Some students immediately think:

```
Greater than...
```

Wrong.

The business wants **all payments**, but arranged from highest to lowest.

Nothing is being removed.

---

### Mistake 2

Thinking sorting changes the answer.

It doesn't.

Sorting only changes presentation.

The underlying data remains exactly the same.

---

## Remember

Ask yourself:

> **Would the answer still be correct if the rows appeared in a different order?**

If the answer is **yes**, sorting is optional.

If the answer is **no**, sorting is part of the business requirement.

---

# Pattern Card 4 — Summarizing Data

## Business Objective

Measure business performance.

This is the moment SQL becomes more than a reporting language.

Businesses don't make decisions from thousands of individual records.

They make decisions using **business metrics**.

Examples:

- Total revenue
- Number of rentals
- Average payment
- Highest payment
- Lowest rental duration

These are measurements.

Not lists.

---

## Recognition Signals

Watch for words like:

- Total
- Count
- Number of
- Average
- Maximum
- Minimum
- Overall
- How many
- How much

These words indicate that the business wants a **single measurement**.

---

## Mental Model

Imagine counting the money in a cash register.

The manager doesn't care about every individual note.

The manager asks:

> "How much money do we have?"

Thousands of individual transactions become one meaningful business number.

That's summarization.

---

## The Golden Rule

Summarization answers one question:

> **"What is the overall value?"**

Not

> "What is the value for each store?"

That is a different pattern.

---

## Pagila Example

The Finance Manager asks:

> "What was yesterday's total revenue?"

Thinking process:

```
Business Objective

Measure yesterday's revenue.

↓

Business Entity

Payment

↓

Pattern

Summarization

↓

SQL Concept

SUM()
```

---

Another example.

The Operations Manager asks:

> "How many rentals happened today?"

Thinking:

```
Business Objective

Measure today's business activity.

↓

Business Entity

Rental

↓

Pattern

Summarization

↓

SQL Concept

COUNT()
```

---

## Common Mistakes

### Mistake 1

Confusing SUM with COUNT.

Ask yourself:

Is the business measuring

money

or

quantity?

Money usually means SUM.

Quantity usually means COUNT.

---

### Mistake 2

Using GROUP BY for one overall metric.

If the business asks:

> "What is our total revenue?"

There is only one answer.

Grouping is unnecessary.

---

## Remember

Every summarization problem has one purpose:

Measure business performance.

---

# Pattern Card 5 — Grouping Data

## Business Objective

Compare business performance across different categories.

This is one of the most valuable analytical skills in SQL.

Businesses rarely stop after asking:

> "What is our total revenue?"

The next question is almost always:

> "Revenue by what?"

Examples:

- Revenue by Store
- Rentals by Month
- Customers by Country
- Payments by Staff
- Films by Category

The business no longer wants one answer.

It wants multiple answers for comparison.

---

## Recognition Signals

These words should immediately trigger your attention:

- By
- Per
- Each
- Every
- Broken down by

Examples:

Revenue **by** Store.

Customers **by** Country.

Payments **by** Staff.

Whenever you hear these words,

stop thinking about one overall metric.

The business now wants multiple metrics.

---

## The Most Important Mental Model

Remember these two words.

```
Metric

+

Dimension
```

Everything about GROUP BY becomes simple once you understand them.

### Metric

What is being measured?

Examples:

Revenue

Rental Count

Average Payment

Inventory Count

---

### Dimension

Who or what is being measured?

Examples:

Store

Customer

Country

Month

Category

---

Business Question

> Revenue by Store

Metric

Revenue

Dimension

Store

---

Business Question

> Customers by Country

Metric

Customer Count

Dimension

Country

---

Business Question

> Rentals by Month

Metric

Rental Count

Dimension

Month

This is how experienced analysts think.

They don't begin with GROUP BY.

They begin with:

> What is the metric?

> What is the dimension?

---

## Pagila Example

The Finance Manager asks:

> "Compare revenue across all stores."

Thinking process:

```
Business Objective

Compare store performance.

↓

Metric

Revenue

↓

Dimension

Store

↓

Pattern

Grouping

↓

SQL Concept

GROUP BY
```

Notice that SQL appears only after the business thinking is complete.

---

## Common Mistakes

### Mistake 1

Using GROUP BY whenever an aggregate function appears.

Ask yourself first:

Does the business want

one metric

or

one metric per category?

---

### Mistake 2

Confusing GROUP BY with ORDER BY.

GROUP BY creates business groups.

ORDER BY arranges the final output.

These are completely different operations.

---

## Remember

If you remember only one sentence from Week 1, let it be this:

> **GROUP BY is not about grouping rows.**

It is about producing **one business metric for each business dimension.**

That is the foundation of business analytics.

---

# Pattern Card 6 — Basic Join Thinking

## Business Objective

Combine information that is stored in different business entities.

One of the biggest mindset shifts for beginners is understanding that **a relational database intentionally stores related information in separate tables**.

Why?

Because each table represents a different business entity.

For example:

- Customer
- Address
- City
- Country

These are different entities.

A JOIN allows us to answer a business question that involves more than one entity.

---

## Recognition Signals

Whenever you hear multiple business entities in the same question, stop and think.

Examples:

- Customer and City
- Film and Category
- Customer and Address
- Rental and Customer

Your first question should be:

> **Can a single table answer this question?**

If the answer is **No**, you're probably looking at a JOIN problem.

---

## Mental Model

Think of every table as a department inside a company.

```
Customer Department

knows customers
```

```
Film Department

knows films
```

```
Category Department

knows categories
```

If the CEO asks:

> "Show every film together with its category."

No single department knows the complete answer.

The departments must share information.

A JOIN works the same way.

It allows business entities to work together.

---

## The Golden Rule

Don't ask:

> Which JOIN should I use?

Instead ask:

> **What information is missing?**

Example

Business asks:

> Show customer names and cities.

Customer table contains:

✔ Customer Name

But it does **not** contain:

❌ City

Now ask:

Where does City exist?

Follow the relationship.

Once the missing information is identified, the need for a JOIN becomes obvious.

---

## Pagila Examples

### Example 1

Customer Support Manager asks:

> "Show customer names together with their cities."

Thinking

```
Business Objective

Display customer location.

↓

Need

Customer

+

City

↓

One table?

No

↓

Pattern

Basic Join
```

---

### Example 2

Content Manager asks:

> "Show every film with its category."

Thinking

```
Business Objective

Display complete film information.

↓

Need

Film

+

Category

↓

Pattern

Basic Join
```

---

### Example 3

Operations Manager asks:

> "Show customer names together with their rentals."

Thinking

```
Need

Customer

+

Rental

↓

Multiple entities

↓

Basic Join
```

---

## Week 1 Scope

At this stage you only need to recognise that:

- Some questions require one table.
- Some questions require multiple tables.

You **do not** need to master:

- Multi-level relationship paths
- Bridge tables
- Join optimization
- Complex reporting joins

Those belong to later weeks.

Week 1 is about recognising the pattern.

---

## Common Mistakes

### Mistake 1

Thinking every query requires a JOIN.

If one table already contains all required information, keep the solution simple.

---

### Mistake 2

Thinking JOIN is difficult.

JOIN is simply a way of bringing together related business information.

The difficult part is understanding the business question—not the SQL.

---

### Mistake 3

Looking at SQL before understanding the entities.

Always identify the business entities first.

---

## Remember

Whenever a manager asks about two different business entities, your brain should ask:

> "Where does each piece of information live?"

That question naturally leads to the correct solution.

---

# Week 1 Decision Matrix

Before writing any SQL, classify the business request.

| Business Request | Pattern |
|------------------|---------|
| Show all customers | Retrieve |
| Show only active customers | Retrieve + Filter |
| Show newest customers first | Retrieve + Sort |
| What is the total revenue? | Summarize |
| Revenue by store | Summarize + Group |
| Show customer name with city | Retrieve + Basic Join |

If you can correctly identify the pattern, writing the SQL becomes much easier.

---

# Week 1 Thinking Checklist

Every time you receive a business request, pause for one minute and answer these questions.

## 1. What is the business trying to achieve?

Examples:

- Display information
- Measure performance
- Compare groups
- Find specific records

---

## 2. Which business entity is involved?

Examples:

- Customer
- Film
- Store
- Rental
- Payment

---

## 3. Which thinking pattern applies?

Choose one or more.

- Retrieval
- Filtering
- Sorting
- Summarization
- Grouping
- Basic Join

---

## 4. Which SQL concept naturally follows?

| Pattern | SQL Concept |
|----------|-------------|
| Retrieval | SELECT |
| Filtering | WHERE |
| Sorting | ORDER BY |
| Summarization | Aggregate Functions |
| Grouping | GROUP BY |
| Basic Join | JOIN |

Notice that SQL is the final step—not the first.

---

# Week 1 Recognition Drill

Without writing SQL, identify the thinking pattern.

---

### Scenario 1

The Customer Support Manager says:

> "Show every active customer."

Pattern:

_____________________

---

### Scenario 2

The Finance Manager says:

> "What was our total revenue yesterday?"

Pattern:

_____________________

---

### Scenario 3

The CEO asks:

> "Compare revenue across stores."

Pattern:

_____________________

---

### Scenario 4

The Marketing Manager says:

> "Show customers alphabetically."

Pattern:

_____________________

---

### Scenario 5

The Operations Manager says:

> "Show customer names together with their cities."

Pattern:

_____________________

---

# Answers

| Scenario | Pattern |
|----------|---------|
| 1 | Retrieve + Filter |
| 2 | Summarization |
| 3 | Summarization + Grouping |
| 4 | Retrieve + Sorting |
| 5 | Retrieve + Basic Join |

---

# Week 1 Summary

Week 1 is **not** about memorising SQL syntax.

It is about learning to recognise business problems.

By the end of this week, you should be able to look at a business request and immediately identify the thinking pattern before writing a single line of SQL.

Remember these six patterns:

1. Retrieve information.
2. Filter unnecessary records.
3. Sort results meaningfully.
4. Measure business performance.
5. Compare business dimensions.
6. Combine information from multiple business entities.

These six ideas form the foundation of analytical SQL.

Everything you learn in later weeks—subqueries, window functions, CTEs, optimization, and reporting—will be built on these same thinking patterns.

Before writing SQL, always ask yourself:

> **"What business problem am I solving?"**

Once you can answer that question clearly, SQL becomes a tool rather than a puzzle.

---

## Final Thought

Many developers learn SQL by memorising clauses.

Professional developers learn SQL by recognising business patterns.

That is the skill this course is designed to develop.