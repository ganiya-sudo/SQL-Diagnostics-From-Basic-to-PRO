-- ========================================================
-- MASTER DIAGNOSTICS JOURNAL
-- ========================================================
USE tse_support_practice;

-- --------------------------------------------------------
-- PHASE 1: FOUNDATIONAL FILTERING & TEXT OPERATORS
-- --------------------------------------------------------

-- Ticket 1.1: Regional Cluster Infrastructure Check
SELECT region, org_name
FROM cluster_projects
WHERE region = 'us-east-1' OR region = 'eu-west-1'
ORDER BY org_name;

-- Ticket 1.2: Pooler Connection Anomaly Triage
SELECT project_id, active_connections
FROM cluster_projects
WHERE status = 'active' AND active_connections > 100
ORDER BY active_connections DESC;

-- Ticket 1.3: Storage Volatility Cleanup Audit
SELECT org_name, total_db_size_gb, status
FROM cluster_projects
WHERE status = 'paused' AND (total_db_size_gb > 10 OR total_db_size_gb = 3)
ORDER BY total_db_size_gb DESC;

-- Ticket 1.4: Pool Exhaustion Metric Isolation
SELECT project_id, region, active_connections, total_db_size_gb
FROM cluster_projects
WHERE region = 'us-east-1' AND (active_connections > 200 OR total_db_size_gb > 100)
ORDER BY project_id;

-- Ticket 1.5: Unencrypted Free Tier Security Scanning
SELECT customer_email, plan_tier, ssl_enabled
FROM user_databases
WHERE plan_tier = 'free' AND ssl_enabled = 'FALSE'
ORDER BY customer_email;

-- Ticket 1.6: Escalated Premium Memory Strain Alert
SELECT customer_email, plan_tier, ram_usage_percent
FROM user_databases
WHERE (plan_tier = 'free' OR plan_tier = 'pro') AND ram_usage_percent > 75
ORDER BY ram_usage_percent DESC;

-- --------------------------------------------------------
-- PHASE 2: RELATIONAL MULTI-TABLE DATA COUPLING (JOINS)
-- --------------------------------------------------------

-- Ticket 2.1: Integrated Fleet Health Review
SELECT u.customer_email, u.plan_tier, b.backup_status
FROM user_databases u
JOIN database_backups b ON u.db_id = b.db_id
ORDER BY u.customer_email;

-- Ticket 2.2: Premium Storage Core Failure Diagnostic
SELECT u.db_id, u.customer_email, u.plan_tier, b.last_backup_date
FROM user_databases u
JOIN database_backups b ON u.db_id = b.db_id
WHERE (u.plan_tier = 'pro' OR u.plan_tier = 'enterprise') AND b.backup_status = 'failed'
ORDER BY b.last_backup_date DESC;

-- Ticket 2.3: Multi-Vector Security Vulnerability Audit
SELECT u.ram_usage_percent, u.customer_email, u.plan_tier, b.backup_status, u.ssl_enabled
FROM user_databases u
LEFT JOIN database_backups b ON u.db_id = b.db_id
WHERE u.plan_tier = 'free' AND u.ssl_enabled = 'FALSE'
ORDER BY u.ram_usage_percent DESC;


-- --------------------------------------------------------
-- PHASE 3: DATA AGGREGATION & OPERATIONAL METRICS
-- --------------------------------------------------------

-- Ticket 3.1: Incident Fleet Headcount (Unencrypted Counts)
SELECT plan_tier, COUNT(*) AS unencrypted_count
FROM user_databases
WHERE ssl_enabled = 'FALSE'
GROUP BY plan_tier;

-- Ticket 3.2: Infrastructure Capacity Volume Audit
SELECT region, SUM(total_db_size_gb) AS combined_gb_volume
FROM cluster_projects
WHERE status = 'active'
GROUP BY region;

-- Ticket 3.3: High Memory Metrics Analysis (Average RAM)
SELECT plan_tier, AVG(ram_usage_percent) AS mean_ram_load
FROM user_databases
WHERE cpu_usage_percent > 50
GROUP BY plan_tier;


-- --------------------------------------------------------
-- PHASE 4: THE CAPSTONE CAPACITIES (FINAL ASSESSMENTS)
-- --------------------------------------------------------

-- Ticket 4.1: Multi-Table Analytical Crisis Triage
SELECT u.plan_tier, AVG(u.cpu_usage_percent) AS avg_cpu_load
FROM user_databases u
JOIN database_backups b ON u.db_id = b.db_id
WHERE (u.customer_email LIKE '%.io' OR u.customer_email LIKE '%.co') AND b.backup_status = 'failed'
GROUP BY u.plan_tier
HAVING AVG(u.cpu_usage_percent) > 10
ORDER BY avg_cpu_load DESC;

-- Ticket 4.2: Internal Verification Naming Pattern Density Scan
SELECT region, COUNT(*) AS project_count
FROM cluster_projects
WHERE org_name LIKE '%Tech%' AND status = 'paused'
GROUP BY region;

NEXT UP IS POSTGRES
