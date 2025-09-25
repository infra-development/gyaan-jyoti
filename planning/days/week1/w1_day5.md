# 📅 Week 1 – Day 5 (Friday, WFH)
**Focus**: Arrays/Strings Mixed Review + System Design (Caching, SQL vs NoSQL)  
**Time**: 07:30 – 10:00 (2.5h) + 10:30 – 12:30 (2h) + 21:00 – 23:00 (2h)

---

## **07:30–10:00 (2.5h) → Arrays/Strings Mixed Review**

### Arrays
1. [238. Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/)
    - **Goal**: Prefix & suffix product technique (O(n) time, O(1) space).
    - **Theory if stuck**: Compute left products, right products, multiply.

2. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
    - **Goal**: Sorting + greedy merging.
    - **Theory if stuck**: Sort by start, merge if overlapping.

### Strings
3. [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/) (revisit, faster implementation)
    - **Goal**: Strengthen frequency map approach.

4. [567. Permutation in String](https://leetcode.com/problems/permutation-in-string/)
    - **Goal**: Sliding window + frequency comparison.
    - **Theory if stuck**: Maintain counts for window, compare with target string.

5. [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)
    - **Goal**: Classic sliding window with hashmap (hard but important).
    - **Theory if stuck**: Track counts of required chars, shrink/expand window.

---

## **10:30–12:30 (2h) → System Design: Caching**

- **Topics**:
    - What is caching? Why it matters (latency, throughput).
    - **Redis basics**: in-memory store, key-value model, eviction policies.
    - **Cache invalidation strategies**:
        - Write-through, Write-back, Write-around.
        - TTL (time-to-live).
    - Common pitfalls (cache stampede, consistency issues).

- **Reliable Resources**:
    - [Redis Official Docs](https://redis.io/docs/latest/develop/) ✅
    - [System Design Primer – Caching](https://github.com/donnemartin/system-design-primer#caching) ✅

- **Activity**:
    - Draw architecture: Client → Cache → DB.
    - Write interview-style answer:
        - “How would you use caching to scale a read-heavy system?”

---

## **21:00–23:00 (2h) → System Design: SQL vs NoSQL**

- **Topics**:
    - **SQL (Relational DBs)**: Schema, ACID properties.
    - **NoSQL (Key-value, Document, Column, Graph)**: Flexibility, eventual consistency.
    - Use cases:
        - SQL → banking, transactions.
        - NoSQL → social networks, logging, big data.
    - Trade-offs: consistency vs scalability.

- **Reliable Resources**:
    - [PostgreSQL Official Docs – Intro](https://www.postgresql.org/docs/current/tutorial-sql-intro.html) ✅
    - [MongoDB – What is NoSQL?](https://www.mongodb.com/nosql-explained) ✅
    - [System Design Primer – Databases](https://github.com/donnemartin/system-design-primer#databases) ✅

- **Activity**:
    - Write down 5 differences SQL vs NoSQL in your notes.
    - Prepare interview answer:
        - “Which database would you choose for an e-commerce system, and why?”

---

# ✅ Outcome of Day 5
- Reviewed **arrays/strings** with prefix-suffix, sliding window, greedy.
- Learned **Redis caching + invalidation strategies** from official docs.
- Understood **SQL vs NoSQL trade-offs** using official PostgreSQL/MongoDB resources.
- Prepared 2 interview-ready answers.  
