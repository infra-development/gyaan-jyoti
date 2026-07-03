# Week 5 Final Challenge

## Advanced Query Construction

---

# Overview

Congratulations!

You have completed the lessons for Week 5.

This challenge combines everything you've learned throughout the week into realistic business scenarios.

Unlike the daily exercises, these problems are intentionally larger and require multiple SQL techniques working together.

There is rarely a single correct solution.

Your objective is to write SQL that is:

- Correct
- Readable
- Maintainable
- Easy to explain

Think like a professional SQL developer.

---

# Rules

- Use only the **PostgreSQL Pagila** database.
- Do not modify the database.
- Write clean, well-formatted SQL.
- Prefer readability over cleverness.
- Break large problems into logical steps.
- Use meaningful CTE names.
- Explain your approach before writing SQL.

---

# Challenge 1

## Premium Customers Report

Build a report that displays:

- Customer ID
- Customer Name
- Store
- Total Revenue
- Average Payment
- Customer Rank Within Store

Only include customers whose total revenue is greater than the average customer revenue.

---

# Challenge 2

## Film Performance Dashboard

For every film display:

- Film Title
- Rental Count
- Category
- Rental Rank Within Category

Only include films rented at least once.

---

# Challenge 3

## Store Performance Summary

Build a report showing:

- Store ID
- Total Revenue
- Total Customers
- Average Customer Revenue

Rank stores by total revenue.

---

# Challenge 4

## Customer Activity Report

For every customer display:

- First Rental Date
- Latest Rental Date
- Total Rentals
- Total Revenue

Sort customers by total revenue.

---

# Challenge 5

## Above Average Films

Display films whose rental count is greater than the average rental count.

Solve this using:

- A Subquery
- A CTE

Compare both solutions.

---

# Challenge 6

## Customer Segmentation

Create four spending groups based on customer revenue.

For every customer display:

- Customer Name
- Total Revenue
- Spending Group

---

# Challenge 7

## Monthly Revenue Analysis

Build a monthly revenue report showing:

- Revenue
- Running Revenue
- Moving Average Revenue

---

# Challenge 8

## Business Data Comparison

Using set operations, identify:

- Customers who rented films but never made a payment.
- Customers who made payments but never rented a film.
- Customers appearing in both datasets.

---

# Challenge 9

## Calendar Generator

Using a Recursive CTE:

Generate every date for the current month.

For every date display:

- Date
- Day Name
- Month Name

---

# Challenge 10

## Executive Dashboard

Create a single report combining multiple SQL techniques.

The report should include:

- Customer Revenue
- Store Revenue
- Customer Ranking
- Running Revenue
- Average Revenue

You may use:

- CTEs
- Window Functions
- Subqueries
- Derived Tables

Design the solution as if it will be used by senior management.

---

# Self Review Checklist

After completing every challenge, ask yourself:

□ Did I understand the business problem before writing SQL?

□ Did I divide the problem into logical steps?

□ Is my SQL readable?

□ Could another developer understand it?

□ Did I choose the correct SQL technique?

□ Are my CTE names meaningful?

□ Can I explain every line of SQL?

---

# Success Criteria

You have mastered Week 5 if you can confidently:

- Break large problems into smaller SQL components.
- Choose between Subqueries, Derived Tables, Correlated Subqueries, and CTEs.
- Use Recursive CTEs correctly.
- Use Set Operations appropriately.
- Write production-quality SQL.
- Explain your design decisions during interviews.

---

# Final Thought

Week 5 is where SQL becomes software design.

Professional SQL developers are not recognized because they know more SQL keywords.

They are recognized because they can transform a complex business requirement into a clear, logical, and maintainable SQL solution.

If you can complete these challenges without relying on the solutions, you are well prepared for Week 6, where you'll use these techniques to build Business Intelligence reports and executive dashboards.