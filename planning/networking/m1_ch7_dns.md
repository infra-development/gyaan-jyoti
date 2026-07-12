# Module 1 – Networking Foundations

# Chapter 7 – DNS (Domain Name System)

> **"Humans remember names. Computers remember numbers. DNS allows both to live in the same world."**

---

# Learning Objectives

After completing this chapter, you will understand:

* Why DNS exists.
* Why computers use IP addresses instead of names.
* What happens when you type `google.com`.
* How DNS servers work.
* Why DNS is one of the first services your computer uses.
* How OPNsense can control and secure DNS traffic.

---

# Table of Contents

1. Introduction
2. The Problem with Numbers
3. Why DNS Was Invented
4. What is DNS?
5. A Phone Contact Analogy
6. The Complete DNS Journey
7. DNS Caching
8. Public DNS Providers
9. DNS in Your Home
10. DNS in OPNsense
11. Common Misconceptions
12. Hands-on Experiments
13. Chapter Summary
14. Next Chapter

---

# 1. Introduction

Suppose I ask you:

> "What is Google's IP address?"

Most people don't know.

Now suppose I ask:

> "What is Google's website?"

Almost everyone answers immediately.

```text
google.com
```

Why?

Because humans remember **names** much more easily than numbers.

Computers are the opposite.

They communicate using IP addresses.

So how do humans and computers communicate with each other?

DNS is the answer.

---

# 2. The Problem with Numbers

Imagine if websites looked like this.

```text
142.250.190.14
```

instead of

```text
google.com
```

Or

```text
157.240.xxx.xxx
```

instead of

```text
facebook.com
```

You would need to remember hundreds of IP addresses.

That would be impractical.

The Internet needed a translation system.

---

# 3. Why DNS Was Invented

Think about your mobile phone.

You don't remember everyone's phone number.

Instead,

you save:

```text
Mom

Dad

Office

Doctor
```

Your phone stores the actual numbers behind the scenes.

DNS performs exactly the same function.

Instead of remembering

```text
142.250.x.x
```

you simply remember

```text
google.com
```

---

# 4. What is DNS?

DNS stands for

**Domain Name System**.

It is a distributed system that translates:

```text
Domain Name

↓

IP Address
```

Example:

```text
google.com

↓

142.250.x.x
```

Without DNS,

most web browsing would be extremely inconvenient.

---

# 5. A Phone Contact Analogy

Imagine you want to call your friend Rahul.

You select:

```text
Rahul
```

Your phone silently looks up Rahul's number.

Only then does it make the call.

Similarly,

your browser receives:

```text
google.com
```

It first asks a DNS server:

> "What is Google's IP address?"

Only after receiving the answer does it begin connecting to Google.

---

# 6. The Complete DNS Journey

Let's follow what happens when you type:

```text
www.google.com
```

Step 1

You press Enter.

↓

Step 2

Your computer checks its local DNS cache.

↓

Step 3

If not found,

it sends a DNS query to the configured DNS server.

↓

Step 4

The DNS server replies with Google's IP address.

↓

Step 5

Your computer now creates packets using the IP address.

↓

Step 6

Routing, NAT, and everything you've already learned takes over.

Notice something.

DNS happens **before** any web page is downloaded.

---

# 7. DNS Caching

Imagine asking your friend every day:

> "What's your phone number?"

Eventually,

you'd simply remember it.

Computers do the same.

They temporarily store DNS results.

This is called the **DNS Cache**.

The next time you visit the same website,

your computer may already know the IP address.

That saves time and reduces Internet traffic.

---

# 8. Public DNS Providers

Some well-known public DNS servers include:

| Provider   | Primary DNS |
| ---------- | ----------- |
| Google     | 8.8.8.8     |
| Cloudflare | 1.1.1.1     |
| Quad9      | 9.9.9.9     |

These servers answer DNS queries for millions of users around the world.

Your ISP also usually provides DNS servers automatically.

---

# 9. DNS in Your Home

Today,

your laptop probably uses your router as its DNS server.

The router either:

* Answers from its own cache.
* Forwards the request to your ISP.
* Forwards the request to another configured DNS provider.

This happens automatically.

Most users never notice.

---

# 10. DNS in OPNsense

One of the powerful features of OPNsense is that it can become your network's DNS server or DNS forwarder.

That allows you to:

* Block malicious domains.
* Filter advertisements.
* Create local hostnames.
* Cache DNS responses.
* Choose which upstream DNS servers to trust.

Later,

we'll configure OPNsense so every VM sends DNS requests through it.

That gives us visibility and control over one of the most important services in the network.

---

# 11. Common Misconceptions

### "DNS downloads websites."

No.

DNS only translates names into IP addresses.

The actual web traffic starts afterward.

---

### "Every website has only one IP address."

Not always.

Large websites often use many IP addresses for performance and reliability.

---

### "Changing DNS changes my Internet provider."

No.

Changing DNS only changes who answers your name lookups.

Your ISP still carries the traffic.

---

# 12. Hands-on Experiments

## Experiment 1

Open Command Prompt.

Run:

```cmd
nslookup google.com
```

Observe the returned IP addresses.

---

## Experiment 2

Run:

```cmd
ipconfig /displaydns
```

This displays your local DNS cache.

---

## Experiment 3

Run:

```cmd
ping google.com
```

Notice that Windows first resolves the name into an IP address before sending packets.

---

# 13. Chapter Summary

You now understand:

* Why DNS exists.
* Why humans use names.
* Why computers use IP addresses.
* How a DNS query works.
* Why DNS caching improves performance.
* How your home network uses DNS.
* How OPNsense can control DNS for your entire lab.

DNS is one of the invisible services that makes the Internet feel simple, even though it performs millions of translations every second.

---

# 14. Next Chapter

So far we've answered:

* How devices get IP addresses.
* How they communicate.
* How they leave the network.
* How they find websites.

One question remains:

> **How did my laptop get its IP address in the first place?**

That leads us to:

# Chapter 8 – DHCP (Dynamic Host Configuration Protocol)

The service that automatically assigns IP addresses whenever a device joins the network.
