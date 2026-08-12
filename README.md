# Enterprise CRM Analytics Engine

---

## 📌 Project Overview
I built this project to automate how customer data flows from a relational database straight into clean business reports and charts. Instead of running manual queries every time, this Python script connects to MySQL, pulls customer and sales deals, crunches the numbers, and spits out a timestamped CSV and a revenue chart in seconds.

---

## 🛑 The Real Problem
In today's fast-paced digital economy, organizations constantly collect massive volumes of customer relationship management (CRM) data across distributed relational tables (such as customers, sales deals, interactions, and support tickets). However, business intelligence and sales operations teams face a critical operational bottleneck: siloed data. Extracting actionable insights requires writing repetitive manual SQL queries or building fragile, error-prone spreadsheets just to track essential metrics like total client spend, deal frequency, and Average Order Value (AOV). This manual lag delays data-driven decision-making, increases human reporting errors, and leaves companies unable to react quickly to shifting market demands or declining customer health.

---

## 💡 The Solution
I wrote an automated Python-powered ETL pipeline (`crm_engine.py`) that bridges modern database engineering and business intelligence to completely eliminate manual reporting friction:
* **Database Extraction:** Uses a database cursor to securely connect to MySQL and execute robust multi-table `JOIN` statements across enterprise tables.
* **Data Transformation:** Transforms raw query results into structured Pandas DataFrames, instantly computing complex commercial metrics like Average Order Value through high-performance vector math.
* **Smart Version Control:** Integrates Python's `datetime` library to dynamically generate precise UTC timestamps for every execution, ensuring export files (`.csv` and `.png`) are automatically version-controlled and never accidentally overwritten.
* **Automatic Visuals:** Programmatically builds, formats, and saves customized Matplotlib bar charts to instantly display customer revenue distributions.

---

## 🗄️ Database Architecture & Visual Proofs

Here is a look at the underlying enterprise database schema and the actual execution steps inside MySQL Workbench and VS Code:

* **MySQL Relational Schema & Tables (`customers`):**
  ![Customers Table Setup](Screenshot%20(94).jpg)

* **Multi-Table Deals & Transactions (`deals`):**
  ![Deals Table Setup](Screenshot%20(95).jpg)

* **Interactions & Support Tickets Tracking:**
  ![Support Tickets Data](Screenshot%20(97).jpg)

* **Advanced SQL Aggregation (Finding Top Regions by Closed-Won Revenue):**
  ![SQL Query Revenue Analysis](Screenshot%20(98).jpg)

* **Handling Missing NULL Values in Customer Health Metrics:**
  ![Null Handling COALESCE](Screenshot%20(99).jpg)

---

## 💻 Python Execution Workflow

Here is how the script executes live in the terminal environment step-by-step:

* **Step 1: Establishing the Database Connection:**
  ![Database Connection Success](Screenshot%20(100).png)

* **Step 2: Pulling and Structuring Data into a Pandas DataFrame:**
  ![Pandas DataFrame Output](Screenshot%20(101).png)

* **Step 3: Calculating CRM Sales Metrics (Total Spend & Deal Frequency):**
  ![CRM Analytics DataFrame](Screenshot%20(102).png)

* **Step 4: Final Enhanced Analytics with Computed Average Order Value (AOV):**
  ![Enhanced CRM Analytics DataFrame](Screenshot%20(103).png)

* **Step 5: Automated CSV Report Exporting:**
  ![CSV Report Export Success](Screenshot%20(104).png)

* **Step 6: Automated Chart Visualization Generation:**
  ![Chart Image Export Success](Screenshot%20(105).png)

* **Step 7: Final Visual Matplotlib Output Rendered:**
  ![Final Revenue Bar Chart Visualization](Screenshot%20(106).png)

---

## ❓ Questions Answered
Running this script gives immediate answers to core business questions:
1. *Which clients are bringing in the highest total revenue?*
2. *Who buys frequently versus who spends big per order?* (For instance, spotting how companies like Alpha Tech buy often with smaller amounts, while Delta Financial drops big money on fewer orders).
3. *What is the exact Average Order Value for each account?*

---

## 📈 The Impact
* **Zero Manual Reporting:** Eliminates hours of tedious data extraction and spreadsheet formatting by turning it into a single automated script execution.
* **Clear Client Segmentation:** Empowers sales or management to easily tell high-value accounts apart from high-frequency accounts.
* **Audit-Ready History:** Automatically logs historical data with unique timestamps every time it runs.

---

## 🛠️ Skills Learnt & Tech Stack
* **Python:** Writing functional scripts, managing variables, and handling automation workflows.
* **SQL & Relational Databases:** Connecting to local MySQL servers, managing cursor mechanics, writing multi-table `JOIN` statements, and using `GROUP BY` aggregations.
* **Pandas:** Converting database outputs into tabular DataFrames and running fast, column-based mathematical calculations.
* **Matplotlib:** Plotting, styling, labeling, and saving custom charts as image files.
* **Project Documentation:** Structuring code and organizing a clean portfolio project.