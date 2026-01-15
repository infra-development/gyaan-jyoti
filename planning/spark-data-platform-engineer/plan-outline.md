# Data Platform Engineer (Spark-heavy) – Mastery Topics

## Index

1. [Scala (Production-Level for Spark)](#1-scala-production-level-for-spark)
2. [Apache Spark – Core & Internals](#2-apache-spark--core--internals-highest-priority)
3. [Spark Performance Optimization](#3-spark-performance-optimization)
4. [Spark SQL & Catalyst](#4-spark-sql--catalyst)
5. [Structured Streaming](#5-structured-streaming)
6. [Lakehouse Technologies](#6-lakehouse-technologies-choose-one-deeply)
7. [SQL (Advanced Analytics)](#7-sql-advanced-analytics)
8. [Data Platform & System Design](#8-data-platform--system-design)
9. [Platform & Production Readiness](#9-platform--production-readiness)
10. [Ownership & Impact](#10-ownership--impact-interview-critical)
11. [10-Week Execution Plan (Interview-Driven)](#11-10-week-execution-plan-interview-driven)
    1. [Week 1 – Scala + Spark Foundations](#week-1--scala--spark-foundations)
    2. [Week 2 – Spark Execution & Shuffle Internals](#week-2--spark-execution--shuffle-internals)
    3. [Week 3 – Partitioning, Joins, and Skew](#week-3--partitioning-joins-and-skew)
    4. [Week 4 – Memory, Serialization, and Storage](#week-4--memory-serialization-and-storage)
    5. [Week 5 – Spark SQL & Catalyst](#week-5--spark-sql--catalyst)
    6. [Week 6 – Structured Streaming](#week-6--structured-streaming)
    7. [Week 7 – Lakehouse (Delta / Iceberg / Hudi)](#week-7--lakehouse-delta--iceberg--hudi)
    8. [Week 8 – Advanced SQL + Analytics](#week-8--advanced-sql--analytics)
    9. [Week 9 – Data Platform & Production Design](#week-9--data-platform--production-design)
    10. [Week 10 – Platform, Ownership & Interviews](#week-10--platform-ownership--interviews)
    

---

## 1. Scala (Production-Level for Spark)

### 1.1 Language Fundamentals

* Values vs variables (`val` vs `var`)
* Immutability principles
* Case classes and companion objects
* Objects vs classes
* Packages and imports

### 1.2 Collections & Functional Usage

* `List`, `Seq`, `Map`, `Set`
* `map`, `flatMap`, `filter`, `fold`, `reduce`
* `groupBy`
* Laziness vs eagerness

### 1.3 Error Handling & Safety

* `Option` (null avoidance)
* `Try` (exception handling)
* `Either` (error modeling)
* Pattern matching

### 1.4 Scala for Spark

* Writing type-safe Spark transformations
* Avoiding mutable state in Spark jobs
* Serialization considerations

---

## 2. Apache Spark – Core & Internals (Highest Priority)

### 2.1 Spark Architecture

* Driver, Executors, Cluster Manager
* Spark Application lifecycle
* Executor memory and cores

### 2.2 Execution Model

* DAG generation
* Stages and Tasks
* Narrow vs wide transformations
* Actions vs transformations

### 2.3 Shuffle Mechanics

* When and why shuffle happens
* Shuffle read/write phases
* Disk and network impact
* Shuffle tuning parameters

### 2.4 Fault Tolerance

* Lineage
* Task retries
* Speculative execution
* Executor failures

### 2.5 Spark UI & Debugging

* Job, Stage, Task tabs
* Shuffle metrics
* Memory and GC metrics
* Identifying bottlenecks

---

## 3. Spark Performance Optimization

### 3.1 Partitioning

* Default partitioning
* Repartition vs coalesce
* Custom partitioning
* Partition sizing strategies

### 3.2 Joins & Aggregations

* Broadcast joins
* Shuffle hash joins
* Sort merge joins
* Join hints

### 3.3 Data Skew Handling

* Identifying skew
* Salting techniques
* Skew join optimizations

### 3.4 Memory & Serialization

* On-heap vs off-heap
* `spark.memory.fraction`
* Kryo vs Java serialization
* Garbage collection impact

### 3.5 File Formats & Storage

* Parquet vs ORC
* Predicate pushdown
* Column pruning
* Small files problem

---

## 4. Spark SQL & Catalyst

### 4.1 Spark SQL Engine

* Logical plans
* Physical plans
* Catalyst optimizer

### 4.2 Query Optimization

* Predicate pushdown
* Column pruning
* Adaptive Query Execution (AQE)
* Cost-based optimization

### 4.3 SQL on Spark

* Writing optimized SQL for Spark
* Debugging slow queries

---

## 5. Structured Streaming

### 5.1 Streaming Model

* Micro-batch architecture
* Continuous processing (conceptual)

### 5.2 State & Time

* Event time vs processing time
* Watermarks
* Late data handling

### 5.3 Exactly-Once Semantics

* Checkpointing
* Idempotent sinks
* Failure recovery

### 5.4 Streaming Sources & Sinks

* Kafka integration
* File-based streaming
* Sink guarantees

---

## 6. Lakehouse Technologies (Choose One Deeply)

### 6.1 Core Concepts

* ACID transactions
* Metadata management
* Time travel

### 6.2 Schema Management

* Schema enforcement
* Schema evolution
* Backward and forward compatibility

### 6.3 Operations

* Compaction
* Vacuum / cleanup
* Upserts and merges

---

## 7. SQL (Advanced Analytics)

### 7.1 Query Fundamentals

* Joins (inner, outer, semi, anti)
* Grouping and aggregations

### 7.2 Advanced SQL

* Window functions (`ROW_NUMBER`, `RANK`, `LAG`, `LEAD`)
* Rolling and sliding windows
* CTEs (WITH clauses)

### 7.3 Performance Reasoning

* Join order
* Index usage (conceptual)
* Query plan interpretation

---

## 8. Data Platform & System Design

### 8.1 Batch Data Pipelines

* Ingestion patterns
* Transform layers
* Reprocessing and backfills

### 8.2 Streaming Architectures

* Real-time ingestion design
* Latency vs throughput trade-offs

### 8.3 Reliability & Quality

* Idempotency
* Exactly-once guarantees
* Data quality checks
* SLA definitions

### 8.4 Cost Optimization

* Compute vs storage trade-offs
* Scheduling strategies
* Resource right-sizing

---

## 9. Platform & Production Readiness

### 9.1 Spark on Kubernetes

* Driver and executor pods
* Resource requests vs limits
* Autoscaling basics

### 9.2 CI/CD for Data Pipelines

* Build pipelines
* Environment promotion
* Configuration management

### 9.3 Observability

* Logging strategies
* Metrics and monitoring
* Alerting for failures

---

## 10. Ownership & Impact (Interview-Critical)

### 10.1 Production Incidents

* Failure scenarios
* Root cause analysis
* Prevention strategies

### 10.2 Optimization Stories

* Performance improvements
* Cost reductions
* Stability gains

### 10.3 Decision Making

* Trade-off analysis
* Technology selection rationale

---

**This document is the baseline syllabus.**
Everything you study, practice, or explain in interviews must map to one or more sections above.

---

## 11. 10-Week Execution Plan (Interview-Driven)

This plan is designed to make you **₹40+ LPA ready** by the end of 10 weeks. Each week has a *clear completion criterion* — if you cannot explain the items verbally, the week is not complete.

---

### Week 1 – Scala + Spark Foundations

**Focus:** Language fluency + Spark mental model

* Scala: immutability, collections, `Option`, `Try`, `Either`, pattern matching
* Spark architecture: Driver, Executors, Cluster Manager
* Transformations vs actions
* DAG → Stages → Tasks (verbal explanation required)

**Outcome:** You can write clean Spark code and explain *exactly* how it executes.

---

### Week 2 – Spark Execution & Shuffle Internals

**Focus:** What actually happens under the hood

* Narrow vs wide transformations
* Shuffle lifecycle (map, spill, reduce)
* Task scheduling and retries
* Speculative execution
* Spark UI: Jobs, Stages, Tasks

**Outcome:** You can diagnose why a job is slow using Spark UI.

---

### Week 3 – Partitioning, Joins, and Skew

**Focus:** Performance-critical topics

* Partition sizing strategy
* `repartition` vs `coalesce`
* Broadcast vs shuffle joins
* Join hints
* Data skew detection and mitigation

**Outcome:** You can explain how you would reduce a 2-hour job to 30 minutes.

---

### Week 4 – Memory, Serialization, and Storage

**Focus:** Stability + efficiency

* On-heap vs off-heap memory
* `spark.memory.fraction`
* Kryo vs Java serialization
* Garbage collection impact
* Parquet vs ORC
* Small files problem

**Outcome:** You can reason about memory-related failures and fixes.

---

### Week 5 – Spark SQL & Catalyst

**Focus:** Query optimization

* Logical vs physical plans
* Catalyst optimizer
* Predicate pushdown
* Column pruning
* Adaptive Query Execution (AQE)

**Outcome:** You can explain why Spark chose a particular execution plan.

---

### Week 6 – Structured Streaming

**Focus:** Real-time data systems

* Micro-batch model
* Event time vs processing time
* Watermarks
* Exactly-once semantics
* Checkpointing and recovery

**Outcome:** You can design a fault-tolerant streaming pipeline.

---

### Week 7 – Lakehouse (Delta / Iceberg / Hudi)

**Focus:** Data reliability at scale

* ACID guarantees
* Schema enforcement and evolution
* Time travel
* Upserts and merges
* Compaction and cleanup

**Outcome:** You can justify using a lakehouse instead of plain Parquet.

---

### Week 8 – Advanced SQL + Analytics

**Focus:** Data logic mastery

* Window functions (`ROW_NUMBER`, `LAG`, `LEAD`)
* Rolling and sliding windows
* CTEs
* Performance reasoning

**Outcome:** You can solve complex analytical problems in SQL.

---

### Week 9 – Data Platform & Production Design

**Focus:** Senior-level thinking

* End-to-end batch and streaming architectures
* Backfills and reprocessing
* Idempotency and data quality
* Cost optimization strategies

**Outcome:** You can design a complete data platform under constraints.

---

### Week 10 – Platform, Ownership & Interviews

**Focus:** Conversion to offers

* Spark on Kubernetes architecture
* Resource tuning basics
* CI/CD for data pipelines
* Incident stories and RCA
* Mock interviews and resume refinement

**Outcome:** You can defend your decisions like a senior engineer.
