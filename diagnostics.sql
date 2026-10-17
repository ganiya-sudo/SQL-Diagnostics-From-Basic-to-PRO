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
WHERE org_name ILIKE '%Tech%' AND status = 'paused'
GROUP BY region;


-- ========================================================
-- PostgreSQL Production Architecture & Support Diagnostics
-- ========================================================

-- ========================================================
-- CASE 01: HIGH RAM VULNERABILITY AUDIT
-- ========================================================
SELECT ram_usage_percent, customer_email, plan_tier, ssl_enabled
FROM user_databases
WHERE plan_tier = 'free' AND ssl_enabled = 'FALSE'
ORDER BY ram_usage_percent DESC;


-- ========================================================
-- CASE 02: THE ALIAS-WHERE GUARD TRIAGE (Formerly CASE 03)
-- ========================================================
SELECT customer_email, cpu_usage_percent AS core_load
FROM user_databases
WHERE cpu_usage_percent > 80;


-- ========================================================
-- CASE 03: CASE-INSENSITIVE TEXT RECOVERY (Formerly CASE 04)
-- ========================================================
SELECT project_id, org_name, status
FROM cluster_projects
WHERE org_name ILIKE '%studio%';


-- ========================================================
-- CASE 04: EXPLICIT NUMERIC-TO-TEXT CASTING SEARCH (Formerly CASE 05)
-- ========================================================
SELECT log_id
FROM system_audit_logs
WHERE log_id::TEXT LIKE '%1' OR log_id::TEXT LIKE '%5';


-- ========================================================
-- CASE 05: TEXT-TO-INTEGER TYPE ISOLATION (Formerly CASE 06)
-- ========================================================
SELECT log_id, raw_user_id
FROM system_audit_logs
WHERE raw_user_id::INT < 505;


-- ========================================================
-- CASE 06: TEXT-TO-DECIMAL FINANCIAL FILTER (Formerly CASE 07)
-- ========================================================
SELECT log_id, raw_billing_limit, raw_user_id
FROM system_audit_logs
WHERE raw_billing_limit::NUMERIC > 100.00;


-- ========================================================
-- CASE 07: RELATIONAL TIMELINE RANGE AUDIT (Formerly CASE 08)
-- ========================================================
SELECT backup_id, last_backup_date
FROM database_backups
WHERE last_backup_date BETWEEN '2026-10-09' AND '2026-10-11';


-- ========================================================
-- CASE 08: TIMELINE DAY LIST DISCRETE SEARCH (Formerly CASE 09)
-- ========================================================
SELECT backup_id, last_backup_date
FROM database_backups
WHERE last_backup_date IN ('2026-10-10', '2026-10-11', '2026-10-12');


-- ========================================================
-- CASE 09: WORKLOAD PAGINATION OFFSET ENGINE (Formerly CASE 10)
-- ========================================================
SELECT org_name, active_connections
FROM cluster_projects
ORDER BY active_connections DESC
LIMIT 2   
OFFSET 1;


-- ========================================================
-- CASE 10: SECURITY CONFIGURATION PLAN BREAKDOWN (Formerly CASE 11)
-- ========================================================
SELECT plan_tier, ssl_enabled, AVG(cpu_usage_percent) AS avg_percent
FROM user_databases
GROUP BY plan_tier, ssl_enabled;


-- ========================================================
-- CASE 11: DYNAMIC INTRA-SYSTEM SPIKE SUBQUERY (Formerly CASE 12)
-- ========================================================
SELECT customer_email, cpu_usage_percent
FROM user_databases
WHERE cpu_usage_percent > (
    SELECT AVG(cpu_usage_percent) 
    FROM user_databases
);


-- ========================================================
-- CASE 12: PERFECT-MATCH COUPLING INNER JOIN (Formerly CASE 13)
-- ========================================================
SELECT u.db_id, u.plan_tier, bi.invoice_id, bi.amount_due_usd 
FROM user_databases u
INNER JOIN billing_invoices bi ON u.db_id = bi.db_id;


-- ========================================================
-- CASE 13: MASTER LOG ACCURACY ASSURANCE LEFT JOIN (Formerly CASE 14)
-- ========================================================
SELECT u.db_id, u.customer_email, u.plan_tier, bi.invoice_id, bi.amount_due_usd 
FROM user_databases u
LEFT JOIN billing_invoices bi ON u.db_id = bi.db_id;


-- ========================================================
-- CASE 14: ORPHANED ACCOUNTING ISOLATION RIGHT JOIN (Formerly CASE 15)
-- ========================================================
SELECT u.customer_email, bi.invoice_id, u.db_id, u.plan_tier, bi.amount_due_usd 
FROM user_databases u              
RIGHT JOIN billing_invoices bi ON u.db_id = bi.db_id;


-- ========================================================
-- CASE 15: SYSTEM LANDSCAPE PROFILE RECONCILIATION FULL JOIN (Formerly CASE 16)
-- ========================================================
SELECT u.customer_email, u.db_id, u.plan_tier, bi.invoice_id, bi.amount_due_usd
FROM user_databases u
FULL OUTER JOIN billing_invoices bi ON u.db_id = bi.db_id;


-- ========================================================
-- CASE 16: MASTER INCIDENT ESCALATION TRIAGE - THE FINALE CAPSTONE (Formerly CASE 17)
-- ========================================================
SELECT 
    u.db_id,
    u.customer_email, 
    u.plan_tier,
    b.backup_status,
    COUNT(*) AS total_logs
FROM user_databases u
LEFT JOIN database_backups b ON u.db_id = b.db_id
WHERE (u.customer_email ILIKE '%test%' OR u.customer_email ILIKE '%corp%')
GROUP BY 
    u.db_id, 
    u.customer_email, 
    u.plan_tier, 
    b.backup_status
HAVING AVG(u.cpu_usage_percent) > (
    SELECT AVG(cpu_usage_percent) 
    FROM user_databases
)
ORDER BY u.ram_usage_percent DESC;
