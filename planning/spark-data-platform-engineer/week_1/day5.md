# Week 1 – Day 5: Spark DAG → Stages → Tasks (Execution Breakdown)

**Role Target:** Senior / Lead Data Platform Engineer (Spark-heavy) – ₹40+ LPA
**Total Time:** 6 hours
**Week Context:** Scala + Spark Foundations
**Focus:** Understanding *how* Spark converts lazy transformations into executable units

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

By the end of Day 5, you must be able to **break any Spark job into**:

> DAG → Stages → Tasks

You should confidently explain:

* Why stages are created
* What causes stage boundaries
* How tasks are generated and executed

This day connects **lazy evaluation (Day 4)** with **actual execution**.

---

## 2. Time Allocation Overview (6 Hours)

| Section                  | Time    |
| ------------------------ | ------- |
| DAG & Stage Theory       | 90 min  |
| Hands-on Experiments (4) | 180 min |
| Mental Model Writing     | 45 min  |
| Interview Preparation    | 45 min  |

---

## 3. Theory to Read (Exact Scope – 90 min)

### Mandatory Reading (Free & Official)

1. **Spark Job Scheduling (DAG Scheduler)**
   [https://spark.apache.org/docs/latest/job-scheduling.html](https://spark.apache.org/docs/latest/job-scheduling.html)

2. **RDD Programming Guide – Dependencies**
   [https://spark.apache.org/docs/latest/rdd-programming-guide.html#rdd-operations](https://spark.apache.org/docs/latest/rdd-programming-guide.html#rdd-operations)

3. **Spark Internals – Narrow vs Wide Dependencies** (Free blogs)

### Optional (If Needed)

* Spark Summit (YouTube): *Inside Spark DAG Scheduler*

---

## 4. Hands-On Experiments (Exact Problems)

### Experiment 1 – Single Stage Job (Only Narrow Transformations)

**Goal:** Identify jobs without shuffle.

#### Task

```scala
val rdd = spark.sparkContext.parallelize(1 to 10, 2)

val result = rdd
  .map(_ * 2)
  .filter(_ > 5)

result.collect()
```

#### Observe

* Number of stages in Spark UI
* Number of tasks per stage

---

### What You Must Understand (Experiment 1)

* Narrow transformations stay in the same stage
* Tasks = number of partitions

---

### Experiment 2 – Wide Transformation (Shuffle Boundary)

**Goal:** See stage boundary creation.

#### Task

```scala
val data = spark.sparkContext.parallelize(List(
  ("a", 1), ("b", 1), ("a", 2), ("b", 2)
), 2)

data.groupByKey().collect()
```

#### Observe

* Number of stages
* Shuffle read/write in Spark UI

---

### What You Must Understand (Experiment 2)

* Wide transformations create new stages
* Shuffles separate stages

---

### Experiment 3 – Join Causing Multiple Stages

**Goal:** Understand complex DAGs.

#### Task

```scala
val rdd1 = spark.sparkContext.parallelize(List((1, "A"), (2, "B")), 2)
val rdd2 = spark.sparkContext.parallelize(List((1, 100), (2, 200)), 2)

rdd1.join(rdd2).collect()
```

#### Observe

* DAG visualization
* Stage dependencies

---

### What You Must Understand (Experiment 3)

* Joins often cause shuffles
* Multiple parent stages feed a child stage

---

### Experiment 4 – Task Failure and Retry (Preview)

**Goal:** Connect tasks to fault tolerance.

#### Task

```scala
val rdd = spark.sparkContext.parallelize(1 to 5, 2)

rdd.map { x =>
  if (x == 4) throw new RuntimeException("fail")
  x
}.collect()
```

#### Observe

* Task retry behavior
* Stage failure if retries exhausted

---

### What You Must Understand (Experiment 4)

* Tasks are the smallest execution unit
* Spark retries tasks, not entire jobs

---

## 5. Spark Execution Mental Model (Written – Mandatory)

Write **8–10 lines** explaining:

> How Spark converts a DAG into stages and tasks.

Your answer must include:

* Narrow vs wide dependencies
* Shuffle boundaries
* Task scheduling per partition

---

## 6. Interview Questions (₹40+ LPA Level)

You must answer **clearly and structurally**:

1. What is a Spark DAG?
2. What causes a stage boundary?
3. Difference between narrow and wide transformations
4. How are tasks created in Spark?
5. Why does Spark retry tasks instead of recomputing the entire job?

---

## 7. Day Completion Checklist (Gate)

Proceed to **Day 6 only if**:

* You can draw DAG → stages → tasks for any job
* You can identify shuffle boundaries confidently
* You understand task retry behavior
* You can answer all interview questions without confusion

---

**Day 5 is the backbone of Spark execution. If this day is weak, performance tuning later will fail.**
