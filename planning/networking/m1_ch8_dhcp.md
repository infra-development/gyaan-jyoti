# Module 1 – Networking Foundations

# Chapter 8 – DHCP (Dynamic Host Configuration Protocol)

> **"Imagine if every time a guest visited your home, you had to manually assign them a room number. DHCP is the receptionist that does this automatically."**

---

# Learning Objectives

After completing this chapter, you will understand:

* Why DHCP was invented.
* What DHCP actually does.
* How a device gets an IP address.
* The complete DHCP process (DORA).
* DHCP Lease Time.
* DHCP Reservation.
* Why home routers and OPNsense run DHCP servers.
* How DHCP fits into everything you've already learned.

---

# Table of Contents

1. Introduction
2. The Problem Before DHCP
3. What is DHCP?
4. The Hotel Reception Analogy
5. The DORA Process
6. What Information Does DHCP Provide?
7. DHCP Lease Time
8. DHCP Reservation
9. Your Home Network
10. DHCP in OPNsense
11. Common Misconceptions
12. Hands-on Experiments
13. Chapter Summary
14. Next Chapter

---

# 1. Introduction

Imagine buying a new phone.

You enter your Wi-Fi password.

A few seconds later...

Everything works.

You can browse websites.

Watch YouTube.

Send WhatsApp messages.

How did your phone learn:

* Its IP address?
* The subnet mask?
* The default gateway?
* The DNS server?

You never typed any of that.

Something else did.

That "something" is **DHCP**.

---

# 2. The Problem Before DHCP

In the early days of networking,

every computer had to be configured manually.

For each device, someone had to enter:

```text
IP Address

Subnet Mask

Default Gateway

DNS Server
```

Imagine doing this for:

* 5 devices
* 50 devices
* 500 devices
* 5,000 devices

Every new device required manual work.

Mistakes were common.

Two computers might accidentally receive the same IP address.

Networks became difficult to manage.

Engineers needed automation.

---

# 3. What is DHCP?

DHCP stands for:

**Dynamic Host Configuration Protocol**

Its job is simple:

> **Automatically configure devices when they join the network.**

Notice the word:

**Configuration**

DHCP doesn't only provide an IP address.

It usually provides several important settings.

We'll see those shortly.

---

# 4. The Hotel Reception Analogy

Imagine arriving at a hotel.

You don't choose your own room.

Instead:

```text
Guest Arrives

↓

Reception Checks Available Rooms

↓

Assigns Room

↓

Records Assignment

↓

Guest Enters Room
```

DHCP works exactly the same way.

When a device joins the network,

the DHCP server:

* Finds an available IP address.
* Assigns it.
* Records the assignment.
* Gives additional networking information.

The device can now begin communicating.

---

# 5. The DORA Process

Network engineers often remember DHCP using the word:

```text
DORA
```

It stands for:

* Discover
* Offer
* Request
* Acknowledge

Let's follow the complete conversation.

---

## Step 1 — Discover

A new laptop joins Wi-Fi.

It doesn't know anything.

No IP.

No gateway.

No DNS.

So it broadcasts:

> "Is there a DHCP server on this network?"

This message is called:

**DHCP Discover**

---

## Step 2 — Offer

The DHCP server replies:

> "Yes.

I can offer you:

```text
192.168.1.25
```

Interested?"

This message is:

**DHCP Offer**

---

## Step 3 — Request

The laptop responds:

> "Yes.

I'd like to use that address."

This message is:

**DHCP Request**

---

## Step 4 — Acknowledge

Finally,

the DHCP server replies:

> "Done.

The address is now yours."

This final message is:

**DHCP Acknowledge**

Now the laptop is ready.

The entire process usually finishes in less than a second.

---

# 6. What Information Does DHCP Provide?

Most people think DHCP only provides an IP address.

That's only part of the story.

A DHCP server typically sends:

| Setting         | Example                |
| --------------- | ---------------------- |
| IP Address      | 192.168.1.25           |
| Subnet Mask     | 255.255.255.0          |
| Default Gateway | 192.168.1.1            |
| DNS Server      | 192.168.1.1 or 8.8.8.8 |
| Lease Time      | 24 Hours (example)     |

Notice something.

Everything we've learned in previous chapters comes together here.

DHCP provides the information needed to start communicating.

---

# 7. DHCP Lease Time

Imagine checking into a hotel.

