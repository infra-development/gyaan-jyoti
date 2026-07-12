# Module 1 – Networking Foundations

# Chapter 3 – Subnets

## Part 2 – Understanding Subnet Masks

> "A subnet mask doesn't create a network. It simply tells a computer where the network ends and where the devices begin."

---

# Table of Contents

1. The Next Question
2. Why Can't a Computer Guess?
3. Network Address vs Host Address
4. What is a Subnet Mask?
5. Reading an IP Address
6. The Apartment Building Analogy
7. Why We Need the Mask
8. Summary

---

# 1. The Next Question

In the previous chapter we learned something important.

A large network is divided into many smaller networks called **subnets**.

Now imagine two computers.

```
Computer A

192.168.1.10
```

```
Computer B

192.168.1.25
```

Question:

How does Computer A know whether Computer B belongs to the same network?

The answer is:

**It cannot know from the IP address alone.**

It needs one more piece of information.

That information is called the **Subnet Mask**.

---

# 2. Why Can't a Computer Guess?

Look at these addresses.

```
192.168.1.10

192.168.1.25
```

They look similar.

Now look at these.

```
192.168.1.10

192.168.2.10
```

These also look similar.

What about these?

```
10.1.50.20

10.1.60.30
```

Which pairs belong to the same network?

As humans we may guess.

A computer never guesses.

Computers follow rules.

To follow those rules,

they need something called a subnet mask.

---

# 3. Network Address vs Host Address

Every IPv4 address actually contains **two pieces of information**.

```
Network

+

Host
```

Think of your postal address.

```
India

↓

Gujarat

↓

Palanpur

↓

House No. 25
```

Some parts describe the **area**.

One part identifies the **house**.

IP addresses work exactly the same way.

Example:

```
192.168.56.100
```

Part of this identifies the network.

The remaining part identifies the specific device.

But...

How does the computer know where to split it?

That's exactly what the subnet mask tells it.

---

# 4. What is a Subnet Mask?

A subnet mask is simply a set of instructions.

It tells every computer:

> "These bits identify the network."

and

> "These remaining bits identify the host."

It does **not** assign IP addresses.

It does **not** create networks.

It only explains how to interpret an IP address.

Think of it as a ruler.

A ruler doesn't build a table.

It simply tells you where to measure.

Similarly,

a subnet mask tells the computer where to divide an IP address.

---

# 5. Reading an IP Address

Let's look at a common example.

IP Address

```
192.168.56.100
```

Subnet Mask

```
255.255.255.0
```

For now,

don't worry about why the mask contains those numbers.

Just observe the result.

The computer interprets it like this.

```
192.168.56 | 100

Network      Host
```

Everything before the split belongs to the network.

Everything after the split identifies one device.

Another example.

```
192.168.56.20
```

Same subnet mask.

```
255.255.255.0
```

The computer sees

```
192.168.56 | 20
```

Same network.

Different host.

Therefore,

both devices belong to the same subnet.

---

# 6. The Apartment Building Analogy

Imagine an apartment complex.

```
Building A

↓

Floor 3

↓

Apartment 307
```

The building identifies the location.

The apartment number identifies one family.

Networking works the same way.

```
Network

↓

Host
```

The network tells you **which neighbourhood**.

The host tells you **which house**.

Without both,

delivery becomes impossible.

---

# 7. Why We Need the Mask

Let's compare two examples.

### Example 1

```
192.168.56.100
```

Mask

```
255.255.255.0
```

Network becomes

```
192.168.56
```

Host becomes

```
100
```

---

### Example 2

```
192.168.57.100
```

Mask

```
255.255.255.0
```

Network becomes

```
192.168.57
```

Now notice something.

The hosts are both **100**.

But the networks are different.

```
192.168.56

≠

192.168.57
```

Therefore,

they belong to different subnets.

If these two computers want to communicate,

they usually need a **router**.

We'll learn why in a later chapter.

---

# Curious Corner

You might wonder:

Why is the subnet mask

```
255.255.255.0
```

instead of

```
192.168.1.0
```

Excellent question.

The subnet mask is **not another address**.

It doesn't identify a computer.

It doesn't identify a network.

Instead,

it is a mathematical pattern that tells the computer how to split an IP address.

We'll uncover exactly how that works in the next part when we learn binary and CIDR notation.

---

# Think About It

Suppose you have two devices.

```
192.168.56.10

192.168.56.200
```

Using the subnet mask

```
255.255.255.0
```

Ask yourself:

Do they belong to the same network?

Don't calculate.

Simply look at the network portion.

You'll probably realise they do.

That's exactly how networking intuition develops.

---

# Chapter Summary

You now understand:

✓ Every IP address contains two parts.

✓ Network portion.

✓ Host portion.

✓ A subnet mask tells the computer where to split the address.

✓ Without a subnet mask,

a computer cannot determine whether another device is local or remote.

Most importantly,

you now understand **what a subnet mask is trying to accomplish**, before worrying about binary or calculations.

---

# Coming Next

Now we'll answer the question that almost every beginner asks.

> Why is the subnet mask written as

```
255.255.255.0
```

What does **255** actually mean?

And how does that relate to

```
/24
```

Once you understand that,

CIDR notation will feel almost obvious.