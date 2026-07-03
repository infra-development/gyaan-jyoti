# Week 4 Final Business Challenge

## Analytical Reporting with Window Functions

---

# Welcome

Congratulations!

You've completed Week 4.

So far you've learned how to:

- Retrieve data.
- Connect business entities.
- Transform raw data.
- Analyze data using Window Functions.

This week introduced one of the most powerful features in SQL.

Instead of summarizing data,

you learned how to perform advanced analysis while preserving every row.

Now it's time to combine everything you've learned into realistic business reports.

---

# Rules

For every challenge complete the following steps.

## Step 1

Understand the business requirement.

---

## Step 2

Identify the business entities involved.

---

## Step 3

Identify the business metric.

Examples:

- Revenue
- Rental Count
- Payment Amount
- Customer Activity

---

## Step 4

Ask yourself:

```
Should every row remain visible?
```

If yes,

consider using a Window Function.

---

## Step 5

Determine whether you need:

- PARTITION BY
- ORDER BY
- Ranking
- Previous / Next Row
- Running Total
- Moving Average

---

## Step 6

Write clean, readable SQL.

---

# Department 1 – Finance

## Task 1

Display every payment together with:

- Customer Total Revenue
- Customer Average Payment
- Customer Payment Rank

---

## Task 2

Calculate a running total of payments for every customer.

---

## Task 3

Compare every payment with the customer's previous payment.

Display:

- Previous Payment
- Difference
- Percentage Change (if applicable)

---

## Task 4

Display the customer's first and latest payment.

---

## Task 5

Build a complete customer payment analysis report.

---

# Department 2 – Customer Analytics

## Task 6

Rank customers based on total revenue.

---

## Task 7

Rank customers within each store.

---

## Task 8

Divide customers into four spending groups.

---

## Task 9

Identify the top three customers in every store.

---

## Task 10

Build a customer performance dashboard.

---

# Department 3 – Film Analytics

## Task 11

Rank films by rental count.

---

## Task 12

Find the most rented film in every category.

---

## Task 13

Display the cumulative rentals for every film over time.

---

## Task 14

Calculate the moving average of film rentals.

---

## Task 15

Build a film popularity dashboard.

---

# Department 4 – Store Performance

## Task 16

Calculate store revenue.

---

## Task 17

Rank stores by revenue.

---

## Task 18

Display cumulative revenue for every store.

---

## Task 19

Compare each payment with the previous payment within the same store.

---

## Task 20

Build a complete store performance dashboard.

---

# Department 5 – Executive Dashboard

## Task 21

Create a customer dashboard showing:

- Customer Name
- Store
- Total Revenue
- Customer Rank
- Spending Group

---

## Task 22

Create a payment dashboard showing:

- Payment Date
- Running Revenue
- Previous Payment
- Payment Difference

---

## Task 23

Create a rental dashboard showing:

- Rental Date
- Running Rentals
- Customer Activity

---

## Task 24

Create a film dashboard showing:

- Film
- Category
- Rental Rank
- Running Rentals

---

## Task 25

Create an executive business dashboard that combines multiple Window Functions in a single report.

---

# Success Criteria

You have successfully completed Week 4 if you can:

✓ Explain the purpose of Window Functions.

✓ Use `OVER()` confidently.

✓ Apply `PARTITION BY` correctly.

✓ Apply `ORDER BY` inside Window Functions.

✓ Choose the correct ranking function.

✓ Compare previous and next rows.

✓ Calculate running totals.

✓ Calculate moving averages.

✓ Combine multiple Window Functions in a single query.

✓ Build analytical dashboards.

---

# Professional Thinking Checklist

Before writing SQL, ask yourself:

□ What is the business trying to analyze?

□ What metric is important?

□ Should every row remain visible?

□ Does the calculation restart for each group?

□ Does the order of rows matter?

□ Which Window Function best solves the problem?

□ Is the report easy for business users to understand?

---

# Week 4 Achievement

You have now learned how to:

```
Retrieve Data

        ✓

↓

Connect Data

        ✓

↓

Transform Data

        ✓

↓

Analyze Data

        ✓
```

You are now capable of writing analytical SQL used by:

- Data Analysts
- Business Intelligence Developers
- Data Engineers
- Backend Engineers
- Analytics Engineers

---

# Looking Ahead to Week 5

Week 5 introduces another major milestone.

Instead of solving analytical problems directly,

you'll learn how to **break large SQL problems into smaller, reusable building blocks**.

You'll master:

- Subqueries
- Correlated Subqueries
- Common Table Expressions (CTEs)
- Recursive CTEs
- UNION
- INTERSECT
- EXCEPT

These techniques allow you to solve business problems that cannot be expressed in a single SQL statement.

By the end of Week 5, you'll begin writing SQL that is modular, reusable, and much easier to maintain—exactly how experienced SQL developers structure complex queries.