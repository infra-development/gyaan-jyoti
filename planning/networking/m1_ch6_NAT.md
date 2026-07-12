# Module 1 – Networking Foundations

# Chapter 6 – Network Address Translation (NAT)

> **"NAT allows millions of devices with private IP addresses to share a single public IP address."**

---

# Learning Objectives

After completing this chapter, you will be able to:

* Understand why NAT was invented.
* Explain the difference between private and public IP addresses.
* Follow a packet through NAT.
* Understand how replies return to the correct device.
* Learn why almost every home router performs NAT.
* Understand how OPNsense uses NAT.

---

# Table of Contents

1. Introduction
2. The IPv4 Crisis
3. Why NAT Was Invented
4. What is NAT?
5. A Family Sharing One Postal Address
6. Following a Packet
7. The NAT Table
8. Your Home Router
9. OPNsense and NAT
10. Common Misconceptions
11. Hands-on Experiments
12. Chapter Summary
13. Next Chapter

---

# 1. Introduction

Let's revisit something we learned in Chapter 2.

Your laptop might have an IP address like:

```text
192.168.1.20
```

That is a **private IP address**.

Earlier we also learned something important:

Private IP addresses **are not routed on the public Internet**.

Now think carefully.

You open YouTube.

Your laptop sends a request.

The request reaches Google.

Google sends the reply.

Question:

How does Google know where your laptop is?

Google has never heard of:

```text
192.168.1.20
```

So how does the video reach you?

To answer that,

we first need to understand a historical problem.

---

# 2. The IPv4 Crisis

In the early days of the Internet,

engineers believed

about

```text
4.3 billion
```

IPv4 addresses would be enough forever.

They were wrong.

Today,

billions of devices need Internet access.

Examples:

* Phones
* Tablets
* Laptops
* TVs
* Cameras
* Watches
* Cars
* Smart speakers
* Industrial equipment

If every device required its own public IP,

we would have run out of addresses long ago.

A temporary solution was needed.

That solution became

**NAT**.

---

# 3. Why NAT Was Invented

Imagine a large apartment building.

It contains

```
200 apartments.
```

Should every apartment have its own street address?

Not necessary.

Instead,

the building has one street address.

Inside,

every apartment has its own apartment number.

Visitors first reach the building.

The security desk then directs them to the correct apartment.

Networking works exactly the same way.

Your entire home shares one public address.

Inside,

each device has its own private address.

---

# 4. What is NAT?

**Network Address Translation (NAT)** is a process that changes the source or destination IP address of a packet as it passes through a router or firewall.

In home networks,

the most common form is:

> **Private IP → Public IP**

Before the packet leaves your home,

your router replaces the private source address with its own public address.

From the Internet's perspective,

every request appears to come from the router.

---

# 5. A Family Sharing One Postal Address

Imagine your family.

Everyone lives at:

```
101 Green Residency
Pune
```

Different family members receive different letters,

but they all share one street address.

The postal worker delivers everything to:

```
101 Green Residency
```

Then someone inside the house hands the correct letter to the correct person.

NAT performs exactly this role.

To the outside world,

there is one public IP.

Inside,

there may be dozens of private devices.

---

# 6. Following a Packet

Let's follow a real example.

Your laptop:

```text
192.168.1.20
```

Your router:

```text
Public IP

49.36.120.18
```

You open YouTube.

Step 1

Your laptop creates a packet.

```
Source

192.168.1.20

Destination

142.250.x.x
```

Step 2

The packet reaches your router.

The router performs NAT.

It changes the packet to:

```
Source

49.36.120.18

Destination

142.250.x.x
```

Notice something.

The destination didn't change.

Only the **source** changed.

Now Google replies.

Google sees:

```
49.36.120.18
```

So it sends the reply there.

The reply reaches your router.

The router remembers:

> "This conversation actually belongs to Laptop 192.168.1.20."

It changes the destination back.

```
Destination

192.168.1.20
```

The packet reaches your laptop.

All of this happens in milliseconds.

---

# 7. The NAT Table

You might wonder:

> "How does the router remember which device started the conversation?"

Excellent question.

It keeps a **NAT Table**.

A simplified example:

| Internal Device | Public Address | Destination |
| --------------- | -------------- | ----------- |
| 192.168.1.20    | 49.36.120.18   | YouTube     |
| 192.168.1.35    | 49.36.120.18   | WhatsApp    |
| 192.168.1.50    | 49.36.120.18   | Netflix     |

Notice something remarkable.

Every device shares the same public IP.

The router keeps track of each conversation and sends replies back to the correct internal device.

This is why an entire family can browse the Internet simultaneously using one public IP address.

---

# 8. Your Home Router

Today,

your Airtel router performs NAT automatically.

You rarely notice it.

Whenever a device accesses the Internet,

your router:

1. Receives the packet.
2. Replaces the private source IP with its public IP.
3. Records the conversation.
4. Sends the packet to the Internet.
5. Translates replies back to the correct private device.

Without NAT,

your home Internet connection would work very differently.

---

# 9. OPNsense and NAT

When OPNsense becomes the gateway for our lab,

it will also perform NAT.

Our lab:

```text
Ubuntu VM

192.168.56.100
```

```
Kali VM

192.168.56.101
```

```
Windows VM

192.168.56.102
```

These VMs use private IP addresses.

When they access the Internet,

OPNsense will translate their private source addresses before forwarding the packets through the WAN interface.

Later,

we'll configure these NAT rules ourselves and see exactly how they work.

---

# Curious Corner

You might ask:

> "If everyone in my house shares one public IP, how does Google know which reply belongs to which device?"

The answer is:

It doesn't.

Google sends every reply to your router's public IP.

Your router uses its NAT table (along with port numbers) to determine which internal device should receive each response.

We'll learn more about ports in a later chapter.

---

# 10. Common Misconceptions

### "NAT is a firewall."

No.

NAT changes addresses.

A firewall decides whether traffic should be allowed or blocked.

Many home routers perform both functions, which is why they're often confused.

---

### "NAT makes me anonymous."

Not completely.

NAT hides your private IP addresses from the Internet, but websites still see your public IP.

Other information can also identify or track activity.

---

### "Every network uses NAT."

No.

Some enterprise environments and IPv6 deployments operate without traditional NAT.

---

# 11. Hands-on Experiments

## Experiment 1

Open Command Prompt.

Run:

```cmd
ipconfig
```

Note your private IPv4 address.

---

## Experiment 2

Visit:

```
https://whatismyipaddress.com
```

Compare:

* Your private IP
* Your public IP

Notice they are different.

Now you know why.

---

## Experiment 3

Later,

when OPNsense is running,

we'll inspect its NAT table while browsing the web.

You'll watch new entries appear in real time as connections are created.

---

# 12. Chapter Summary

You now understand:

* Why IPv4 address exhaustion led to NAT.
* How private devices access the Internet.
* Why one public IP can serve many devices.
* How routers remember conversations.
* Why your Airtel router performs NAT.
* Why OPNsense will also perform NAT.

NAT is one of the key technologies that made the modern home Internet practical.

---

# 13. Next Chapter

We've now answered another important question:

> **How do private devices reach the Internet?**

But there's still one mystery.

When you type:

```
www.google.com
```

your computer doesn't immediately know Google's IP address.

So where does that IP address come from?

That leads us to one of the most important and fascinating services on the Internet:

# Chapter 7 – DNS (Domain Name System)

DNS is often called **"the phonebook of the Internet."**

We'll discover why that description is both useful—and incomplete.
