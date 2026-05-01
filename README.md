# Hospital Performance Dashboard — SQL & Power BI

A data analysis project connecting a PostgreSQL database to Power BI to build an interactive dashboard tracking hospital appointment performance and patient billing.

---

## Project Overview

This project analyses hospital operational data across two key areas:

- **Appointment performance** — tracking total, cancelled, and year-to-date appointments by doctor
- **Patient billing** — monitoring billed amounts, payments received, and outstanding balances

Data is stored in PostgreSQL, connected directly to Power BI, and visualised through an interactive dashboard with custom DAX measures.

---

## Tools Used

- **PostgreSQL** — data storage and view creation
- **Power BI** — data modelling, DAX measures, and dashboard visualisation
- **Power Query** — data transformation on import
- **DAX** — custom measures for aggregations and time intelligence

---

## Data Import

1. Open Power BI and start a blank report
2. Go to **Get Data → PostgreSQL database**
3. Enter server, database name, and authentication credentials
4. Select the required views in the navigation panel
5. Click **Transform Data** to open Power Query for any pre-load transformations
6. Load into the data model

---

## Data Model

![WhatsApp Image 2025-12-08 at 8 43 09 PM](https://github.com/user-attachments/assets/68182472-ce2a-492e-8403-00dd1a1c2c4e)


The model connects two core tables:

- `hospital_doctor_monthly_metrics` — appointment data by doctor and month
- `hospital_patient_balances` — billing and payment records per patient

A `DateTable` is used to enable time intelligence calculations (e.g. YTD measures).

---

## DAX Measures

### Appointments

| Measure | DAX | Purpose |
|---|---|---|
| Total Appointments | `SUM([Total_appointments])` | Total appointment count |
| YTD Appointments | `TOTALYTD([Total Appointments], DateTable[Date])` | Cumulative appointments from start of year |
| Cancelled Appointments | `SUM([Cancelled_appointments])` | Total cancelled appointments |
| Cancellation Rate | `DIVIDE([Cancelled Appointments], [Total Appointments])` | Proportion of appointments cancelled |

### Billing & Payments

| Measure | DAX | Purpose |
|---|---|---|
| Patient Volume | `DISTINCTCOUNT([Patient ID])` | Count of unique patients with billing history |
| Average Billing per Patient | `AVERAGE([Total billed])` | Typical billing amount per patient |
| Total Billed Amount | `SUM([Total billed])` | Total revenue billed |
| Total Paid Amount | `SUM([Total paid])` | Total payments received |
| Outstanding Balance | `SUM([Total outstanding])` | Total unpaid amount owed by patients |

---

## Dashboard Visuals

The report includes:

- Monthly appointment trends (total vs. cancelled)
- YTD appointment progress
- Doctor-level performance comparison
- Patient billing summary — billed vs. paid vs. outstanding
- Cancellation rate by doctor / month

---
## Article link: https://dev.to/beatrice_njagi/health-care-data-analysis-power-bi-workflow-dli

