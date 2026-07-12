# Module 1 – Networking Foundations

# Chapter 2 – IP Addressing

## Part 2 – Why IP Exists When MAC Addresses Already Exist

---

# Table of Contents

1. The Postal System
2. Every Computer Has Two Identities
3. What is a MAC Address?
4. Why MAC Addresses Are Not Enough
5. Why IP Addresses Were Invented
6. Logical vs Physical Address
7. A Simple Journey Across Your Home Network
8. Chapter Summary

---

# 1. The Postal System

Imagine your friend wants to send you a birthday gift.

He packs the gift inside a box.

Then he writes:

Name:
Haresh

Address:
Palanpur
Gujarat
India

Notice something.

He doesn't describe:

- Your height
- Your weight
- Your hairstyle
- Your mobile phone

He writes only one thing.

Your address.

Because the delivery company understands addresses.

The Internet works exactly the same way.

Instead of gifts,

we send packets.

Instead of people,

we have computers.

Instead of postal addresses,

we use IP addresses.

---

# 2. Every Computer Has Two Identities

This surprises many beginners.

Every network device has TWO identities.

One identity never changes.

One identity usually changes.

Those identities are:

```
MAC Address
```

and

```
IP Address
```

Think of yourself.

You have:

- Your fingerprint
- Your home address

Your fingerprint identifies YOU.

Your address identifies WHERE YOU ARE.

Networking uses exactly the same idea.

---

# 3. What is a MAC Address?

A MAC Address is the hardware identity of a network card.

Example:

```
98:FA:9B:11:45:AB
```

It is usually assigned by the manufacturer.

Think of it as the serial number of your network card.

No matter where you take your laptop:

Home

↓

Office

↓

Hotel

↓

Airport

↓

The MAC Address remains the same.

---

# 4. Why Isn't the MAC Address Enough?

Excellent question.

Imagine you buy a new phone.

Its MAC Address never changes.

Now imagine you travel.

Mumbai

↓

Delhi

↓

London

↓

New York

Your physical location changes.

Your MAC Address does not.

Now think about the postal service.

Could a courier deliver a package using only your fingerprint?

No.

Because fingerprints don't tell anyone where you live.

Exactly the same problem exists with MAC Addresses.

They identify the hardware.

They do NOT identify the location of that hardware in a network.

---

# 5. Why IP Addresses Were Invented

IP Addresses answer a different question.

Not

"Who are you?"

Instead,

"Where are you?"

Suppose your laptop moves from your home Wi-Fi

to your office Wi-Fi.

Your MAC Address remains exactly the same.

But your IP Address changes.

Example:

At home:

```
192.168.1.15
```

At office:

```
10.20.30.45
```

The network now knows where your laptop currently exists.

This is why IP Addresses are called

Logical Addresses.

---

# 6. Logical vs Physical Address

Think about your own house.

Your Aadhaar number identifies YOU.

Your house address identifies WHERE YOU LIVE.

If you move to another city,

your Aadhaar number stays the same.

Your address changes.

Networking works exactly like this.

| Physical Identity | Logical Identity |
|-------------------|------------------|
| MAC Address | IP Address |

One answers

WHO?

The other answers

WHERE?

---

# 7. A Journey Inside Your Home

Suppose your laptop wants to print.

```
Laptop

↓

Wi-Fi Router

↓

Printer
```

Your laptop already knows

Printer IP

↓

192.168.1.40

It sends data toward that address.

The router helps deliver the packet.

The printer receives it.

Everything happens within milliseconds.

You don't see any of it.

But every print job,

every YouTube video,

every WhatsApp message,

works using this same idea.

---

# Think About It

If your laptop keeps the same MAC Address forever,

but changes IP Addresses every time you join a new Wi-Fi,

which address is better for finding your current location?

Exactly.

The IP Address.

That is why routers use IP Addresses for routing.

---

# Chapter Summary

You now understand:

✓ Every device has two identities.

✓ MAC identifies the hardware.

✓ IP identifies the network location.

✓ MAC usually stays constant.

✓ IP often changes.

✓ Routers care about IP Addresses because they tell the network where the device currently is.

---

# Coming Next

Now that we know WHY IP exists,

we'll answer another question.

> Why does an IPv4 address always have four numbers?

That takes us into the structure of IPv4.