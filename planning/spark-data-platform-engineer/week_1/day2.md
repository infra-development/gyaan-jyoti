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

- **Nulls are dangerous because they crash at runtime**
  - Example:
    ```scala
    rdd.map(r => r.getString(1).toInt)
    ```
  - If `getString(1)` is `null`, a `NullPointerException` is thrown during task execution.

- **Null-related failures appear far from the data source**
  - Example:
    - Data is read successfully from CSV or Parquet.
    - Failure occurs later inside a transformation like `map` or `filter`.
  - This makes it hard to identify which input record caused the issue.

- **Exceptions inside Spark tasks trigger retries**
  - Example:
    - A single malformed record causes a `NumberFormatException`.
    - Spark retries the same task multiple times on different executors.

- **Repeated task failures cause stage failure**
  - Example:
    - The same bad record exists in the partition.
    - Every retry fails consistently.
    - Spark marks the stage as failed and aborts the job.

- **One bad record can stop processing of many valid records**
  - Example:
    - A partition contains 10,000 records.
    - One invalid record throws an exception.
    - The remaining 9,999 valid records are never processed.

- **Modeling bad data explicitly turns failures into values**
  - Example:
    ```scala
    Either[String, Int]
    ```
  - `Left("salary is null for id=5")` flows through the pipeline safely.

- **Valid and invalid data can be handled separately**
  - Example:
    - `Right(50000)` is written to the main fact table.
    - `Left(error)` is written to an error or reject table.

- **Explicit error modeling improves reliability and observability**
  - Example:
    - Count or log `Left` records to monitor data quality.
    - Spark job completes successfully without crashing.

> How would you handle malformed records in a Spark job without failing the entire pipeline?

- **Validate records explicitly during parsing**
  - Do not assume input data is clean.
  - Example:
    ```scala
    def parseSalary(s: String): Either[String, Int] =
      if (s != null && s.forall(_.isDigit)) Right(s.toInt)
      else Left(s"Invalid salary: $s")
    ```

- **Model malformed records as data, not exceptions**
  - Use `Either` or `Option` instead of throwing errors.
  - Example:
    ```scala
    RDD[Either[String, CleanRecord]]
    ```
  - `Right` represents valid data, `Left` represents malformed data with an error reason.

- **Split valid and invalid records into separate pipelines**
  - This prevents bad data from stopping good data.
  - Example:
    ```scala
    val parsed = rdd.map(parse)
    val valid  = parsed.collect { case Right(v) => v }
    val errors = parsed.collect { case Left(e)  => e }
    ```

- **Persist only clean records**
  - Write valid data to the main sink (Hive, Parquet, Delta).
  - Example:
    ```scala
    valid.toDF.write.parquet("/data/clean")
    ```

- **Route malformed records to an error sink**
  - Store bad records for auditing, debugging, or reprocessing.
  - Example:
    ```scala
    errors.toDF.write.parquet("/data/errors")
    ```

- **Avoid throwing exceptions inside Spark transformations**
  - Exceptions cause task retries and stage failures.
  - Prefer total functions that always return a value.

- **Track data quality metrics**
  - Count or log malformed records without failing the job.
  - Example:
    ```scala
    val errorCount = errors.count()
    ```

- **Result: a resilient Spark pipeline**
  - Valid data continues to flow.
  - Bad data is isolated, visible, and manageable.


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

### Q1. Why is `Option` preferred over `null` in Spark jobs?
**Answer:**  
`Option` is preferred because it makes missing data explicit and type-safe, whereas `null` bypasses the type system. Using `null` can cause `NullPointerException`s during Spark transformations, often far from where the data was read. `Option` forces the developer to handle the absence of a value explicitly using pattern matching or combinators like `map` and `flatMap`. This results in safer, total functions that behave reliably in distributed Spark execution.

---

### Q2. What happens if a Spark task throws an exception?
**Answer:**  
When a Spark task throws an exception, Spark marks the task as failed and retries it on another executor. By default, Spark retries a task multiple times. If the exception is deterministic, such as one caused by bad data, every retry fails in the same way. After the retry limit is exceeded, Spark fails the entire stage and aborts the job, wasting cluster resources due to repeated recomputation.

---

### Q3. When would you use `Either` instead of `Try`?
**Answer:**  
`Either` is used when failure is an expected business outcome, such as validation errors or malformed input data. `Try` is designed for exception-based failures and carries JVM exceptions, which are expensive and problematic in distributed Spark jobs. `Either` allows failures to be modeled explicitly using domain-specific error values, making pipelines more predictable, debuggable, and safe.

---

### Q4. How do you handle bad records without failing a Spark job?
**Answer:**  
Bad records are handled by treating them as data rather than throwing exceptions. During parsing or validation, each record is converted into an `Either`, where valid records become `Right` and invalid records become `Left` with an error reason. The pipeline is then split so that valid records continue through the main processing path while invalid records are written to an error or reject sink. This allows the Spark job to complete successfully while preserving full visibility into data quality issues.

---

### Q5. How does pattern matching improve Spark code readability and safety?
**Answer:**  
Pattern matching makes all possible data states explicit in Spark code, such as `Some` and `None` for `Option`, or `Right` and `Left` for `Either`. It avoids unsafe operations like calling `.get` and allows the compiler to warn about missing cases. This leads to clearer, more maintainable code and prevents runtime failures, which is especially important in distributed Spark applications.

---


## 8. Day Completion Checklist (Gate)

Proceed to **Day 3 only if**:

* You eliminated all `null` usage in practice problems
* You did not use `.get` on `Option`
* You modeled failures explicitly using `Try` or `Either`
* You can explain Spark failure behavior without notes

---

**Day 2 ensures your Spark jobs fail safely, not catastrophically. This is a senior-level expectation.**
