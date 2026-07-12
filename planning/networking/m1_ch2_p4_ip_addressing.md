# Module 1 – Networking Foundations

# Chapter 2 – IP Addressing

## Part 4 – Public IP, Private IP, DHCP and Special IP Addresses

> "Knowing an address is useful. Knowing where that address can be used is even more important."

---

# Table of Contents

1. Why Not Give Every Device a Public IP?
2. Public IP Addresses
3. Private IP Addresses
4. The Three Private IP Ranges
5. Static vs Dynamic IP Addresses
6. DHCP – The Automatic Address Manager
7. Special IP Addresses
8. Your Home Network Explained
9. Our OPNsense Lab
10. Common Misconceptions
11. Hands-on Experiments
12. Complete Chapter Summary

---

# 1. Why Not Give Every Device a Public IP?

Imagine your home has:

- 2 Laptops
- 4 Phones
- 2 Smart TVs
- 3 Security Cameras
- 1 Printer
- 1 NAS
- 1 Tablet
- 2 Smart Speakers

That's already **16 devices**.

Now imagine every house in the world doing the same.

There simply aren't enough IPv4 addresses.

Remember from Part 3:

IPv4 provides approximately

```
4.3 Billion Addresses
```

Today's world contains **tens of billions** of connected devices.

Engineers had a problem.

How can billions of devices communicate using only four billion addresses?

The solution was surprisingly clever.

Instead of giving every device a public address,

we'll give every **home** one public address.

Inside the home,

devices can use private addresses.

---

# 2. Public IP Addresses

A Public IP Address is visible on the Internet.

It is assigned by your Internet Service Provider (ISP).

Example:

```
49.xxx.xxx.xxx
```

or

```
103.xxx.xxx.xxx
```

Your router receives this address.

The entire Internet knows how to reach it.

Think of it like this.

```
Internet
      │
      │
Public IP
      │
Home Router
```

Whenever someone on the Internet communicates with your home,

they first communicate with your Public IP.

---

# 3. Private IP Addresses

Inside your house,

your devices do NOT normally use Public IP addresses.

Instead they use Private IP addresses.

Examples:

```
192.168.1.15

192.168.1.20

192.168.1.45
```

These addresses exist only inside your home network.

The Internet cannot directly reach them.

Think of a hotel.

The hotel has one public street address.

Inside,

every room has its own room number.

```
Hotel Address
     │
     │
Room 101

Room 102

Room 103
```

People outside know the hotel.

People inside know the room numbers.

Networking works the same way.

---

# 4. The Three Private IP Ranges

Engineers reserved three ranges specifically for private networks.

### Range 1

```
10.0.0.0

↓

10.255.255.255
```

Very large.

Often used by enterprises.

---

### Range 2

```
172.16.0.0

↓

172.31.255.255
```

Medium-sized.

Used by many companies.

---

### Range 3

```
192.168.0.0

↓

192.168.255.255
```

Most common in homes.

Your Airtel router probably uses

```
192.168.1.x
```

Our OPNsense lab will use

```
192.168.56.x
```

Notice we deliberately chose a different subnet to avoid conflicts.

---

# Curious Corner

Why specifically:

```
10

172

192.168
```

Could they have chosen

```
25.x.x.x ?
```

Yes.

They could have.

The Internet Engineering Task Force (IETF) simply reserved these ranges for private use through standards (today documented in RFC 1918).

The exact numbers are less important than the rule:

These ranges are never routed across the public Internet.

---

# 5. Static vs Dynamic IP Addresses

There are two common ways a device receives an IP address.

---

## Static Address

Someone manually configures it.

Example:

```
Printer

↓

192.168.1.50
```

The printer keeps this address.

Advantages:

✓ Predictable

✓ Good for servers

✓ Good for routers

Disadvantages:

Requires manual management.

---

## Dynamic Address

Automatically assigned.

Example:

```
Phone joins Wi-Fi

↓

Router gives

↓

192.168.1.23
```

Advantages:

✓ Automatic

✓ Easy

✓ Scales well

Nearly every phone and laptop uses dynamic addressing.

---

# 6. DHCP – The Automatic Address Manager

Suppose 50 people visit your house.

Do you manually configure every phone?

Of course not.

Instead,

your router automatically assigns an address.

The service responsible is called

