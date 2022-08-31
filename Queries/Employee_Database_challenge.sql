--///////////////////////
--/////Deliverable 1/////
--///////////////////////

-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no,
    e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tt
	ON e.emp_no = tt.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title

INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Retrieve the count of employees by their most recent job title who are about to retire.
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

--///////////////////////
--/////Deliverable 2/////
--///////////////////////

-- Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.
SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
INNER JOIN titles as tt
	ON tt.emp_no = e.emp_no
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

