# 📅 Week 1 – Day 6 (Saturday)

---

## **07:30–10:00 (2.5h) → Arrays (Sliding Window Advanced Problems)**

1. [1004. Max Consecutive Ones III](https://leetcode.com/problems/max-consecutive-ones-iii/)
    - **Goal**: Sliding window with conditional expansion (allowing k flips).
    - **Theory if stuck**: Maintain count of zeros in window, shrink when > k.

2. [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)
    - **Goal**: Use deque for O(n) max in window.
    - **Theory if stuck**: Store indices, remove smaller elements from deque.

3. [424. Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/) (if not done earlier)
    - **Goal**: Sliding window with frequency map.
    - **Theory if stuck**: Window length – max frequency char ≤ k.

---

## **10:30–12:30 (2h) → Strings (Pattern Matching, KMP Basics)**

1. [28. Find the Index of the First Occurrence in a String](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/)
    - **Goal**: Implement naive substring search.
    - **Theory if stuck**: Compare substring with `haystack[i:i+m]`.

2. [214. Shortest Palindrome](https://leetcode.com/problems/shortest-palindrome/)
    - **Goal**: Apply prefix function idea (KMP-based).
    - **Theory if stuck**: Use KMP longest prefix-suffix (LPS) array.

- **Reliable Resources for KMP**:
    - [CP-Algorithms – Prefix Function (KMP)](https://cp-algorithms.com/string/prefix-function.html) ✅
    - [GeeksforGeeks – KMP Algorithm](https://www.geeksforgeeks.org/kmp-algorithm-for-pattern-searching/) ✅ (good explanations with diagrams).

---

## **13:00–17:00 (4h) → System Design: Databases**

- **Topics**:
    - **Sharding**: splitting data across multiple DBs.
    - **Replication**: leader-follower, multi-leader, eventual consistency.
    - **Indexing**: B-tree, hash index, tradeoffs.

- **Reliable Resources**:
    - [System Design Primer – Databases](https://github.com/donnemartin/system-design-primer#databases) ✅
    - [MongoDB Docs – Sharding Introduction](https://www.mongodb.com/docs/manual/sharding/) ✅
    - [PostgreSQL Docs – Indexes](https://www.postgresql.org/docs/current/indexes.html) ✅

- **Activity**:
    - Draw 2 diagrams:
        - Sharded database with multiple nodes.
        - Leader-follower replication setup.
    - Write 2 interview answers:
        - “How would you scale a database when traffic grows 10x?”
        - “When would you use sharding vs replication?”

---

## **17:00–20:00 → Family Trip 🚗**
- Relax, refresh, spend quality time with family.

---

## **20:30–23:00 (2.5h) → DSA Mixed Set (LeetCode Timed Practice)**

- Pick **5 random problems** (mix arrays, strings, hashing).
- Suggested problems:
    - [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/) (two pointers).
    - [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/) (prefix sum + hashmap).
    - [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/) (expand around center).
    - [206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/) (iterative/recursive).
    - [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/) (deque).

- **Goal**: Simulate real interview pace → ~20–25 min per problem.

---

# ✅ Outcome of Day 6
- Solved **5–7 advanced sliding window and string problems**.
- Learned **KMP basics** for pattern matching.
- Understood **sharding, replication, indexing** from official docs.
- Completed **timed DSA mixed practice** for interview simulation.  
