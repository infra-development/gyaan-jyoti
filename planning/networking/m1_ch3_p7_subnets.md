# Module 1 – Networking Foundations

# Chapter 3 – Subnets

## Part 7 – Thinking Like a Network Engineer

> "Experienced engineers don't memorize every subnet. They recognize patterns."

---

# Learning Objectives

By the end of this chapter you will be able to:

- Quickly identify which subnet an IP address belongs to.
- Understand subnet boundaries.
- Develop intuition instead of relying on formulas.
- Prepare for designing your own OPNsense networks.

---

# 1. Stop Looking at Individual Addresses

Beginners often look at an IP address like this:

```
192.168.56.143
```

Experienced engineers look at it differently.

They immediately ask:

> **"Which range does this address belong to?"**

Networking is really about **ranges**, not isolated addresses.

---

# 2. Think of Hotel Floors

Imagine a hotel.

```
Rooms 1–100

↓

Floor 1
```

```
Rooms 101–200

↓

Floor 2
```

```
Rooms 201–300

↓

Floor 3
```

If someone says,

> "Room 157"

you don't inspect every room.

You instantly know:

> "Second floor."

Subnetting works exactly the same way.

---

# 3. Understanding Ranges

Suppose we have

```
192.168.56.0/26
```

Earlier we learned

a `/26` contains

```
64 addresses.
```

Instead of memorizing individual addresses,

remember the ranges.

```
0 – 63
```

```
64 – 127
```

```
128 – 191
```

```
192 – 255
```

Notice something.

Every range contains

```
64 addresses.
```

---

# 4. Finding the Correct Range

Suppose someone gives you

```
192.168.56.143
```

Ignore everything except

```
143
```

Now ask:

Which range contains

```
143?
```

```
0–63

No
```

```
64–127

No
```

```
128–191

Yes
```

Immediately,

you know the subnet begins at

```
192.168.56.128
```

and ends at

```
192.168.56.191
```

No binary.

No calculator.

Just pattern recognition.

---

# 5. Another Example

Consider

```
192.168.56.70/26
```

Look only at

```
70
```

Which range?

```
0–63

No
```

```
64–127

Yes
```

Therefore

Network

```
192.168.56.64
```

Broadcast

```
192.168.56.127
```

First Host

```
192.168.56.65
```

Last Host

```
192.168.56.126
```

Done.

---

# 6. Why This Works

Remember our housing society.

Every time we divided it,

we created equal-sized sections.

Networking works exactly the same way.

A `/26` always creates groups of

```
64 addresses.
```

A `/27` always creates groups of

```
32 addresses.
```

A `/28` always creates groups of

```
16 addresses.
```

The only thing that changes is the size of the group.

The thinking process stays the same.

---

# 7. Common Subnet Sizes

You don't need to memorize every possible subnet.

Start with the most common ones.

| CIDR | Addresses per Subnet | Common Use |
|------|----------------------:|------------|
| /24 | 256 | Home networks, small offices |
| /25 | 128 | Dividing one LAN into two |
| /26 | 64 | Small departments |
| /27 | 32 | Small teams or labs |
| /28 | 16 | Infrastructure devices |
| /29 | 8 | Small point-to-point or management networks |
| /30 | 4 | Traditional router-to-router links |

Later you'll see these repeatedly in enterprise networks.

---

# 8. Our Future OPNsense Design

Let's imagine our completed home lab.

```
                    Internet
                         │
                    OPNsense
                         │
        ┌──────────┬──────────┬──────────┬──────────┐
        │          │          │          │
     Home LAN    Servers     IoT      Guest Wi-Fi
     /24         /26         /27        /25
```

Each network has a purpose.

The sizes are chosen based on the number of devices expected.

For example:

**Home LAN**

```
Many laptops

Phones

TVs

Tablets
```

Needs more addresses.

A `/24` makes sense.

---

**Servers**

```
NAS

Ubuntu

Docker

Monitoring

Git Server
```

Only a handful of devices.

A `/26` or `/27` is usually enough.

---

**Guest Wi-Fi**

Visitors come and go.

A `/25` provides plenty of room without exposing your internal systems.

---

**IoT**

```
Camera

Doorbell

Smart Plug

Lights
```

A `/27` or `/28` is often sufficient.

Notice something important.

We are no longer choosing subnet sizes randomly.

We choose them based on the purpose of the network.

That is how real networks are designed.

---

# 9. Designing Before Configuring

One mistake beginners make is opening OPNsense first.

Experienced engineers do the opposite.

First they design the network on paper.

Example:

```
Home

192.168.10.0/24
```

```
Servers

192.168.20.0/26
```

```
IoT

192.168.30.0/27
```

```
Guest

192.168.40.0/25
```

Only after the design is complete do they configure the firewall.

Planning comes before implementation.

---

# 10. What You've Learned

Let's pause for a moment.

Think back to the beginning of Chapter 3.

At first,

a subnet looked mysterious.

Now you know that:

- A subnet is simply a smaller network.
- A subnet mask tells a computer how to interpret an IP address.
- Every subnet has a network address, host addresses, and a broadcast address.
- CIDR notation is just a shorthand.
- Large networks are divided into smaller ones for performance, security, and management.
- Real network design starts with planning.

You've gone from seeing subnetting as a mathematical exercise to seeing it as a way of organizing networks.

That's exactly the goal.

---

# Chapter Summary

Congratulations!

You have completed one of the most important chapters in networking.

You now understand:

✓ Why subnetting exists.

✓ What subnet masks do.

✓ Why `/24`, `/25`, `/26` and other CIDR values exist.

✓ How network and broadcast addresses work.

✓ How to recognize subnet ranges.

✓ How to choose subnet sizes based on real requirements.

Most importantly,

you've learned to think like a network designer rather than someone memorizing formulas.

---

# Looking Ahead

Now imagine your laptop wants to contact a server in another subnet.

Your laptop realizes:

> "That destination is not in my network."

A new question appears.

> **Where should I send the packet now?**

That question introduces the next chapter:

# Chapter 4 – The Default Gateway

This is where we'll finally understand the true purpose of your Airtel router today—and why OPNsense will become the gateway for every device in your home lab.