-- SQL Queries for Questions

-- List the employee number, last name, first name, sex, and salary of each employee (2 points)

SELECT 
	emps.emp_no, emps.last_name, emps.first_name, emps.sex, sal.salary
	FROM employees emps
	LEFT JOIN salaries sal
		ON emps.emp_no = sal.emp_no;
		
-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT 
	first_name, last_name, hire_date
	FROM 
		employees
	WHERE 
	 	hire_date BETWEEN '01/01/1996' and '01/01/1997'
	;
		
-- List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)

SELECT
	dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
	FROM
		dept_manager dm
	LEFT JOIN
		departments d
		ON
			d.dept_no = dm.dept_no
	LEFT JOIN
		employees e
		ON
			e.emp_no = dm.emp_no
	;
			
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)

SELECT
	de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM
		dept_emp de
	LEFT JOIN
		departments d
		ON
			d.dept_no = de.dept_no
	LEFT JOIN
		employees e
		ON
			e.emp_no = de.emp_no
	;
	
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)

SELECT 
	first_name, last_name, sex
	FROM 
		employees
	WHERE 
	 	first_name = 'Hercules'
		AND
		last_name like 'B%'
	;
	
-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT
	de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM
		dept_emp de
	LEFT JOIN
		departments d
		ON
			d.dept_no = de.dept_no
	LEFT JOIN
		employees e
		ON
			e.emp_no = de.emp_no
	WHERE
		d.dept_name = 'Sales'
	;
	
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

SELECT
	de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM
		dept_emp de
	LEFT JOIN
		departments d
		ON
			d.dept_no = de.dept_no
	LEFT JOIN
		employees e
		ON
			e.emp_no = de.emp_no
	WHERE
		d.dept_name = 'Sales' 
		OR
			d.dept_name = 'Development'
	;
	
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

SELECT 
	count(last_name) AS last_name_count, last_name
	FROM 
		employees
	GROUP BY
		last_name
	ORDER BY
		last_name_count DESC
	;