Select * from dbo.data_science_salaries

--- Average salary of data analyst across countries
select employee_residence, Round(avg(salary_in_usd),2) as Avg_Salary_in_usd
from dbo.data_science_salaries
where job_title like '%analyst%'
group by employee_residence
order by Avg_Salary_in_usd desc

-- USA is by far offer significantly higher Data Analyst salary
-- Are there cases where data analyst from UK or elsewhere work for US companies?
select * from dbo.data_science_salaries
where job_title like '%analyst%'
AND employee_residence <> 'US' 
AND company_location = 'US'
order by salary_in_usd desc

-- Significant number of data scientist/analysts are based in USA
select employee_residence, count(employee_residence) numberofemployees
from dbo.data_science_salaries
group by employee_residence
order by numberofemployees desc

-- experience level columns updated
Update dbo.data_science_salaries
SET experience_level = 'Expert Executive-level'
Where experience_level = 'EX'

--- Experience level and average salary across Data Scientist/Analyst
Select experience_level, Round(AVG(salary_in_usd),0) as Average_salary
from dbo.data_science_salaries
Group by experience_level
order by Average_salary DESC
