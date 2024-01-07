/***
Program name: query.sql
Purpose: to retrieve particular information of interest from the employee data tables
***/

-- list the employee number, last name, first name, sex, and salary of each employee
SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
	FROM employees AS E
		LEFT JOIN salaries AS S ON (E.emp_no=S.emp_no);

-- list the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
	FROM employees
		WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';
	
-- list the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT D.dept_no, D.dept_name, M.emp_no, E.last_name, E.first_name
	FROM employees AS E
		INNER JOIN dept_manager AS M ON (E.emp_no=M.emp_no)
		INNER JOIN departments AS D ON (M.dept_no=D.dept_no);

-- list the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT D.dept_no, D.dept_name, DE.emp_no, E.last_name, E.first_name
	FROM employees AS E
		INNER JOIN dept_emp AS DE ON (E.emp_no=DE.emp_no)
		INNER JOIN departments AS D ON (DE.dept_no=D.dept_no);

-- list first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
	FROM employees
		WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- list each employee in the sales department, including their employee number, last name, and first name
SELECT emp_no, last_name, first_name
	FROM employees
		WHERE emp_no
		IN(
			SELECT emp_no
			FROM dept_emp
			WHERE dept_no 
			IN(
				SELECT dept_no
				FROM departments
				WHERE dept_name='Sales'
			)
		);

-- list each employee in the sales and development departments, including their employee number, last name, first name, and department name
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
	FROM employees AS E
		INNER JOIN dept_emp AS DE ON (E.emp_no=DE.emp_no)
		INNER JOIN departments AS D ON (DE.dept_no=D.dept_no)
			WHERE D.dept_name = 'Sales' or D.dept_name = 'Development';
		
-- list the frequency counts, in descending order, of all the employees' last names (aka. how many employees share each last name)
SELECT last_name, COUNT(last_name) AS last_name_count
	FROM employees
		GROUP BY last_name
		ORDER BY last_name_count DESC;