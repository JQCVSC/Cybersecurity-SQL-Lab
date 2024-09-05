---

# Cybersecurity SQL Adventure Lab

## Description

In this lab, you will use SQL to investigate potential security threats in a company's database. You'll learn how to query databases, analyze login attempts, and identify suspicious activities. This hands-on project is designed to demonstrate SQL for cybersecurity log analysis, including cloud database setup, sample logs, and SQL queries for detecting security threats. It is ideal for security analysts and students.

## Table of Contents

- [Introduction](#introduction)
- [Setup Instructions](#setup-instructions)
- [Quest 1: Reconnaissance](#quest-1-reconnaissance)
- [Quest 2: Failed Infiltrations](#quest-2-failed-infiltrations)
- [Quest 3: After Hours Activity](#quest-3-after-hours-activity)
- [Quest 4: Insider Threat?](#quest-4-insider-threat)
- [Quest 5: Cross-Reference Investigation](#quest-5-cross-reference-investigation)
- [Final Challenge: Comprehensive Security Audit](#final-challenge-comprehensive-security-audit)
- [Conclusion](#conclusion)
- [Next Steps](#next-steps)

---

![Screenshot 2024-09-03 122811](https://github.com/user-attachments/assets/08065b2f-0e13-4020-a005-291ca29b5e50)


## Introduction

Welcome, aspiring cybersecurity analyst! In this lab, you'll use SQL to investigate potential security threats in a company's database. You'll learn how to query databases, analyze login attempts, and identify suspicious activities.

---

## Setup Instructions

### Make sure you create a DB instance in google cloud to add the tables and data

You can use a free SQL server, I Used https://www.freesqldatabase.com/freemysqldatabase/

Or if you want to go with the cloud then you go about it in the steps below

## Make sure MySQL is also installed on your local machine

### 1. Installing the Cloud SQL Auth Proxy

The Cloud SQL Auth Proxy allows secure access to your Cloud SQL instance. The installation process depends on your operating system:

- **For Windows 64-bit:**
  - Right-click this link: https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.13.0/cloud-sql-proxy.x64.exe
  - Select "Save Link As" to download the Cloud SQL Auth Proxy.
  - Rename the downloaded file to `cloud-sql-proxy.exe`.

- **For other operating systems or 32-bit Windows:**
  - Visit the official documentation to find the correct download link.

### 2. Starting the Cloud SQL Auth Proxy

Open a command prompt or PowerShell window and navigate to the directory where you saved `cloud-sql-proxy.exe`. Then run:

```shell
.\cloud-sql-proxy.exe YOUR_INSTANCE_CONNECTION_NAME
```

Replace `YOUR_INSTANCE_CONNECTION_NAME` with the connection name provided by your instructor.

### 3. Connecting to the Database

Open a new command prompt or PowerShell window and run:

```shell
mysql -u root -p --host 127.0.0.1 --port 3306
```

Enter the password when prompted.

### 4. Accessing the Company Database

Once connected to MySQL, access the company database:

```sql
USE organization;
```

---

## Quest 1: Reconnaissance

### Scenario

You're new to the company and need to understand the database structure.

### Tasks

1. List all tables in the database.
2. Examine the structure of the `log_in_attempts` table.
3. Examine the structure of the `employees` table.

### SQL Queries

```sql
SHOW TABLES;
DESCRIBE log_in_attempts;
DESCRIBE employees;
```

### Questions

- How many tables are in the database?
- What columns are present in the `log_in_attempts` table?
- What information does the `employees` table contain?

---

## Quest 2: Failed Infiltrations

### Scenario

There's been an increase in failed login attempts. Investigate these failures.

### Task

Identify all failed login attempts.

### SQL Query

```sql
SELECT * FROM log_in_attempts WHERE success = FALSE;
```

### Questions

- How many failed login attempts are there?
- Are there any usernames with multiple failed attempts?
- Do you notice any patterns in the times or locations of these attempts?

---

## Quest 3: After Hours Activity

### Scenario

Security is concerned about logins outside business hours (before 9 AM or after 5 PM).

### Task

Find login attempts outside of business hours.

### SQL Query

```sql
SELECT * FROM log_in_attempts 
WHERE TIME(login_time) < '09:00:00' OR TIME(login_time) > '17:00:00';
```

### Questions

- How many after-hours login attempts were there?
- Are these attempts mostly successful or failed?
- Are there any employees consistently logging in after hours?

---

## Quest 4: Insider Threat?

### Scenario

IT department staff have elevated privileges. We need to identify them for a security audit.

### Task

Identify employees in the IT department.

### SQL Query

```sql
SELECT * FROM employees WHERE department = 'IT';
```

### Questions

- How many employees are in the IT department?
- What offices are the IT employees located in?
- Do you notice anything unusual about the device IDs assigned to IT staff?

---

## Quest 5: Cross-Reference Investigation

### Scenario

We need more context about the failed login attempts.

### Task

Join the `log_in_attempts` and `employees` tables to get more information about failed logins.

### SQL Query

```sql
SELECT l.username, l.login_date, l.login_time, l.country, e.department
FROM log_in_attempts l
JOIN employees e ON l.username = e.username
WHERE l.success = FALSE;
```

### Questions

- Which department has the most failed login attempts?
- Are there any failed attempts from countries where we don't have offices?
- Do you see any patterns between employee departments and login times?

---

## Final Challenge: Comprehensive Security Audit

### Scenario

Create a full report of all login activity with employee details.

### Task

Generate a comprehensive report of all login attempts, including employee information.

### SQL Query

```sql
SELECT l.event_id, l.username, e.department, e.office, l.login_date, l.login_time, l.country, l.ip_address, 
CASE WHEN l.success THEN 'Success' ELSE 'Failure' END AS login_result 
FROM log_in_attempts l 
LEFT JOIN employees e ON l.username = e.username 
ORDER BY l.login_date, l.login_time;
```

### Questions

- What insights can you draw from this comprehensive view of login attempts?
- Are there any correlations between department, office location, and login success rate?
- Based on this data, what security recommendations would you make to the company?

---

## Conclusion

Congratulations on completing the Cybersecurity SQL Adventure Lab! You've used SQL to investigate real-world security scenarios. Remember, in cybersecurity, asking the right questions is just as important as finding the answers.

---

## Next Steps

- Try creating your own SQL queries to investigate other potential security issues.
- Research more advanced SQL techniques for data analysis in cybersecurity.
- Explore how this type of analysis fits into a broader cybersecurity strategy.
---
