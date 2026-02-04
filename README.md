# 🐾 Veterinary Physiotherapy Management System (VPMS)

**Academic Project **

**Institution:** University of Algarve - FCT (UAlg FCT)

**Course:** Database Systems 2024/2025

**Authors:**
* André Martins
* António Matoso
* Tomás Machado

---

## 📖 Project Overview
This project consists of the **end-to-end modeling and implementation of a relational database** for a Veterinary Physiotherapy Clinic. The system was designed to handle complex clinical workflows, from animal admission and diagnosis to physical rehabilitation planning and execution.

It focuses heavily on **Data Integrity**, **Business Logic enforcement**, and **Data Analytics** through advanced SQL features.

### 🎯 Key Features & Scope
The system manages three core operational areas:

1.  **Advanced Human Resources Management:**
    * Handles a hierarchy of **Collaborators**, including Receptionists, Cleaners, and Veterinarians.
    * **Specialization Logic:** Implements disjoint specialization where a Veterinarian can be either a *Therapist* or a *Clinical Director*, but not both simultaneously.
2.  **Patient & Clinical History:**
    * Manages Clients (Owners), Animals (Patients), and their detailed medical history and insurance status.
3.  **Treatment Workflow Engine:**
    * **Consultations:** Performed exclusively by the Clinical Director.
    * **Intervention Plans:** Defines long-term rehabilitation strategies.
    * **Treatment Cycles:** Links Consultations to specific Plans.
    * **Execution Tracking:** Monitors *Planned Treatments* vs. *Realized Treatments* to ensure protocol compliance.

---

## 🛠️ Technical Implementation

The project leverages advanced SQL capabilities to ensure data quality and automate processes:

### 1. Business Rules & Data Integrity
We moved business logic from the application layer to the database layer using **PL/pgSQL Triggers** (located in `ddl.sql`):
* `verifica_diretor`: Ensures only **one** Clinical Director exists at any given time.
* `verifica_disjuncao_terapeuta`: Enforces the rule that the Director cannot perform Therapist duties.
* `CK_DATA_PLANOS`: Constraints to ensure start dates are strictly prior to end dates.

### 2. Analytics & Reporting (Stored Procedures & Views)
* **Productivity Analysis:** A Stored Function `total_tratamentos_detalhados_por_terapeuta` (in `proc_func.sql`) calculates the performance of therapists within specific timeframes.
* **Data Abstraction:** Views like `vw_tratamentos_planeados_e_realizados` (in `views.sql`) provide a simplified layer for reporting on treatment efficacy.

### 3. Complex Data Extraction
The repository includes 12 complex SQL queries (in `queries.sql`) demonstrating proficiency in:
* `LEFT OUTER JOIN` and `SELF-JOIN`.
* Subqueries and `WITH` clauses (CTEs).
* Aggregation (`GROUP BY`, `HAVING`).
* Set operations (`EXISTS`, `NOT EXISTS`).

---

## 📂 Repository Structure

The project is organized into modular SQL scripts for maintainability:

| File | Description |
| :--- | :--- |
| **`sql/ddl.sql`** | **Schema Definition:** Creates tables, Primary/Foreign Keys, and integrity constraints (Check, Unique). Contains the **Trigger** logic. |
| **`sql/dml_insert.sql`** | **Data Population:** A robust dataset of dummy data (Clients, Animals, Staff, Clinical Records) to test all system features. |
| **`sql/queries.sql`** | **Business Intelligence:** A collection of 12 analytical queries answering business questions (e.g., *"Which animals have appointments on date X?", "Average salary by specialty"*). |
| **`sql/proc_func.sql`** | **Automation:** Stored Procedures and Functions for complex calculations. |
| **`sql/views.sql`** | **Reporting Layers:** Virtual tables created to simplify access to frequent data patterns. |
| **`docs/`** | Contains the Entity-Relationship Diagram (ER) and project documentation. |

---

## 📊 Entity-Relationship Model (Summary)
The core logic relies on the following relational chain:
> **Client** (1:N) ➔ **Animal** (1:N) ➔ **Consultation** (1:1) ➔ **Treatment Cycle** (1:N) ➔ **Planned Treatment** (1:N) ➔ **Realized Treatment**

*(Please refer to the `docs` folder for the full ER Diagram).*

---
*Developed for the BSc in Informatics Engineering - University of Algarve.*
