-- 1) Display all the records in emp table?
SELECT * FROM employees;

-- 2) Display all the records in emp table where employee belongs to deptno 10?
SELECT * FROM employees WHERE department_id=10;

-- 3) Display all the records in emp table where employee does not belong to deptno 30?
SELECT * FROM employees WHERE department_id!= 30;

-- 4) Display first five records in employee table?
SELECT * FROM employees LIMIT 5;

-- 5) Display all employees those who were joined in year 1981?
SELECT * FROM employees WHERE hire_date LIKE '1981%';
SELECT * FROM employees WHERE hire_date LIKE '1998%';

-- 6) Display COMM in emp table. Display zero in place of null.
SELECT ifnull(commission_pct,0) FROM employees;

-- 7) Display the records in emp table where MGR in 7698,7566 and sal should be greater then 1500
SELECT * FROM employees WHERE manager_id=7698 OR manager_id=7566 AND salary>1500;
SELECT * FROM employees WHERE manager_id=145 OR manager_id=140 AND salary>1500;

-- 8) Display all employees where employees hired before 01-JAN-1981 
SELECT * FROM employees WHERE hire_date < '1981-01-01';
SELECT * FROM employees WHERE hire_date < '1991-01-01';

-- 9) Display all employees those were not joined in 1981? 
SELECT * FROM employees WHERE hire_date NOT LIKE '1981%';

-- 10) Display all employees where their hiredate belongs to third quarter?
SELECT * FROM employees WHERE hire_date LIKE '____-07%' OR hire_date LIKE '____-08%' OR hire_date LIKE '____-09%';

-- 11) Display all employees where their salary is less then the Ford’s salary?
SELECT * FROM employees WHERE salary < (SELECT salary FROM employees WHERE last_name='Ford');
SELECT * FROM employees WHERE salary < (SELECT salary FROM employees WHERE last_name='kochhar');

-- 12) The HR department wants a query to display the last name, job code, hire date, and employee number for each employee, with employee number appearing first. Provide an alias STARTDATE for the HIRE_DATE column.
SELECT employee_id,last_name,job_id,hire_date AS STARTDATE FROM employees; 

-- 13) The HR department needs a query to display all unique job codes from the EMPLOYEES table.
SELECT DISTINCT job_id FROM employees; 

-- 14) To display the last name, job ID, and start date for   the employees with the last names of Matos and Taylor.    Order the query in ascending order by the start date.
SELECT last_name,job_id,hire_date FROM employees WHERE last_name='Matos' OR last_name='Taylor' ORDER BY hire_date;

-- 15) Display all employee last names in which the third   letter of the name is “a.”
SELECT last_name FROM employees WHERE last_name LIKE '__a%';

-- 16) The HR department needs a report that displays the last name and hire date for all employees who were hired in 1994.
SELECT last_name, hire_date FROM employees WHERE hire_date LIKE "1994%";

-- 17) Display the last name of all employees who have both an a and an e in their last name.
SELECT last_name FROM employees WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

-- 18) Display the last name and department number of all employees in departments 20 or 50 in ascending alphabetical order by name.
SELECT last_name, department_id FROM employees WHERE department_id=20 OR department_id=50 ORDER BY last_name;

-- 19) Write a query to display the system date. Label the column as Date.
SELECT *,curdate() AS Date FROM employees;

-- 20) Write a SQL statement to change the email column of employees table with 'not available' for all employees.
SELECT first_name,last_name, 'not available' AS email FROM employees;

-- 21) Write a SQL statement to change the email and commission_pct column of employees table with 'organization@gmail.com' and 0.20 for employees belongs to department 20.
SELECT 'organization@gmail.com' AS email, 0.20 AS commission_pct, department_id  FROM employees WHERE department_id=20;
-- 22) Write a SQL statement to change the email column of employees table with 'not available' for those employees whose department_id is 80 and gets a commission is less than .20%
SELECT first_name,last_name, 'not available' AS email, department_id,commission_pct FROM employees WHERE department_id=80 AND commission_pct<0.20;

-- 23) Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.
SELECT first_name,last_name, 8000 AS salary FROM employees WHERE salary=5000 AND employee_id=105;

-- 24) Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.
SELECT first_name,last_name,'SH_CLERK' as job_id FROM employees WHERE employee_id=118 AND department_id=30 and job_id NOT LIKE 'SH%';
