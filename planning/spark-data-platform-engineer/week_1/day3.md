# Week 1 – Day 3: Spark Architecture (Driver, Executors, Cluster Manager)

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Scala + Spark Foundations
**Focus:** *Exactly* understanding what runs **where**, **when**, and **why** in a Spark application

---

## Index

1. Day Objective
2. Time Allocation Overview
3. Theory to Read (Exact Scope)
4. Hands-On Experiments (Exact Problems)
5. What You Must Understand After Each Experiment
6. Spark Failure Mental Model
7. Interview Questions (₹40+ LPA Level)
8. Day Completion Checklist (Gate)

---

## 1. Day Objective

By the end of Day 3, you must be able to **explain a Spark application lifecycle end-to-end**:

> From `spark-submit` → Driver startup → Executor allocation → Task execution → Job completion/failure

This day removes *all ambiguity* around **Driver vs Executors vs Cluster Manager**.

---

## 2. Time Allocation Overview (6 Hours)

| Section                               | Time    |
| ------------------------------------- | ------- |
| Spark Architecture Theory             | 90 min  |
| Hands-on Experiments (3)              | 180 min |
| Mental Model Writing + Interview Prep | 90 min  |

---

## 3. Theory to Read (Exact Scope – 90 min)

### Mandatory Reading (Free & Official)

1. **Spark Cluster Overview**
   [https://spark.apache.org/docs/latest/cluster-overview.html](https://spark.apache.org/docs/latest/cluster-overview.html)

2. **Submitting Spark Applications**
   [https://spark.apache.org/docs/latest/submitting-applications.html](https://spark.apache.org/docs/latest/submitting-applications.html)

3. **Spark Components (Driver, Executor, Cluster Manager)**
   [https://spark.apache.org/docs/latest/cluster-overview.html#components](https://spark.apache.org/docs/latest/cluster-overview.html#components)

### Optional (If Needed)

* Spark Summit (YouTube): *Spark Architecture Explained*

**You are NOT required to learn YARN/Kubernetes internals today.**

---

## 4. Hands-On Experiments (Exact Problems)

### Experiment 1 – Identify Driver vs Executor Code

**Goal:** Prove what runs on the driver and what runs on executors.

#### Task

Write the following Spark program (Scala):

```scala
val spark = SparkSession.builder()
  .appName("DriverVsExecutor")
  .master("local[2]")
  .getOrCreate()

println("This runs on DRIVER")

val data = spark.sparkContext.parallelize(List(1, 2, 3, 4))

data.map { x =>
  println(s"Processing $x")
  x * 2
}.collect()
```

#### Observe

* How many times does `"This runs on DRIVER"` print?
* How many times does `"Processing x"` print?

---

### What You Must Understand (Experiment 1)

* Driver executes **main application code**
* Executors execute **transformation logic**
* Executor code runs **once per partition, not once per job**

---

### Experiment 2 – Driver Memory vs Executor Memory

**Goal:** Understand where data lives.

#### Task

Modify the program:

* Create a large Scala collection **before** parallelization
* Observe memory usage

```scala
val largeList = (1 to 5_000_000).toList

val rdd = spark.sparkContext.parallelize(largeList)
rdd.count()
```

#### Observe

* Where is `largeList` created?
* Who holds it in memory initially?

---

### What You Must Understand (Experiment 2)

* Data created before `parallelize` lives on the **driver**
* Spark distributes data **after** parallelization
* Large driver-side objects can cause driver OOM

---

### Experiment 3 – Executor Failure (Conceptual but Precise)

**Goal:** Understand Spark fault tolerance.

#### Task

* Run a Spark job with `local[2]`
* Add an artificial exception for one record:

```scala
data.map { x =>
  if (x == 3) throw new RuntimeException("boom")
  x
}.collect()
```

#### Observe

* Job failure
* Retry behavior

---

### What You Must Understand (Experiment 3)

* Exceptions inside tasks fail the task
* Spark retries tasks automatically
* Driver decides retry based on configuration

---

## 5. Spark Failure Mental Model (Written – Mandatory)

Write **8–10 lines** explaining:

> What happens if an executor crashes while processing a task?

Your answer must include:

* Role of lineage
* Task re-execution
* Why stateless executors matter

---

## 6. Interview Questions (₹40+ LPA Level)

You must answer **without vague language**:

1. Walk me through what happens when you run `spark-submit`.
2. What code runs on the driver vs executors?
3. What happens if the driver crashes? Why is it fatal?
4. What happens if an executor crashes?
5. Why are executors designed to be stateless?

---

## 7. Day Completion Checklist (Gate)

Proceed to **Day 4 only if**:

* You can explain Experiment 1 output confidently
* You understand where memory is allocated (driver vs executor)
* You can explain executor failure and retry logic
* You can answer all interview questions clearly

---

**Day 3 is where Spark becomes real. If this day is weak, DAGs and shuffles will not make sense later.**
