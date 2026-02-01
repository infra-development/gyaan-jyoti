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

    * [https://docs.scala-lang.org/scala3/book/fp-immutable-values.html](https://docs.scala-lang.org/scala3/book/fp-immutable-values.html)
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

1. Spark transformations assume immutability
Spark expects transformation functions (`map`, `filter`, `flatMap`) to be pure and side-effect free so that the same input always produces the same output.  
**Example:**  
Incrementing a mutable counter inside a `map` makes the result depend on execution order rather than input data.

2. Closures are serialized, not shared
Scala closures capture variables, but Spark serializes the closure and sends a copy to each executor. The variable is not shared across tasks.  
**Example:**  
A mutable variable `var sum = 0` inside a `map` is copied to every executor, so each executor updates its own local copy.

3. Executors run in parallel JVMs
Each Spark executor runs in its own JVM, meaning there is no shared memory across executors.  
**Example:**  
Mutating a `ListBuffer` inside a transformation on one executor cannot be seen by other executors.

4. No single global update point exists
Spark has no built-in mechanism to safely merge arbitrary mutable updates coming from multiple executors.  
**Example:**  
Appending elements to a shared mutable `ArrayBuffer` from multiple partitions cannot be synchronized globally.

5. Task re-execution breaks mutation logic
Spark may re-run tasks due to failures or speculative execution, causing mutations to be applied multiple times.  
**Example:**  
A mutable counter updated inside `foreach` may be incremented twice if a task is retried.

6. Execution order is non-deterministic
Partitions can execute in any order, so mutations that depend on order lead to inconsistent results.  
**Example:**  
Updating a mutable `Map` with partial counts may produce different results across runs.

7. Transformations must be deterministic
Spark relies on deterministic transformations to recompute data using lineage during failures.  
**Example:**  
A transformation that mutates external state cannot be safely recomputed because the state has already changed.

8. Immutability enables fault tolerance
Immutable operations allow Spark to recompute lost partitions without side effects or corruption.  
**Example:**  
Re-running a pure transformation like `map(x => x * 2)` is safe, while re-running a mutation-based update is not.

9. Spark provides controlled alternatives
Spark allows shared behavior only through well-defined abstractions that preserve correctness.  
**Example:**  
Use **Accumulators** for counters and **Broadcast variables** for read-only shared data.

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
- Spark relies on immutability because it cannot trust execution order, location, or repetition in a distributed system.
Data may be processed on different machines, retried on failure, or recomputed later from lineage. If data were mutable, Spark would have no way to guarantee that recomputation produces the same result. Immutability gives Spark referential transparency, which allows it to freely parallelize, retry, cache, and recompute data without coordination or locks. In short, immutability is what makes Spark predictable under failure.

2. What breaks if you use `var` inside Spark transformations?
- What breaks is **determinism**.

    When you use var inside a transformation, that variable becomes part of a closure. Spark serializes that closure and ships copies to multiple executors running in different JVMs. Each executor mutates its own copy, tasks may run out of order, and tasks may run more than once due to retries or speculation. As a result:

    - Updates are not shared
    - Side effects happen multiple times
    - Results change across runs

    This breaks Spark’s assumptions about correctness, recomputation, and fault tolerance.

3. Difference between `map` and `flatMap` with a real Spark example
- `map` enforces one-to-one transformation, while `flatMap` allows one-to-many expansion.
  `flatMap` is essential in Spark for record explosion such as tokenizing text in word count.
4. Why is Scala a better fit for Spark than Java?
- Scala matches Spark’s execution model natively, not accidentally.

    Spark is built around:

    - Higher-order functions
    - Closures
    - Immutable transformations
    - Functional composition

    Scala provides:

    - Concise lambda syntax
    - Immutable-by-default design
    - First-class functions and pattern matching
    - Natural expression of DAG-style transformations

    Java can use Spark, but Scala expresses Spark’s mental model directly. That’s why Spark itself is written in Scala, and why advanced Spark APIs feel natural in Scala and verbose in Java.
5. How does immutability enable Spark fault tolerance and recomputation?
- Spark does not recover data by restoring memory—it recomputes it.

    Each RDD/DataFrame remembers how it was derived (lineage). If a partition is lost:

    1. Spark goes back to the lineage
    2. Re-runs the transformations
    3. Regenerates the exact same data
    
    This only works because:

    - Transformations are immutable
    - Inputs are not modified
    - Same inputs always produce same outputs

    If data were mutable, recomputation would replay transformations on already-modified state, producing incorrect results. Immutability is what makes **lineage-based fault tolerance mathematically valid**.

---

## 8. Day Completion Checklist (Gate)

You may proceed to **Day 2 only if**:

* All problems are solved immutably
* You can explain immutability ↔ Spark linkage without notes
* You can refactor mutable logic into functional style
* You can answer all interview questions clearly

---

**Day 1 is foundational. Any weakness here will multiply in Spark internals, streaming, and system design.**
