# PostgreSQL (psql) Basic Commands Cheat Sheet

A quick reference for connecting to PostgreSQL and performing common database operations from the terminal.

---

# 1. Connect to PostgreSQL

## Connect as a specific user

```bash
psql -U postgres
```

## Connect to a specific database

```bash
psql -U postgres -d pagila
```

## Connect to a database on another host

```bash
psql -h localhost -p 5432 -U postgres -d pagila
```

---

# 2. Exit psql

```text
\q
```

---

# 3. Get Help

List all psql commands

```text
\?
```

SQL command help

```text
\h
```

Help for a specific SQL command

```text
\h SELECT
```

---

# 4. Database Information

Current database

```sql
SELECT current_database();
```

Current user

```sql
SELECT current_user;
```

Current timestamp

```sql
SELECT NOW();
```

PostgreSQL version

```sql
SELECT version();
```

---

# 5. Database Management

List all databases

```text
\l
```

or

```sql
SELECT datname
FROM pg_database;
```

Switch database

```text
\c pagila
```

Create database

```sql
CREATE DATABASE company_db;
```

Drop database

```sql
DROP DATABASE company_db;
```

---

# 6. User (Role) Management

List users

```text
\du
```

or

```sql
SELECT rolname
FROM pg_roles;
```

Detailed role information

```sql
SELECT rolname,
       rolsuper,
       rolcreatedb,
       rolcreaterole,
       rolcanlogin
FROM pg_roles;
```

Create user

```sql
CREATE USER john WITH PASSWORD 'password';
```

Change password

```sql
ALTER USER john WITH PASSWORD 'newpassword';
```

Grant database access

```sql
GRANT ALL PRIVILEGES ON DATABASE pagila TO john;
```

---

# 7. Schema Commands

List schemas

```text
\dn
```

Current schema

```sql
SELECT current_schema();
```

Change schema

```sql
SET search_path TO public;
```

---

# 8. Table Commands

List tables

```text
\dt
```

List tables in all schemas

```text
\dt *.*
```

Describe a table

```text
\d actor
```

Detailed description

```text
\d+ actor
```

List views

```text
\dv
```

List sequences

```text
\ds
```

---

# 9. Create Objects

Create table

```sql
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10,2)
);
```

---

# 10. Insert Data

```sql
INSERT INTO employee(name, salary)
VALUES
('Alice', 50000),
('Bob', 65000);
```

---

# 11. Query Data

Select all rows

```sql
SELECT *
FROM employee;
```

Select specific columns

```sql
SELECT id, name
FROM employee;
```

Limit rows

```sql
SELECT *
FROM employee
LIMIT 5;
```

Order results

```sql
SELECT *
FROM employee
ORDER BY salary DESC;
```

Filter rows

```sql
SELECT *
FROM employee
WHERE salary > 50000;
```

---

# 12. Update Data

```sql
UPDATE employee
SET salary = 70000
WHERE id = 1;
```

---

# 13. Delete Data

Delete selected rows

```sql
DELETE FROM employee
WHERE id = 1;
```

Delete all rows

```sql
DELETE FROM employee;
```

---

# 14. Drop Objects

Drop table

```sql
DROP TABLE employee;
```

Drop table only if it exists

```sql
DROP TABLE IF EXISTS employee;
```

---

# 15. Count Rows

```sql
SELECT COUNT(*)
FROM employee;
```

---

# 16. Useful Aggregate Functions

```sql
SELECT
    COUNT(*),
    MIN(salary),
    MAX(salary),
    AVG(salary),
    SUM(salary)
FROM employee;
```

---

# 17. Transaction Commands

Begin transaction

```sql
BEGIN;
```

Commit transaction

```sql
COMMIT;
```

Rollback transaction

```sql
ROLLBACK;
```

---

# 18. Describe Database Objects

List functions

```text
\df
```

List indexes

```text
\di
```

List triggers

```text
\dS
```

---

# 19. Execute SQL Script

```text
\i script.sql
```

---

# 20. Save Query Output

```text
\o output.txt
```

Reset output back to terminal

```text
\o
```

---

# 21. Command History

View command history

```text
\s
```

Execute previous command

```text
\g
```

---

# 22. Refresh Screen

```text
Ctrl + L
```

---

# 23. Clear Screen (Linux/macOS)

```text
\! clear
```

Windows

```text
\! cls
```

---

# 24. Common Keyboard Shortcuts

Interrupt running query

```
Ctrl + C
```

Exit psql

```
Ctrl + D
```

Auto-complete

```
TAB
```

Search command history

```
Ctrl + R
```

---

# 25. Pagila Practice Tables

```text
actor
address
category
city
country
customer
film
film_actor
film_category
inventory
language
payment
rental
staff
store
```

Example

```sql
SELECT *
FROM actor
LIMIT 10;
```

---

# 26. Important Notes

* SQL statements **must end with a semicolon (`;`)**.
* psql meta-commands (those beginning with `\`) **do not use a semicolon**.
* Prompt ending with `#` means you are connected as a **superuser**.
* Prompt ending with `=>` or `$` typically indicates a non-superuser session.

---

# Typical Workflow

```bash
psql -U postgres -d pagila
```

```text
\dt
```

```text
\d actor
```

```sql
SELECT *
FROM actor
LIMIT 10;
```

```sql
SELECT COUNT(*)
FROM actor;
```

```text
\q
```
