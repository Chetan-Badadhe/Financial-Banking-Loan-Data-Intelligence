# Financial Banking Loan Data Intelligence 

# Problem Overview

### A financial institution required data-driven insights to evaluate loan performance, analyze borrower behavior, and identify regional lending trends.

### My Objective
My responsibility was to analyze the loan dataset and develop a dashboard that showcases key metrics such as:

Total loan applications

Funded amount vs amount received

Average interest rates

Debt-to-income ratios

And breakdowns of good vs bad loans, loan purposes, and regional performance

## My Approach
Data Cleaning: Performed data preprocessing and cleansing in Excel to ensure accuracy and consistency.

KPI Extraction & Validation: Extracted and validated key performance indicators using SQL queries.

Visualization & Dashboard Design: Developed interactive dashboards in Power BI for clear data presentation.

Insight Generation & Reporting: Analyzed data to derive actionable insights and prepared reports for stakeholders.

# Key finance domain terms that are essential to understand.
## 1) DTI 
--> The Debt-to-Income (DTI) ratio should ideally be between 30% and 35%, as it is a key factor in determining a customer’s eligibility for a loan. 

## The Dashboard is divided into 3 parts 
### 1) Summary
<img width="908" height="509" alt="summary dashboard" src="https://github.com/user-attachments/assets/e07c8864-eefd-4fd2-a5c1-86ff34e3fc6f" />


### Slicers
1)  Purpose 
2)  Grade 
3)  State

### 2) Overview
<img width="904" height="509" alt="overview dashboard" src="https://github.com/user-attachments/assets/e9f520cd-f603-4517-a151-60ece8badadc" />


### Slicers
1) Select Measure -->
                 Total Amount received | Total Funded Amount | Total Loan Application |
   
3) Good loan vs Bad Loan
4) Grade
5) State

#### so the whole dashboard will change for the slicer

### 3)Details
<img width="904" height="509" alt="details dashboard" src="https://github.com/user-attachments/assets/47ae62af-b4a7-422c-987b-e582234ab794" />


### Slicers
1) Good vs Bad Loan
2) Grade
3) State


## Tools and use case
I used a combination of Excel, SQL, and Power BI:

In Excel, I cleaned the raw CSV data, handled missing values, and did initial exploration.

Using SQL, I wrote queries to extract KPIs like monthly loan applications, funded amounts, and average DTI. I also used SQL to validate the backend data logic powering the dashboard.

Finally, I used Power BI to design a 3-page dashboard:

Summary for high-level KPIs,

Overview for monthly and regional trends,

Details for deeper insights like loan purposes, employment length, and home ownership.



## Conclusion
The dashboard provided clear insights:

Identified that most loans were issued in states like California and Texas,

Found that good loans outnumbered bad loans significantly,

And showed that customers with longer employment length had a lower default rate.
These insights help the bank improve risk assessment and target the right customer segments.

#### Attachments
- Bank Loan Report
- PowerPoint Presentation
- Power BI Report
- Dataset (CSV)
- Key Loan Data Fields and Their Uses
- BANK_LOAN_ANALYSIS - SQL Script File
