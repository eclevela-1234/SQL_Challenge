-- query question #1

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees inner join salaries on employees.emp_no = salaries.emp_no;

-- query question #2

select employees.first_name, employees.last_name, employees.hire_date
from employees where extract(year from "hire_date") = 1986; 

-- query question #3

select employees.last_name, employees.first_name, employees.emp_no, dept_manager.dept_no, departments.dept_name
from employees inner join dept_manager on employees.emp_no = dept_manager.emp_no
	inner join departments on dept_manager.dept_no = departments.dept_no;