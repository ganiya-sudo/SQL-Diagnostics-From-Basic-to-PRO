# SQL Diagnostics: From Basic to PRO

Welcome to my master SQL progress journal! I am transitioning from a Customer Service Representative (CSR) to a **Technical Support Engineer (TSE)**. This repository tracks my journey as I build my technical muscle memory to prepare for a role at teams like **Supabase**.

This repository documents my progression from simple single-table filters to multi-table relational debugging, explicit database casting mechanisms, and advanced query optimizations.

---

## My Progression Map

### Phase 1: Foundational Filtering (Basic)
*   **Concepts Mastered:** `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `AND`, `OR`.
*   **What I learned:** Mastered the strict front-end lexical query sequence and learned how to use parenthetical containers `( )` to prevent logical operator traps.

### Phase 2: Relational Multi-Table Joins (Intermediate)
*   **Concepts Mastered:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `ON` hooks.
*   **What I learned:** Discovered how database systems use Primary Keys and Foreign Keys to cross-reference data. Mastered tracking down orphaned records and data leaks using outer joins.

### Phase 3: Native PostgreSQL Infrastructure Diagnostics (Graduated 🚀)
*   **Concepts Mastered:** Strict Quotes Law, `ILIKE`, `COUNT(*)`, `AVG()`, `GROUP BY`, `HAVING`, Explicit Data Casting (`::TEXT`, `::INT`, `::NUMERIC`), Date Mechanics (`NOW()`, `INTERVAL`, `BETWEEN`), Pagination Loops (`LIMIT` / `OFFSET`), Nested Subqueries.
*   **What I learned:** Transitioned from MySQL to strict PostgreSQL architecture. Mastered the database engine's true internal 6-step Order of Execution. Learned how to isolate complex structural bugs, perform data adjustments on the fly, and resolve platform performance metrics using live Supabase sandboxes.

---

## Repository Schema Files
*   `schemas.sql` - Contains all the SQL/PostgreSQL database structures and data seed rows built throughout my training.
*   `diagnostics.sql` - My complete history of solved real-world technical support incidents and queries.
