# Week 2 – Day 3: Task Scheduling, Retries & Speculative Execution

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Spark Execution & Shuffle Internals
**Focus:** Understanding *how Spark schedules tasks, handles failures, and mitigates slow tasks*

---

## Index

1. [Day Objective](#1-day-objective)
2. [Time Allocation Overview](#2-time-allocation-overview-6-hours)
3. [Standard Dataset (Reuse)](#3-standard-dataset-reuse--mandatory)
4. [Theory to Read (Exact Scope)](#4-theory-to-read-exact-scope--165-min)
5. [Hands-On Experiments (Exact, Observable)](#5-hands-on-experiments-exact-observable)
6. [Fault Tolerance & Scheduling Mental Model (Written – Mandatory)](#6-fault-tolerance--scheduling-mental-model-written--mandatory)
7. [Interview Questions (₹40+ LPA Level)](#7-interview-questions-40-lpa-level)
8. [Day Completion Checklist (Gate)](#8-day-completion-checklist-gate)

---

## 1. Day Objective

By the end of **Week 2 – Day 3**, you must be able to **explain and predict Spark’s behavior under failure and slowness**:

> How tasks are scheduled, retried, and speculated — and why Spark can safely do so.

This day explains Spark’s **resilience and execution guarantees**, a core senior-level expectation.

---

## 2. Time Allocation Overview (6 Hours)

| Section                        | Time    |
| ------------------------------ | ------- |
| Task Scheduling Theory         | 75 min  |
| Retry & Fault Tolerance Theory | 45 min  |
| Speculative Execution Theory   | 45 min  |
| Hands-on Experiments (4)       | 180 min |
| Mental Model Writing           | 45 min  |
| Interview Preparation          | 45 min  |

---

## 3. Standard Dataset (Reuse – Mandatory)

Reuse the **standard dataset** from Week 2 – Day 1 & Day 2.

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

This dataset ensures **tasks run long enough** for retries and speculation to be observable.

---

## 4. Theory to Read (Exact Scope – 165 min)

### Mandatory Reading (Free & Official)

1. **Spark Job Scheduling & Task Execution**
   [https://spark.apache.org/docs/latest/job-scheduling.html](https://spark.apache.org/docs/latest/job-scheduling.html)

2. **Spark Fault Tolerance & Task Retry**
   [https://spark.apache.org/docs/latest/rdd-programming-guide.html#fault-tolerance](https://spark.apache.org/docs/latest/rdd-programming-guide.html#fault-tolerance)

3. **Spark Configuration – Speculative Execution**
   [https://spark.apache.org/docs/latest/configuration.html](https://spark.apache.org/docs/latest/configuration.html)

### Key Concepts to Extract

* TaskSet
* Task attempts
* Stage retries
* Speculative execution triggers

---

## 5. Hands-On Experiments (Exact, Observable)

### Experiment 1 – Task Scheduling & Parallelism

**Goal:** Understand how tasks are scheduled based on partitions.

```scala
val rdd = spark.sparkContext.parallelize(1 to 10000000, 8)
rdd.map(_ + 1).count()
```

#### Observe in Spark UI

* Number of tasks per stage
* Parallel task execution

---

### What You Must Understand (Experiment 1)

* Tasks = partitions
* Spark schedules tasks in waves based on available cores

---

### Experiment 2 – Task Failure & Retry

**Goal:** Observe automatic task retries.

```scala
val rdd = spark.sparkContext.parallelize(1 to 20, 4)

rdd.map { x =>
  if (x == 13) throw new RuntimeException("simulated failure")
  x
}.count()
```

#### Observe

* Failed task attempts
* Retry count in Spark UI

---

### What You Must Understand (Experiment 2)

* Spark retries failed tasks automatically
* Retries happen at task level, not job level

---

### Experiment 3 – Stage Failure (Retry Limit)

**Goal:** Understand when Spark gives up.

```scala
spark.conf.set("spark.task.maxFailures", "1")

rdd.map { x =>
  if (x == 13) throw new RuntimeException("always fail")
  x
}.count()
```

#### Observe

* Stage failure
* Job termination

---

### What You Must Understand (Experiment 3)

* Stage fails when retries are exhausted
* Driver makes retry decisions

---

### Experiment 4 – Speculative Execution

**Goal:** Observe speculative execution for slow tasks.

#### Setup

```scala
spark.conf.set("spark.speculation", "true")
spark.conf.set("spark.speculation.multiplier", "1.5")
```

#### Task

```scala
val rdd = spark.sparkContext.parallelize(1 to 100, 4)

rdd.map { x =>
  if (x % 4 == 0) Thread.sleep(2000)
  x
}.count()
```

#### Observe in Spark UI

* Duplicate task attempts
* Faster task completion wins

---

### What You Must Understand (Experiment 4)

* Speculative execution mitigates stragglers
* Duplicate work trades resources for latency

---

## 6. Fault Tolerance & Scheduling Mental Model (Written – Mandatory)

Write **12–15 lines** answering:

> How Spark schedules tasks, handles failures, and uses speculation to reduce job latency.

Your answer must include:

* Task attempts
* Retry thresholds
* Stage failure conditions
* Speculative execution trade-offs

---

## 7. Interview Questions (₹40+ LPA Level)

You must answer **precisely and structurally**:

1. How does Spark schedule tasks across executors?
2. What happens when a task fails?
3. Difference between task retry and stage retry
4. What is speculative execution and when is it useful?
5. What are the downsides of speculative execution?

---

## 8. Day Completion Checklist (Gate)

Proceed to **Week 2 – Day 4** only if:

* You observed task retries in Spark UI
* You triggered a stage failure intentionally
* You observed speculative execution behavior
* You can explain Spark fault tolerance end-to-end

---

**Week 2 – Day 3 reveals why Spark is resilient at scale. This knowledge is mandatory for platform-level ownership.**
