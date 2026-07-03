# Week 3 Practice Questions

## Data Transformation, Conditional Logic & Advanced JOINs

---

# Day 1 — Advanced JOIN Concepts (Q1–Q10)

### SELF JOIN

**Q1.** Show every staff member together with their manager (assume a manager relationship exists).

**Q2.** Find actors who have acted together in the same film.

**Q3.** Find customers living in the same city.

### USING Clause

**Q4.** Rewrite a simple INNER JOIN using the `USING` clause.

**Q5.** Rewrite a LEFT JOIN using the `USING` clause where applicable.

### RIGHT & FULL JOIN

**Q6.** Compare INNER JOIN and RIGHT JOIN using customer and payment.

**Q7.** Compare LEFT JOIN and FULL JOIN conceptually.

### JOIN Thinking

**Q8.** Explain when SELF JOIN should be preferred over a normal JOIN.

**Q9.** Explain why RIGHT JOIN is rarely used.

**Q10.** Draw the relationship path before writing each query.

---

# Day 2 — CASE Expressions (Q11–Q20)

**Q11.** Display customer status as "Active" or "Inactive".

**Q12.** Classify films as Short, Medium or Long based on length.

**Q13.** Display payment amounts as Low, Medium or High.

**Q14.** Categorize customers based on total rentals.

**Q15.** Show different rental labels based on rental duration.

**Q16.** Use CASE inside ORDER BY.

**Q17.** Use CASE inside GROUP BY.

**Q18.** Use multiple WHEN conditions.

**Q19.** Write a nested CASE expression.

**Q20.** Explain your CASE logic before writing SQL.

---

# Day 3 — Handling NULL Values (Q21–Q30)

**Q21.** Replace NULL phone numbers with "Not Available".

**Q22.** Replace NULL emails with "Unknown".

**Q23.** Use COALESCE to display a default value.

**Q24.** Use NULLIF to avoid division by zero.

**Q25.** Compare COALESCE and CASE.

**Q26.** Find customers with missing information.

**Q27.** Display alternative values when NULL exists.

**Q28.** Explain when NULLIF should be used.

**Q29.** Explain when COALESCE should be used.

**Q30.** Rewrite a CASE expression using COALESCE.

---

# Day 4 — CAST and Data Conversion (Q31–Q40)

**Q31.** Convert payment amount to INTEGER.

**Q32.** Convert rental date to DATE.

**Q33.** Convert customer ID to TEXT.

**Q34.** Display formatted numeric values.

**Q35.** Convert timestamps to readable dates.

**Q36.** Compare explicit and implicit casting.

**Q37.** Convert numbers into formatted strings.

**Q38.** Explain why CAST is important.

**Q39.** Use CAST inside a report.

**Q40.** Explain every conversion before writing SQL.

---

# Day 5 — String Functions (Q41–Q50)

**Q41.** Display customer names in uppercase.

**Q42.** Display customer names in lowercase.

**Q43.** Concatenate first and last names.

**Q44.** Remove leading and trailing spaces.

**Q45.** Replace spaces with underscores.

**Q46.** Display the first five characters of each film title.

**Q47.** Display the length of every film title.

**Q48.** Build formatted customer names.

**Q49.** Combine multiple string functions.

**Q50.** Explain which string function best solves each question.

---

# Day 6 — Date & Time Functions (Q51–Q60)

**Q51.** Display today's date.

**Q52.** Display the current timestamp.

**Q53.** Calculate customer rental age.

**Q54.** Extract the rental year.

**Q55.** Extract the rental month.

**Q56.** Group rentals by month.

**Q57.** Format rental dates for business reports.

**Q58.** Display customer membership duration.

**Q59.** Build a monthly rental report.

**Q60.** Explain the business value of each date function.

---

# Day 7 — Integration Challenge (Q61–Q70)

**Q61.** Build a customer profile report using CASE, COALESCE and string functions.

**Q62.** Build a film report with formatted titles and rental categories.

**Q63.** Build a payment report with formatted dates and revenue categories.

**Q64.** Build a store performance report.

**Q65.** Build a customer activity dashboard.

**Q66.** Build a monthly business summary.

**Q67.** Build a report combining JOINs and transformation functions.

**Q68.** Clean and format messy business data.

**Q69.** Explain the transformation steps before writing SQL.

**Q70.** Identify all SQL concepts required before solving each report.

---

# End of Week Goal

By the end of Week 3, you should be able to:

- Transform raw business data.
- Apply conditional logic.
- Handle NULL values correctly.
- Convert between data types.
- Format strings and dates.
- Use advanced JOIN concepts.
- Build business-ready reports with clean and readable output.