/* List the following details of each employee: employee number, last name, first name, gender, and salary. */
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no

/* List employees who were hired in 1986 */
SELECT * FROM employees
WHERE hire_date LIKE '1986%'

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates. */
SELECT departments.dept_no, departments.dep_name, dept_manager.emp_no, 
employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
INNER JOIN dept_manager 
	on departments.dept_no = dept_manager.dept_no
INNER JOIN employees
	on dept_manager.emp_no = employees.emp_no ;

/* List the department of each employee with the following information: 
employee number, last name, first name, and department name */
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dep_name
FROM departments
INNER JOIN dept_emp
	ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees
	ON dept_emp.emp_no = employees.emp_no


/* List all employees whose first name is "Hercules" and last names begin with "B." */
SELECT * FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'


/* List all employees in the Sales department, including their employee number, last name, first name, and department name. */
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_no, departments.dep_name, dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
RIGHT JOIN departments
	ON dept_emp.dept_no = departments.dept_no
	AND departments.dept_no = 'd007';

/* List all employees in the Sales and Development departments, including their employee number, last name, first name, 
and department name. */
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_no, departments.dep_name, dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
	ON dept_emp.dept_no = departments.dept_no
	AND departments.dept_no = 'd007' OR departments.dept_no = 'd005';


/* In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. */
SELECT COUNT(last_name) as Last_Name_Count, last_name
FROM employees
GROUP BY last_name