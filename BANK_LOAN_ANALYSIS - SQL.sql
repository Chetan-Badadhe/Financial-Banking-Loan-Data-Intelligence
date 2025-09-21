
#--lET's Find the total Number of Loan Application--#
select count(ID) as Total_Applications from bank_loan_db;

#--lET's Find the total Number of Loan MTD Application--#
SELECT COUNT(ID) AS MTP_Total_Applications FROM bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

#--lET's Find the total Number of Loan MTD Application--#
SELECT COUNT(ID) AS PMTP_Total_Applications FROM bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

#-- Let's Find Total Funded Amount--#
select sum(loan_amount) as Total_Funded_Amount from bank_loan_db;

#-- Let's Find MTD Total Funded Amount--#
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

#-- Let's Find PMTD Total Funded Amount--#
select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

#-- Let's Find Total_Amount_Received--#
select sum(TOTAL_PAYMENT) as Toatl_Amount_Received from bank_loan_db;

#-- Let's Find Total_Amount_Received MTD--#
select sum(TOTAL_PAYMENT) as MTD_Toatl_Amount_Received from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

#-- Let's Find Total_Amount_Received PMTD--#
select sum(TOTAL_PAYMENT) as PMTD_Toatl_Amount_Received from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

#-- Let's Find Avergae of Interst Rate--#
select round(avg(int_rate) *100,2) as AVG_INT_RATE from bank_loan_db;

#-- Let's Find Avergae of Interst Rate MTD--#
select round(avg(int_rate) *100,2) as AVG_INT_RATE from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

#-- Let's Find Avergae of Interst Rate PMTD--#
select round(avg(int_rate) *100,2) as AVG_INT_RATE from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

#-- Let's Find the Average Debt-to-income Ratio (DTI)--#
select round(avg(dti)*100,2 ) as AVG_DTI_RATIO from bank_loan_db;

#-- Let's Find the Average Debt-to-income Ratio (DTI) MTD--#
select round(avg(dti)*100,2 ) as MTD_AVG_DTI_RATIO from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

#-- Let's Find the Average Debt-to-income Ratio (DTI) PMTD--#
select round(avg(dti)*100,2 ) as PMTD_AVG_DTI_RATIO from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;


#Good Loan v Bad Loan KPI’s#

#Good Loan#

select *from bank_loan_db;

#--Let's find Good Loan Application Percentage--#   
SELECT 
  ROUND(
    (SUM(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN 1 ELSE 0 END) * 100.0)
    / COUNT(id),
    2
  ) AS Good_Loan_Percentage
FROM bank_loan_db;

#--Good loan Application --#
select count(id) as Good_Loan_Application from bank_loan_db where loan_status in ('Fully Paid','Current');

#--Good Loan Funded Amount--#
select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_db where loan_status in ('Fully Paid','Current');

#--Good Loan Total Received Amount--#
select sum(total_payment) as Good_Loan_Received_Amount from bank_loan_db where loan_status in ('Fully Paid','Current');

#Bad Loan#

#--Let's find Bad Loan Application Percentage--#   
SELECT 
  ROUND(
    (SUM(CASE WHEN loan_status ='Charged Off' THEN 1 ELSE 0 END) * 100.0)
    / COUNT(id),
    2
  ) AS Bad_Loan_Percentage
FROM bank_loan_db;

#--Bad loan Application --#
select count(id) as Bad_Loan_Application from bank_loan_db where loan_status = 'Charged Off';

#--Bad Loan Funded Amount--#
select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_db where loan_status = 'Charged Off';

#--Good Loan Total Received Amount--#
select sum(total_payment) as Bad_Loan_Received_Amount from bank_loan_db where loan_status = 'Charged Off';

#--Loan Status Grid View--#

#Loan_Status#

select 
 loan_status,
 count(id) as Loan_Application,
 sum(total_payment) as Total_Amount_Received,
 sum(Loan_Amount) as Total_Funded_Amount,
 round(avg(int_rate *100),2) as Intrest_Rate,
 round(avg(dti * 100),2) as DTI
 from
 bank_loan_db
 group by loan_status;

#Current_Month#

select loan_status,
sum(total_payment) as MTD_Total_Amount_Received,
sum(loan_amount) as MTD_Total_Funded_Amount
from bank_loan_db WHERE EXTRACT(MONTH FROM issue_date) = 12 group by loan_status;

#--let's Find Monthly Trend by Issue Date--#

SELECT
   EXTRACT(MONTH FROM issue_date) AS Month_Number,
   TO_CHAR(issue_date, 'Month') AS Month_Name,
   COUNT(id) AS Total_Loan_Application,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_db
GROUP BY
   EXTRACT(MONTH FROM issue_date),
   TO_CHAR(issue_date, 'Month')
ORDER BY
   EXTRACT(MONTH FROM issue_date);

#--Regional Analysis by State--#

SELECT
   address_state,
   COUNT(id) AS Total_Loan_Application,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_db
GROUP BY address_state order by count(id) desc;
   
#--Loan Term Analysis--#

SELECT
   term,
   COUNT(id) AS Total_Loan_Application,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_db
GROUP BY term order by term;

#--Employee Length Analysis--#

SELECT
   emp_length,
   COUNT(id) AS Total_Loan_Application,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_db
GROUP BY emp_length order by COUNT(id) desc;

#--Loan Purpose Breakdown --#

SELECT
   purpose,
   COUNT(id) AS Total_Loan_Application,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_db
GROUP BY purpose order by COUNT(id) desc;

#--Home Ownership analysis --#

SELECT
   home_ownership,
   COUNT(id) AS Total_Loan_Application,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_db
GROUP BY home_ownership order by COUNT(id) desc;




