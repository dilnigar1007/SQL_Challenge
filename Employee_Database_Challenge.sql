----Deliverable 1: The Number of Retiring Employees by Title

--1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT * FROM employees;
SELECT emp_no, first_name, last_name FROM employees;

--2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT * FROM titles;
SELECT emp_no, from_date, to_date FROM titles;

--3. Create a new table using the INTO clause.
--4. Join both tables on the primary key.
--5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
SELECT employees.emp_no,
	employees.birth_date,
	employees.first_name,
	employees.last_name,
	employees.gender,
	employees.hire_date,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

--9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table. 
--These columns will be in the new table that will hold the most recent title of each employee.
-- Use Dictinct with Orderby to remove duplicate rows
SELECT emp_no, first_name, last_name, title FROM retirement_titles;
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title FROM retirement_titles
ORDER BY emp_no, title DESC;

--11. Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
--12. Create a Unique Titles table using the INTO clause. 
--13. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
SELECT emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, title DESC;

SELECT * FROM unique_titles;
--17. First, retrieve the number of titles from the Unique Titles table.
--18. Then, create a Retiring Titles table to hold the required information.
--19. Group the table by title, then sort the count column in descending order. 
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

----Deliverable 2: The Employees Eligible for the Mentorship Program
--1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--2. Retrieve the from_date and to_date columns from the Department Employee table.
--3. Retrieve the title column from the Titles table.

SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM titles;

SELECT emp_no, first_name, last_name, birth_date FROM employees;
SELECT emp_no, from_date, to_date FROM dept_emp;
SELECT emp_no, title FROM titles;

--4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--5. Create a new table using the INTO clause.
--6. Join the Employees and the Department Employee tables on the primary key.
--7. Join the Employees and the Titles tables on the primary key.
--8. Filter the data on the to_date column to all the current employees, 
--then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
--9. Order the table by the employee number.
SELECT DISTINCT ON (emp_no) employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	titles.title
INTO mentorship_eligibility
FROM employees 
	INNER JOIN dept_emp 
		ON (employees.emp_no = dept_emp.emp_no)
	INNER JOIN titles
		ON (employees.emp_no = titles.emp_no)
			WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
			AND (dept_emp.to_date = '9999-01-01')
ORDER BY emp_no, title;

SELECT * FROM mentorship_eligibility;










