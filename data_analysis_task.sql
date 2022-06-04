-- employee number, last name, first name, sex, and salary

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
JOIN salaries AS sal 
ON emp.emp_no = sal.emp_no;

------------------------------------------

-- first name, last name, and hire date for employees who were hired in 1986

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

------------------------------------------

-- department number, department name, the manager's employee number, last name, first name

SELECT manager.dept_no, dep.dept_name, manager.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS manager
JOIN departments AS dep ON dep.dept_no = manager.dept_no
JOIN employees AS emp ON emp.emp_no = manager.emp_no;

------------------------------------------

-- employee number, last name, first name, and department name
-- we will have to join with dept_emp to get to the department

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
JOIN dept_emp AS depemp ON (emp.emp_no = depemp.emp_no)
LEFT JOIN departments AS dep ON (dep.dept_no = depemp.dept_no);

------------------------------------------

-- first name, last name, and sex for employees 
-- whose first name is Hercules and last names begin with B

SELECT emp.first_name, emp.last_name, emp.sex
FROM employees AS emp
WHERE first_name='Hercules' AND last_name LIKE 'B%';

------------------------------------------

-- employees in the Sales department, including their 
-- employee number, last name, first name, and department name
-- Joining through the dept_emp to join to departments

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp 
JOIN dept_emp AS depemp ON emp.emp_no = depemp.emp_no
JOIN departments AS dep ON depemp.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales';

------------------------------------------

-- employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp 
JOIN dept_emp AS depemp ON emp.emp_no = depemp.emp_no
JOIN departments AS dep ON depemp.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales' OR dep.dept_name = 'Development';

------------------------------------------

-- frequency count of employee last names 
-- (i.e., how many employees share each last name) 
--in descending order


SELECT last_name, COUNT(last_name) AS "count"
FROM employees
GROUP BY last_name
ORDER BY "count" DESC;

