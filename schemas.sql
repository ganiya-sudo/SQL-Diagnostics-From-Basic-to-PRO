MASTER SCHEMA SETUP

CREATE DATABASE tse_support_practice;
USE tse_support_practice;

CREATE TABLE cluster_projects (
    project_id INT PRIMARY KEY,
    org_name VARCHAR(100),
    region VARCHAR(50),
    total_db_size_gb INT,
    active_connections INT,
    status VARCHAR(20)
);

CREATE TABLE user_databases (
    db_id INT PRIMARY KEY,
    customer_email VARCHAR(100),
    plan_tier VARCHAR(20),       
    cpu_usage_percent INT,       
    ram_usage_percent INT,       
    ssl_enabled VARCHAR(5)       
);

CREATE TABLE database_backups (
    backup_id INT PRIMARY KEY,
    db_id INT,                         
    last_backup_date DATE,
    backup_status VARCHAR(20)          
);
    
CREATE TABLE billing_invoices (
    invoice_id INT PRIMARY KEY,
    db_id INT, 
    amount_due_usd NUMERIC(10,2),
    payment_status VARCHAR(20);

CREATE TABLE system_audit_logs (
    log_id INT PRIMARY KEY,
    raw_user_id VARCHAR(50),      
    raw_billing_limit VARCHAR(50) 
);

    INSERT INTO cluster_projects VALUES
(101, 'AcmeCorp', 'us-east-1', 45, 120, 'active'),
(102, 'DevStudio', 'eu-west-1', 12, 8, 'paused'),
(103, 'BuildIt', 'us-east-1', 150, 450, 'active'),
(104, 'Saasify', 'ap-southeast', 8, 95, 'active'),
(105, 'ByteSize', 'eu-west-1', 95, 12, 'active'),
(106, 'CloudTech', 'us-east-1', 3, 0, 'paused');

INSERT INTO user_databases VALUES
(501, 'alpha@test.com', 'free', 92, 45, 'FALSE'),
(502, 'beta@corp.com', 'enterprise', 40, 88, 'TRUE'),
(503, 'gamma@dev.io', 'pro', 15, 20, 'TRUE'),
(504, 'delta@shop.nz', 'free', 85, 90, 'FALSE'),
(505, 'epsilon@app.co', 'pro', 98, 95, 'TRUE'),
(506, 'zeta@edu.ng', 'free', 10, 12, 'TRUE');

INSERT INTO database_backups VALUES
(901, 501, '2026-10-10', 'successful'),
(902, 502, '2026-10-12', 'successful'),
(903, 503, '2026-10-11', 'failed'),
(904, 504, '2026-10-09', 'successful'),
(905, 505, '2026-10-12', 'failed'),
(906, 506, '2026-10-12', 'successful');

INSERT INTO billing_invoices VALUES
(7001, 502, 1500.00, 'paid'),      
(7002, 503, 25.00,   'paid'),      
(7003, 505, 25.00,   'unpaid'),    
(7004, 999, 120.00,  'unpaid');  

INSERT INTO system_audit_logs VALUES
(1, '501', '150.00'),
(2, '502', '2000.50'),
(3, '505', '45.00'),
(4, '705', '1200.00'),
(5, '509', '75.25');
