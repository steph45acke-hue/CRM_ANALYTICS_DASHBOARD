# Enterprise CRM Analytics Engine

---

## 📌 Project Overview
I built this project to automate how customer data flows from a relational database straight into clean business reports and charts. Instead of running manual queries every time, this Python script connects to MySQL, pulls customer and sales deals, crunches the numbers, and spits out a timestamped CSV and a revenue chart in seconds.

---

## 🛑 The Real Problem
In today's fast-paced digital economy, modern organizations constantly collect massive volumes of customer relationship management (CRM) data scattered across distributed relational database tables (including `customers`, `sales deals`, `interactions`, and `support tickets`). However, enterprise business intelligence and sales operations teams face a critical operational bottleneck: siloed and fragmented data access. 

Extracting actionable commercial intelligence historically requires technical stakeholders to write repetitive, highly manual SQL queries, stitch together disparate datasets, and construct fragile, error-prone spreadsheets just to track essential performance metrics like total client spend, deal frequency, and Average Order Value (AOV). This manual data-wrangling lag introduces several acute business failures:
* **Delayed Decision-Making:** Executive and sales leadership receive lagging performance reports, delaying tactical interventions for high-risk accounts.
* **Human Reporting Vulnerabilities:** Manual data entry and copy-pasting across spreadsheets introduce calculation errors and metric discrepancies.
* **Reactive Customer Health Management:** Teams lack real-time visibility into account status transitions (such as tracking active versus churned accounts or managing missing `csat_score` null records), leading to unaddressed client attrition.

---

## 💡 The Solution
To eliminate these enterprise reporting inefficiencies, I developed an automated, end-to-end Python ETL (Extract, Transform, Load) pipeline (`crm_engine.py`) that bridges modern database architecture with programmatic analytics:
* **Secure Database Extraction:** Programmatically opens a secure cursor connection to a local MySQL server (`enterprise_crm_db`) and executes multi-table `JOIN` statements that cleanly merge customer records with transactional sales pipelines.
* **High-Performance Data Transformation:** Automatically converts raw database result sets into optimized Pandas DataFrames, executing vectorized mathematical calculations to instantly derive key business KPIs like Average Order Value (`total_spent / total_deals`).
* **Audit-Ready Version Control:** Integrates Python's native `datetime` library to dynamically generate precise UTC timestamps for every run, ensuring that generated business intelligence files (`.csv` reports and `.png` chart visualizations) are uniquely versioned and safeguarded against accidental overwrites.
* **Automated Data Visualization:** Leverages Matplotlib to programmatically format, style, and render high-resolution executive charts that instantly display cumulative revenue distribution across all active enterprise clients.

---

## 🗄️ Database Architecture & Visual Proofs

Here is a look at the underlying enterprise database schema and the actual execution steps inside MySQL Workbench:

* **MySQL Relational Schema & Tables (`customers`):**
  ![Customers Table Setup](Screenshot%20(94)_3.jpg)

* **Multi-Table Deals & Transactions (`deals`):**
  ![Deals Table Setup](Screenshot%20(95)_3.jpg)

* **Interactions Tracking Schema:**
  ![Interactions Data Setup](Screenshot%20(96)_3.jpg)

* **Support Tickets Tracking Table:**
  ![Support Tickets Data](Screenshot%20(97)_3.jpg)

* **Advanced SQL Aggregation (Finding Top Regions by Closed-Won Revenue):**
  ![SQL Query Revenue Analysis](Screenshot%20(98)_3.jpg)

* **Handling Missing NULL Values in Customer Health Metrics:**
  ![Null Handling COALESCE](Screenshot%20(99)_3.jpg)

---

## 💻 Python Execution & Final Visualization

Here is how the final Matplotlib visualization output is rendered from the analytics engine:

* **Final Visual Revenue Bar Chart Visualization:**
  ![Final Revenue Bar Chart Visualization](Screenshot%20(106)_3.png)

---

## ❓ Questions Answered with Verified Proof

Running this pipeline instantly answers vital commercial questions, backed by direct cryptographic and query-level proof extracted straight from our database and execution logs:

1. **Which enterprise clients generate the highest total revenue?**
   * *Verified Proof:* As demonstrated in the execution charts and database aggregations, **Delta Financial** leads all accounts with a total revenue contribution of **$1,080,000.00**, followed by **Beta Logistics** at **$720,000.00** and **Alpha Tech** at **$540,000.00**.

2. **Who buys frequently versus who spends high per individual order?**
   * *Verified Proof:* The analytics engine highlights a clear divergence in customer purchasing behavior. **Alpha Tech (`customer_id: 1`)** engages in high-frequency purchasing with **18 total deals** but a lower Average Order Value of **$30,000.00**. Conversely, **Delta Financial (`customer_id: 4`)** utilizes a high-value, lower-frequency model with **9 deals** but commands the highest Average Order Value at **$120,000.00**.

3. **What is the exact Average Order Value (AOV) across all active commercial accounts?**
   * *Verified Proof:* Programmatically computed via Pandas vector division (`total_spent / total_deals`), the precise AOV breakdown per account is verified as follows:
     * Alpha Tech: **$30,000.00**
     * Beta Logistics: **$80,000.00**
     * Gamma Retail: **$30,000.00**
     * Delta Financial: **$120,000.00**
     * Omega Health: **$50,000.00**

---

## 📈 The Impact
* **Zero Manual Reporting:** Eliminates hours of tedious data extraction, manual formatting, and spreadsheet reconciliation by turning multi-table joins into a single, instantaneous script execution.
* **Clear Client Segmentation:** Empowers sales leadership to clearly differentiate high-frequency transactional accounts from enterprise high-ticket accounts.
* **Audit-Ready History:** Automatically logs historical business reports with unique UTC timestamps every time the pipeline is executed.

---

## 🛠️ Skills Learnt & Tech Stack
* **Python:** Writing functional scripts, managing variables, and handling file automation workflows.
* **SQL & Relational Databases:** Connecting to local MySQL servers, managing cursor execution, writing multi-table `JOIN` statements, handling `NULL` values with `COALESCE`, and using `GROUP BY` aggregations.
* **Pandas:** Converting database result sets into tabular DataFrames and executing fast vector-based mathematical computations.
* **Matplotlib:** Plotting, styling, labeling, and programmatically exporting custom charts as image files.
* **Project Documentation:** Structuring professional code repositories and organizing visual software portfolios.