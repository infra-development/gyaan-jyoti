# Week 1 – Day 6: Spark UI & Diagnostics (Seeing Execution)

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Scala + Spark Foundations
**Focus:** Using Spark UI to *see and verify* DAGs, stages, tasks, and failures

---

## Index

1. Day Objective
2. Time Allocation Overview
3. Theory to Read (Exact Scope)
4. Hands-On Experiments (Exact Problems)
5. What You Must Understand After Each Experiment
6. Spark UI Mental Model
7. Interview Questions (₹40+ LPA Level)
8. Day Completion Checklist (Gate)

---

## 1. Day Objective

By the end of Day 6, you must be able to **open Spark UI and immediately explain what is happening**:

* How many jobs ran
* Why stages were created
* How many tasks executed
* Where time was spent

This day converts **mental models (Days 3–5)** into **observable reality**.

---

## 2. Time Allocation Overview (6 Hours)

| Section                  | Time    |
| ------------------------ | ------- |
| Spark UI Theory          | 60 min  |
| Hands-on Experiments (4) | 210 min |
| Mental Model Writing     | 45 min  |
| Interview Preparation    | 45 min  |

---

## 3. Theory to Read (Exact Scope – 60 min)

### Mandatory Reading (Free & Official)

1. **Spark Web UI Overview**
   [https://spark.apache.org/docs/latest/web-ui.html](https://spark.apache.org/docs/latest/web-ui.html)

2. **Spark Monitoring & Instrumentation**
   [https://spark.apache.org/docs/latest/monitoring.html](https://spark.apache.org/docs/latest/monitoring.html)

### Optional (If Needed)

* Spark Summit (YouTube): *Understanding Spark UI*

---

## 4. Hands-On Experiments (Exact Problems)

### Experiment 1 – Mapping Jobs to Actions

**Goal:** Understand why each action creates a job.

#### Task

```scala
val rdd = spark.sparkContext.parallelize(1 to 100, 4)
val t = rdd.map(_ * 2)

t.count()
t.collect()
```

#### Observe in Spark UI

* Number of jobs
* Stage breakdown per job

---

### What You Must Understand (Experiment 1)

* Each action creates a separate job
* Jobs may reuse the same DAG

---

### Experiment 2 – Stage & Task Visualization

**Goal:** Correlate partitions with tasks.

#### Task

```scala
val rdd = spark.sparkContext.parallelize(1 to 100, 5)
rdd.map(_ + 1).collect()
```

#### Observe

* Number of tasks
* Relationship between partitions and tasks

---

### What You Must Understand (Experiment 2)

* One task per partition per stage
* Task parallelism is partition-driven

---

### Experiment 3 – Shuffle Observation

**Goal:** Identify shuffle in Spark UI.

#### Task

```scala
val data = spark.sparkContext.parallelize(List(("a",1),("b",1),("a",2)),2)
data.groupByKey().collect()
```

#### Observe

* Shuffle Read / Shuffle Write metrics
* Stage boundary creation

---

### What You Must Understand (Experiment 3)

* Shuffle always appears as a new stage
* Shuffle metrics explain performance cost

---

### Experiment 4 – Failed Task & Retry in UI

**Goal:** See fault tolerance visually.

#### Task

```scala
val rdd = spark.sparkContext.parallelize(1 to 5, 2)
rdd.map { x =>
  if (x == 3) throw new RuntimeException("fail")
  x
}.collect()
```

#### Observe

* Failed tasks
* Retry attempts
* Error messages

---

### What You Must Understand (Experiment 4)

* Spark retries tasks automatically
* Failure is visible at task level

---

## 5. Spark UI Mental Model (Written – Mandatory)

Write **8–10 lines** answering:

> How can Spark UI help you identify whether a performance issue is due to shuffles or insufficient parallelism?

Your answer must reference:

* Jobs tab
* Stages tab
* Tasks tab

---

## 6. Interview Questions (₹40+ LPA Level)

You must answer clearly and practically:

1. How do you debug a slow Spark job using Spark UI?
2. What does the Jobs tab show?
3. How do you identify shuffle-heavy stages?
4. What indicates task skew or retries in Spark UI?
5. How does Spark UI help validate DAG → stage understanding?

---

## 7. Day Completion Checklist (Gate)

Proceed to **Day 7 only if**:

* You can map Spark UI metrics to execution concepts
* You can explain jobs, stages, and tasks from the UI
* You can identify shuffles and retries visually
* You can answer all interview questions confidently

---

**Day 6 turns theory into evidence. A senior Spark engineer must be fluent in Spark UI.**
