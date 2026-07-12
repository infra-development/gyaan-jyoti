# Module 1 – Networking Foundations

# Chapter 2 – IP Addressing

## Part 3 – Understanding IPv4

> "An address is useful only if everyone follows the same format."

---

# Table of Contents

1. Why Does IPv4 Have Four Numbers?
2. What is an Octet?
3. Why is Each Number Limited to 255?
4. Binary Without Fear
5. Why Do Computers Use Binary?
6. How Many IPv4 Addresses Exist?
7. Why Did We Run Out of IPv4 Addresses?
8. Real-World Examples
9. Chapter Summary

---

# 1. Why Does IPv4 Have Four Numbers?

Most people have seen addresses like these:

```
192.168.1.10

10.0.0.1

172.16.5.20

8.8.8.8
```

Have you ever wondered...

Why four numbers?

Why not three?

Why not six?

Why not letters?

The answer lies in how computers store information.

Computers understand only two values:

```
0

1
```

Everything inside a computer eventually becomes combinations of these two digits.

When engineers designed IPv4, they decided that every address would contain **32 bits**.

Instead of showing all 32 bits together, they divided them into four equal groups.

Each group contains:

```
8 bits
```

Since 4 × 8 = 32,

every IPv4 address naturally has four sections.

For example,

```
192.168.56.2
```

can be viewed as

```
192 | 168 | 56 | 2
```

Each section is called an **octet**.

---

# 2. What is an Octet?

An octet is simply a group of **8 bits**.

Nothing more.

Nothing less.

Think of an apartment address.

```
Building

↓

Floor

↓

Apartment

↓

Room
```

Each part helps identify the complete location.

Similarly,

```
192 . 168 . 56 . 2
```

contains four separate parts that together identify one device.

These parts are called octets.

---

# 3. Why is Each Number Limited to 255?

This is one of the most common beginner questions.

If computers can count forever,

why can't an IP address contain:

```
192.168.999.500
```

The reason is simple.

Each octet contains exactly **8 bits**.

With 8 bits,

the smallest number possible is

```
00000000
```

which equals

```
0
```

The largest possible combination is

```
11111111
```

which equals

```
255
```

Nothing larger can fit into 8 bits.

So every octet must always remain between

```
0

and

255
```

That's why this is valid:

```
192.168.100.50
```

and this is not:

```
192.168.300.10
```

because **300 cannot be represented using only 8 bits**.

---

# 4. Binary Without Fear

Many networking books spend pages teaching binary.

We're going to keep it simple.

Computers have electronic circuits.

Each circuit has only two stable states.

```
OFF

ON
```

Networking represents these as

```
0

1
```

That's all binary really is.

Humans naturally count like this:

```
0

1

2

3

4
```

Computers count using only

```
0

1
```

Everything else—letters, photos, videos, games, websites, even this document—is ultimately stored as combinations of zeros and ones.

You don't need to master binary today.

You only need to remember one important idea:

> IPv4 is based on 32 binary digits.

---

# 5. Why Do Computers Use Binary?

Imagine trying to build a switch with three states:

```
OFF

MEDIUM

ON
```

Very difficult.

Electrical circuits naturally behave like simple switches.

Either electricity flows...

or it doesn't.

So computers were designed around two reliable states.

```
0

1
```

This made hardware simpler, faster, and more reliable.

Networking inherited this design.

That is why IP addresses ultimately become binary inside every computer.

---

# 6. How Many IPv4 Addresses Exist?

Since every IPv4 address contains

```
32 bits
```

there are

```
2³²
```

possible combinations.

That equals

```
4,294,967,296
```

approximately

```
4.3 billion
```

When IPv4 was designed,

people believed

4 billion addresses would be enough forever.

At the time,

there were only a handful of computers connected together.

No one imagined:

- Smartphones
- Smart TVs
- Watches
- Cars
- Refrigerators
- Security cameras
- IoT devices

Eventually,

4.3 billion addresses were no longer enough.

---

# 7. Why Did We Run Out of IPv4 Addresses?

Imagine a city with

```
4 billion houses.
```

Sounds enormous.

Now imagine every person owns

- a laptop
- a phone
- a tablet
- a smart TV
- a smartwatch
- a gaming console
- a work laptop

One person now needs multiple addresses.

Companies may have

```
100,000 devices.
```

Cloud providers have

```
millions.
```

Worldwide,

we now have **far more devices than IPv4 addresses**.

Engineers solved this temporarily using **NAT**, which we'll study later.

Eventually, IPv6 was created to provide a vastly larger address space.

---

# 8. Real-World Examples

Let's look at some familiar IPv4 addresses.

Google Public DNS

```
8.8.8.8
```

Cloudflare Public DNS

```
1.1.1.1
```

Typical home router

```
192.168.1.1
```

Typical office router

```
10.0.0.1
```

Our future OPNsense LAN

```
192.168.56.2
```

Ubuntu VM

```
192.168.56.100
```

Kali Linux VM

```
192.168.56.101
```

Windows VM

```
192.168.56.102
```

Notice something.

Every IPv4 address follows exactly the same format.

Four numbers.

Each between

0

and

255.

---

# Think About It

Why didn't engineers design IPv4 using letters?

Something like

```
HOME-PC-A
```

Because computers need an addressing format that is:

- predictable
- compact
- efficient
- easy to process in hardware

Numbers satisfy those requirements much better than arbitrary names.

Later, we'll learn how **DNS** lets humans use names like

```
google.com
```

while computers continue using IP addresses behind the scenes.

---

# Chapter Summary

You now understand:

✓ Why IPv4 has four numbers.

✓ What an octet is.

✓ Why each number ranges from 0 to 255.

✓ Why computers use binary.

✓ Why IPv4 contains about 4.3 billion addresses.

✓ Why IPv4 eventually became insufficient.

✓ Why IPv6 was developed.

Most importantly,

you now understand **why IPv4 looks the way it does**, rather than simply memorizing its format.

---

# Coming Next

In Part 4, we'll answer questions such as:

- What is the difference between Public and Private IP addresses?
- Why can't your laptop use a public IP directly?
- What are Static and Dynamic IP addresses?
- What is DHCP?
- What is 127.0.0.1?
- What is 0.0.0.0?
- Why do some devices get a 169.254.x.x address?
- How does all of this fit into your home network and our OPNsense lab?