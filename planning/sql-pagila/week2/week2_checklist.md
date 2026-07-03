# Week 2 Checklist
## Multi-Table Analysis and Business Reporting

---

# Purpose

Week 2 is about thinking beyond individual tables.

This checklist helps you verify that you understand the concepts before moving to Week 3.

Do not rush through it.

If you cannot confidently answer "Yes" to most questions, revisit the relevant lessons.

---

# Section 1 — Relationship Thinking

□ I understand that most business questions require information from multiple tables.

□ I can identify the business entities involved in a question.

□ I can determine whether one table is enough to answer a question.

□ I can identify the correct starting table.

□ I can identify the destination table.

□ I can draw a relationship path before writing SQL.

□ I understand that every JOIN represents a business relationship.

---

# Section 2 — JOIN Understanding

□ I know when to use INNER JOIN.

□ I know when to use LEFT JOIN.

□ I understand why bridge tables exist.

□ I understand many-to-many relationships.

□ I understand one-to-many relationships.

□ I can follow foreign key relationships without guessing.

□ I understand that JOIN order follows relationship paths.

---

# Section 3 — Duplicate Thinking

□ I understand why duplicate rows appear after joins.

□ I no longer assume duplicate rows indicate an incorrect JOIN.

□ I know when DISTINCT is appropriate.

□ I know when DISTINCT hides a design mistake.

□ I understand COUNT(*).

□ I understand COUNT(column).

□ I understand COUNT(DISTINCT column).

□ I know what the business is asking me to count.

---

# Section 4 — Business Reporting

□ I can build reports using multiple JOINs.

□ I can combine JOIN with GROUP BY.

□ I can combine JOIN with HAVING.

□ I can combine JOIN with ORDER BY.

□ I can identify the business metric.

□ I can identify the business dimension.

□ I understand the difference between operational reports and analytical reports.

---

# Section 5 — Missing Information

□ I know how to find customers without rentals.

□ I know how to find films that have never been rented.

□ I know how to find inventory items with no rentals.

□ I understand why LEFT JOIN is required for these reports.

□ I know how NULL values help identify missing relationships.

---

# Section 6 — Business Process Thinking

□ I understand the rental business process.

```
Customer

↓

Rental

↓

Inventory

↓

Film
```

---

□ I understand the payment process.

```
Customer

↓

Payment
```

---

□ I understand the customer location hierarchy.

```
Customer

↓

Address

↓

City

↓

Country
```

---

□ I understand the film classification hierarchy.

```
Film

↓

Film_Category

↓

Category
```

---

□ I understand the actor relationship.

```
Actor

↓

Film_Actor

↓

Film
```

---

# Section 7 — SQL Planning

Before writing SQL I now ask:

□ What is the business objective?

□ Which entities contain the information?

□ How are they connected?

□ What relationship path should I follow?

□ What metric am I calculating?

□ What dimension am I grouping by?

□ Will joins create duplicate rows?

□ Do I need DISTINCT?

□ Should missing information remain?

□ Which JOIN type is appropriate?

Only after answering these questions do I begin writing SQL.

---

# Week 2 Skills Assessment

Rate yourself from 1 to 5.

| Skill | Rating |
|--------|--------|
| Understanding relationships | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |
| Drawing relationship paths | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |
| INNER JOIN | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |
| LEFT JOIN | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |
| GROUP BY after JOIN | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |
| DISTINCT | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |
| COUNT(DISTINCT) | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |
| Business reporting | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |
| Business process thinking | ☐ 1 ☐ 2 ☐ 3 ☐ 4 ☐ 5 |

---

# Ready for Week 3?

You are ready to move forward if you can confidently:

✓ Read an unfamiliar database schema.

✓ Identify relationship paths without assistance.

✓ Explain why two tables are related.

✓ Build reports using multiple JOINs.

✓ Explain duplicate rows after JOINs.

✓ Use DISTINCT only when the business requires uniqueness.

✓ Find missing information using LEFT JOIN.

✓ Translate business questions into SQL systematically.

✓ Think about business processes before SQL syntax.

---

# Final Reflection

Complete the following sentences.

### The biggest idea I learned in Week 2 is:

_____________________________________________________

_____________________________________________________

---

### The concept I still need to practice is:

_____________________________________________________

_____________________________________________________

---

### My biggest improvement compared to Week 1 is:

_____________________________________________________

_____________________________________________________

---

### Before Week 2, I thought SQL was:

_____________________________________________________

---

### After Week 2, I now think SQL is:

_____________________________________________________

---

# Final Thought

Week 1 taught you individual SQL techniques.

Week 2 taught you how data moves through a business.

From this point onward, every new SQL concept will build on the ability to understand relationships, business processes, and analytical thinking.

That mindset—not syntax—is what distinguishes professional SQL developers.