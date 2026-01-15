# Week 1 – Day 1: Scala Foundations for Spark

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Focus:** Scala immutability + collections with explicit Spark linkage
**Rule:** Do not proceed to Day 2 unless all gates are cleared

---

## Index

1. [Day Objective](#1-day-objective)
2. [Time Allocation Overview](#2-time-allocation-overview)
3. [Theory Topics](#3-theory-topics)

    * [Immutability in Scala](#31-immutability-in-scala)
    * [Scala Collections](#32-scala-collections-core-only)
4. [Hands-On Practice Problems](#4-hands-on-practice-exact-problems)
5. [Spark Mental Mapping](#5-spark-mental-mapping-critical)
6. [Spark Theory References](#6-spark-theory-references-day-1-scope)
7. [Interview Questions (₹40+ LPA)](#7-interview-questions-40-lpa-level)
8. [Day Completion Checklist](#8-day-completion-checklist-gate)

---

## 1. Day Objective

Build a **production-grade understanding of Scala immutability and collections**, and clearly explain *why Spark fundamentally depends on these concepts*.

By end of Day 1, you must be able to:

* Write immutable Scala code confidently
* Explain why Spark transformations assume immutability
* Defend Scala as a design choice for Spark at senior-interview depth

---

## 2. Time Allocation Overview (6 Hours Total)

| Section                     | Time    |
| --------------------------- | ------- |
| Scala Immutability (Theory) | 60 min  |
| Scala Collections (Theory)  | 60 min  |
| Hands-on Coding Problems    | 120 min |
| Spark Mental Mapping + Docs | 60 min  |
| Interview Q&A + Notes       | 45 min  |
| Review & Self-Test          | 15 min  |

---

## 3. Theory Topics

### 3.1 Immutability in Scala (60 min)

**Concepts to Cover:**

* `val` vs `var`
* Immutable objects and data structures
* Side effects and shared mutable state
* Why immutability is essential in distributed systems

**Free & Genuine Resources:**

* Scala Official Docs – Tour of Scala (Basics)

    * [https://docs.scala-lang.org/tour/basics.html](https://docs.scala-lang.org/tour/basics.html)
* Scala Official Docs – Immutability

    * [https://docs.scala-lang.org/scala3/book/immutability.html](https://docs.scala-lang.org/scala3/book/immutability.html)
* YouTube (Free):

    * Martin Odersky – Scala introduction (selected parts)
    * Rock the JVM – *Why Immutability Matters in Scala*

**Expected Depth:**
You should be able to explain immutability *without using buzzwords*.

---

### 3.2 Scala Collections (Core Only) (60 min)

**Concepts to Cover:**

* `List`, `Seq`, `Map`, `Set`
* Immutable vs mutable collections (conceptual difference)
* `map`, `flatMap`, `filter`, `groupBy`
* Eager evaluation in Scala collections

**Free & Genuine Resources:**

* Scala Collections Overview (Official)

    * [https://docs.scala-lang.org/overviews/collections/overview.html](https://docs.scala-lang.org/overviews/collections/overview.html)
* YouTube (Free):

    * Rock the JVM – *Scala Collections: map / flatMap / filter*

**Expected Depth:**
You should be able to refactor loop-based code into functional style.

---

## 4. Hands-On Practice (Exact Problems) – 120 min

### Problem 1 – Immutable Transformation

**Input:**

```scala
List(1, 2, 3, 4, 5, 6)
```

**Task:**

* Remove odd numbers
* Multiply remaining numbers by 2
* Return a **new list**

**Constraints:**

* No `var`
* No loops (`for`, `while`)
* Use only immutable collections

---

### Problem 2 – Grouping with Collections

**Input:**

```scala
List("spark", "scala", "sql", "stream", "storage")
```

**Task:**

* Group words by their first character
* Output type must be:

```scala
Map[Char, List[String]]
```

---

### Problem 3 – Spark-Style Data Preparation

**Given:**

```scala
case class Employee(id: Int, dept: String, salary: Int)
```

**Input:**

```scala
List(
  Employee(1, "IT", 70000),
  Employee(2, "HR", 40000),
  Employee(3, "IT", 90000),
  Employee(4, "FIN", 60000)
)
```

**Tasks:**

* Filter employees with salary > 50_000
* Group employees by department
* Produce department-wise employee count

**Expected Output Type:**

```scala
Map[String, Int]
```

---

## 5. Spark Mental Mapping (Critical) – 60 min

You must explicitly connect Scala concepts to Spark execution:

* Spark transformations assume immutability
* Executors operate in parallel JVMs
* Mutable shared state leads to incorrect or non-deterministic results

**Written Exercise:**
Write 8–10 lines answering:

> Why does Spark prohibit safe usage of mutable shared variables inside transformations?

---

## 6. Spark Theory References (Day 1 Scope)

**Free & Official Resources:**

* Apache Spark – Programming Guide (RDD & transformations)

    * [https://spark.apache.org/docs/latest/rdd-programming-guide.html](https://spark.apache.org/docs/latest/rdd-programming-guide.html)
* Apache Spark – Cluster Overview

    * [https://spark.apache.org/docs/latest/cluster-overview.html](https://spark.apache.org/docs/latest/cluster-overview.html)
* Databricks Blog – *Why Spark Uses Immutable Data*
* Spark Summit (YouTube): Intro to Spark Execution Model

**Goal:**
Understand *why Spark was designed this way*, not just how to code.

---

## 7. Interview Questions (₹40+ LPA Level)

You must answer confidently, without memorized definitions:

1. Why does Spark rely on immutable data structures?
2. What breaks if you use `var` inside Spark transformations?
3. Difference between `map` and `flatMap` with a real Spark example
4. Why is Scala a better fit for Spark than Java?
5. How does immutability enable Spark fault tolerance and recomputation?

---

## 8. Day Completion Checklist (Gate)

You may proceed to **Day 2 only if**:

* All problems are solved immutably
* You can explain immutability ↔ Spark linkage without notes
* You can refactor mutable logic into functional style
* You can answer all interview questions clearly

---

**Day 1 is foundational. Any weakness here will multiply in Spark internals, streaming, and system design.**
