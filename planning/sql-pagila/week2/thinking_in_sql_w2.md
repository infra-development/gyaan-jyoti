# Thinking in SQL
## Week 2
### From Tables to Business Processes

---

# Purpose of This Guide

Congratulations!

By completing Week 1, you learned how to:

- Retrieve data
- Filter rows
- Sort results
- Aggregate information
- Group data
- Write basic JOINs

These skills allow you to answer questions that involve one or two tables.

Week 2 introduces a much bigger idea.

Professional SQL developers rarely think about tables.

They think about **business processes**.

Instead of asking:

> "Which table contains this information?"

they ask:

> "How does this information flow through the business?"

That change in thinking separates beginners from professionals.

---

# The Week 2 Thinking Framework

Every multi-table problem should follow the same thinking process.

```
Business Question
        │
        ▼
Business Objective
        │
        ▼
Business Entities
        │
        ▼
Relationship Path
        │
        ▼
Business Metric
        │
        ▼
Business Dimension
        │
        ▼
SQL Concepts
        │
        ▼
Write SQL
```

Notice again.

SQL appears near the end.

---

# Step 1 — Understand the Business Objective

Business users don't care about joins.

They care about solving business problems.

Example

> Which customers generate the most revenue?

Don't think

```
SUM()

GROUP BY

JOIN
```

Think

```
Business Objective

Identify valuable customers.
```

---

Another example

> Which films have never been rented?

Don't think

```
LEFT JOIN
```

Think

```
Business Objective

Find inventory that is not being used.
```

Business thinking always comes first.

---

# Step 2 — Identify the Business Entities

Every report involves one or more entities.

Examples

Customer

Film

Rental

Inventory

Payment

Store

Category

Actor

Country

Ask yourself

> Which business entities contain the required information?

---

Example

Business Question

> Which customers rented Action movies?

Entities

```
Customer

Rental

Inventory

Film

Film_Category

Category
```

---

# Step 3 — Find the Relationship Path

This is the most important skill in Week 2.

Imagine the database is a road map.

Tables are cities.

Foreign keys are roads.

You cannot teleport.

You must travel using valid roads.

Example

```
Customer

↓

Rental

↓

Inventory

↓

Film
```

Every JOIN simply follows one road.

---

# Relationship Thinking

Bad thinking

```
I need customer.

I need film.

Let's JOIN them.
```

Professional thinking

```
Customer

↓

Rental

↓

Inventory

↓

Film
```

The relationship path determines the JOIN sequence.

Never guess joins.

---

# Pattern Card 1 — Retrieving Related Information

## Business Objective

Combine information stored in multiple business entities.

Example

> Show every customer together with their country.

Thinking

```
Customer

↓

Address

↓

City

↓

Country
```

Notice

There is no direct relationship between Customer and Country.

The intermediate tables matter.

---

# Pattern Card 2 — Following Business Processes

Business questions often describe events.

Example

Customer rents a movie.

Business process

```
Customer

↓

Rental

↓

Inventory

↓

Film
```

SQL should follow the business process.

Not the other way around.

---

Another example

Customer makes a payment.

```
Customer

↓

Payment
```

The shortest valid relationship path is usually the correct one.

---

# Pattern Card 3 — Building Reports

Businesses rarely ask for raw data.

They ask for reports.

Examples

Revenue by Store

Rentals by Customer

Films by Category

Thinking

```
Business Metric

+

Business Dimension
```

Example

Revenue by Store

Metric

Revenue

Dimension

Store

Now determine how to reach both entities.

---

# Pattern Card 4 — Duplicate Thinking

One of the biggest surprises for beginners is duplicate rows.

Example

Actor

↓

Film_Actor

↓

Film

One actor appears in ten films.

The JOIN produces ten rows.

SQL is correct.

The relationship created multiple valid records.

Always ask

```
Did the relationship create
multiple business facts?
```

If yes,

duplicates are expected.

---

# Pattern Card 5 — Missing Information

Businesses often care more about what did **not** happen.

Examples

Customers without rentals

Films never rented

Categories without rentals

Thinking

```
Keep everything

↓

Find missing relationships
```

This naturally leads to

LEFT JOIN

Not because SQL says so,

but because the business requires it.

---

# Pattern Card 6 — Counting Correctly

Business question

> How many customers rented Action films?

Ask first

Am I counting

Rows

or

Customers?

These are different questions.

Relationships often multiply rows.

Sometimes

COUNT(*)

is correct.

Sometimes

COUNT(DISTINCT customer_id)

is correct.

Always understand what the business wants counted.

---

# Pattern Card 7 — Relationship Chains

Some reports require many relationships.

Example

Revenue by Country

Thinking

```
Customer

↓

Address

↓

City

↓

Country

↓

Payment
```

Instead of remembering SQL,

remember the business path.

The SQL becomes much easier.

---

# How Professionals Build Queries

Professionals rarely start typing SQL immediately.

Instead they sketch something like this.

```
Question

↓

Entities

↓

Relationship Path

↓

Metric

↓

Dimension

↓

Filters

↓

Expected Output

↓

SQL
```

Planning usually takes longer than typing.

That is normal.

---

# The Golden Rules of Week 2

Rule 1

Never join tables until you understand the relationship.

---

Rule 2

Always identify the relationship path first.

---

Rule 3

Business processes determine JOIN order.

---

Rule 4

Duplicate rows are often correct.

---

Rule 5

Use DISTINCT only when the business requires uniqueness.

---

Rule 6

Every report should answer a business question.

Not demonstrate SQL syntax.

---

# Week 2 Mental Checklist

Before writing SQL ask yourself

□ What is the business trying to know?

□ Which entities are involved?

□ Which table contains the starting information?

□ Which table contains the final information?

□ What relationship path connects them?

□ Will the joins create multiple rows?

□ Am I counting rows or business entities?

□ Should missing information remain in the report?

□ What business metric am I calculating?

□ What business dimension am I grouping by?

Only after answering these questions should you begin writing SQL.

---

# Final Thought

By the end of Week 2, you should notice a change in how you think.

Instead of seeing

```
customer

film

payment
```

as separate tables,

you should see a connected business system.

That is how professional SQL developers approach every new database.