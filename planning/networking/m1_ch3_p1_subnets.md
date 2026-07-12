# Module 1 – Networking Foundations

# Chapter 3 – Subnets

## Part 1 – Why Subnets Exist

> "Every great networking technology was invented to solve a problem. Before learning what a subnet is, let's first understand the problem it solved."

---

# Learning Objectives

After reading this part, you will understand:

- Why subnetting was invented
- What problems large networks create
- Why one huge network is a bad idea
- What a subnet actually is
- How subnetting relates to your home network
- Why OPNsense relies heavily on subnets

---

# Table of Contents

1. Introduction
2. The City That Became Too Big
3. The Problem With One Giant Network
4. The Birth of Subnetting
5. What is a Subnet?
6. Why Smaller Networks Are Better
7. Your Home Network Today
8. Our Future OPNsense Lab
9. Summary

---

# 1. Introduction

In Chapter 2 we learned that every device receives an IP address.

Imagine we now have a company with:

- 5 computers

Easy.

Now imagine:

- 500 computers

Still manageable.

Now imagine:

- 50,000 computers

Would you put every single device into one network?

Almost certainly not.

Why?

Let's discover.

---

# 2. The City That Became Too Big

Imagine an enormous city.

Everyone lives in one giant neighborhood.

No sectors.

No blocks.

No streets.

No apartment complexes.

Just one massive area.

Now imagine the police receive a call.

> "Please send an officer to House 14."

The officer asks,

"Which area?"

The reply is,

"There are no areas."

Finding anything becomes difficult.

Now imagine another city.

```
City

├── Sector A

├── Sector B

├── Sector C

└── Sector D
```

Suddenly,

everything becomes easier.

Each sector is smaller.

More organized.

Easier to manage.

Networking has exactly the same problem.

---

# 3. The Problem With One Giant Network

Imagine every device in your company belongs to one network.

```
Laptop 1

Laptop 2

Laptop 3

Printer

Camera

Server

Phone

Smart TV

NAS

Switch

More laptops...

Hundreds more...

Thousands more...
```

Everything belongs to one network.

At first this sounds convenient.

It isn't.

Several problems appear.

---

## Problem 1 — Too Much Noise

Imagine standing in a room.

One person speaks.

Everyone hears.

Now imagine 5,000 people speaking.

Nobody can concentrate.

Computer networks experience something similar.

Some network messages are intended for **every device**.

As the network grows,

the amount of unnecessary traffic also grows.

This wastes bandwidth and processing power.

---

## Problem 2 — Hard to Manage

Suppose someone says,

"The Finance printer isn't working."

Which printer?

Where is it?

Who owns it?

If every department shares one enormous network,

organization becomes difficult.

---

## Problem 3 — Security

Imagine Finance and Human Resources.

Should HR computers freely communicate with Finance servers?

Probably not.

Different departments often need different security policies.

One giant network makes that difficult.

---

## Problem 4 — Troubleshooting

A problem occurs somewhere.

Question:

Which department?

Which floor?

Which building?

If everything belongs to one network,

finding problems takes longer.

---

# Think About It

Imagine your entire city has

only one postal code.

Would that make deliveries easier?

No.

Postal codes divide large areas into smaller, manageable sections.

Subnets do exactly the same thing.

---

# 4. The Birth of Subnetting

Network engineers realised something important.

Instead of building

```
One Huge Network
```

why not build

```
Many Small Networks
```

Each smaller network becomes easier to:

- Manage
- Secure
- Troubleshoot
- Expand

That simple idea became

**Subnetting**.

---

# 5. What is a Subnet?

A subnet is simply

> **a smaller network created by dividing a larger network.**

Think about an apartment building.

```
Building

↓

Floor

↓

Apartment
```

The building is easier to manage because it is divided.

Subnetting works the same way.

Instead of

```
One giant network
```

we create

```
Office Network

↓

HR

↓

Finance

↓

Engineering

↓

Sales
```

Each department receives its own subnet.

---

# 6. Why Smaller Networks Are Better

Subnetting gives us several advantages.

---

## Better Performance

Less unnecessary traffic.

Devices communicate more efficiently.

---

## Better Security

Different departments can have different firewall rules.

Example:

Finance

↓

Only Finance employees can access Finance servers.

---

## Easier Troubleshooting

Instead of checking

100,000 devices,

you check one subnet.

---

## Better Organization

Instead of one enormous network,

everything has structure.

Exactly like folders on a computer.

---

# Real World Example

Imagine a university.

Instead of one network,

it creates:

```
Student Network

Faculty Network

Research Network

Library Network

Guest Wi-Fi
```

Every network has different rules.

Students cannot accidentally access payroll servers.

Guests cannot access research computers.

This is possible because of subnetting.

---

# 7. Your Home Network Today

Your current home network probably looks like this.

```
192.168.1.x

───────────────

Laptop

Phone

TV

Printer

Camera

Router
```

Everything belongs to one subnet.

For a home,

this is perfectly fine.

---

# 8. Our Future OPNsense Lab

Our lab will eventually become much more interesting.

```
Internet

↓

OPNsense

├── Home Devices

├── Servers

├── Security Lab

├── Guest Wi-Fi

└── IoT Devices
```

Each of these will become its **own subnet**.

Why?

Because they have different purposes.

Later,

we'll create firewall rules like:

```
Guest Wi-Fi

↓

Internet

✓ Allowed

↓

NAS

✗ Blocked
```

Without subnetting,

this becomes much harder.

---

# Chapter Summary

You now understand:

✓ Why subnetting was invented.

✓ Why one huge network is inefficient.

✓ Why engineers divide networks.

✓ What a subnet actually is.

✓ Why enterprises use many subnets.

✓ Why OPNsense depends heavily on subnetting.

Most importantly,

you understand **the problem** before learning the technical solution.

---

# Coming Next

Now that we know **why subnets exist**, the next question is:

> **How does a computer know which devices belong to its own subnet and which are somewhere else?**

That answer introduces one of the most misunderstood topics in networking:

**Subnet Masks**.