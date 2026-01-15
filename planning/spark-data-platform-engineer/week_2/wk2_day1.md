# Week 2 – Day 1: Narrow vs Wide Transformations (Shuffle Foundations)

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Spark Execution & Shuffle Internals
**Focus:** Understanding *why* shuffles happen using **realistic data volumes**, not toy examples

---

## Index

1. [Day Objective](#1-day-objective)
2. [Time Allocation Overview](#2-time-allocation-overview-6-hours)
3. [Standard Experiment Dataset (Mandatory – 45 min)](#3-standard-experiment-dataset-mandatory--45-min)
4. [Theory to Read (Exact Scope – 75 min)](#4-theory-to-read-exact-scope--75-min)
5. [Hands-On Experiments (Exact, Scalable Problems)](#5-hands-on-experiments-exact-scalable-problems)
6. [Spark Shuffle Mental Model (Written – Mandatory)](#6-spark-shuffle-mental-model-written--mandatory)
7. [Interview Questions (₹40+ LPA Level)](#7-interview-questions-40-lpa-level)
8. [Day Completion Checklist (Gate)](#8-day-completion-checklist-gate)

---

## 1. Day Objective

By the end of **Week 2 – Day 1**, you must be able to:

> Look at any Spark transformation and immediately decide whether it causes a shuffle, **and explain the cost implications using evidence from Spark UI**.

This day formally transitions you from *Spark usage* to *Spark performance engineering*.

---

## 2. Time Allocation Overview (6 Hours)

| Section                  | Time    |
| ------------------------ | ------- |
| Narrow vs Wide Theory    | 75 min  |
| Standard Dataset Setup   | 45 min  |
| Hands-on Experiments (4) | 180 min |
| Mental Model Writing     | 45 min  |
| Interview Preparation    | 45 min  |

---

## 3. Standard Experiment Dataset (Mandatory – 45 min)

All performance-related experiments **from Week 2 onward** must use a **standard, scalable dataset**.

### Dataset Goals

* Large enough to trigger **real shuffles**
* Repeated keys to force aggregation
* Safe to run on a laptop (local mode)

### Canonical Dataset Generator (Scala)

```scala
val spark = SparkSession.builder()
  .appName("ShuffleStudy")
  .master("local[4]")
  .config("spark.sql.shuffle.partitions", "8")
  .getOrCreate()

val numRecords = 20_000_000   // adjust if machine is weaker
val numKeys = 100

val baseData = spark.sparkContext
  .parallelize(1 to numRecords, 8)
  .map { i =>
    val key = s"key_${i % numKeys}"
    (key, 1)
  }
```

**Important Rules:**

* Do NOT reduce data size for shuffle experiments
* Small datasets are allowed only for DAG visualization

---

## 4. Theory to Read (Exact Scope – 75 min)

### Mandatory Reading (Free & Official)

1. **RDD Dependencies – Narrow vs Wide**
   [https://spark.apache.org/docs/latest/rdd-programming-guide.html#rdd-operations](https://spark.apache.org/docs/latest/rdd-programming-guide.html#rdd-operations)

2. **Spark Job Scheduling & Dependencies**
   [https://spark.apache.org/docs/latest/job-scheduling.html](https://spark.apache.org/docs/latest/job-scheduling.html)

3. **Databricks / Community Blogs – Shuffle Overview** (Free)

### Optional (If Needed)

* Spark Summit (YouTube): *Understanding Shuffles in Spark*

---

## 5. Hands-On Experiments (Exact, Scalable Problems)

### Experiment 1 – Narrow Transformations (No Shuffle)

**Goal:** Establish baseline execution without shuffle.

```scala
val narrowResult = baseData
  .mapValues(_ + 1)
  .filter(_._2 > 0)

narrowResult.count()
```

#### Observe in Spark UI

* Single stage
* No shuffle read/write metrics

---

### What You Must Understand (Experiment 1)

* Narrow transformations do not require data movement
* Execution is pipeline-friendly and efficient

---

### Experiment 2 – Wide Transformation: groupByKey

**Goal:** Force a heavy shuffle.

```scala
val gbkResult = baseData
  .groupByKey()
  .mapValues(_.sum)

val start = System.currentTimeMillis()
gbkResult.count()
val end = System.currentTimeMillis()
println(s"groupByKey time = ${end - start} ms")
```

#### Observe in Spark UI

* New shuffle stage
* Large shuffle write/read sizes
* Longer task durations

---

### What You Must Understand (Experiment 2)

* All values for a key move across the network
* Memory pressure and spill risk increases

---

### Experiment 3 – Wide Transformation: reduceByKey

**Goal:** Compare shuffle cost with early aggregation.

```scala
val rbkResult = baseData.reduceByKey(_ + _)

val start = System.currentTimeMillis()
rbkResult.count()
val end = System.currentTimeMillis()
println(s"reduceByKey time = ${end - start} ms")
```

#### Observe

* Shuffle still exists
* Shuffle size significantly smaller than groupByKey

---

### What You Must Understand (Experiment 3)

* reduceByKey performs **map-side aggregation**
* Less data shuffled = better performance

---

### Experiment 4 – Join-Induced Shuffle

**Goal:** Identify shuffle from joins.

```scala
val left = baseData
val right = baseData.mapValues(_ * 2)

left.join(right).count()
```

#### Observe

* Multiple shuffle stages
* Parent-child stage dependency

---

### What You Must Understand (Experiment 4)

* Joins often cause multiple shuffles
* Shuffle cost multiplies with dataset size

---

## 6. Spark Shuffle Mental Model (Written – Mandatory)

Write **10–12 lines** answering:

> Why do wide transformations require shuffles, and why does shuffle cost dominate Spark job performance?

Your answer must explicitly mention:

* Network I/O
* Disk spill
* Serialization
* Stage boundaries

---

## 7. Interview Questions (₹40+ LPA Level)

You must answer **instantly and confidently**:

1. Difference between narrow and wide transformations
2. What exactly triggers a shuffle?
3. Why is `reduceByKey` preferred over `groupByKey`?
4. Why do shuffles dominate Spark job runtime?
5. How can Spark UI prove a job is shuffle-heavy?

---

## 8. Day Completion Checklist (Gate)

Proceed to **Week 2 – Day 2** only if:

* You can identify shuffle-causing operations by sight
* You observed real shuffle metrics in Spark UI
* You can explain performance differences with evidence
* You can answer all interview questions without hesitation

---

**Week 2 – Day 1 corrects a common mistake: reasoning about performance using toy data. From here on, evidence matters.**
