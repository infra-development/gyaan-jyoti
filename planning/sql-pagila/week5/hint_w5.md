# Week 5 Hints

## Advanced Query Construction

---

# How to Use This File

This file is designed to guide your thinking without revealing the complete SQL solution.

Follow this sequence for every question.

```
Read the Business Question

↓

Identify the Business Entities

↓

Identify the Required SQL Technique

↓

Break the Problem into Smaller Steps

↓

Write the SQL
```

Only read these hints if you become stuck.

---

# Day 1 — Subqueries & Derived Tables

## Q1

Hint

Calculate the total spending for every customer.

Then compare each customer's spending with the overall average customer spending.

Think about:

- GROUP BY
- Subquery

---

## Q2

Hint

Calculate the average rental rate first.

Then compare every film against that value.

Think:

```
Scalar Subquery
```

---

## Q3

Hint

Find the maximum payment first.

Then display every customer having that payment.

---

## Q4

Hint

Find films that do not appear in the rental process.

Think about:

```
NOT EXISTS

or

NOT IN
```

---

## Q5

Hint

Build a temporary table that calculates customer revenue.

Then query that result.

Think:

```
FROM

(

)

AS customer_revenue
```

---

## Q6

Hint

Calculate revenue for every store first.

Then calculate the average.

Two logical steps.

---

## Q7

Hint

Ask yourself:

Where does the subquery appear?

```
WHERE

or

FROM
```

---

## Q8

Hint

Scalar subqueries return only one value.

Think about business questions requiring:

- Average
- Maximum
- Minimum

---

## Q9

Hint

Derived tables are useful when intermediate calculations are required.

---

## Q10

Hint

Think:

```
Business Problem

↓

Can it be solved directly?

↓

No

↓

Break into Smaller Queries
```

---

# Day 2 — Correlated Subqueries

## Q11

Hint

Each customer has a different average payment.

The inner query depends on the current customer.

---

## Q12

Hint

Each film belongs to a rating.

Compare against the average rental rate of that rating.

---

## Q13

Hint

Calculate rental count for one customer.

Compare with the overall average.

---

## Q14

Hint

The maximum payment is different for every customer.

---

## Q15

Hint

Find the highest rental rate within each rating.

---

## Q16

Hint

Think:

```
Does at least one rental exist?
```

Use:

```
EXISTS
```

---

## Q17

Hint

Reverse the previous logic.

Use:

```
NOT EXISTS
```

---

## Q18

Hint

A correlated subquery depends on values from the outer query.

---

## Q19

Hint

Ordinary subqueries execute independently.

Correlated subqueries execute repeatedly.

---

## Q20

Hint

Think:

```
Outer Row

↓

Inner Query

↓

Comparison
```

---

# Day 3 — Common Table Expressions (CTEs)

## Q21

Hint

Calculate customer revenue first.

Store it in a CTE.

---

## Q22

Hint

Repeat the same idea for stores.

---

## Q23

Hint

Calculate rental counts.

Save them in a CTE.

---

## Q24

Hint

Use multiple CTEs.

Join them afterwards.

---

## Q25

Hint

Use one CTE for customer revenue.

Use another calculation for average revenue.

---

## Q26

Hint

Calculate revenue first.

Rank afterwards.

---

## Q27

Hint

Readability.

Maintainability.

Reusability.

---

## Q28

Hint

Both solve similar problems.

One is easier to read.

---

## Q29

Hint

Large reports often require several intermediate calculations.

---

## Q30

Hint

Think:

```
Large Problem

↓

Small Queries

↓

CTEs

↓

Final Query
```

---

# Day 4 — Recursive CTEs

## Q31

Hint

Start with:

```
1
```

Then generate:

```
2

3

4
```

until:

```
10
```

---

## Q32

Hint

Same idea.

Only the stopping condition changes.

---

## Q33

Hint

Generate one date.

Then add one day repeatedly.

---

## Q34

Hint

Generate months instead of days.

---

## Q35

Hint

Start at:

```
10
```

Decrease by one.

---

## Q36

Hint

Every recursive CTE has:

- Anchor Member
- Recursive Member

---

## Q37

Hint

The anchor member starts the recursion.

---

## Q38

Hint

The recursive member produces new rows.

---

## Q39

Hint

Think about:

- Organization charts
- Calendars
- Hierarchies

---

## Q40

Hint

Think:

```
Start

↓

Repeat

↓

Stop
```

---

# Day 5 — Set Operations

## Q41

Hint

Combine both result sets.

Remove duplicates.

---

## Q42

Hint

Keep duplicates.

---

## Q43

Hint

Return only common values.

---

## Q44

Hint

Return values existing in the first query but not the second.

---

## Q45

Hint

Compare inventory with rentals.

---

## Q46

Hint

Duplicates matter.

---

## Q47

Hint

Common records only.

---

## Q48

Hint

Difference between datasets.

---

## Q49

Hint

Think about combining reports from multiple sources.

---

## Q50

Hint

Think:

```
Dataset A

Dataset B

↓

Combine?

↓

Compare?

↓

Subtract?
```

---

# Day 6 — Choosing the Right Technique

## Q51

Hint

Write the solution twice.

Compare readability.

---

## Q52

Hint

Derived Table

vs

CTE

---

## Q53

Hint

Can the correlated query become a reusable CTE?

---

## Q54

Hint

Move the FROM subquery into a WITH clause.

---

## Q55

Hint

Read both versions.

Which is easier to understand?

---

## Q56

Hint

Correlated subqueries execute many times.

Think about performance.

---

## Q57

Hint

Large reports benefit from named query blocks.

---

## Q58

Hint

Professionals divide problems into logical steps.

---

## Q59

Hint

Never solve everything at once.

---

## Q60

Hint

Think:

```
Business Problem

↓

Small Steps

↓

Reusable Queries

↓

Final Solution
```

---

# Day 7 — Integration Challenge

## Q61

Hint

Multiple CTEs.

Customer revenue.

Store revenue.

Join together.

---

## Q62

Hint

Combine CTEs with Window Functions.

---

## Q63

Hint

Use a subquery before ranking.

---

## Q64

Hint

Monthly aggregation.

Then analytical calculations.

---

## Q65

Hint

Break the report into logical sections.

---

## Q66

Hint

Replace deeply nested queries with CTEs.

---

## Q67

Hint

Think about combining and comparing multiple datasets.

---

## Q68

Hint

Generate data recursively.

Join it with business data.

---

## Q69

Hint

Always begin with the business requirement.

SQL comes later.

---

## Q70

Hint

Review every technique learned this week.

Ask:

> Which business problem does this solve?

---

# Final Advice

Whenever a query starts becoming difficult to read, stop and ask yourself:

```
Can I divide this problem
into smaller pieces?

↓

Yes

↓

Subquery

Derived Table

CTE

Recursive CTE

↓

Final Query
```

Professional SQL developers don't write the longest query.

They write the clearest solution.