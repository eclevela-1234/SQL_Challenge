-- query question #1
-- List the following details of each employee: employee number, last name, first name, sex, and salary.

drop view query_1;
create view query_1 as  
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees inner join salaries on employees.emp_no = salaries.emp_no;

-- query question #2
-- List first name, last name, and hire date for employees who were hired in 1986.

drop view query_2;
create view query_2 as  
select employees.first_name, employees.last_name, employees.hire_date
from employees where extract(year from "hire_date") = 1986; 

-- query question #3
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

drop view query_3;
create view query_3 as  
select employees.last_name, employees.first_name, employees.emp_no, dept_manager.dept_no, departments.dept_name
from employees inner join dept_manager on employees.emp_no = dept_manager.emp_no
	inner join departments on dept_manager.dept_no = departments.dept_no;
	
-- query question #4
-- List the department of each employee with the following information: employee number, last name, first name, and department name.

drop view query_4;
create view query_4 as  
select employees.last_name, employees.first_name, employees.emp_no, departments.dept_name
from employees inner join dept_emp on employees.emp_no = dept_emp.emp_no
	inner join departments on dept_emp.dept_no = departments.dept_no;

-- query question #5
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

drop view query_5;
create view query_5 as  
select employees.first_name, employees.last_name, employees.sex
from employees where employees.first_name = 'Hercules' and employees.last_name like 'B%';

-- query question #6
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

drop view query_6;
create view query_6 as  
select employees.emp_no, employees.last_name, employees.first_name,  departments.dept_name
from employees inner join dept_emp on employees.emp_no = dept_emp.emp_no
	inner join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';
	
-- query question #7
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

drop view query_7;
create view query_7 as  
select employees.emp_no, employees.last_name, employees.first_name,  departments.dept_name
from employees inner join dept_emp on employees.emp_no = dept_emp.emp_no
	inner join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- query question #8
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

drop view query_8;
create view query_8 as  
select employees.last_name, count(employees.last_name)
from employees
group by employees.last_name
order by count(employees.last_name) desc;