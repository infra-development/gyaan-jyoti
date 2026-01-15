# Week 1 – Day 4: Spark Transformations vs Actions (Lazy Execution)

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Scala + Spark Foundations
**Focus:** Understanding *when* Spark executes code and *why* laziness is fundamental to Spark’s design

---

## Index

1. Day Objective
2. Time Allocation Overview
3. Theory to Read (Exact Scope)
4. Hands-On Experiments (Exact Problems)
5. What You Must Understand After Each Experiment
6. Spark Execution Mental Model
7. Interview Questions (₹40+ LPA Level)
8. Day Completion Checklist (Gate)

---

## 1. Day Objective

By the end of Day 4, you must be able to **predict Spark execution without running the code**.

You should clearly explain:

* Why Spark does nothing until an action is invoked
* What exactly triggers execution
* Why Spark can optimize before execution

This day is the foundation for understanding **DAGs, stages, and shuffles**.

---

## 2. Time Allocation Overview (6 Hours)

| Section                            | Time    |
| ---------------------------------- | ------- |
| Lazy Execution & Concepts (Theory) | 90 min  |
| Hands-on Experiments (4)           | 180 min |
| Mental Model Writing               | 45 min  |
| Interview Preparation              | 45 min  |

---

## 3. Theory to Read (Exact Scope – 90 min)

### Mandatory Reading (Free & Official)

1. **RDD Programming Guide – Transformations & Actions**
   [https://spark.apache.org/docs/latest/rdd-programming-guide.html#transformations](https://spark.apache.org/docs/latest/rdd-programming-guide.html#transformations)

2. **Spark Programming Guide – Lazy Evaluation**
   [https://spark.apache.org/docs/latest/rdd-programming-guide.html](https://spark.apache.org/docs/latest/rdd-programming-guide.html)

3. **Databricks Blog – Lazy Evaluation in Spark** (Free)

### Optional (If Needed)

* Spark Summit (YouTube): *Understanding Lazy Evaluation in Spark*

**You are NOT expected to know optimizers yet (Catalyst comes later).**

---

## 4. Hands-On Experiments (Exact Problems)

### Experiment 1 – Proving Lazy Evaluation

**Goal:** Prove Spark does nothing until an action is called.

#### Task

Write the following Spark code:

```scala
val spark = SparkSession.builder()
  .appName("LazyEval")
  .master("local[2]")
  .getOrCreate()

val rdd = spark.sparkContext.parallelize(List(1, 2, 3, 4))

val transformed = rdd.map { x =>
  println(s"Mapping $x")
  x * 2
}

// DO NOT call any action yet
```

Run the program.

#### Observe

* Does "Mapping x" print?

Now add:

```scala
transformed.count()
```

Observe again.

---

### What You Must Understand (Experiment 1)

* Transformations are **lazy**
* No execution happens without an action
* Spark only builds a *logical plan*

---

### Experiment 2 – Multiple Transformations, Single Action

**Goal:** Understand execution chaining.

#### Task

```scala
val rdd2 = rdd
  .map(_ * 2)
  .filter(_ > 4)
  .map(_ + 1)

rdd2.collect()
```

#### Observe

* How many times data is read
* Whether intermediate results are stored

---

### What You Must Understand (Experiment 2)

* Transformations are pipelined
* Spark does NOT execute step-by-step eagerly

---

### Experiment 3 – Multiple Actions

**Goal:** Understand recomputation.

#### Task

```scala
val base = spark.sparkContext.parallelize(List(1, 2, 3, 4))
val t = base.map(_ * 2)

t.count()
t.collect()
```

#### Observe

* Is the transformation executed once or twice?

---

### What You Must Understand (Experiment 3)

* Each action triggers execution
* Without caching, Spark recomputes transformations

---

### Experiment 4 – Action That Triggers Shuffle (Preview)

**Goal:** Preview future concepts without deep dive.

#### Task

```scala
val data = spark.sparkContext.parallelize(List(("a", 1), ("b", 1), ("a", 2)))

data.groupByKey().collect()
```

#### Observe

* Job execution in Spark UI
* Number of stages (high level)

---

### What You Must Understand (Experiment 4)

* Some actions require data movement
* Execution plan changes based on transformations

---

## 5. Spark Execution Mental Model (Written – Mandatory)

Write **8–10 lines** answering:

> Why does Spark delay execution until an action is called?

Your answer must include:

* Optimization opportunity
* Reduced I/O
* Fault tolerance benefits

---

## 6. Interview Questions (₹40+ LPA Level)

You must answer **precisely**:

1. What is lazy evaluation in Spark?
2. Why are transformations lazy but actions eager?
3. What happens if a Spark job has 3 actions?
4. Why does Spark recompute transformations?
5. How does lazy evaluation help Spark optimize execution?

---

## 7. Day Completion Checklist (Gate)

Proceed to **Day 5 only if**:

* You can predict execution without running code
* You understand why multiple actions cause recomputation
* You can explain lazy execution in your own words
* You can answer all interview questions confidently

---

**Day 4 is where Spark execution truly begins. Without mastering laziness, DAGs and stages will remain confusing.**
