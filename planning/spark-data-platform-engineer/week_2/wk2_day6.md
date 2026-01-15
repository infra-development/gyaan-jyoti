# Week 2 – Day 6: Stress Scenarios, Failure Modes & Production Reasoning

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Spark Execution & Shuffle Internals
**Focus:** Understanding how Spark behaves under stress, failure, skew, and misconfiguration — and how to reason about it using Spark UI

---

## Index

1. [Day Objective](#1-day-objective)
2. [Time Allocation Overview](#2-time-allocation-overview-6-hours)
3. [Scope of Day 6 (What This Day Is and Is Not)](#3-scope-of-day-6-what-this-day-is-and-is-not)
4. [Stress & Failure Experiments (Exact, Observable)](#4-stress--failure-experiments-exact-observable)
5. [What You Must Understand After Each Experiment](#5-what-you-must-understand-after-each-experiment)
6. [Spark UI–Driven Root Cause Analysis](#6-spark-uidriven-root-cause-analysis)
7. [Production Reasoning Scenarios](#7-production-reasoning-scenarios)
8. [Interview Questions (₹40+ LPA Level)](#8-interview-questions-40-lpa-level)
9. [Day Completion Checklist (Gate)](#9-day-completion-checklist-gate)

---

## 1. Day Objective

By the end of **Week 2 – Day 6**, you must be able to:

> Diagnose *why* a Spark job is slow, unstable, or failing — even when the cause is indirect (skew, memory pressure, retries, speculation).

This day simulates **real production pain points** using controlled experiments.

---

## 2. Time Allocation Overview (6 Hours)

| Section                               | Time    |
| ------------------------------------- | ------- |
| Stress & Failure Theory Review        | 60 min  |
| Hands-on Stress Experiments (4)       | 210 min |
| Spark UI Root Cause Analysis          | 60 min  |
| Production Reasoning & Interview Prep | 90 min  |

---

## 3. Scope of Day 6 (What This Day Is and Is Not)

### This Day IS:

* About **failure modes**
* About **stress behavior**
* About **reading Spark UI under pressure**
* About **reasoning**, not tuning yet

### This Day is NOT:

* About Catalyst or Tungsten
* About advanced config tuning
* About memory internals beyond shuffle context

---

## 4. Stress & Failure Experiments (Exact, Observable)

Reuse the **standard dataset** from Week 2 – Day 1.

---

### Experiment 1 – Extreme Data Skew

**Goal:** Observe how skew breaks parallelism.

```scala
val skewed = baseData.map {
  case (k, v) => if (k == "key_0") (k, v) else ("other", v)
}

skewed.reduceByKey(_ + _).count()
```

#### Observe in Spark UI

* One very long-running task
* Many short tasks

---

### Experiment 2 – Executor Memory Pressure

**Goal:** Observe performance degradation without outright failure.

#### Setup

```scala
spark.conf.set("spark.executor.memory", "512m")
```

#### Task

```scala
baseData.groupByKey().count()
```

#### Observe

* Spill to disk
* Increased GC / task duration

---

### Experiment 3 – Retry Storm

**Goal:** Understand cascading retries.

```scala
spark.conf.set("spark.task.maxFailures", "4")

val rdd = baseData.map {
  case (k, v) =>
    if (v % 1000000 == 0) throw new RuntimeException("intermittent failure")
    (k, v)
}

rdd.count()
```

#### Observe

* Multiple task retries
* Longer stage duration

---

### Experiment 4 – Speculation Gone Wrong

**Goal:** See when speculation hurts.

#### Setup

```scala
spark.conf.set("spark.speculation", "true")
spark.conf.set("spark.speculation.multiplier", "1.1")
```

#### Task

```scala
val rdd = spark.sparkContext.parallelize(1 to 200, 4)

rdd.map { x =>
  if (x % 2 == 0) Thread.sleep(1500)
  x
}.count()
```

#### Observe

* Duplicate tasks everywhere
* Increased cluster work

---

## 5. What You Must Understand After Each Experiment

After completing all experiments, you must be able to explain:

* Why skew causes stragglers
* Why memory pressure amplifies shuffle cost
* How retries can snowball into slowness
* Why speculation is not always beneficial

---

## 6. Spark UI–Driven Root Cause Analysis

Pick **one failed or slow job** from the experiments and explain:

* Which tab revealed the problem first
* Which metric confirmed it
* What the *root cause* was (not symptom)

Write **8–10 lines** summarizing your analysis.

---

## 7. Production Reasoning Scenarios

Answer verbally (no coding):

1. A Spark job was fast last week and slow today — where do you look first?
2. One executor is always slow — what are the possible causes?
3. Speculation is enabled but latency increased — why?
4. Jobs fail intermittently under load — what do you suspect?

---

## 8. Interview Questions (₹40+ LPA Level)

You must answer **calmly and structurally**:

1. How do you diagnose Spark performance issues in production?
2. What are common Spark failure modes?
3. When does speculative execution backfire?
4. How does skew manifest in Spark UI?
5. How do retries affect cluster stability?

---

## 9. Day Completion Checklist (Gate)

Proceed beyond **Week 2** only if:

* You can diagnose skew, spill, retries, speculation visually
* You can distinguish root cause vs symptom
* You can reason about failures without touching configs
* You can answer all interview questions confidently

---

**Week 2 – Day 6 simulates production reality. If you survive this day, Week 3 tuning will make sense.**
