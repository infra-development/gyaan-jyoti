# Week 4 Hints

## Window Functions & Analytical SQL

---

# How to Use This File

This file is designed to guide your thinking without revealing the complete SQL solution.

Follow this sequence for every question:

```
Read the Business Question

↓

Identify the Business Entities

↓

Identify the Required Analysis

↓

Choose the Appropriate Window Function

↓

Write the SQL
```

Only view these hints if you become stuck.

---

# Day 1 — Understanding Window Functions

## Q1

Hint:

You need the average payment.

Should every payment row remain visible?

If yes, think about a Window Function instead of `GROUP BY`.

---

## Q2

Hint:

Calculate the total revenue without collapsing the payment rows.

Look at:

```
SUM()

+

OVER()
```

---

## Q3

Hint:

Every payment should display the total number of payments.

Consider:

```
COUNT()

OVER()
```

---

## Q4

Hint:

Write the query twice.

Once using:

- GROUP BY

Once using:

- Window Functions

Compare the number of rows returned.

---

## Q5

Hint:

Each customer row should remain visible.

Think about counting all customers using a Window Function.

---

## Q6

Hint:

The average rental rate is the same for every film.

Can a Window Function display that value without removing rows?

---

## Q7

Hint:

Ask yourself:

Which SQL operation reduces rows?

Which SQL operation preserves rows?

---

## Q8

Hint:

Think about reports that need:

- Ranking
- Running totals
- Previous values

Would GROUP BY work?

---

## Q9

Hint:

Every Window Function requires one important clause.

What does `OVER()` actually define?

---

## Q10

Hint:

Start with:

```
Business Question

↓

Analysis

↓

Window Function

↓

SQL
```

---

# Day 2 — PARTITION BY

## Q11

Hint:

Each payment belongs to one customer.

Partition by customer.

Then calculate revenue.

---

## Q12

Hint:

Average payments should restart for every customer.

Which clause restarts calculations?

---

## Q13

Hint:

Count payments inside each customer partition.

---

## Q14

Hint:

Films already have ratings.

Partition using the rating.

---

## Q15

Hint:

Every customer belongs to one store.

Partition by store.

---

## Q16

Hint:

Count rentals for each customer while keeping every rental row.

---

## Q17

Hint:

Partition films by rating.

Calculate the average replacement cost.

---

## Q18

Hint:

Think of PARTITION BY as creating smaller analytical groups.

---

## Q19

Hint:

GROUP BY creates fewer rows.

PARTITION BY keeps every row.

That is the biggest difference.

---

## Q20

Hint:

Your thinking should follow:

```
Business Group

↓

PARTITION BY

↓

Analysis
```

---

# Day 3 — ORDER BY Inside Window Functions

## Q21

Hint:

A running total requires:

```
SUM()

+

ORDER BY

inside

OVER()
```

---

## Q22

Hint:

Instead of summing amounts,

count rows progressively.

---

## Q23

Hint:

Revenue should continuously increase over time.

Order by payment date.

---

## Q24

Hint:

Order rentals chronologically.

Calculate cumulative rentals.

---

## Q25

Hint:

Two ideas together:

- Customer partition
- Ordered payments

---

## Q26

Hint:

Partition by store.

Order payments by date.

---

## Q27

Hint:

Ask yourself:

What happens if ORDER BY is removed?

---

## Q28

Hint:

An aggregate returns one answer.

A running total returns many answers.

---

## Q29

Hint:

Think about dashboards showing:

Revenue growth

Daily sales

Monthly progress

---

## Q30

Hint:

Start with:

```
Time

↓

Ordering

↓

Running Analysis
```

---

# Day 4 — Ranking Functions

## Q31

Hint:

Every row needs a unique sequence number.

---

## Q32

Hint:

Rank customers after calculating total revenue.

---

## Q33

Hint:

Compare ties carefully.

How should equal values be ranked?

---

## Q34

Hint:

Use the same dataset.

Compare all three ranking functions.

Observe what happens when ties occur.

---

## Q35

Hint:

Rank customers inside each store.

Return only Rank 1.

---

## Q36

Hint:

Find rental counts first.

Then rank films within every category.

---

## Q37

Hint:

After ranking,

keep only the first three rows.

---

## Q38

Hint:

Unique numbering.

No ties.

---

## Q39

Hint:

Competition ranking.

Ties create gaps.

---

## Q40

Hint:

Dense ranking.

Ties do not create gaps.

---

# Day 5 — Comparing Rows

## Q41

Hint:

Look one row backward.

---

## Q42

Hint:

Look one row forward.

---

## Q43

Hint:

Current payment

minus

Previous payment.

---

## Q44

Hint:

Compare rentals within each customer.

---

## Q45

Hint:

Find the customer's next rental.

---

## Q46

Hint:

Divide customers into four equal spending groups.

---

## Q47

Hint:

LAG reads previous rows.

---

## Q48

Hint:

LEAD reads future rows.

---

## Q49

Hint:

NTILE creates evenly sized groups.

---

## Q50

Hint:

Think:

```
Current Row

↓

Previous / Next Row

↓

Comparison
```

---

# Day 6 — Advanced Analytical Functions

## Q51

Hint:

Find the first payment within every customer.

---

## Q52

Hint:

Find the latest payment.

Ordering is important.

---

## Q53

Hint:

Repeat the same idea for rentals.

---

## Q54

Hint:

Use descending order.

---

## Q55

Hint:

Moving averages require a window frame.

---

## Q56

Hint:

Group by date first.

Then calculate moving averages.

---

## Q57

Hint:

Average

vs

Moving Average.

How are they different?

---

## Q58

Hint:

Return the first value inside a partition.

---

## Q59

Hint:

Return the final value inside a partition.

---

## Q60

Hint:

Think:

```
Business Trend

↓

Window Function

↓

Analysis
```

---

# Day 7 — Integration Challenge

## Q61

Hint:

Combine:

- Ranking
- Running totals
- Customer revenue

---

## Q62

Hint:

Store performance requires multiple analytical metrics.

---

## Q63

Hint:

Rank films.

Calculate cumulative rentals.

---

## Q64

Hint:

Monthly revenue should show trends.

---

## Q65

Hint:

Think about:

Global Rank

and

Store Rank.

---

## Q66

Hint:

Compare every payment with its previous payment.

---

## Q67

Hint:

Show how customer activity changes over time.

---

## Q68

Hint:

Use more than one Window Function in the same query.

---

## Q69

Hint:

Write the business thinking process before SQL.

---

## Q70

Hint:

Review every Window Function learned this week.

Ask:

> Which business problem does it solve?

---

# Final Advice

Before writing any Window Function query, always ask yourself:

```
Do I need to reduce rows?

↓

Yes

↓

GROUP BY

-------------------------

No

↓

Window Function

↓

Should analysis restart?

↓

PARTITION BY

↓

Should order matter?

↓

ORDER BY

↓

Choose the appropriate Window Function
```

Remember:

Window Functions do not replace `GROUP BY`.

They solve a different class of business problems by allowing you to analyze data while preserving every row.