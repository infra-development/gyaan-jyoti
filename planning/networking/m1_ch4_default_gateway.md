# Module 1 – Networking Foundations

# Chapter 4 – Default Gateway

> **"A computer can communicate with the entire world, but the first device it talks to is almost always its default gateway."**

---

# Learning Objectives

After completing this chapter, you will be able to:

* Explain what a default gateway is.
* Understand why a default gateway exists.
* Know when a computer uses the gateway.
* Know when a computer communicates directly.
* Understand why OPNsense acts as a gateway.
* Follow the journey of a packet leaving your network.

---

# Table of Contents

1. Introduction
2. The Problem
3. A City with Many Neighborhoods
4. What is a Default Gateway?
5. How a Computer Makes a Decision
6. Communication Inside the Same Network
7. Communication Outside the Network
8. The Journey to Google
9. Your Home Network
10. Our OPNsense Lab
11. Common Misconceptions
12. Hands-on Experiments
13. Summary
14. Next Chapter

---

# 1. Introduction

In the previous chapters, we learned three important things.

First, every device on a network has an **IP address**.

Second, every IP address belongs to a **subnet**.

Third, a computer can determine whether another device is inside or outside its own subnet.

Now a new question naturally appears.

Suppose your laptop wants to send data.

Where should it send the packet?

Should it send it directly to the destination?

Or should it ask another device for help?

The answer depends entirely on **where the destination is located**.

This is where the concept of the **Default Gateway** enters the picture.

---

# 2. The Problem

Imagine you live in a housing society.

Inside the society there are many buildings.

```
Building A

Building B

Building C

Building D
```

If you want to visit someone in Building C, you simply walk there.

You do not leave the society.

Now imagine you want to travel to another city.

Walking around your own society won't help.

You first need to leave through the main gate.

Only after reaching the main road can you continue your journey.

Computer networks work in exactly the same way.

---

# 3. A City with Many Neighborhoods

Let's imagine a city.

```
                City

      ┌────────┬────────┬────────┐
      │        │        │
  Neighborhood A   Neighborhood B   Neighborhood C
```

Each neighborhood has its own internal roads.

Moving inside the neighborhood is easy.

But moving from one neighborhood to another requires using the city's road network.

The **exit point** from each neighborhood is called the **gateway**.

Networking borrowed this same idea.

Every subnet has a "way out."

That way out is called the **Default Gateway**.

---

# 4. What is a Default Gateway?

A **Default Gateway** is the device that receives packets when the destination is **outside the local subnet**.

Think of it as the main exit from your neighborhood.

It is **not** involved in every communication.

It is involved only when your computer cannot reach the destination directly.

A simple definition is:

> A Default Gateway is the router that forwards traffic from one network to another.

Later in this chapter, you'll see why this definition makes sense.

---

# 5. How a Computer Makes a Decision

Suppose your laptop has:

```
IP Address

192.168.56.100
```

Subnet Mask

```
255.255.255.0
```

Default Gateway

```
192.168.56.2
```

Now imagine you want to contact:

```
192.168.56.40
```

Your computer compares the network portions.

```
My Network

192.168.56
```

Destination Network

```
192.168.56
```

Both are identical.

Decision:

```
Send directly.
```

The gateway is not involved.

---

Now consider another destination.

```
8.8.8.8
```

Comparison:

```
My Network

192.168.56
```

Destination

```
8.8.8
```

Different network.

Decision:

```
I cannot reach this directly.

Send it to the Default Gateway.
```

Notice something important.

The computer never asks,

> "Is this Google?"

It asks only one question:

> "Is the destination inside my subnet?"

That single decision determines the entire path of the packet.

---

# 6. Communication Inside the Same Network

Suppose your network looks like this.

```
Laptop
192.168.56.100

Printer
192.168.56.40

NAS
192.168.56.50
```

All three devices belong to:

```
192.168.56.0/24
```

If your laptop prints a document:

```
Laptop
      │
      ▼
Printer
```

The packet never reaches the gateway.

It never reaches the Internet.

Everything happens locally.

This is one reason printing continues to work even if your Internet connection goes down.

