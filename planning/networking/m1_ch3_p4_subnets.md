# Module 1 – Networking Foundations

# Chapter 3 – Subnets

## Part 4 – Network Address, Host Address & Broadcast Address

> "Every IP address has a role. Some identify the network, some identify a device, and one talks to everyone."

---

# Learning Objectives

After completing this chapter, you will understand:

- What a Network Address is
- What a Host Address is
- What a Broadcast Address is
- Why some addresses cannot be assigned to computers
- How a computer determines whether another device is local or remote
- Why these concepts are essential for routing

---

# 1. Looking at an IP Address Differently

Until now we've looked at an IP address like this:

```
192.168.56.100
```

But a computer doesn't see it as just four numbers.

Using the subnet mask `/24`, it interprets it like this:

```
192.168.56 | 100
```

The first part represents the **network**.

The second part represents a **device within that network**.

This simple split is the basis of almost every networking decision.

---

# 2. The Network Address

Imagine a city.

```
City
│
├── Area A
├── Area B
├── Area C
└── Area D
```

If someone asks,

> "Where do you live?"

You might answer:

> "Area B."

You haven't identified your exact house yet.

You've identified the neighbourhood.

Networking works the same way.

Consider the subnet:

```
192.168.56.0/24
```

The first address is:

```
192.168.56.0
```

This is called the **Network Address**.

It identifies the subnet itself.

It does **not** identify a computer.

Think of it as the name of the neighbourhood.

---

# Why Can't We Assign It?

Suppose you give this address to your laptop.

```
Laptop

192.168.56.0
```

Now another computer asks,

> "Are you the network itself or a device inside it?"

The answer becomes ambiguous.

To avoid confusion, networking reserves the first address to represent the network.

---

# 3. The Host Addresses

Everything between the first and last address is available for devices.

Example:

```
192.168.56.1

192.168.56.2

192.168.56.3

...

192.168.56.254
```

These are called **Host Addresses**.

Each identifies one specific device.

Examples:

```
Router

192.168.56.1
```

```
Laptop

192.168.56.20
```

```
Printer

192.168.56.40
```

```
NAS

192.168.56.100
```

Every device must have its own unique host address.

---

# 4. The Broadcast Address

Now imagine a school.

The principal wants to announce:

> "Everyone, please assemble in the auditorium."

He doesn't call each student individually.

He makes one announcement.

Every student hears it.

Networking has the same idea.

Sometimes a computer wants to send a message to **every device in the subnet**.

For that purpose, we use the **Broadcast Address**.

For

```
192.168.56.0/24
```

the broadcast address is

```
192.168.56.255
```

When a packet is sent to this address,

every device on that subnet receives it.

---

# Why Can't We Assign the Broadcast Address?

Imagine assigning

```
192.168.56.255
```

to your printer.

Now another device sends a broadcast.

Who should receive it?

```
Everyone?

or

Only the printer?
```

That would create confusion.

Therefore, the last address is always reserved for broadcasting.

---

# 5. Putting It All Together

For the subnet

```
192.168.56.0/24
```

we now have:

```
Network Address

192.168.56.0
```

```
Usable Hosts

192.168.56.1

↓

192.168.56.254
```

```
Broadcast Address

192.168.56.255
```

This pattern repeats in every IPv4 subnet.

---

# 6. How Does a Computer Decide?

Imagine your laptop has:

```
IP

192.168.56.100

Mask

255.255.255.0
```

Now you want to communicate with:

```
192.168.56.25
```

Your computer compares the network portion.

```
My Network

192.168.56
```

Destination

```
192.168.56
```

Same network.

Result:

> Send directly.

---

Now imagine the destination is

```
192.168.57.20
```

Comparison:

```
Mine

192.168.56
```

Destination

```
192.168.57
```

Different.

Now the computer says:

> "This device isn't in my subnet."

So instead of sending directly, it forwards the packet to the **default gateway**.

That gateway is usually your router.

We'll study that in the next chapter.

---

# 7. Real Example From Your Home

Suppose your laptop has

```
192.168.1.20
```

Your printer has

```
192.168.1.50
```

Both belong to

```
192.168.1.0/24
```

Since they're in the same subnet,

your laptop can communicate directly with the printer.

Now suppose you try to access Google's public DNS:

```
8.8.8.8
```

Your computer immediately recognises:

> "This is not in my subnet."

It sends the packet to your Airtel router.

The router then forwards it toward the Internet.

---

# 8. Our OPNsense Lab

Soon we'll configure:

```
Network

192.168.56.0/24
```

OPNsense LAN:

```
192.168.56.2
```

Ubuntu VM:

```
192.168.56.100
```

Kali VM:

```
192.168.56.101
```

Windows VM:

```
192.168.56.102
```

All of these machines will recognise that they belong to the same subnet and can communicate directly.

Later, we'll create additional subnets such as:

```
192.168.10.0/24

Guest Network
```

```
192.168.20.0/24

Servers
```

```
192.168.30.0/24

IoT Devices
```

Communication between these subnets will require OPNsense to route the traffic.

---

# Curious Corner

Why do we lose two addresses in every subnet?

Many beginners ask:

> "Why does a /24 have 256 addresses but only 254 usable devices?"

Now you know.

One address identifies the network.

One address broadcasts to everyone.

Neither can belong to an individual device.

---

# Hands-on Experiment

Open Command Prompt.

Run:

```
ipconfig
```

Write down:

- Your IP Address
- Your Subnet Mask

Now ask yourself:

- Which subnet am I in?
- What is my network address?
- Which address is probably my broadcast address?

Don't worry about calculating them perfectly yet.

We'll learn the calculations in the next part.

---

# Chapter Summary

You now understand:

✓ What a Network Address is.

✓ What a Host Address is.

✓ What a Broadcast Address is.

✓ Why the first address is reserved.

✓ Why the last address is reserved.

✓ Why a /24 subnet supports 254 usable devices.

✓ How a computer decides whether another device is local or remote.

These ideas are at the heart of routing and are used every time your computer sends a packet.

---

# Looking Ahead

We've learned **what** the network, host, and broadcast addresses are.

Next, we'll learn **how to calculate them** for any subnet.

Don't worry—we won't memorise formulas.

We'll build the calculations step by step until they become intuitive.

By the end of the next section, you'll be able to look at an address like:

```
192.168.56.100/24
```

and immediately know:

- The network address
- The usable host range
- The broadcast address
- The number of usable devices

without relying on online subnet calculators.