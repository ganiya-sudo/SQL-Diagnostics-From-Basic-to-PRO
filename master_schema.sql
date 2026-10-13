-- ========================================================
-- MASTER SCHEMA SETUP
-- ========================================================
CREATE DATABASE IF NOT EXISTS tse_support_practice;
USE tse_support_practice;

-- --------------------------------------------------------
-- DATASET A: SYSTEM CLUSTER PROJECTS (Phase 1 & 2 Baseline)
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS supabase_projects (
    project_id INT PRIMARY KEY,
    org_name VARCHAR(100),
    region VARCHAR(50),
    total_db_size_gb INT,
    active_connections INT,
    status VARCHAR(20)
);

INSERT INTO supabase_projects (project_id, org_name, region, total_db_size_gb, active_connections, status) VALUES
(101, 'AcmeCorp', 'us-east-1', 45, 120, 'active'),
(102, 'DevStudio', 'eu-west-1', 12, 8, 'paused'),
(103, 'BuildIt', 'us-east-1', 150, 450, 'active'),
(104, 'Saasify', 'ap-southeast', 8, 95, 'active'),
(105, 'ByteSize', 'eu-west-1', 95, 12, 'active'),
(106, 'CloudTech', 'us-east-1', 3, 0, 'paused')
ON DUPLICATE KEY UPDATE project_id=project_id;

-- --------------------------------------------------------
-- DATASET B: USER DATABASE STORAGE METRICS (Phase 2 Joins)
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_databases (
    db_id INT PRIMARY KEY,
    customer_email VARCHAR(100),
    plan_tier VARCHAR(20),       
    cpu_usage_percent INT,       
    ram_usage_percent INT,       
    ssl_enabled VARCHAR(5)       
);

CREATE TABLE IF NOT EXISTS database_backups (
    backup_id INT PRIMARY KEY,
    db_id INT,                         
    last_backup_date DATE,
    backup_status VARCHAR(20)          
);

INSERT INTO user_databases VALUES
(501, 'alpha@test.com', 'free', 92, 45, 'FALSE'),
(502, 'beta@corp.com', 'enterprise', 40, 88, 'TRUE'),
(503, 'gamma@dev.io', 'pro', 15, 20, 'TRUE'),
(504, 'delta@shop.nz', 'free', 85, 90, 'FALSE'),
(505, 'epsilon@app.co', 'pro', 98, 95, 'TRUE'),
(506, 'zeta@edu.ng', 'free', 10, 12, 'TRUE')
ON DUPLICATE KEY UPDATE db_id=db_id;

INSERT INTO database_backups VALUES
(901, 501, '2026-10-10', 'successful'),
(902, 502, '2026-10-12', 'successful'),
(903, 503, '2026-10-11', 'failed'),
(904, 504, '2026-10-09', 'successful'),
(905, 505, '2026-10-12', 'failed'),
(906, 506, '2026-10-12', 'successful')
ON DUPLICATE KEY UPDATE backup_id=backup_id;
