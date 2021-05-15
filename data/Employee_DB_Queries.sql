-- query question #1

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees inner join salaries on employees.emp_no = salaries.emp_no;

