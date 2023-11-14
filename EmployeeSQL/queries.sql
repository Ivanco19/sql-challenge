-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	EMPLOYEES.SEX,
	SALARIES.SALARY
FROM EMPLOYEES
LEFT JOIN SALARIES ON EMPLOYEES.EMP_NO = SALARIES.EMP_NO
ORDER BY EMP_NO ASC;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
-- First I will transform varchar to date format. Could not declare column as a date type because
-- this column is in MM/DD/YYYY format on the csv file.
UPDATE EMPLOYEES SET HIRE_DATE = TO_DATE(HIRE_DATE, 'MM/DD/YYYY')
SELECT FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '1986-01-01' AND HIRE_DATE <= '1986-12-31';

-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
SELECT DEPT_MANAGER.DEPT_NO,
	DEPARTMENTS.DEPT_NAME,
	DEPT_MANAGER.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME
FROM DEPT_MANAGER
LEFT JOIN DEPARTMENTS ON DEPT_MANAGER.DEPT_NO = DEPARTMENTS.DEPT_NO
LEFT JOIN EMPLOYEES ON DEPT_MANAGER.EMP_NO = EMPLOYEES.EMP_NO;

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT DEPT_EMP.DEPT_NO,
	EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
LEFT JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
LEFT JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B.
SELECT FIRST_NAME,
	LAST_NAME,
	SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules'
	AND LAST_NAME LIKE '%B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
LEFT JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
LEFT JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO
WHERE DEPT_NAME = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT EMPLOYEES.EMP_NO,
	EMPLOYEES.LAST_NAME,
	EMPLOYEES.FIRST_NAME,
	DEPARTMENTS.DEPT_NAME
FROM EMPLOYEES
LEFT JOIN DEPT_EMP ON EMPLOYEES.EMP_NO = DEPT_EMP.EMP_NO
LEFT JOIN DEPARTMENTS ON DEPT_EMP.DEPT_NO = DEPARTMENTS.DEPT_NO
WHERE DEPT_NAME = 'Sales' OR DEPT_NAME = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, count(*) AS number_employees
FROM employees
GROUP BY last_name
ORDER BY number_employees DESC;
