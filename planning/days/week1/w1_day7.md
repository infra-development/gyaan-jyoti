# 📅 Week 1 – Day 7 (Sunday)

---

## **07:30–10:00 (2.5h) → Linked List + HashMap Integration (LRU Cache)**

1. [146. LRU Cache](https://leetcode.com/problems/lru-cache/)
    - **Goal**: Implement LRU cache using **HashMap + Doubly Linked List**.
    - **Theory if stuck**:
        - HashMap for O(1) lookups.
        - Doubly linked list for O(1) insert/delete.
        - Move recently used node to head, evict from tail.

- **Reliable Resources**:
    - [LeetCode Official LRU Explanation](https://leetcode.com/problems/lru-cache/editorial/) ✅
    - [MIT OpenCourseWare – Hash Tables](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-spring-2008/readings/lecture-notes/) ✅ (deep dive on hashing).

---

## **10:30–12:30 (2h) → DSA Practice Set (Arrays + Strings + Linked List)**

- Suggested mix (5 problems, ~20 min each):
    1. [238. Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/) (arrays, prefix/suffix).
    2. [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/) (strings, sliding window).
    3. [141. Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/) (linked list basics).
    4. [206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/) (linked list iterative/recursive).
    5. [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/) (prefix sum + hashmap).

- **Goal**: Reinforce patterns already learned this week.

---

## **13:00–17:00 (4h) → System Design: CAP Theorem**

- **Topics**:
    - **Consistency**: all nodes see the same data at the same time.
    - **Availability**: every request receives a response, even if not the latest data.
    - **Partition tolerance**: system continues working despite network failures.
    - Real-world examples:
        - CP → HBase, MongoDB (with strong consistency).
        - AP → Cassandra, DynamoDB.

- **Reliable Resources**:
    - [CAP Theorem Explained – ACM Queue](https://queue.acm.org/detail.cfm?id=1394128) ✅
    - [System Design Primer – CAP Theorem](https://github.com/donnemartin/system-design-primer#cap-theorem) ✅

- **Activity**:
    - Draw CAP triangle diagram.
    - Write interview answer:
        - “Would you choose consistency or availability for a chat application, and why?”

---

## **20:30–23:00 (2.5h) → DSA Timed Practice**

- Pick 4–5 medium problems (timed, 25–30 min each):
    1. [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/) (two pointers).
    2. [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/) (deque).
    3. [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/) (strings + hashmap).
    4. [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/) (linked list + heap).
    5. [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/) (Kadane).

- **Goal**: Simulate interview conditions, apply learned patterns under pressure.

---

# ✅ Outcome of Day 7
- Built **LRU cache** (real-world interview classic).
- Practiced **mixed DSA set** across arrays, strings, linked list, hashmap.
- Understood **CAP theorem tradeoffs** with reliable references.
- Completed **timed DSA simulation** for interview readiness.  
