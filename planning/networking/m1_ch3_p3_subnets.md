# Module 1 – Networking Foundations

# Chapter 3 – Subnets

## Part 3 – Why is the Subnet Mask 255.255.255.0?

> "255 is not a magic number. It is simply the largest number that can be represented using 8 bits."

---

# Table of Contents

1. The Mystery of 255
2. Computers Think in Binary
3. Understanding a Single Bit
4. From 1 Bit to 8 Bits
5. Why 255 is the Maximum
6. What Does 255 Mean in a Subnet Mask?
7. Understanding /24
8. Real Examples
9. Summary

---

# 1. The Mystery of 255

By now you've probably seen subnet masks like:

```
255.255.255.0
```

Almost every networking tutorial simply says:

> "That's the subnet mask."

But nobody explains why.

Where did **255** come from?

Why not

```
500
```

or

```
999
```

The answer lies inside the computer.

---

# 2. Computers Think in Binary

We already learned that computers only understand two electrical states.

```
OFF

ON
```

Networking represents these as

```
0

1
```

Every number inside a computer is ultimately stored using combinations of these two values.

Example

```
01010110

11110000

00001111
```

These may look strange.

Don't panic.

They're simply another way of writing numbers.

---

# 3. Understanding a Single Bit

A **bit** is the smallest unit of information a computer can store.

A single bit has only two possible values.

```
0

or

1
```

Imagine a light switch.

```
OFF

↓

0
```

```
ON

↓

1
```

That's exactly how computers store information.

One switch.

Two possibilities.

---

# 4. From 1 Bit to 8 Bits

Now imagine eight switches instead of one.

```
0 0 0 0 0 0 0 0
```

Every switch can be

```
0

or

1
```

That creates many different combinations.

Example

```
00000000

00000001

00000010

00000011

...

11111111
```

Each combination represents a different number.

This group of eight bits is called an **octet**.

Remember from Chapter 2?

Every IPv4 address contains four octets.

---

# 5. Why 255 is the Maximum

Let's look at the smallest possible value.

```
00000000
```

This equals

```
0
```

Now look at the largest possible value.

```
11111111
```

This equals

```
255
```

Why?

Because 8 bits can represent exactly

```
256 different values
```

Those values range from

```
0

to

255
```

Notice something interesting.

There are **256 possible values**, but the highest number is **255**, because counting starts from zero.

Just like:

```
Floor numbers

0

1

2

3
```

Four floors,

but the highest number is 3.

---

# Curious Corner

Why doesn't counting begin with 1?

Because computers naturally represent

```
00000000
```

as the first possible value.

That pattern corresponds to zero.

So computers count

```
0

1

2

3

...
```

rather than

```
1

2

3

4
```

This idea appears throughout computing, not just networking.

---

# 6. What Does 255 Mean in a Subnet Mask?

Now we can finally answer the question.

Suppose the subnet mask is

```
255.255.255.0
```

Think of it like this.

```
255

↓

11111111
```

Every **1** means

> "This part belongs to the network."

Now look at the last octet.

```
0

↓

00000000
```

Every **0** means

> "This part belongs to the host."

So the subnet mask

```
255.255.255.0
```

really means

```
11111111

11111111

11111111

00000000
```

Which becomes

```
Network

Network

Network

Host
```

Suddenly,

the mask doesn't look mysterious anymore.

It's simply a pattern.

---

# 7. Understanding /24

Networking has a shorter way to write subnet masks.

Instead of

```
255.255.255.0
```

we often write

```
/24
```

Why 24?

Count the number of ones.

```
11111111

11111111

11111111

00000000
```

Each row contains

```
8 ones
```

Three rows give

```
8 + 8 + 8 = 24
```

Therefore

```
255.255.255.0

=

/24
```

Nothing magical happened.

We simply counted the ones.

---

# Another Example

Suppose we have

```
255.255.0.0
```

Binary becomes

```
11111111

11111111

00000000

00000000
```

How many ones?

```
8

+

8

=

16
```

Therefore

```
255.255.0.0

=

/16
```

Exactly the same idea.

---

# 8. Real Examples

Example 1

```
IP Address

192.168.56.100

Mask

255.255.255.0

CIDR

/24
```

Network portion

```
192.168.56
```

Host portion

```
100
```

---

Example 2

```
10.20.30.40

255.255.0.0

/16
```

Network

```
10.20
```

Host

```
30.40
```

---

Example 3

```
172.16.50.100

255.255.255.0

/24
```

Network

```
172.16.50
```

Host

```
100
```

---

# Think About It

Suppose I write

```
192.168.100.20/24
```

Without performing any calculations,

can you identify:

- Network part

- Host part

You probably can.

That's because you're beginning to think like a network engineer.

---

# Summary

You now understand

✓ Why subnet masks use 255.

✓ Why every octet ranges from 0 to 255.

✓ What binary has to do with subnetting.

✓ Why /24 equals 255.255.255.0.

✓ Why /16 equals 255.255.0.0.

Most importantly,

you no longer need to memorize these values.

You understand **where they come from**.

---

# Coming Next

Now that we know how to read a subnet mask,

we'll answer the next important questions.

- What is a Network Address?
- What is a Host Address?
- What is a Broadcast Address?
- Why can't they be assigned to computers?
- How many usable devices can exist in a subnet?

These concepts complete the foundation of subnetting and prepare us for routing, gateways, and OPNsense configuration.