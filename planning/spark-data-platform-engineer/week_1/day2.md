# Week 1 – Day 2: Scala Safety (Option, Try, Either) & Pattern Matching

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Scala + Spark Foundations
**Focus:** Writing safe, failure-aware Scala code that behaves correctly in Spark jobs

---

## Index

1. [Day Objective](#1-day-objective)
2. [Time Allocation Overview](#2-time-allocation-overview)
3. [Theory Topics](#3-theory-topics)

    * [Option & Null Safety](#31-option--null-safety)
    * [Try & Exception Handling](#32-try--exception-handling)
    * [Either for Error Modeling](#33-either-for-error-modeling)
    * [Pattern Matching](#34-pattern-matching)
4. [Hands-On Practice (Exact Problems)](#4-hands-on-practice-exact-problems)
5. [Spark Mental Mapping](#5-spark-mental-mapping-critical)
6. [Spark & Scala Theory References](#6-spark--scala-theory-references)
7. [Interview Questions (₹40+ LPA Level)](#7-interview-questions-40-lpa-level)
8. [Day Completion Checklist (Gate)](#8-day-completion-checklist-gate)

---

## 1. Day Objective

Eliminate **nulls and uncontrolled exceptions** from Scala code and learn to **model failure explicitly**. This is critical for Spark because:

* Spark retries tasks automatically
* Exceptions fail tasks and stages
* Nulls cause silent data corruption

By the end of Day 2, you must be able to:

* Write null-safe Scala code using `Option`
* Handle failures using `Try` and `Either`
* Use pattern matching to safely process data
* Explain how bad data and failures propagate in Spark

---

## 2. Time Allocation Overview (6 Hours)

| Section                        | Time    |
| ------------------------------ | ------- |
| Option & Null Safety (Theory)  | 75 min  |
| Try & Either (Theory)          | 75 min  |
| Pattern Matching (Theory)      | 45 min  |
| Hands-on Practice              | 120 min |
| Spark Mapping + Interview Prep | 45 min  |

---

## 3. Theory Topics

### 3.1 Option & Null Safety (75 min)

**Concepts to Cover:**

* `Option`, `Some`, `None`
* `map`, `flatMap`, `getOrElse`, `orElse`
* Avoiding `NullPointerException`
* Converting Java nulls to `Option`

**Free & Genuine Resources:**

* Scala Official Docs – Options

    * [https://www.scala-lang.org/api/current/scala/Option.html](https://www.scala-lang.org/api/current/scala/Option.html)
* Scala Tour – Option

    * [https://docs.scala-lang.org/overviews/collections-2.13/conversion-between-option-and-the-collections.html](https://docs.scala-lang.org/overviews/collections-2.13/conversion-between-option-and-the-collections.html)
* YouTube (Free):

    * Rock the JVM – *Scala Option Explained*

**Required Depth:**
You should never need `.get` in production Spark code.

---

### 3.2 Try & Exception Handling (45 min)

**Concepts to Cover:**

* `Try`, `Success`, `Failure`
* Wrapping unsafe code
* Why throwing exceptions inside Spark tasks is dangerous

**Free & Genuine Resources:**

* Scala Official Docs – Try

    * [https://docs.scala-lang.org/overviews/scala-book/functional-error-handling.html](https://docs.scala-lang.org/overviews/scala-book/functional-error-handling.html)
* Rock the JVM – *Try in Scala*

---

### 3.3 Either for Error Modeling (30 min)

**Concepts to Cover:**

* `Either[Error, Value]`
* `Left` vs `Right`
* Modeling recoverable vs non-recoverable errors

**Free & Genuine Resources:**

* Scala Tour – Either

    * [https://www.scala-lang.org/api/current/scala/util/Either.html](https://www.scala-lang.org/api/current/scala/util/Either.html)
* Rock the JVM – *Either Explained*

---

### 3.4 Pattern Matching (45 min)

**Concepts to Cover:**

* `match` expressions
* Pattern matching on `Option`, `Try`, `Either`
* Pattern matching with case classes

**Free & Genuine Resources:**

* Scala Tour – Pattern Matching

    * [https://docs.scala-lang.org/tour/pattern-matching.html](https://docs.scala-lang.org/tour/pattern-matching.html)

---

## 4. Hands-On Practice (Exact Problems) – 120 min

### Problem 1 – Removing Nulls Safely

**Given (Bad Code):**

```scala
def getDept(empId: Int): String = {
  if (empId == 1) "IT" else null
}
```

**Task:**

* Refactor this to return `Option[String]`
* Safely consume the result without `.get`

---

### Problem 2 – Safe Parsing with Try

**Input:**

```scala
List("100", "200", "abc", "300")
```

**Task:**

* Convert strings to integers
* Capture failures using `Try`
* Separate valid and invalid values

---

### Problem 3 – Error Modeling with Either (Spark-Style)

**Given:**

```scala
case class RawRecord(id: String, salary: String)
```

**Task:**

* Parse salary as integer
* Return `Either[String, Int]`
* Collect valid salaries and error messages separately

---

### Problem 4 – Pattern Matching Drill

Pattern match on:

* `Option`
* `Try`
* `Either`

Explain what happens in each case.

---

## 5. Spark Mental Mapping (Critical)

You must be able to explain:

* Why nulls are dangerous in Spark transformations
* How exceptions inside tasks lead to retries and stage failures
* Why modeling bad data explicitly improves pipeline reliability

**Written Exercise:**
Write 6–8 lines answering:

> How would you handle malformed records in a Spark job without failing the entire pipeline?

---

## 6. Spark & Scala Theory References

**Spark (Free & Official):**

* Apache Spark – RDD Programming Guide

    * [https://spark.apache.org/docs/latest/rdd-programming-guide.html](https://spark.apache.org/docs/latest/rdd-programming-guide.html)
* Apache Spark – Fault Tolerance (Lineage)

    * [https://spark.apache.org/docs/latest/rdd-programming-guide.html#resilient-distributed-datasets-rdds](https://spark.apache.org/docs/latest/rdd-programming-guide.html#resilient-distributed-datasets-rdds)

**Goal:**
Understand how **task retries + exceptions** interact in Spark.

---

## 7. Interview Questions (₹40+ LPA Level)

You must answer confidently and clearly:

1. Why is `Option` preferred over `null` in Spark jobs?
2. What happens if a Spark task throws an exception?
3. When would you use `Either` instead of `Try`?
4. How do you handle bad records without failing a Spark job?
5. How does pattern matching improve Spark code readability and safety?

---

## 8. Day Completion Checklist (Gate)

Proceed to **Day 3 only if**:

* You eliminated all `null` usage in practice problems
* You did not use `.get` on `Option`
* You modeled failures explicitly using `Try` or `Either`
* You can explain Spark failure behavior without notes

---

**Day 2 ensures your Spark jobs fail safely, not catastrophically. This is a senior-level expectation.**
