# Module 1 – Networking Foundations

# Chapter 2 – IP Addressing

> "A network without addresses is like a city where no house has a number."

---

# Learning Objectives

After completing this chapter, you will understand:

- Why IP addresses were invented
- What problem they solve
- What an IP address really is
- How computers identify each other
- Why IP addresses are called *logical addresses*
- The relationship between IP addresses and networking
- How this applies to your own home network and our OPNsense lab

---

# Table of Contents

1. Introduction
2. A City Without Addresses
3. The Birth of IP Addressing
4. What is an IP Address?
5. Why Every Device Needs an IP Address
6. Logical Address vs Physical Address *(Next Part)*
7. IPv4 Structure *(Next Part)*
8. Public vs Private IP *(Next Part)*
9. Static vs Dynamic IP *(Next Part)*
10. Special IP Addresses *(Next Part)*
11. IP Addressing in Your Home *(Next Part)*
12. IP Addressing in OPNsense *(Next Part)*
13. Summary *(Next Part)*

---

# 1. Introduction

In the previous chapter we answered a simple question.

> **What is a network?**

A network is simply a collection of devices that can communicate with each other.

Now another question naturally appears.

Imagine you have only two computers.

```
Laptop A  ----------------  Laptop B
```

Easy.

If Laptop A wants to send a file,
there is only one possible destination.

Now imagine something bigger.

```
                 Office Network

Laptop 1
Laptop 2
Laptop 3
Laptop 4
Laptop 5
Printer
NAS
Server
Phone 1
Phone 2
Camera 1
Camera 2
Smart TV
```

Now there are many possible destinations.

If Laptop 1 wants to send data,

how does it tell the network

> "I want to send this only to the printer."

How does it avoid sending the same data to every device?

This problem had to be solved before networking could become practical.

The solution was the **IP Address**.

---

# 2. A City Without Addresses

Imagine a city.

It has:

- 50,000 houses
- 200 roads
- Thousands of people

Now imagine something strange.

None of the houses have numbers.

No names.

No addresses.

A courier arrives with a parcel.

He asks,

> "Where is Mr. Sharma's house?"

Everyone replies,

> "Somewhere in the city."

How long will delivery take?

Probably forever.

Now imagine the same city with addresses.

```
House No. 17
MG Road
Pune
```

Immediately,

the courier knows exactly where to go.

Networking has exactly the same problem.

Instead of houses,

we have computers.

Instead of roads,

we have cables and Wi-Fi.

Instead of parcels,

we have data.

Instead of house numbers,

we have IP addresses.

---

# 3. The Birth of IP Addressing

During the early days of computing,
very few computers existed.

Most computers worked alone.

People moved files using:

- Floppy disks
- Magnetic tapes
- Printed paper

As computers became connected,
a new challenge appeared.

Imagine 100 computers connected together.

If Computer A wants to communicate,

how can it identify Computer B?

Engineers needed a universal addressing system.

That addressing system became the **Internet Protocol (IP)**.

The goal was simple.

Every connected device should have an address that other devices can understand.

Exactly like every house has a postal address.

---

# 4. What is an IP Address?

An **IP Address** is a unique logical identifier assigned to a device on a network.

Think of it as the network identity of a device.

Example:

```
192.168.1.25
```

This number tells other devices,

> "This is the destination."

Without it,

communication becomes impossible.

---

## Important Observation

Notice something interesting.

When someone sends you a letter,

they don't write:

- Brand of your house
- Colour of your house
- Number of windows

They write only your address.

Exactly the same thing happens in networking.

When your laptop sends data,

it doesn't say,

```
Send this to:

Dell Laptop
Silver colour
Purchased in 2023
```

Instead,

it says,

```
Destination:

192.168.1.25
```

The network understands addresses,

not descriptions.

---

# 5. Why Every Device Needs an IP Address

Suppose your home contains:

```
Laptop

Phone

Smart TV

Printer

NAS
```

All are connected to your Wi-Fi.

Now imagine you press **Print**.

Your laptop sends the document.

Question:

How does it know which device is the printer?

Not by its colour.

Not by its manufacturer.

Not by its location.

It knows because the printer has an IP address.

For example,

```
Printer

192.168.1.40
```

Your laptop sends the data specifically to that address.

Every other device ignores it.

The printer accepts it.

This is why IP addresses are essential.

Without them,

every device would constantly receive everyone else's traffic.

Networks would become chaotic.

---

# Think About It

Imagine a classroom.

The teacher says,

> "Rohan, please come here."

Only Rohan stands up.

Why?

Because the teacher used a unique identifier: **Rohan's name**.

Now imagine the teacher simply says,

> "Someone come here."

Everyone looks confused.

An IP address works exactly like a unique name on a network.

Every device knows,

"This packet is meant for me."

---

# Chapter Pause

At this point you should understand:

✅ Why addresses became necessary.

✅ The problem they solve.

✅ Why every network device needs one.

In the next part we'll answer a much deeper question:

> **If computers already have something called a MAC Address, why do we need IP Addresses at all?**

That single question leads us into one of the most important concepts in networking.