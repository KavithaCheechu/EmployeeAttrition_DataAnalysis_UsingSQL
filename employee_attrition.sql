create database EmployeeAttrition;
show databases;
use EmployeeAttrition;
show tables;
select * from employee_attrition;
select count(*) from employee_attrition;

#1 Write a SQL query to find the details of employee having 5+ years of experience in between the age group of 27-35
select * from employee_attrition
where age between 27 and 35
and TotalWorkingYears > 5;

select count(*) from employee_attrition
where age between 27 and 35
and TotalWorkingYears >= 5;

#2 Fetch the details of employees having maximum and minimum salary working in different departments who received less than 13% salary hike

select Department, max(MonthlyIncome), min(MonthlyIncome) from employee_attrition
where PercentSalaryHike < 13
group by Department
order by max(MonthlyIncome) desc;

select Department, PercentSalaryHike, max(MonthlyIncome), min(MonthlyIncome)
 from employee_attrition
 group by Department, PercentSalaryHike
 having PercentSalaryHike < 13;

#3 Calculate the average monthly income of all the employee who worked more than 3 years whose education background is medical

select avg(MonthlyIncome) as Average_MontghlyIncome 
from employee_attrition 
where YearsAtCompany > 3
and EducationField = 'Medical';

#4 Identify the total number of male and female Employees under attrition whose marital status is married and haven't received promotion in last 3 years

select gender, count(EmployeeNumber) from employee_attrition
where MaritalStatus = 'Married' and YearsSinceLastPromotion >= 3
group  by gender;

select gender, count(EmployeeNumber) from employee_attrition
where MaritalStatus = 'Married' and YearsSinceLastPromotion >= 3
and Attrition = 'Yes'
group  by gender;

#5 Find the list of employees with max performance rating but no promtion for 4 years and above

select * from employee_attrition
where  PerformanceRating = (select max(PerformanceRating) from employee_attrition)
and YearsSinceLastPromotion >= 4;

#6 List of employees with max and min percentage salary hike

select * from employee_attrition
where PercentSalaryHike = (select max(PercentSalaryHike) from employee_attrition)
or PercentSalaryHike = (select min(PercentSalaryHike) from employee_attrition)
order by PercentSalaryHike desc;

#7 Find distict Departments from table employee_attrition

select distinct Department from employee_attrition;

#8 Find the list of employees working overtime but given min salary hike and are more than 5 years with Company

select * from employee_attrition
where OverTime = 'Yes'
and PercentSalaryHIke = (select min(PercentSalaryHIke) from employee_attrition)
and YearsAtCompany >5
and Attrition = 'Yes';

select * from employee_attrition
where OverTime = 'Yes'
and PercentSalaryHIke = (select max(PercentSalaryHIke) from employee_attrition)
and YearsAtCompany < 5;

#9 Find the list of employees who are not working overtime but given max salary hike and are more than 5 years with Company

select * from employee_attrition
where OverTime = 'No'
and PercentSalaryHIke = (select max(PercentSalaryHIke) from employee_attrition)
and YearsAtCompany < 5;

#10 Find the maximum and minimum of Relationship satisfaction wrt to their marital status

select MaritalStatus, max(RelationshipSatisfaction), min(RelationshipSatisfaction)
from employee_attrition
group by MaritalStatus;


