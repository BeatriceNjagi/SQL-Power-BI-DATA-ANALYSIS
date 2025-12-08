# SQL-Power-BI-DATA-ANALYSIS
## Data Import to Power BI

1.	Start a Blank Report in Power BI.
2.	Navigate to Get Data → PostgreSQL database.
3.	Enter the connection details (server:database) and authentication credentials (username:password), then connect.
4.	In the navigation panel, select the views to import and click Transform Data to open Power Query.

## Data model

![WhatsApp Image 2025-12-08 at 8 43 09 PM](https://github.com/user-attachments/assets/0cada1eb-878b-4278-b5fa-31776e88423a)

## Measures
### Measure 1: Total Appointments
#### DAX:
Total appointments = SUM('hospital doctor_monthly_metrics2'[Total_appointments])
#### Purpose: 
Counts all appointment records. 
#### Fields Used: 
'hospital doctor_monthly_metrics2'[Total_appointments

### Measure 2: YTD Appointments
#### DAX:
YTD Appointments = TOTALYTD([Total appointments], DateTable[Date])
#### Purpose: 
Shows cumulative appointments from the start of the year. 
#### Fields Used: 
[Total appointments], DateTable[Date]
 
### Measure 3: Cancelled Appointments
#### DAX:
Cancelled appointments = SUM('hospital doctor_monthly_metrics2'[Cancelled_appointments])
#### Purpose: 
Counts appointments that were cancelled. 
#### Fields Used: 
‘hospital doctor_monthly_metrics2’[Cancelled_appointments]
 
### Measure 4: Patient Volume
#### DAX:
Patient volume = DISTINCTCOUNT('hospital patient_balances'[Patient ID])
#### Purpose: 
Shows the count of patients with billing history. 
#### Fields Used:
‘hospital patient_balances’[Patient ID]
 
### Measure 5: Average Billing per Patient
#### DAX:
Average Total billed = AVERAGE('hospital patient_balances'[Total billed])
#### Purpose: 
Shows typical billing per patient. 
#### Fields Used: 
‘hospital patient_balances’[Total billed]

### Measure 6: Cancellations Proportion
#### DAX:
Cancelled appointments = SUM('hospital doctor_monthly_metrics2'[Cancelled_appointments])
#### Purpose: 
Shows the proportion of appointments that were cancelled. 
#### Fields Used: 
'hospital doctor_monthly_metrics2'[Cancelled_appointments]
 
### Measure 7: Total Billed amount
#### DAX:
Total billed amount = SUM('hospital patient_balances'[Total billed])
#### Purpose: 
Calculates total billing amounts. 
#### Fields Used: - 
'hospital patient_balances'[Total billed] 

### Measure 8: Total Paid amount
#### DAX:
Total paid amounts = SUM('hospital patient_balances'[Total paid])
#### Purpose: 
Calculates total payments received.
#### Fields Used: - 
'hospital patient_balances'[Total paid] 

### Measure 9: Current Outstanding Balance
#### DAX:
Outstanding balances = SUM('hospital patient_balances'[Total outstanding])
#### Purpose: 
Shows the total unpaid amount owed by patients. 
#### Fields Used: - 
'hospital patient_balances'[Total outstanding]
