# Week 5 Quiz

## Advanced Query Construction

---

# Instructions

- Do not use PostgreSQL while answering.
- Try to answer from memory.
- The purpose of this quiz is to test your SQL thinking, not your memorization.
- Some questions are conceptual rather than syntax-based.

---

# Part 1 — Multiple Choice

## Q1

Which SQL technique is best suited for returning a **single calculated value**?

A. UNION

B. Scalar Subquery

C. Recursive CTE

D. INTERSECT

---

## Q2

Which SQL technique creates a temporary named result set that improves readability?

A. EXISTS

B. Derived Table

C. CTE

D. UNION ALL

---

## Q3

Which statement about Correlated Subqueries is correct?

A. They execute only once.

B. They never reference the outer query.

C. They depend on values from the outer query.

D. They always return one row.

---

## Q4

Which operator removes duplicate rows?

A. UNION

B. UNION ALL

C. EXISTS

D. EXCEPT

---

## Q5

Which SQL feature is primarily used to generate sequences recursively?

A. Derived Table

B. Recursive CTE

C. INTERSECT

D. Scalar Subquery

---

## Q6

Which operator returns only common rows between two result sets?

A. UNION

B. UNION ALL

C. INTERSECT

D. EXISTS

---

## Q7

Which operator returns rows from the first query that do not appear in the second?

A. UNION

B. EXCEPT

C. INTERSECT

D. EXISTS

---

## Q8

Which SQL technique is usually preferred for large, readable reports?

A. Nested Subqueries

B. CTEs

C. Scalar Subqueries

D. UNION

---

## Q9

Which clause is commonly used to test whether matching rows exist?

A. EXISTS

B. UNION

C. GROUP BY

D. HAVING

---

## Q10

Which statement best describes professional SQL development?

A. Write the shortest query possible.

B. Use the newest SQL feature.

C. Break large business problems into smaller logical steps.

D. Avoid using CTEs.

---

# Part 2 — True or False

## Q11

A scalar subquery returns exactly one value.

---

## Q12

A correlated subquery can reference columns from the outer query.

---

## Q13

CTEs always execute faster than subqueries.

---

## Q14

UNION ALL removes duplicate rows.

---

## Q15

Recursive CTEs require both an anchor member and a recursive member.

---

## Q16

INTERSECT returns rows common to both queries.

---

## Q17

EXCEPT returns rows appearing only in the second query.

---

## Q18

Meaningful CTE names improve SQL readability.

---

## Q19

Professional SQL developers always think about maintainability.

---

## Q20

Business understanding should come before SQL syntax.

---

# Part 3 — Short Answer

## Q21

What is the difference between a scalar subquery and a multi-row subquery?

---

## Q22

When should you prefer a CTE over a derived table?

---

## Q23

Why are correlated subqueries often slower than ordinary subqueries?

---

## Q24

Explain the purpose of EXISTS.

---

## Q25

Explain the difference between UNION and UNION ALL.

---

## Q26

When should INTERSECT be used?

---

## Q27

When should EXCEPT be used?

---

## Q28

What is the purpose of the anchor member in a recursive CTE?

---

## Q29

What is the purpose of the recursive member?

---

## Q30

Why are meaningful CTE names important?

---

# Part 4 — Business Thinking

## Q31

A business wants to compare every customer's spending with the company average.

Which SQL technique would you consider first?

Why?

---

## Q32

A report requires five intermediate calculations before producing the final result.

Which SQL technique would make the query easiest to maintain?

---

## Q33

A business wants to know whether every customer has rented at least one film.

Would you use JOIN or EXISTS?

Explain your reasoning.

---

## Q34

A business needs to compare two lists of customer IDs and identify only the customers appearing in both lists.

Which SQL operator should be used?

---

## Q35

You need to generate every date for the next 365 days.

Which SQL feature is designed for this problem?

---

## Q36

A query contains four deeply nested subqueries.

How could you improve its readability?

---

## Q37

Two datasets must be combined while preserving duplicate rows.

Which SQL operator is appropriate?

---

## Q38

A report must identify customers that appear in one dataset but not another.

Which SQL operator solves this?

---

## Q39

A junior developer asks:

> "Should I always use CTEs?"

How would you answer?

---

## Q40

What is the biggest mindset change introduced in Week 5?

---

# Part 5 — SQL Design

## Q41

Describe the thought process before writing a complex SQL query.

---

## Q42

How would you divide a large business problem into smaller SQL components?

---

## Q43

Explain the difference between solving a problem directly and solving it using intermediate query blocks.

---

## Q44

Why is SQL design more important than SQL syntax in complex reports?

---

## Q45

List three situations where CTEs significantly improve SQL.

---

## Q46

List three situations where EXISTS is preferable to JOIN.

---

## Q47

List three business uses of Recursive CTEs.

---

## Q48

List three situations where set operations simplify SQL.

---

## Q49

How would you explain Week 5 to someone who already knows basic SQL?

---

## Q50

Complete the following workflow.

```text
Business Problem

↓

____________________

↓

____________________

↓

Choose SQL Technique

↓

____________________

↓

Final SQL Solution
```

---

# Scoring Guide

| Score | Interpretation |
|--------|----------------|
| **45–50** | Excellent. You think like an advanced SQL developer. |
| **38–44** | Very Good. Minor improvements needed before Week 6. |
| **30–37** | Good. Review Subqueries and CTEs before continuing. |
| **20–29** | Fair. Revisit Week 5 lessons and practice more problems. |
| **Below 20** | Re-study Week 5 before moving to Business Intelligence topics. |

---

# Final Reflection

If you can answer most of these questions **without opening PostgreSQL**, you've reached the primary goal of Week 5:

> You no longer think in terms of SQL syntax.

> You think in terms of **designing SQL solutions**.