-- creating the CRM database
CREATE DATABASE IF NOT EXISTS enterprise_crm_db;
USE enterprise_crm_db;

-- creating the customer table which stores core account information
CREATE TABLE IF NOT EXISTS customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
company_name VARCHAR(100) NOT NULL,
industry VARCHAR(50),
region VARCHAR(50),
account_status ENUM('Active','At-Risk','Churned') DEFAULT 'Active',
signup_date DATE NOT NULL
);

-- creating deals table which tracks sales pipelines and revenue
CREATE TABLE IF NOT EXISTS deals (
deal_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
deal_stage ENUM('Lead','Qualified','Proposal','Closed-Won','Closed-Lost') NOT NULL,
deal_value DECIMAL(12,2) NOT NULL,
close_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- interaction table - logs touchpoints (calls,emails,demos)
CREATE TABLE IF NOT EXISTS interactions (
interaction_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
interaction_type ENUM('Call','Email','Meeting','Demo') NOT NULL,
interaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- support ticket table - tracks issues and customer satisfaction (CSAT)
CREATE TABLE IF NOT EXISTS support_tickets (
ticket_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
issue_category VARCHAR(50),
resolution_time_hours INT,
csat_score INT CHECK (csat_score BETWEEN 1 AND 5),
ticket_date DATE,
FOREIGN KEY ( customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);


USE enterprise_crm_db;

-- Insert sample customers
INSERT INTO customers (company_name, industry, region, account_status, signup_date) VALUES
('Alpha Tech', 'SaaS', 'North America', 'Active', '2025-01-15'),
('Beta Logistics', 'Supply Chain', 'Europe', 'Active', '2025-03-10'),
('Gamma Retail', 'E-Commerce', 'North America', 'At-Risk', '2025-05-20'),
('Delta Financial', 'Fintech', 'Asia-Pacific', 'Active', '2025-06-01'),
('Omega Health', 'Healthcare', 'Europe', 'Churned', '2025-02-11');

-- Insert sample deals
INSERT INTO deals (customer_id, deal_stage, deal_value, close_date) VALUES
(1, 'Closed-Won', 45000.00, '2026-01-10'),
(1, 'Closed-Won', 15000.00, '2026-03-05'),
(2, 'Closed-Won', 80000.00, '2026-02-14'),
(3, 'Proposal', 30000.00, NULL),
(4, 'Closed-Won', 120000.00, '2026-01-25'),
(5, 'Closed-Lost', 50000.00, '2026-04-01');

-- Insert sample support tickets (including a NULL csat_score to test Q3)
INSERT INTO support_tickets (customer_id, issue_category, resolution_time_hours, csat_score, ticket_date) VALUES
(1, 'API Integration', 4, 5, '2026-01-12'),
(2, 'Billing Inquiry', 24, 3, '2026-02-18'),
(3, 'System Lag', 48, 2, '2026-03-10'),
(4, 'Authentication', 2, 5, '2026-01-28'),
(5, 'Data Export Error', 72, NULL, '2026-02-05');

SELECT * FROM  customers;
SELECT * FROM deals;
SELECT * FROM interactions;
SELECT * FROM support_tickets;



-- finding the top most 3 region generating the highest closed-won revenue

SELECT
c.region,
SUM(d.deal_value) AS total_revenue
FROM customers c
JOIN deals d ON c.customer_id = d.customer_id
WHERE d.deal_stage = 'Closed-Won'
GROUP BY c.region
ORDER BY total_revenue DESC
LIMIT 3;

-- handling missing null csat_score values when calculating customer health metrics

SELECT 
    t.ticket_id,
    c.company_name,
    t.issue_category,
    t.csat_score AS original_score,
    COALESCE(t.csat_score, (SELECT ROUND(AVG(csat_score), 1) FROM support_tickets)) AS imputed_csat_score,
    CASE 
        WHEN t.csat_score IS NULL THEN 'Imputed via Average'
        ELSE 'Actual Score'
    END AS data_status
FROM support_tickets t
JOIN customers c ON t.customer_id = c.customer_id;










