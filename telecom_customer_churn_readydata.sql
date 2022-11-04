SELECT * FROM telecom_portfoilo_project.telecom_customer_churn;

SELECT `Internet Type`,`Total Charges`
FROM telecom_customer_churn

-- Deleting unnecessary column --
ALTER TABLE telecom_customer_churn
DROP Married, DROP `Number of Referrals`, DROP `Online Security`,
DROP `Churn Category`, DROP `Churn Reason`, DROP `Paperless Billing`,
 DROP Contract,DROP `Premium Tech Support`,DROP `Device Protection Plan`,
 DROP `Online Backup`;
 
 -- Checking the table --
SELECT *
 FROM telecom_portfoilo_project.telecom_customer_churn;

-- Check through for city with the highest Monthly GB download & charges --
SELECT City,`Zip Code`,`Internet Type`,
`Avg Monthly GB Download`,`Monthly Charge`
FROM telecom_customer_churn
ORDER BY `Avg Monthly GB Download` DESC;

SELECT distinct (City),`Zip Code`,`Internet Type`,
`Avg Monthly GB Download`,`Monthly Charge`
FROM telecom_customer_churn
ORDER BY `Monthly Charge` DESC;

-- Check the customer with highest Monthly GB download --

select `Customer ID`,Gender,
Age,`Avg Monthly GB Download`, 
`Monthly Charge`,`Payment Method`
from telecom_customer_churn
ORDER BY `Avg Monthly GB Download` DESC; 

-- Check the customer vs Monthly charge --

select `Customer ID`,Gender,
Age,`Avg Monthly GB Download`,         
`Monthly Charge`,`Payment Method`
from telecom_customer_churn
ORDER BY `Monthly Charge`DESC


SELECT  City, count(`Avg Monthly GB Download`) as 'total GB used',
count(`Total Charges`) as total_charges
from telecom_customer_churn 


-- joining population with customer id table --
SELECT Population, `Total Charges`, `Total Revenue`,City, telecom_customer_churn.`Zip Code`
FROM telecom_customer_churn
JOIN telecom_zipcode_population 
	ON telecom_customer_churn.`Zip Code`= telecom_zipcode_population.`Zip Code`
ORDER BY Population DESC


-- check for the city vs revenue vs population --
SELECT `Avg Monthly GB Download`,`Total Charges`,`Total Revenue`,
City, Population
FROM telecom_customer_churn
JOIN telecom_zipcode_population
ON telecom_zipcode_population.`Zip Code` = telecom_customer_churn.`Zip Code`
GROUP BY City
ORDER BY `Total Revenue` DESC


select `Customer ID`,Gender,
Age,City,Latitude,Longitude
from telecom_customer_churn 
WHERE `Zip Code` IN 
(SELECT `Zip Code` FROM telecom_zipcode_population
WHERE `Zip Code` BETWEEN 90350 AND 90550)


-- Group age into category --
SELECT
CASE
WHEN Age < 20 THEN 'Under 20'
WHEN Age BETWEEN 20 AND 24 THEN '20-24'
WHEN Age BETWEEN 25 AND 29 THEN '25-29'
WHEN Age BETWEEN 30 AND 34 THEN '30-34'
WHEN Age BETWEEN 35 AND 39 THEN '35-39'
WHEN Age BETWEEN 40 AND 44 THEN '40-44'
WHEN Age BETWEEN 45 AND 49 THEN '45-49'
WHEN Age BETWEEN 50 AND 54 THEN '50-54'
WHEN Age BETWEEN 55 AND 59 THEN '55-59'
WHEN Age BETWEEN 60 AND 64 THEN '60-64'
WHEN Age BETWEEN 65 AND 69 THEN '65-69'
WHEN Age BETWEEN 70 AND 74 THEN '70-74'
WHEN Age BETWEEN 75 AND 79 THEN '75-79'
WHEN Age BETWEEN 80 AND 84 THEN '80-84'
WHEN Age > 85 THEN 'Over 80'
END AS 'Age Range'
FROM telecom_customer_churn

-- creating a new table --
 Create table age_range 
SELECT`Customer ID`,Gender,Age,Latitude,Longitude,`Avg Monthly GB Download`,
 City,`Payment Method`,`Monthly Charge`,`Total Charges`,`Total Revenue`,
 `Customer Status`, Population, telecom_customer_churn.`Zip Code`
FROM telecom_customer_churn
JOIN telecom_zipcode_population 
	ON telecom_customer_churn.`Zip Code`= telecom_zipcode_population.`Zip Code`


create temporary table ready_table 
as (
select *,
case
WHEN Age < 20 THEN 'Under 20'
WHEN Age BETWEEN 20 AND 24 THEN '20-24'
WHEN Age BETWEEN 25 AND 29 THEN '25-29'
WHEN Age BETWEEN 30 AND 34 THEN '30-34'
WHEN Age BETWEEN 35 AND 39 THEN '35-39'
WHEN Age BETWEEN 40 AND 44 THEN '40-44'
WHEN Age BETWEEN 45 AND 49 THEN '45-49'
WHEN Age BETWEEN 50 AND 54 THEN '50-54'
WHEN Age BETWEEN 55 AND 59 THEN '55-59'
WHEN Age BETWEEN 60 AND 64 THEN '60-64'
WHEN Age BETWEEN 65 AND 69 THEN '65-69'
WHEN Age BETWEEN 70 AND 74 THEN '70-74'
WHEN Age BETWEEN 75 AND 79 THEN '75-79'
WHEN Age BETWEEN 80 AND 84 THEN '80-84'
WHEN Age > 85 THEN 'Over 80'
END AS 'Age Range'
from age_range);

create view ready_table AS
select *,
case
WHEN Age < 20 THEN 'Under 20'
WHEN Age BETWEEN 20 AND 24 THEN '20-24'
WHEN Age BETWEEN 25 AND 29 THEN '25-29'
WHEN Age BETWEEN 30 AND 34 THEN '30-34'
WHEN Age BETWEEN 35 AND 39 THEN '35-39'
WHEN Age BETWEEN 40 AND 44 THEN '40-44'
WHEN Age BETWEEN 45 AND 49 THEN '45-49'
WHEN Age BETWEEN 50 AND 54 THEN '50-54'
WHEN Age BETWEEN 55 AND 59 THEN '55-59'
WHEN Age BETWEEN 60 AND 64 THEN '60-64'
WHEN Age BETWEEN 65 AND 69 THEN '65-69'
WHEN Age BETWEEN 70 AND 74 THEN '70-74'
WHEN Age BETWEEN 75 AND 79 THEN '75-79'
WHEN Age BETWEEN 80 AND 84 THEN '80-84'
WHEN Age > 85 THEN 'Over 80'
END AS 'Age Range'
from age_range;

select*
FROM ready_table