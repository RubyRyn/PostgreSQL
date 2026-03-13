"""
Difficulty: Medium

Calculates the difference between the highest salaries in the marketing and engineering departments. 
Output just the absolute difference in salaries.

db_employee table
------------------
id:bigint
name:text
salary:bigint
department_id:bigint

db_dept table
------------------
id:bigint
department:text
"""

select
-- MAX(de.salary) FILTER(WHERE de.department_id = 1) as eng_salary, 
-- MAX(de.salary) FILTER(WHERE de.department_id = 4) as marketing_salary, 
ABS(MAX(de.salary) FILTER(WHERE de.department_id = 1)-MAX(de.salary) FILTER(WHERE de.department_id = 4)) as salary_difference
from db_employee as de 
left join db_dept as dd on de.department_id = dd.id
;
