# 📊 SQL for Business Analysis: From Basic to Advanced Scenarios

This repository showcases practical SQL solutions designed from a **Business Analyst (BA)** perspective to address real-world operational and business problems. Rather than abstract theory, it serves as an **end-to-end progressive guide** focusing on payment systems, data hygiene, and e-commerce analytics.

## 🎯 Module Overview & Core Focus

### 💳 1. Payment Systems & FinTech Analytics
Focuses on banking operations, payment gateways, credit card BINs, risk management, and fraud controls.
* **Core Focus:** Identifying high-value transaction failures, foreign currency account management, segmenting user risk profiles based on KYC status, double-spending detection, and flagging anomalous/nighttime fraud velocity.

### 📑 2. SQL Core Concepts & Data Quality
Focuses on foundational SQL techniques essential for data validation, reporting, and pipeline hygiene across industries.
* **Core Focus:** Table initialization, data cleaning, duplicate record resolution, merging user cohorts across platforms (iOS vs. Web), and fundamental aggregation pipelines.

### 🛒 3. E-Commerce & Customer Analytics *(In Progress)*
Actively under development, focusing on retail metrics, customer loyalty, and revenue growth.
* **Core Focus:** Identifying products priced above category averages, calculating customer tenure (time between first and last order), Month-over-Month (MoM) revenue growth, and segmenting high-value (VIP) customers.

---

## 🛠️ Core Technical Stack

* **Data Management & Hygiene:** `DDL / DML (CREATE, INSERT, UPDATE)`, `WHERE`, `GROUP BY`, `HAVING`, `Duplicates Detection`
* **Data Integration & Multi-Source:** `INNER JOIN`, `LEFT JOIN`, `SET Operators (UNION / UNION ALL)`
* **Conditional & Risk Logic:** `CASE WHEN`, `KYC & Status Segmentation`, `Rule-Based Labeling`
* **Time-Series & Date Analytics:** `Timestamp / Date Functions`, `Tenure Calculation`, `Nighttime & Velocity Logic`
* **Advanced Analytics & Window Functions:** `CTEs (WITH / Recursive CTEs)`, `Correlated Subqueries`, `Window Functions (LAG, NTILE, SUM() OVER, ORDER BY)`
