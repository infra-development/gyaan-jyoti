# Week 2 – Day 2: Shuffle Lifecycle (Map → Spill → Reduce)

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Spark Execution & Shuffle Internals
**Focus:** Understanding *exactly* what happens during a Spark shuffle at the executor level

---

## Index

1. [Day Objective](#1-day-objective)
2. [Time Allocation Overview](#2-time-allocation-overview-6-hours)
3. [Standard Dataset (Reuse)](#3-standard-dataset-reuse--mandatory)
4. [Theory to Read (Exact Scope)](#4-theory-to-read-exact-scope--90-min)
5. [Hands-On Experiments (Exact, Observable)](#5-hands-on-experiments-exact-observable)
6. [Spark Shuffle Lifecycle Mental Model (Written – Mandatory)](#6-spark-shuffle-lifecycle-mental-model-written--mandatory)
7. [Interview Questions (₹40+ LPA Level)](#7-interview-questions-40-lpa-level)
8. [Day Completion Checklist (Gate)](#8-day-completion-checklist-gate)
---

## 1. Day Objective

By the end of **Week 2 – Day 2**, you must be able to **mentally simulate a Spark shuffle**:

> Map-side processing → in-memory buffering → spill to disk → shuffle files → reduce-side fetch → aggregation

This day explains *why shuffles are expensive*, not just *that they are*.

---

## 2. Time Allocation Overview (6 Hours)

| Section                           | Time    |
| --------------------------------- | ------- |
| Shuffle Theory (Map/Spill/Reduce) | 90 min  |
| Spark Configs for Shuffle         | 45 min  |
| Hands-on Experiments (3)          | 180 min |
| Mental Model Writing              | 45 min  |
| Interview Preparation             | 45 min  |

---

## 3. Standard Dataset (Reuse – Mandatory)

Reuse the **standard dataset** created in **Week 2 – Day 1**.

```scala
val numRecords = 20_000_000
val numKeys = 100

val baseData = spark.sparkContext
  .parallelize(1 to numRecords, 8)
  .map { i =>
    val key = s"key_${i % numKeys}"
    (key, 1)
  }
```

**Rule:** Do not downsize this dataset unless the machine crashes.

---

## 4. Theory to Read (Exact Scope – 90 min)

### Mandatory Reading (Free & Official)

1. **Spark Shuffle Mechanism (High Level)**
   [https://spark.apache.org/docs/latest/job-scheduling.html](https://spark.apache.org/docs/latest/job-scheduling.html)

2. **Spark Configuration – Shuffle & Memory**
   [https://spark.apache.org/docs/latest/configuration.html](https://spark.apache.org/docs/latest/configuration.html)

3. **Databricks / Community Blogs – Shuffle Internals** (Free)

### Key Concepts to Extract

* Map-side combine
* In-memory buffer
* Spill threshold
* Reduce-side fetch

---

## 5. Hands-On Experiments (Exact, Observable)

### Experiment 1 – Observing Shuffle Write & Read

**Goal:** See map-side and reduce-side shuffle metrics.

```scala
val result = baseData.reduceByKey(_ + _)
result.count()
```

#### Observe in Spark UI (Stages → Metrics)

* Shuffle Write Size (map side)
* Shuffle Read Size (reduce side)

---

### What You Must Understand (Experiment 1)

* Map tasks write shuffle files
* Reduce tasks fetch shuffle blocks

---

### Experiment 2 – Forcing Disk Spill

**Goal:** Observe spill due to memory pressure.

#### Setup (Reduce memory intentionally)

```scala
spark.conf.set("spark.memory.fraction", "0.2")
```

#### Task

```scala
baseData.groupByKey().count()
```

#### Observe

* Spill (memory/disk) metrics in Spark UI
* Increased task duration

---

### What You Must Understand (Experiment 2)

* Shuffle data exceeds in-memory buffer
* Spark spills intermediate data to disk

---

### Experiment 3 – Increasing Shuffle Partitions

**Goal:** Understand reduce-side parallelism.

#### Setup

```scala
spark.conf.set("spark.sql.shuffle.partitions", "32")
```

#### Task

```scala
baseData.reduceByKey(_ + _).count()
```

#### Observe

* Number of reduce tasks
* Impact on execution time

---

### What You Must Understand (Experiment 3)

* Shuffle partitions control reduce parallelism
* Too few → slow tasks, too many → overhead

---

## 6. Spark Shuffle Lifecycle Mental Model (Written – Mandatory)

Write **12–15 lines** answering:

> Describe the full lifecycle of a Spark shuffle from map task to reduce task.

Your answer must include:

* Buffering
* Spill
* Disk files
* Network transfer
* Aggregation

---

## 7. Interview Questions (₹40+ LPA Level)

You must answer **precisely and structurally**:

1. What happens internally during a Spark shuffle?
2. What triggers a spill to disk?
3. Difference between shuffle write and shuffle read
4. How does `spark.sql.shuffle.partitions` affect performance?
5. Why does shuffle dominate Spark job runtime?

---

## 8. Day Completion Checklist (Gate)

Proceed to **Week 2 – Day 3** only if:

* You observed shuffle read/write metrics clearly
* You triggered and observed spill behavior
* You understand reduce-side parallelism
* You can explain shuffle lifecycle end-to-end

---

**Week 2 – Day 2 is where Spark stops being abstract and becomes mechanical. This knowledge separates users from performance engineers.**