```
DHCP

Dynamic Host Configuration Protocol
```

Think of DHCP as the receptionist in a hotel.

Guest arrives.

↓

Reception checks available room.

↓

Assigns room number.

↓

Records it.

↓

Guest checks in.

Networking follows exactly the same process.

Device joins network.

↓

Requests an address.

↓

DHCP responds.

↓

Device starts communicating.

We'll study DHCP in great detail later because OPNsense will become our DHCP server.

---

# 7. Special IP Addresses

Some addresses have special meanings.

---

## Loopback

```
127.0.0.1
```

Means

"Myself."

When your computer communicates with

```
127.0.0.1
```

it never leaves the computer.

Useful for testing software.

---

## Localhost

Usually refers to

```
127.0.0.1
```

When developers say

```
localhost
```

they usually mean

"My own computer."

---

## Link-Local Address

```
169.254.x.x
```

Suppose DHCP fails.

Instead of having no address,

Windows assigns one automatically.

These addresses usually indicate

"Something is wrong with DHCP."

---

## Broadcast Address

Every subnet has one broadcast address.

Instead of talking to one device,

broadcast means

"Send this to everyone."

We'll study this properly in the Subnet chapter.

---

## 0.0.0.0

This usually means

"No specific address."

You'll see it often in routing tables and server configurations.

Don't worry about it yet.

Just remember it has a special meaning.

---

# 8. Your Home Network Explained

Your network today probably looks like this.

```
                Internet
                     │
                     │
              Public IP
                     │
              Airtel Router
                     │
──────────────────────────────────
     Home Network (Private)
──────────────────────────────────

Laptop

192.168.1.20

Phone

192.168.1.35

Printer

192.168.1.50

TV

192.168.1.60
```

Notice something.

Everything inside your house uses Private IP addresses.

Only the router knows the Public IP.

---

# 9. Our OPNsense Lab

Soon our lab will look like this.

```
Internet

↓

Airtel Router

↓

Windows Laptop

↓

VirtualBox

↓

OPNsense

↓

Host-Only Network

↓

Ubuntu VM

↓

Kali VM

↓

Windows VM
```

Future IP plan:

```
OPNsense

192.168.56.2

Ubuntu

192.168.56.100

Kali

192.168.56.101

Windows

192.168.56.102
```

Every VM will communicate through OPNsense.

Exactly like devices communicate through your Airtel router.

---

# 10. Common Misconceptions

"My laptop has the Public IP."

Usually false.

Your router owns the Public IP.

Your laptop normally uses a Private IP.

---

"My IP Address never changes."

Not always.

Most home Internet connections receive changing Public IPs.

Likewise,

phones and laptops usually receive dynamic Private IPs.

---

"Private IPs are less secure."

Not exactly.

Private simply means

"Not routable on the Internet."

Security depends on many other factors.

---

# 11. Hands-on Experiments

Open Command Prompt.

Run:

```
ipconfig
```

Observe:

- IPv4 Address
- Subnet Mask
- Default Gateway

Now ask yourself.

Is this a Public IP?

Or a Private IP?

---

Run:

```
ping 127.0.0.1
```

You are talking to your own computer.

Nothing leaves your laptop.

---

Visit

```
https://whatismyipaddress.com
```

Compare:

Your Public IP

with

Your Private IP.

Notice they are different.

Now you understand why.

---

# 12. Complete Chapter Summary

Congratulations.

You now understand:

✓ Why IP addresses exist.

✓ Why MAC Addresses alone are not enough.

✓ Why IPv4 has four numbers.

✓ Why each number is limited to 255.

✓ Why computers use binary.

✓ Why IPv4 became insufficient.

✓ Public vs Private IP.

✓ Static vs Dynamic IP.

✓ DHCP.

✓ Loopback.

✓ Localhost.

✓ Link-local addresses.

✓ Broadcast (basic idea).

✓ Your home network.

✓ Our OPNsense IP plan.

At this point,

you know more about IP Addressing than most people who simply memorize definitions.

---

# Looking Ahead

We now know that every device has an IP Address.

But another important question appears.

Imagine a company with

```
100,000 computers.
```

Should they all belong to one giant network?

Probably not.

How do engineers divide a huge network into smaller, organized pieces?

That question introduces one of the most important concepts in networking:

# Chapter 3 – Subnets