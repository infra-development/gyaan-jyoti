# 📅 Week 1 – Day 3 (Wednesday, WFH)

---

## **07:30–10:00 (2.5h) → Hashing Problems**

1. [1. Two Sum](https://leetcode.com/problems/two-sum/)
    - **Goal**: Learn to use hashmap for complement lookup.
    - **Theory if stuck**: Store index of each number, check if `target - num` exists.

2. [387. First Unique Character in a String](https://leetcode.com/problems/first-unique-character-in-a-string/)
    - **Goal**: Frequency map for character counts.
    - **Theory if stuck**: Use hashmap/array to store counts, then scan string.

3. [451. Sort Characters By Frequency](https://leetcode.com/problems/sort-characters-by-frequency/)
    - **Goal**: Frequency counting + sorting by count.
    - **Theory if stuck**: Hashmap for freq, sort entries by value.

4. [128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)
    - **Goal**: Practice set-based lookups to achieve O(n).
    - **Theory if stuck**: Use set, only expand sequence from numbers that are sequence “starts.”

---

## **10:30–12:30 (2h) → System Design Fundamentals**

- **Topic**: Client-Server Model & REST APIs
- **Learning Goals**:
    - Understand how clients interact with servers.
    - Learn request/response lifecycle (HTTP basics).
    - Difference between **stateless REST API** vs stateful server.

- **Reliable Resources**:
    - [MDN Web Docs – Client-Server Overview](https://developer.mozilla.org/en-US/docs/Learn/Server-side/First_steps/Client-Server_overview) ✅ (Mozilla official)
    - [REST API Tutorial](https://restfulapi.net/) ✅ (industry standard reference site, widely cited in books/blogs)
    - (Optional depth) [Roy Fielding’s original REST Dissertation, Chapter 5](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm) ✅ (REST creator)

- **Activity**:
    - Draw request/response flow (Client → Load Balancer → API Server → DB).
    - Write down pros/cons of REST vs SOAP.

---

## **21:00–23:00 (2h) → System Design: Load Balancers**

- **Topic**: Horizontal vs Vertical Scaling + Load Balancing
- **Learning Goals**:
    - Why load balancers are needed (availability + distribution).
    - Difference: vertical (bigger machines) vs horizontal (more machines).
    - Algorithms: Round robin, least connections, consistent hashing.

- **Reliable Resources**:
    - [System Design Primer – Load Balancers](https://github.com/donnemartin/system-design-primer#load-balancer) ✅ (most popular open-source repo for system design)
    - [NGINX Load Balancing Guide](https://www.nginx.com/resources/glossary/load-balancing/) ✅ (official NGINX docs, industry-standard tool)

- **Activity**:
    - Draw scaling diagram (1 server → multiple servers + LB in front).
    - Write 2 interview answers:
        - “How would you scale a website with growing traffic?”
        - “When would you use horizontal scaling vs vertical scaling?”

---

# ✅ Outcome of Day 3
- Solved **4 hashing-based problems** (complement, frequency, sorting, set usage).
- Learned **client-server model + REST APIs** from MDN/Fielding REST dissertation.
- Understood **load balancers + scaling tradeoffs** from System Design Primer + NGINX official docs.  