---

# 7. Communication Outside the Network

Now you open YouTube.

```
Destination

142.250.x.x
```

Your laptop immediately realizes:

```
Different network.
```

The journey becomes:

```
Laptop

↓

Default Gateway

↓

Internet

↓

Google

↓

YouTube
```

The laptop does **not** know the route to Google.

It only knows the address of one important device:

**The Default Gateway.**

---

# 8. The Journey to Google

Let's follow a real packet.

You type:

```
www.google.com
```

After DNS resolves the name to an IP address, your computer begins sending packets.

The first packet travels like this:

```
Laptop

↓

Default Gateway

↓

Your ISP

↓

Regional ISP Router

↓

National Backbone

↓

International Backbone

↓

Google Network

↓

Google Server
```

Notice something.

Your laptop never learns the entire journey.

It only knows the **first hop**.

Every router after that decides the next hop.

We'll study that in the next chapter on routing.

---

# 9. Your Home Network

Your home network today probably looks like this.

```
                  Internet
                       │
                  Airtel Router
                       │
      ┌──────────┬──────────┬──────────┐
      │          │          │
   Laptop     Phone      Smart TV
```

Typical configuration:

| Device | Example      |
| ------ | ------------ |
| Router | 192.168.1.1  |
| Laptop | 192.168.1.20 |
| Phone  | 192.168.1.35 |
| TV     | 192.168.1.60 |

Every device usually has:

```
Default Gateway

192.168.1.1
```

That is your Airtel router.

Every packet leaving your home first goes there.

---

# 10. Our OPNsense Lab

Soon our virtual lab will look like this.

```
                    Internet
                         │
                    Airtel Router
                         │
                    OPNsense
                  WAN      LAN
                           │
         ┌──────────┬──────────┬──────────┐
         │          │          │
     Ubuntu VM   Kali VM   Windows VM
```

Each VM will have a configuration similar to:

| Setting         | Value          |
| --------------- | -------------- |
| IP Address      | 192.168.56.100 |
| Subnet Mask     | 255.255.255.0  |
| Default Gateway | 192.168.56.2   |

Notice something.

The VMs do **not** use the Airtel router as their gateway.

They use **OPNsense**.

This is why OPNsense can inspect, filter, log, and control all traffic leaving the virtual network.

Every packet must pass through it.

---

# 11. Common Misconceptions

### "The gateway is used for every packet."

False.

Only packets destined for another network use the gateway.

Devices in the same subnet communicate directly.

---

### "The gateway must always be connected to the Internet."

Not necessarily.

A gateway simply connects one network to another.

Whether that ultimately reaches the Internet depends on the network design.

---

### "The gateway and router are different things."

In most home networks, the default gateway is your router.

In larger networks, the gateway function may be provided by a dedicated router, firewall, or Layer 3 switch.

---

# 12. Hands-on Experiments

## Experiment 1

Open Command Prompt.

Run:

```cmd
ipconfig
```

Find:

* IPv4 Address
* Subnet Mask
* Default Gateway

Write them down.

---

## Experiment 2

Run:

```cmd
tracert 8.8.8.8
```

Observe the **first hop**.

It should usually be your default gateway.

This experiment proves that packets leave your computer by first reaching the gateway.

---

## Experiment 3

Ping another device in your home network.

Then ping:

```
8.8.8.8
```

Think about which communication stayed local and which required the gateway.

---

# 13. Chapter Summary

You now understand:

* Why a default gateway exists.
* When a computer sends packets directly.
* When it sends packets to the gateway.
* Why local communication does not require a gateway.
* Why Internet communication always begins with the gateway.
* Why OPNsense will become the gateway for every virtual machine in our lab.

The default gateway is not just another device.

It is the **bridge between your local network and every other network in the world.**

---

# 14. Next Chapter

So far we've answered:

> **When does a computer use the gateway?**

The next question is even more interesting:

> **How does the gateway know where to send the packet?**

That leads us to **Chapter 5 – Routers and Routing**, where we'll learn how routers make forwarding decisions, what a routing table is, and how a packet travels across multiple networks to reach its destination.