You don't receive the room forever.

You receive it for:

```text
2 days
```

Similarly,

DHCP gives an IP address for a limited time.

This is called the **Lease Time**.

For example:

```text
24 Hours
```

Before the lease expires,

the device asks:

> "May I keep this IP?"

If approved,

the lease is renewed.

If the device disappears,

the address eventually returns to the pool for someone else to use.

---

# 8. DHCP Reservation

Sometimes we want a device to always receive the same IP.

Examples:

* Printer
* NAS
* OPNsense
* Security Camera
* Home Server

Instead of manually configuring the device,

we can create a **DHCP Reservation**.

The DHCP server looks at the device's **MAC Address** and always assigns the same IP.

Example:

| MAC Address       | Reserved IP  |
| ----------------- | ------------ |
| AA:BB:CC:DD:EE:FF | 192.168.1.50 |

The device still uses DHCP,

but always receives the same address.

This combines automation with predictability.

---

# 9. Your Home Network

Today,

your Airtel router probably acts as your DHCP server.

When your phone joins Wi-Fi:

```text
Phone

↓

DHCP Discover

↓

Airtel Router

↓

DHCP Offer

↓

Phone

↓

DHCP Request

↓

Router

↓

DHCP Acknowledge
```

Within seconds,

your phone knows:

* Its IP address.
* Its subnet.
* Its gateway.
* Its DNS server.

You simply see:

> **Connected.**

---

# 10. DHCP in OPNsense

Soon,

OPNsense will become the DHCP server for our virtual lab.

Our virtual machines:

```text
Ubuntu VM

Kali VM

Windows VM
```

will all receive their settings automatically from OPNsense.

Later,

we'll configure:

* DHCP Range
* Lease Time
* Static Reservations
* DNS Options

You'll see every part of the DORA process in action.

---

# Curious Corner

You might ask:

> "How can my computer send a DHCP Discover message if it doesn't have an IP address yet?"

Excellent question.

Since it doesn't know the DHCP server's address,

it sends the first message as a **broadcast**.

Every device receives it,

but only the DHCP server responds.

This is one reason we learned about broadcast addresses earlier.

Everything connects together.

---

# 11. Common Misconceptions

### "DHCP and DNS are the same."

No.

DHCP assigns network configuration.

DNS translates names into IP addresses.

---

### "DHCP always gives the same IP."

Not necessarily.

Without a reservation,

the assigned address may change over time.

---

### "Static IPs are always better."

Not always.

Most client devices work best with DHCP.

Static addresses are usually reserved for infrastructure devices like servers, printers, and routers.

---

# 12. Hands-on Experiments

## Experiment 1

Open Command Prompt.

Run:

```cmd
ipconfig /all
```

Look for:

* DHCP Enabled
* DHCP Server
* Lease Obtained
* Lease Expires

You'll see information about your current DHCP lease.

---

## Experiment 2

Release your current IP:

```cmd
ipconfig /release
```

Then request a new one:

```cmd
ipconfig /renew
```

Watch your computer obtain a fresh DHCP lease.

---

## Experiment 3

When we configure OPNsense,

we'll watch the DHCP lease table update in real time as VMs join the network.

---

# 13. Chapter Summary

You now understand:

* Why DHCP exists.
* How devices automatically receive network settings.
* The complete DORA process.
* DHCP leases.
* DHCP reservations.
* Why your router runs a DHCP server.
* Why OPNsense will become the DHCP server for our lab.

At this point, you've learned how a device joins a network from the very beginning:

1. It gets an IP address (DHCP).
2. It learns the gateway (DHCP).
3. It learns the DNS server (DHCP).
4. It resolves names (DNS).
5. It communicates locally or through the gateway.
6. NAT translates private addresses for Internet access.
7. Routers forward packets across the Internet.

You've now seen the complete life cycle of a packet from your home network to the wider Internet.

---

# 14. Next Chapter

So far we've learned the theory.

Now it's time to connect that theory to the lab.

In the next chapter, we'll answer questions like:

* Why does VirtualBox have **NAT**, **Bridged**, **Host-Only**, and **Internal** networking?
* Why did we create **two adapters** for OPNsense?
* Which adapter is the WAN?
* Which adapter is the LAN?
* How does VirtualBox simulate real networking hardware?

This chapter will bridge everything you've learned with the practical OPNsense setup we've been building.
