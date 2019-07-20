-- #1. List Employee Detail
-- Employee Number, last name, first name, gender, salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- #2. list employees who were hired in 1986
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date)=1986; 

-- #3. list the manager of each department with department number & name, employee number, last name and first name
-- and start and end employment dates as manager.

-- Since the directions are not clear, I will also include the overall hire date from the "employees" table
-- Note that there is not an "end date" for overall employment in the "employees" table

SELECT depts.dept_no, depts.dept_name, employees.emp_no, employees.last_name, employees.first_name,
       dept_mgr.from_date, dept_mgr.to_date, employees.hire_date
FROM dept_mgr
JOIN employees ON dept_mgr.emp_no = employees.emp_no
JOIN depts ON dept_mgr.dept_no = depts.dept_no;

-- #4. List the department of each employee with the following information
-- Employee number, last name, first name and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, depts.dept_name 
FROM employees
JOIN dept_emp on employees.emp_no = dept_emp.emp_no
JOIN depts ON dept_emp.dept_no = depts.dept_no;

-- #5. List all employees whos first name is "Hercules" and last name begins with "B".
SELECT emp_no, last_name, first_name
FROM employees
WHERE (first_name = 'Hercules') and (left (last_name,1) = 'B'); 

-- #6. List all employees in the Sales department, including their employee number, 
-- last name, first name and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, depts.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN depts ON depts.dept_no = dept_emp.dept_no
WHERE depts.dept_name = 'Sales';

-- #7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, depts.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN depts ON depts.dept_no = dept_emp.dept_no
WHERE (depts.dept_name = 'Sales') or (depts.dept_name = 'Development');

-- #8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
