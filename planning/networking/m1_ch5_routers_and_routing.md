# Module 1 – Networking Foundations

# Chapter 5 – Routers and Routing

> **"A router doesn't know the entire Internet. It only knows the next step."**

---

# Learning Objectives

After completing this chapter, you will be able to:

* Understand what a router really is.
* Explain why routers exist.
* Understand what routing means.
* Learn how a router makes forwarding decisions.
* Understand the concept of the Routing Table.
* Follow a packet as it travels across multiple routers.
* Relate all of this to OPNsense.

---

# Table of Contents

1. Introduction
2. Why Routers Were Invented
3. What is a Router?
4. A Router's Job
5. The Routing Table
6. How a Router Makes Decisions
7. Journey of a Packet
8. Your Home Router
9. OPNsense as a Router
10. Common Misconceptions
11. Hands-on Experiments
12. Chapter Summary
13. Next Chapter

---

# 1. Introduction

In the previous chapter we learned something important.

When your laptop wants to communicate outside its own subnet, it sends the packet to its **Default Gateway**.

Now a new question appears.

The router receives the packet.

Then what?

How does it know where to send it?

Does it know every computer in the world?

Does it know every website?

Does it know every network?

The answer is surprisingly simple.

No.

---

# 2. Why Routers Were Invented

Imagine India had only one road.

Every city.

Every village.

Every house.

Connected to the same road.

What would happen?

Traffic would become impossible.

Now imagine a proper road system.

```
Local Road

↓

City Road

↓

State Highway

↓

National Highway
```

Suddenly,

travel becomes organized.

Networking faced exactly the same challenge.

Small local networks needed a way to communicate with other networks.

That device became the **Router**.

---

# 3. What is a Router?

A router is a device that connects **different networks** and forwards packets between them.

Notice something important.

A router does **not** connect computers.

A **switch** connects computers within the same network.

A **router** connects **different networks**.

Example:

```
Home Network

↓

Router

↓

Internet
```

Or:

```
Office Network

↓

Router

↓

Branch Office
```

---

# 4. A Router's Job

Imagine you're driving from Pune to Delhi.

At every major intersection you see signboards.

```
Delhi →

Mumbai →

Ahmedabad →
```

You don't need to know every road in India.

You only need to know the next direction.

Routers work exactly the same way.

They don't know the complete journey.

They only decide:

> **"Where should this packet go next?"**

This decision is called **routing**.

---

# 5. The Routing Table

How does the router make that decision?

It uses a **Routing Table**.

Think of the routing table as a map.

Example:

| Destination Network | Next Hop           |
| ------------------- | ------------------ |
| 192.168.56.0/24     | Directly Connected |
| 192.168.1.0/24      | Airtel Router      |
| Everything Else     | ISP                |

Notice something.

The router doesn't memorize billions of IP addresses.

It remembers **networks**.

That makes routing practical.

---

# 6. How a Router Makes Decisions

Let's say OPNsense receives a packet destined for:

```
8.8.8.8
```

The router checks its routing table.

Question:

Do I know this network?

If yes,

forward the packet accordingly.

If not,

send it to the **Default Route**.

Think of the Default Route as saying:

> "If you don't know where to go, send it to this next router."

That next router repeats the same process.

---

# 7. Journey of a Packet

Let's follow one packet.

```
Laptop

↓

OPNsense

↓

Airtel Router

↓

ISP Router

↓

Regional Router

↓

National Backbone

↓

International Backbone

↓

Google Network

↓

Google Server
```

At every step,

one router asks exactly the same question.

> "Where should I send this packet next?"

It forwards the packet.

The next router repeats the process.

Eventually,

the packet reaches its destination.

No router needs to know the entire path.

Each router only knows the **next hop**.

---

# 8. Your Home Router

Today your Airtel router performs several roles.

It is:

* Router
* Default Gateway
* DHCP Server
* Wi-Fi Access Point
* NAT Device
* Basic Firewall

That's why home routers are often called **wireless routers**.

In reality,

they combine many networking functions into one device.

---

# 9. OPNsense as a Router

In our lab,

OPNsense will become the router.

```
                Internet
                     │
              Airtel Router
                     │
                OPNsense
               /    |    \
              /     |     \
        Home LAN  Servers  Guest
```

OPNsense will maintain its own routing table.

Whenever a packet arrives,

it will:

1. Check the destination.
2. Consult the routing table.
3. Decide the next hop.
4. Forward or block the packet.

Later,

we'll add multiple subnets.

For example:

| Network         | Purpose      |
| --------------- | ------------ |
| 192.168.10.0/24 | Home Devices |
| 192.168.20.0/24 | Servers      |
| 192.168.30.0/24 | IoT          |
| 192.168.40.0/24 | Guest Wi-Fi  |

OPNsense will know how to route traffic between them.

---

# Curious Corner

You might wonder:

> "Does Google know my laptop?"

No.

Google only knows the public IP address your traffic appears to come from.

Between your laptop and Google,

many routers cooperate to move the packet.

None of them need to know everything.

Each one only makes the next forwarding decision.

This is one reason the Internet scales so well.

---

# 10. Common Misconceptions

### "A router knows the entire Internet."

False.

It only knows the routes in its routing table and, if necessary, where to send unknown traffic.

---

### "A router decides based on website names."

False.

Routers forward packets using **IP addresses**.

Names like `google.com` are converted to IP addresses earlier by DNS.

---

### "Every packet follows the same path."

Not always.

Different packets in the same conversation can take different routes depending on network conditions.

---

# 11. Hands-on Experiments

## Experiment 1

Open Command Prompt.

Run:

```cmd
tracert 8.8.8.8
```

Each line after the first represents another router forwarding your packet.

---

## Experiment 2

Run:

```cmd
route print
```

You'll see your computer's routing table.

Don't worry about every entry yet.

Simply notice that your computer also keeps a small routing table.

We'll study it later.

---

## Experiment 3

When we configure OPNsense,

we'll open its routing table and compare it with your Windows routing table.

You'll discover that both follow the same principles.

---

# 12. Chapter Summary

You now understand:

* Why routers exist.
* The difference between a switch and a router.
* What routing means.
* What a routing table is.
* How routers choose the next hop.
* Why no router needs to know the entire Internet.
* Why OPNsense is fundamentally a router.

At this point,

you've learned how a packet leaves your computer, reaches the gateway, and begins its journey across the Internet.

---

# 13. Next Chapter

So far we've learned how a packet travels.

But another mystery remains.

Your laptop uses a **private IP address** like:

```
192.168.56.100
```

The Internet cannot route private IP addresses.

So how does your laptop successfully open websites?

The answer is one of the most important technologies in networking:

# Chapter 6 – Network Address Translation (NAT)

Without NAT, most home networks as we know them today would not work.
