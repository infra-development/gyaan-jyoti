# Week 4 Quiz

## Window Functions & Analytical SQL

---

# Instructions

- Answer the questions without executing SQL whenever possible.
- Focus on the business requirement before thinking about SQL syntax.
- Explain *why* a Window Function is needed, not just *which* one.

---

# Section 1 – Multiple Choice

## Q1

Which SQL feature allows analytical calculations while keeping every row?

A. GROUP BY

B. HAVING

C. Window Functions

D. DISTINCT

---

## Q2

Which clause defines the analytical window?

A. GROUP BY

B. OVER()

C. ORDER BY

D. WHERE

---

## Q3

Which clause divides data into logical groups for analysis?

A. GROUP BY

B. ORDER BY

C. PARTITION BY

D. HAVING

---

## Q4

Which Window Function assigns a unique number to every row?

A. RANK()

B. DENSE_RANK()

C. ROW_NUMBER()

D. NTILE()

---

## Q5

Which ranking function leaves gaps after ties?

A. ROW_NUMBER()

B. RANK()

C. DENSE_RANK()

D. FIRST_VALUE()

---

## Q6

Which ranking function does **not** leave gaps after ties?

A. ROW_NUMBER()

B. RANK()

C. DENSE_RANK()

D. NTILE()

---

## Q7

Which function returns the previous row?

A. LEAD()

B. LAG()

C. FIRST_VALUE()

D. LAST_VALUE()

---

## Q8

Which function returns the next row?

A. LEAD()

B. LAG()

C. NTILE()

D. RANK()

---

## Q9

Which function divides rows into equally sized groups?

A. ROW_NUMBER()

B. NTILE()

C. RANK()

D. SUM()

---

## Q10

Which function is commonly used to calculate running totals?

A. SUM() OVER()

B. AVG()

C. COUNT()

D. GROUP BY

---

# Section 2 – True or False

## Q11

Window Functions always reduce the number of rows.

---

## Q12

`PARTITION BY` is the same as `GROUP BY`.

---

## Q13

Every Window Function requires an `OVER()` clause.

---

## Q14

`ORDER BY` inside a Window Function controls analytical ordering.

---

## Q15

`ROW_NUMBER()` gives identical values the same rank.

---

## Q16

`RANK()` allows ties.

---

## Q17

`DENSE_RANK()` skips rank numbers after ties.

---

## Q18

`LAG()` compares the current row with a previous row.

---

## Q19

Running totals usually require ordering.

---

## Q20

Window Functions are mainly used for analytical reporting.

---

# Section 3 – Short Answer

## Q21

Why were Window Functions introduced into SQL?

---

## Q22

When should you choose a Window Function instead of `GROUP BY`?

---

## Q23

What is the purpose of `OVER()`?

---

## Q24

What does `PARTITION BY` do?

---

## Q25

Why is `ORDER BY` important inside a Window Function?

---

## Q26

When should you use `ROW_NUMBER()`?

---

## Q27

When should you use `RANK()` instead of `ROW_NUMBER()`?

---

## Q28

When should you use `DENSE_RANK()`?

---

## Q29

When is `LAG()` useful?

---

## Q30

When is `LEAD()` useful?

---

# Section 4 – Business Thinking

## Q31

A business wants to display every payment together with the customer's average payment.

Should you use:

- GROUP BY
- Window Function

Why?

---

## Q32

A manager wants to rank customers by revenue within each store.

Which Window Function would you choose?

---

## Q33

A finance team wants cumulative revenue by payment date.

Which Window Function pattern should you use?

---

## Q34

A business analyst wants to compare today's payment with yesterday's payment.

Which Window Function is most appropriate?

---

## Q35

An executive wants customers divided into four spending categories.

Which Window Function should you use?

---

## Q36

A report needs the first payment made by every customer.

Which Window Function would you choose?

---

## Q37

A report needs the latest payment made by every customer.

Which Window Function would you choose?

---

## Q38

A business wants to smooth daily revenue fluctuations.

Which analytical technique is most appropriate?

---

## Q39

Before writing a Window Function query, what is the most important business question to ask?

---

## Q40

What is the biggest lesson learned during Week 4?

---

# Scoring Guide

| Score | Level |
|--------|-------|
| 36–40 | Excellent – Ready for Week 5 |
| 30–35 | Good – Review a few Window Function concepts |
| 24–29 | Fair – Practice more analytical SQL |
| Below 24 | Revisit Week 4 before continuing |

---

# Congratulations!

If you can confidently answer these questions, you now understand one of the most powerful areas of SQL.

You have learned how to analyze data without losing detail, build rankings, identify trends, compare rows, and solve analytical business problems using Window Functions.

These are core skills expected from Data Analysts, BI Developers, Data Engineers, and experienced SQL Developers.