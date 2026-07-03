# Week 3 Hints

## Data Transformation, Conditional Logic & Advanced JOINs

---

# How to Use These Hints

These hints are designed to guide your thinking without giving away the complete SQL solution.

Read the hint only if you're stuck.

Try to solve the question yourself before looking at the answer.

---

# Day 1 – Advanced JOIN Concepts (Q1–Q10)

### Q1

Think about joining the same table to itself.

---

### Q2

The `film_actor` table will be joined more than once.

---

### Q3

Customers sharing the same city will have the same `city_id`.

---

### Q4

The `USING` clause works only when both tables have the same column name.

---

### Q5

Compare the syntax of `ON` and `USING`.

Notice what changes.

---

### Q6

Run both queries and compare their outputs.

Which rows are different?

---

### Q7

Think about which rows are returned by:

- LEFT JOIN
- RIGHT JOIN
- FULL JOIN

---

### Q8

A SELF JOIN compares rows within the same table.

---

### Q9

Can every RIGHT JOIN be rewritten as a LEFT JOIN?

Think about changing the order of the tables.

---

### Q10

Draw the relationship path before writing any SQL.

---

# Day 2 – CASE Expressions (Q11–Q20)

### Q11

CASE can replace numeric values with meaningful text.

---

### Q12

Use multiple `WHEN` conditions.

---

### Q13

Think about different payment ranges.

---

### Q14

Count rentals first.

Then classify customers.

---

### Q15

CASE is useful for creating business labels.

---

### Q16

CASE can be used inside `ORDER BY`.

---

### Q17

CASE can also be used inside `GROUP BY`.

---

### Q18

Conditions are checked from top to bottom.

---

### Q19

One CASE can contain another CASE.

---

### Q20

Write the business rules before writing SQL.

---

# Day 3 – Handling NULL Values (Q21–Q30)

### Q21

`COALESCE()` returns the first non-NULL value.

---

### Q22

Choose a meaningful default value.

---

### Q23

`COALESCE()` is often simpler than CASE.

---

### Q24

`NULLIF()` can safely prevent division-by-zero errors.

---

### Q25

Compare readability.

Which solution is shorter?

---

### Q26

Look for columns that may contain NULL values.

---

### Q27

Display something useful instead of NULL.

---

### Q28

Think about calculations.

---

### Q29

Think about display values.

---

### Q30

Can `COALESCE()` replace a simple CASE?

---

# Day 4 – CAST and Data Conversion (Q31–Q40)

### Q31

Use the `CAST()` function.

---

### Q32

Convert a timestamp into a date.

---

### Q33

Convert numbers into text.

---

### Q34

Formatting is often easier after casting.

---

### Q35

Think about what business users want to read.

---

### Q36

Not every conversion requires CAST.

---

### Q37

Combine CAST with string functions.

---

### Q38

Think about why different data types exist.

---

### Q39

Conversions are often performed inside reports.

---

### Q40

Explain every conversion before writing SQL.

---

# Day 5 – String Functions (Q41–Q50)

### Q41

Convert text to uppercase.

---

### Q42

Convert text to lowercase.

---

### Q43

Join two strings together.

---

### Q44

Remove unnecessary spaces.

---

### Q45

Replace one character with another.

---

### Q46

Extract only part of the title.

---

### Q47

Measure the length of a string.

---

### Q48

Build a display name suitable for reports.

---

### Q49

More than one string function can be combined.

---

### Q50

Always choose the simplest function.

---

# Day 6 – Date & Time Functions (Q51–Q60)

### Q51

The database knows today's date.

---

### Q52

Current date and current timestamp are different.

---

### Q53

Calculate the time between two dates.

---

### Q54

Extract only the year.

---

### Q55

Extract only the month.

---

### Q56

Group by month instead of individual dates.

---

### Q57

Business users prefer formatted dates.

---

### Q58

Think about customer membership duration.

---

### Q59

Aggregate by month.

---

### Q60

Every date function answers a business question.

---

# Day 7 – Integration Challenge (Q61–Q70)

### Q61

Break the problem into smaller steps.

---

### Q62

Use multiple concepts together.

---

### Q63

Formatting improves readability.

---

### Q64

Think about business metrics.

---

### Q65

Customer reports usually combine several tables.

---

### Q66

Monthly reports require grouping by date.

---

### Q67

Relationship paths still matter.

---

### Q68

Clean the data before presenting it.

---

### Q69

Write the business logic first.

---

### Q70

Identify every SQL concept before writing SQL.

---

# Final Advice

Don't memorize SQL syntax.

Instead, learn to answer three questions:

1. What is the business asking?

2. Which SQL feature solves this problem?

3. How can I make the result easy for the business to understand?

That's how professional SQL developers think.