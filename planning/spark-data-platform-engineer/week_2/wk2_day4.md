# Week 2 – Day 4: Spark UI Deep Dive (Jobs, Stages, Tasks, Shuffles, Retries)

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Spark Execution & Shuffle Internals
**Focus:** Using Spark UI to *diagnose, explain, and validate* execution, shuffles, retries, and speculation

---

## Index

1. [Day Objective](#1-day-objective)
2. [Time Allocation Overview](#2-time-allocation-overview-6-hours)
3. [Prerequisites (Mandatory)](#3-prerequisites-mandatory)
4. [Theory to Read (Exact Scope)](#4-theory-to-read-exact-scope--60-min)
5. [Hands-On Experiments (Exact, UI-Driven)](#5-hands-on-experiments-exact-ui-driven)
6. [Spark UI Mental Model (Written – Mandatory)](#6-spark-ui-mental-model-written--mandatory)
7. [Interview Questions (₹40+ LPA Level)](#7-interview-questions-40-lpa-level)
8. [Day Completion Checklist (Gate)](#8-day-completion-checklist-gate)

---

## 1. Day Objective

By the end of **Week 2 – Day 4**, you must be able to **open Spark UI and answer, without hesitation**:

* Why this job exists
* Why these stages were created
* Why this stage has a shuffle
* Why some tasks are slow or retried
* Whether speculation helped or hurt

This day turns Spark UI into a **first-class debugging and reasoning tool**, not a passive dashboard.

---

## 2. Time Allocation Overview (6 Hours)

| Section                    | Time   |
| -------------------------- | ------ |
| Spark UI Concepts (Theory) | 60 min |
| Jobs Tab – Deep Dive       | 60 min |
| Stages Tab – Deep Dive     | 90 min |
| Tasks Tab – Deep Dive      | 90 min |
| Mental Model Writing       | 45 min |
| Interview Preparation      | 45 min |

---

## 3. Prerequisites (Mandatory)

You must reuse:

* **Standard dataset** from Week 2 – Day 1
* Experiments from:

    * Week 2 – Day 1 (Narrow vs Wide)
    * Week 2 – Day 2 (Shuffle Lifecycle)
    * Week 2 – Day 3 (Retries & Speculation)

Do **not** invent new jobs today. Today is about **reading execution**, not creating it.

---

## 4. Theory to Read (Exact Scope – 60 min)

### Mandatory Reading (Free & Official)

1. **Spark Web UI Overview**
   [https://spark.apache.org/docs/latest/web-ui.html](https://spark.apache.org/docs/latest/web-ui.html)

2. **Spark Monitoring & Instrumentation**
   [https://spark.apache.org/docs/latest/monitoring.html](https://spark.apache.org/docs/latest/monitoring.html)

### Key Concepts to Extract

* Job vs Stage vs Task
* Stage retry indicators
* Shuffle metrics
* Speculative task indicators

---

## 5. Hands-On Experiments (Exact, UI-Driven)

> ⚠️ All experiments below must be inspected **only via Spark UI**, not logs.

---

### Experiment 1 – Jobs Tab: Actions → Jobs Mapping

**Goal:** Understand why each action creates a job.

#### Task

Re-run the following (from earlier days):

```scala
val rdd = baseData.mapValues(_ + 1)

rdd.count()
rdd.collect()
```

#### Observe in **Jobs Tab**

* Number of jobs
* Completion time per job
* Relationship between actions and jobs

---

### What You Must Understand (Experiment 1)

* Each action triggers a separate job
* Jobs may share the same DAG

---

### Experiment 2 – Stages Tab: Identifying Shuffles

**Goal:** Learn to spot shuffle stages instantly.

#### Task

Re-run:

```scala
baseData.groupByKey().count()
```

#### Observe in **Stages Tab**

* Stage boundaries
* Shuffle Read / Write columns
* Parent / child stage relationship

---

### What You Must Understand (Experiment 2)

* Shuffles always introduce new stages
* Shuffle metrics explain performance cost

---

### Experiment 3 – Tasks Tab: Parallelism & Skew

**Goal:** Understand task-level behavior.

#### Task

```scala
val skewed = baseData.map {
  case (k, v) => if (k == "key_0") (k, v * 1000) else (k, v)
}

skewed.reduceByKey(_ + _).count()
```

#### Observe in **Tasks Tab**

* Task duration variance
* Long-running tasks (stragglers)

---

### What You Must Understand (Experiment 3)

* Data skew creates straggler tasks
* Spark UI exposes skew visually

---

### Experiment 4 – Retries & Speculation in UI

**Goal:** Correlate retries/speculation with UI indicators.

Re-run experiments from **Week 2 – Day 3** with speculation enabled.

#### Observe

* Duplicate task attempts
* Failed vs successful attempts
* Speculation indicators

---

### What You Must Understand (Experiment 4)

* Retries and speculation are visible at task level
* Spark UI reveals resilience mechanisms clearly

---

## 6. Spark UI Mental Model (Written – Mandatory)

Write **12–15 lines** answering:

> How can Spark UI be used to diagnose performance issues related to shuffles, skew, retries, and speculation?

Your answer must reference:

* Jobs tab
* Stages tab
* Tasks tab

---

## 7. Interview Questions (₹40+ LPA Level)

You must answer **practically and confidently**:

1. How do you debug a slow Spark job using Spark UI?
2. How do you identify shuffle-heavy stages?
3. How do you detect data skew from Spark UI?
4. How can you tell if speculative execution helped?
5. How do retries appear in Spark UI?

---

## 8. Day Completion Checklist (Gate)

Proceed to **Week 2 – Day 5 (Consolidation)** only if:

* You can explain any Spark UI screen confidently
* You can correlate UI metrics with execution concepts
* You can identify shuffles, skew, retries visually
* You can answer all interview questions without hesitation

---

**Week 2 – Day 4 turns Spark UI into your primary execution debugger. Senior engineers live here.**
