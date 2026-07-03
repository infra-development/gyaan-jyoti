# SQL Pattern Map
## Week 2

> Week 1 taught you to recognize SQL concepts.
>
> Week 2 teaches you to recognize **business relationship patterns**.
>
> Before writing SQL, identify:
>
> - What information is needed?
> - Which business entities contain it?
> - How are those entities connected?

---

# Step 1 — Understand the Business Question

Don't ask:

❌ Which JOIN should I use?

Ask:

✅ Which business entities contain the required information?

---

# Step 2 — Identify the Business Entities

Every report begins with entities.

Examples

Customer

Film

Rental

Payment

Inventory

Actor

Category

Store

Address

City

Country

---

# Step 3 — Find the Relationship Path

Think of the database as a road map.

Every table is a city.

Foreign keys are roads.

Your job is to find the correct route.

```
Business Question

↓

Business Entities

↓

Relationship Path

↓

SQL
```

---

# Pattern 1 — Retrieve Related Information

## Recognition Signals

Business questions mentioning two or more entities.

Examples

- Customer with City
- Film with Category
- Customer with Country
- Film with Language

Think

```
Information exists
in different tables.

↓

Need Relationships
```

SQL Concept

```
INNER JOIN
```

---

# Pattern 2 — Follow a Relationship Chain

## Recognition Signals

Information is several tables away.

Examples

Customer

↓

Rental

↓

Inventory

↓

Film

Business Examples

- Which films did customers rent?
- Which customers rented Action movies?
- Which customers rented films in English?

Think

```
Need to travel
through multiple
business entities.
```

SQL Concept

```
Multiple JOINs
```

---

# Pattern 3 — Build Business Reports

## Recognition Signals

Business asks

- How many...
- Revenue by...
- Rentals by...
- Customers by...

Think

```
Business Metric

+

Business Dimension
```

SQL Concepts

```
JOIN

GROUP BY

Aggregate Function
```

---

# Pattern 4 — Find Missing Information

## Recognition Signals

Business asks

- Never
- Without
- Missing
- No

Examples

- Customers who never rented
- Films never rented
- Categories without rentals

Think

```
Keep everything

↓

Look for
missing matches
```

SQL Concepts

```
LEFT JOIN

IS NULL
```

---

# Pattern 5 — Remove Duplicate Values

## Recognition Signals

Business asks

- Different
- Unique
- Distinct

Examples

- Different customers
- Different films
- Different categories

Think

```
Relationships
can repeat values.

Need uniqueness.
```

SQL Concepts

```
DISTINCT

COUNT(DISTINCT)
```

---

# Pattern 6 — Count Related Records

## Recognition Signals

Business asks

- Number of rentals
- Number of films
- Number of customers

Examples

- Rentals per customer
- Films per actor
- Customers per city

Think

```
Join

↓

Group

↓

Count
```

SQL Concepts

```
JOIN

GROUP BY

COUNT()
```

---

# Pattern 7 — Compare Business Performance

## Recognition Signals

Business asks

- Best
- Worst
- Highest
- Lowest
- Top
- Bottom

Examples

- Best customers
- Highest revenue store
- Most rented films

Think

```
Measure

↓

Compare

↓

Rank
```

SQL Concepts

```
JOIN

GROUP BY

SUM()

COUNT()

ORDER BY

LIMIT
```

---

# Pattern 8 — Navigate Business Processes

## Recognition Signals

Business questions describing a complete process.

Examples

Customer rents a film.

Customer pays for rental.

Film belongs to a category.

Think

```
Business Process

↓

Relationship Path

↓

SQL
```

Example

```
Customer

↓

Rental

↓

Inventory

↓

Film

↓

Film_Category

↓

Category
```

---

# Week 2 Decision Matrix

| Business Question | Thinking Pattern | SQL Concepts |
|-------------------|------------------|--------------|
| Customer with Country | Retrieve Related Information | JOIN |
| Films rented by Customer | Relationship Chain | Multiple JOINs |
| Revenue by Customer | Business Report | JOIN + GROUP BY + SUM |
| Customers without Rentals | Missing Information | LEFT JOIN + IS NULL |
| Unique Films Rented | Remove Duplicates | DISTINCT |
| Films per Category | Count Related Records | JOIN + GROUP BY + COUNT |
| Highest Revenue Customer | Compare Performance | JOIN + GROUP BY + SUM + ORDER BY |
| Customer Rental Process | Business Process | Multi-table JOIN |

---

# Week 2 Mental Checklist

Before writing SQL ask yourself:

□ What is the business trying to know?

□ Which business entities are involved?

□ Which table should I start from?

□ What relationship path connects the entities?

□ Will this require one JOIN or several?

□ Will joining create duplicate rows?

□ Do I need DISTINCT?

□ Do I need GROUP BY?

□ Am I measuring one value or comparing many?

□ Do I need INNER JOIN or LEFT JOIN?

□ Can I explain the business process before writing SQL?

If you can answer these questions first,

the SQL usually becomes straightforward.