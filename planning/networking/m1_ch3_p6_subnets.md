# Module 1 – Networking Foundations

# Chapter 3 – Subnets

## Part 6 – Finding the Network, First Host, Last Host and Broadcast Address

> "Every subnet has a beginning, many houses, and an ending."

---

# Learning Objectives

By the end of this chapter, you will be able to determine:

- Network Address
- First Host
- Last Host
- Broadcast Address
- Number of Usable Hosts

without relying on a subnet calculator.

---

# 1. Think of a Street Instead of an IP Address

Imagine a street with 256 houses.

```
Street A

House 0
House 1
House 2
House 3
...
House 253
House 254
House 255
```

Now imagine the city government makes two rules.

Rule 1

The first house becomes the street's signboard.

Nobody lives there.

Rule 2

The last house becomes the public announcement office.

Nobody lives there either.

Now how many houses remain?

```
256

-

2

=

254
```

Congratulations.

You've just discovered why a `/24` supports **254 usable devices**.

No formulas.

Just logic.

---

# 2. Every Subnet Has Four Important Addresses

Whenever you create a subnet, it always contains four important things.

```
+-----------------------------------------------------------+
| Network | First Host | ... Hosts ... | Last Host | Broadcast |
+-----------------------------------------------------------+
```

The size changes.

The pattern never changes.

---

# 3. Example: /24

Consider

```
192.168.56.0/24
```

This subnet contains

```
256 addresses
```

Let's list them.

```
192.168.56.0
```

↓

```
192.168.56.1
```

↓

```
192.168.56.2
```

↓

...

↓

```
192.168.56.254
```

↓

```
192.168.56.255
```

Now assign roles.

```
192.168.56.0

↓

Network Address
```

```
192.168.56.1

↓

First Host
```

```
192.168.56.254

↓

Last Host
```

```
192.168.56.255

↓

Broadcast
```

Done.

No calculations required.

---

# 4. Why Is the First Address Reserved?

Imagine a city.

```
Pune
```

Is Pune a person?

No.

It represents the entire city.

Likewise,

```
192.168.56.0
```

represents the entire subnet.

It is the identity of the network itself.

Giving it to a laptop would be like giving someone the name "India."

The name already represents something larger.

---

# 5. Why Is the Last Address Reserved?

Imagine a school principal.

Instead of calling

```
Student 1

Student 2

Student 3

...

Student 500
```

individually,

he uses the public announcement system.

Everyone hears it.

The broadcast address serves exactly this purpose.

When a packet is sent to

```
192.168.56.255
```

every device in that subnet receives it.

Therefore,

it cannot belong to one particular computer.

---

# 6. Example: /25

Earlier we divided

```
/24
```

into two equal parts.

So now we have

```
Subnet 1

192.168.56.0/25
```

and

```
Subnet 2

192.168.56.128/25
```

Let's examine the first one.

Addresses

```
192.168.56.0

↓

...

↓

192.168.56.127
```

Roles

```
Network

192.168.56.0
```

```
First Host

192.168.56.1
```

```
Last Host

192.168.56.126
```

```
Broadcast

192.168.56.127
```

Notice something.

The pattern hasn't changed.

Only the size changed.

---

# 7. Example: /26

Now divide again.

Each subnet now contains

```
64 addresses.
```

The first subnet becomes

```
192.168.56.0

↓

192.168.56.63
```

Therefore,

```
Network

0
```

```
First Host

1
```

```
Last Host

62
```

```
Broadcast

63
```

The next subnet starts immediately afterwards.

```
64

↓

127
```

Again,

```
64

Network
```

```
65

First Host
```

```
126

Last Host
```

```
127

Broadcast
```

See the pattern?

Every subnet begins exactly where the previous one ends.

---

# 8. A Visual Pattern

```
/24

0 --------------------255
```

↓

Split

```
/25

0----------127

128---------255
```

↓

Split

```
/26

0------63

64-----127

128----191

192----255
```

This is subnetting.

Simply dividing a larger range into smaller ranges.

---

# 9. A Simple Rule

Every subnet always follows this order.

```
Network

↓

First Host

↓

Usable Hosts

↓

Last Host

↓

Broadcast
```

Once you know the subnet boundaries,

everything else becomes obvious.

---

# 10. Our OPNsense Lab

Today

```
192.168.56.0/24
```

Tomorrow

we might split it.

```
Home

192.168.56.0/25
```

```
Guest

192.168.56.128/25
```

Later

```
Servers

192.168.56.192/26
```

As our home lab grows,

we'll keep dividing networks to improve security and organization.

Exactly like companies do.

---

# Think About It

Suppose I tell you

```
Network

192.168.10.0/24
```

Can you immediately answer

First Host?

Yes.

```
192.168.10.1
```

Last Host?

```
192.168.10.254
```

Broadcast?

```
192.168.10.255
```

Without doing any calculations.

That's because you're beginning to understand the structure.

---

# Chapter Summary

You now know that every subnet has:

✓ One Network Address

✓ One First Host

✓ Many Usable Hosts

✓ One Last Host

✓ One Broadcast Address

You also understand why the first and last addresses are reserved.

Most importantly,

you've started seeing subnetting as **organizing address ranges**, not memorizing numbers.

---

# Coming Next

Now we'll answer the final practical question.

Suppose I give you

```
192.168.56.143/26
```

How do you immediately know

which subnet it belongs to?

That is the skill network engineers use every day when designing and troubleshooting networks.

Once you master that, you'll be ready to configure OPNsense interfaces, DHCP ranges, VLANs, and firewall rules with confidence.