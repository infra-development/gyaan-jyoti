# Module 1 – Networking Foundations

# Chapter 3 – Subnets

## Part 5 – Understanding Subnetting Without Mathematics

> "Subnetting is nothing more than dividing a large neighborhood into smaller neighborhoods."

---

# Learning Objectives

After reading this chapter you will understand:

- Why subnetting is simply dividing a network
- Why every division creates two smaller networks
- Why subnet sizes always follow powers of two
- Why /25 has 128 addresses
- Why /26 has 64 addresses
- Why /27 has 32 addresses

Without memorizing a single formula.

---

# 1. Let's Forget Computers

Imagine you own a large piece of land.

```
+------------------------------------------------------+
|                                                      |
|                 Entire Housing Society               |
|                                                      |
+------------------------------------------------------+
```

This society contains

```
256 houses
```

Everything is together.

One entrance.

One security gate.

One management office.

One electricity meter.

One water supply.

Life is simple.

But then...

The society grows.

---

# 2. The Society Becomes Too Big

Now imagine

```
256 families
```

live inside.

Problems begin.

People complain.

```
Too much traffic.

Too much noise.

Too many visitors.

Too difficult to manage.
```

The committee decides

"We should divide the society."

Excellent idea.

But how?

---

# 3. First Division

The easiest solution is

split it exactly in half.

```
Before

+---------------------------+
|         256 Houses        |
+---------------------------+
```

After

```
+-------------+-------------+
|             |             |
|   128       |    128      |
|             |             |
+-------------+-------------+
```

Nothing complicated happened.

We simply divided one large area into two smaller ones.

Networking does exactly the same thing.

---

# 4. Second Division

Suppose one section grows too large.

Again,

split it into two.

```
128

↓

64

+

64
```

Now we have

```
64

64

128
```

Again,

no mathematics.

Only division.

---

# 5. Third Division

Continue.

```
64

↓

32

+

32
```

Again.

```
32

↓

16

+

16
```

Every time,

the number becomes half.

---

# 6. A Pattern Appears

Let's write what happened.

```
256

↓

128

↓

64

↓

32

↓

16

↓

8

↓

4

↓

2
```

Notice something.

Every subnet size is simply

half of the previous one.

That's why networking always uses numbers like

```
256

128

64

32

16

8

4

2
```

Not because engineers love these numbers.

Because every division naturally halves the available addresses.

---

# 7. Returning to Networking

Remember our subnet

```
192.168.56.0/24
```

Earlier we learned it contains

```
256 addresses.
```

Now suppose we divide it into two equal parts.

Immediately we obtain

```
128 addresses

+

128 addresses
```

Networking calls this

```
/25
```

Nothing magical happened.

We simply divided one network into two.

---

# 8. Divide Again

Take one of those

128-address networks.

Split it again.

```
128

↓

64

+

64
```

Networking calls this

```
/26
```

Again,

just another division.

---

# 9. Continue Dividing

```
64

↓

32
```

↓

```
/27
```

---

```
32

↓

16
```

↓

```
/28
```

---

```
16

↓

8
```

↓

```
/29
```

---

```
8

↓

4
```

↓

```
/30
```

Suddenly,

all those mysterious subnet sizes become obvious.

---

# 10. Why Does Networking Always Divide Into Two?

Excellent question.

Because computers store information using binary.

Binary has only two values.

```
0

1
```

Every time we borrow one additional bit for the network,

we create exactly

```
2 possibilities.
```

Therefore,

every subnet division naturally creates

```
Two new subnets.
```

Not three.

Not five.

Always two.

We'll see the binary explanation later.

For now,

just remember:

Binary causes subnetting to split into halves.

---

# 11. Our OPNsense Example

Suppose our LAN starts as

```
192.168.56.0/24
```

Later we decide

Guests should not access our servers.

Instead of keeping everything together,

we split.

```
Before

192.168.56.0/24

Everything
```

Later

```
Home

192.168.56.0/25
```

Guest

```
192.168.56.128/25
```

Exactly like dividing a housing society into two wings.

Both are easier to manage.

---

# 12. Think About It

Imagine a company has

```
512 computers.
```

Would you create

one enormous network?

Or would you divide it into

smaller departments?

Now you're beginning to think like a network architect.

---

# Chapter Summary

You now understand:

✓ Subnetting is simply dividing a large network.

✓ Every division creates two smaller networks.

✓ Every new subnet is half the previous size.

✓ That's why subnet sizes become

```
256

128

64

32

16

8

4

2
```

✓ These numbers come naturally from repeatedly dividing by two.

Most importantly,

you no longer need to memorize subnet sizes.

You understand where they come from.

---

# Coming Next

Now we'll answer one of the most practical questions in networking.

Given this subnet

```
192.168.56.0/26
```

How do we find

- Network Address
- First Host
- Last Host
- Broadcast Address

without using an online subnet calculator?

By the end of the next chapter,

you'll be able to calculate them manually in just a few seconds.