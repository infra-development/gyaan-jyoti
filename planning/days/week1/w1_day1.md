# 📅 Week 1 – Day 1 (Monday)
**Focus**: Arrays → Two Pointers, Sliding Window, Kadane’s Algorithm, Subarray Sum with Hashing  
**Time**: 07:30 – 10:00 (2.5h)

---

## **07:30–07:40 (10 min) → Warm-up**
- Problem: [344. Reverse String](https://leetcode.com/problems/reverse-string/)
- **Goal**: Get comfortable with **array traversal + swapping**.
- **Theory if stuck**: Basics of arrays, how indices work, swapping elements.

---

## **07:40–08:10 (30 min) → Two Pointers Basics**
1. [167. Two Sum II – Input array is sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
    - **Goal**: Learn **two-pointer technique** on sorted arrays.
    - **Theory if stuck**: Why binary search isn’t the best here; how left/right pointer movement works.

2. [283. Move Zeroes](https://leetcode.com/problems/move-zeroes/)
    - **Goal**: Practice **in-place array manipulation** using two pointers.
    - **Theory if stuck**: Difference between “read pointer” and “write pointer.”

---

## **08:10–08:50 (40 min) → Sliding Window**
1. [643. Maximum Average Subarray I](https://leetcode.com/problems/maximum-average-subarray-i/)
    - **Goal**: Understand **fixed-size sliding window**.
    - **Theory if stuck**: Window sum update = add right element, remove left element.

2. [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
    - **Goal**: Master **variable-size sliding window** with a set/hashmap.
    - **Theory if stuck**: How to expand/shrink the window to maintain conditions.

---

## **08:50–09:30 (40 min) → Kadane’s Algorithm**
1. [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)
    - **Goal**: Learn **Kadane’s Algorithm** for max subarray sum.
    - **Theory if stuck**: `max_ending_here = max(current element, current + previous best)`.

2. [918. Maximum Sum Circular Subarray](https://leetcode.com/problems/maximum-sum-circular-subarray/)
    - **Goal**: Extend Kadane’s to **circular arrays**.
    - **Theory if stuck**: Trick = `max_sum = max(normal_kadane, total_sum - min_subarray_sum)`.

---

## **09:30–09:55 (25 min) → Subarray Sum with Hashing**
1. [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)
    - **Goal**: Apply **prefix sums + hashmap** for subarray problems.
    - **Theory if stuck**: Prefix sum = running sum; check if `(current_sum - k)` exists.

2. (Optional if time) [525. Contiguous Array](https://leetcode.com/problems/contiguous-array/)
    - **Goal**: Practice prefix sum + hashmap in a **binary array** setting.
    - **Theory if stuck**: Store running balance of 0s/1s.

---

## **09:55–10:00 (5 min) → Wrap-up**
- Write short notes:
    - Two pointers → shrink/grow array efficiently.
    - Sliding window → reuse previous computation by adding/removing edges.
    - Kadane → running max subarray sum.
    - Prefix sum + hashmap → detect subarrays with conditions.

---

# ✅ Outcome of Day 1
- 6–7 problems solved.
- Understood **why** each technique matters in interviews.
- Quick notes prepared for **Friday review session**.  
