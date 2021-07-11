SELECT * FROM employees;
-- *****************************************************************

-- 1) Display all the employee whose salary greater then average salary of there department. 
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
-- *****************************************************************


-- 2) Display employees where length of ename is 5
SELECT first_name FROM employees WHERE length(first_name) = 5;


-- 3) Display all employees where ename start with J and ends with S
SELECT * FROM employees WHERE first_name LIKE 'J%' AND first_name LIKE '%S';

-- 4) Display all employees where employee does not belong to 10,20,40
-- department_id
SELECT * FROM employees WHERE department_id != 10 AND department_id != 20 AND department_id != 40;

-- 5) Display all employees where jobs does not belong to PRESIDENT and MANAGER?
SELECT * FROM employees 
JOIN jobs
ON employees.job_id = jobs.job_id
WHERE jobs.job_title != "PRESIDENT" AND jobs.job_title != "MANAGER";

-- 6) Display all three figures salary in emp table
SELECT * FROM employees WHERE salary LIKE '____.00';                            #four figure sal
SELECT * FROM employees WHERE salary LIKE '___.00';                             #three figure sal

-- 7) Display all records in emp table for employee who does not receive any commission
SELECT * FROM employees WHERE commission_pct IS NULL;

-- 8) Display all ename where first character could be anything, but second character should be L?
SELECT * FROM employees WHERE first_name LIKE '_L%';
-- =======================================================================


-- 9) Display nth highest and nth lowest salary in emp table?
SELECT MIN(salary) AS lowest,max(salary) AS highest FROM employees;

-- 10) Display all the departments where department has 3 employees?
SELECT  *
FROM employees
HAVING COUNT(department_id) = 3;

-- 11) Display emp name and corresponding subordinates. Use CONNECT BY clause.
SELECT 
    sub.first_name AS subordinate_first_name,        
    sup.first_name AS superior_first_name
FROM employees sub 
JOIN employees sup 
ON sub.manager_id = sup.employee_id
ORDER BY sup.manager_id;

-- 12) Display all ename, sal, deptno,dname from emp, dept table where all department which has employees as well as department does not have any employees. This query should include non matching rows.
SELECT E1.first_name,E1.salary,D1.department_id,D1.department_name FROM employees E1
RIGHT JOIN departments D1
ON D1.department_id=E1.department_id;

-- 13) Display all ename, sal, deptno from emp, dept table where all employees which has matching department as well as employee does not have any departments. This query should include non matching rows.
    -- Note: In the below query, employee will always have matching record in dept table. Emp, dept table may not be good example to answer this question.
SELECT E1.first_name,E1.salary,D1.department_id,D1.department_name FROM employees E1
LEFT JOIN departments D1
ON D1.department_id=E1.department_id;

-- 14) Display all ename, sal, deptno from emp, dept table where all employees which has matching and non matching department as well as all departments in dept table which has matching and non matching employees. This query should include non matching rows on both the tables. 
	-- Note: In the below query, employee will always have matching record in dept table. Emp, dept table may not be good example to answer this question.
SELECT E1.first_name,E1.salary,D1.department_id,D1.department_name FROM employees E1
JOIN departments D1
ON D1.department_id=E1.department_id;

-- 15) Display all ename, empno, dname, loc from emp, dept table without joining two tables
SELECT e.first_name,e.employee_id, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id; 

-- 16) Display all the departments where department does not have any employees
SELECT * FROM departments
LEFT JOIN employees
ON employees.department_id=departments.department_id
WHERE employees.employee_id IS NULL;
-- 17) Display all the departments where department does have atleast one employee
SELECT * FROM departments
LEFT JOIN employees
ON employees.department_id=departments.department_id
WHERE employees.employee_id >= 1;
-- 18) Display all employees those who are not managers?
SELECT * FROM employees WHERE employee_id NOT IN (SELECT manager_id FROM employees);
-- 19) Display ename, deptno from emp table with format of {ename} belongs to {deptno}
SELECT first_name AS ename,department_id AS deptno FROM employees;

-- 20) Display total number of employees hired for 1980,1981,1982. The output should be in one record.
SELECT * FROM employees WHERE year(hire_date)=1980 OR year(hire_date)=1981 OR year(hire_date)=1982;      # this years do no exist 
SELECT * FROM employees WHERE year(hire_date)=1987 OR year(hire_date)=1989 OR year(hire_date)=1993;       #taking diffrent years
-- 21) Display ename, deptno from employee table. Also add another column in the same query and it should display ten for dept 10, twenty for dept 20, thirty for dept 30, fourty for dept 40
SELECT first_name,department_id, 
	CASE 
		WHEN department_id=10 THEN 'Ten'
        WHEN department_id=20 THEN 'Twenty'
        WHEN department_id=30 THEN 'Thirty'
        WHEN department_id=40 THEN 'fourty'
	END AS In_words
    FROM employees;
    
    
-- 22) Display all the records in emp table. The ename should be lower case. The job first character should be upper case and rest of the character in job field should be lower case.
SELECT upper(first_name) AS first_Name, concat(UPPER(LEFT(job_id,1)) , LOWER(SUBSTRING(job_id,2,LENGTH(job_id)))) AS FirstletterCap FROM employees;

-- 23) Display all employees those who have joined in first week of the month ?
SELECT * FROM employees WHERE day(hire_date) IN (1,2,3,4,5,6,7);

-- 24) Display all empoyees those who have joined in the 49th week of the year?
SELECT *
from employees
where WEEK(hire_date)=49;

-- 25) Display empno, deptno, salary, salary difference between current record and previous record in emp table. Deptno should be in descending order.
SELECT 
	employee_id, 
	department_id, 
	salary,
	salary-LAG(salary) OVER (
		ORDER BY department_id) previous_salary
FROM
	employees;

-- 26) Create table emp1 and copy the emp table for deptno 10 while creating the table
CREATE TABLE emp1 AS SELECT * FROM employees WHERE department_id=10;
SELECT * FROM emp1;

-- 27) Create table emp2 with same structure of emp table. Do not copy the data
CREATE TABLE emp2
AS (SELECT * FROM employees WHERE 1=2);

SELECT * FROM emp2;

-- 28) Insert new record in emp1 table, Merge the emp1 table on emp table.
INSERT INTO emp1 
SELECT * FROM employees;
    

-- 29) Display all the records for deptno which belongs to employee name JAMES? 
SELECT * FROM departments 
JOIN employees
ON departments.department_id=employees.department_id
WHERE employees.first_name= 'James';

-- 30) Display all the records in emp table where salary should be less then or equal to ADAMS salary?
SELECT * FROM employees WHERE salary <= (SELECT salary FROM employees WHERE first_name='ADAM');

-- 31) Display all employees those were joined before employee WARD joined?
SELECT * FROM employees WHERE salary< (SELECT hire_date FROM employees WHERE first_name='WARD');

-- 32) Display all subordinate those who are working under BLAKE?
SELECT * FROM employees WHERE manager_id= (SELECT employee_id FROM employees WHERE first_name='Lex' AND last_name='De Haan');   #BLAKE does not exist

-- 33) Display all subordinate(all levels) for employee BLAKE?
SELECT * FROM employees WHERE manager_id= (SELECT employee_id FROM employees WHERE first_name='Lex' AND last_name='BLAKE');

-- 34) Display all record in emp table for deptno which belongs to KING's Job? 
SELECT * FROM employees WHERE last_name='King' ;

-- 35) Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
SELECT employee_id,first_name,salary,CASE
    WHEN
      department_id=40
        THEN
          ((salary / 100) * 25 + salary)
    WHEN
      department_id=90
        THEN
          (salary / 100) * 15 + salary
	WHEN
      department_id=110
        THEN
          (salary / 100) * 10 + salary
  END AS APPRAISED_SALARY, department_id FROM employees;
-- 36) Display list of ename those who have joined in Year 81 as MANAGER?
SELECT * FROM employees
JOIN jobs
ON employees.job_id=jobs.job_id
WHERE jobs.job_title LIKE '%Manager%' AND employees.hire_date LIKE '__81-%';

-- 37) Display who is making highest commission?
SELECT * FROM employees WHERE commission_pct = (SELECT MAX(commission_pct) FROM employees);
-- 38) Display who is senior most employee? How many years has been working?
SELECT *,  year(curdate()) - year(hire_date) as diff FROM employees WHERE hire_date = (SELECT MIN(hire_date) FROM employees);

-- 39) Display who is most experienced and least experienced employee?
SELECT *,  year(curdate()) - year(hire_date) as diff FROM employees WHERE hire_date = (SELECT MIN(hire_date) FROM employees) OR hire_date= (SELECT MAX(hire_date) FROM employees);

-- 40) Display ename, sal, grade, dname, loc for each employee.
SELECT employees.first_name,employees.salary, CASE
    WHEN
      salary > 15000
        THEN
          'Grade_A'
    WHEN
      salary > 10000 and salary <= 15000
        THEN
          'Grade_B'
	WHEN
      salary > 5000 and salary <= 10000
        THEN
          'Grade_C'
    ELSE
      'Grade_D'
  END AS Grade,departments.department_name,locations.city FROM employees
  JOIN departments
  ON departments.department_id=employees.department_id
  JOIN locations
  ON departments.location_id=locations.location_id;


-- 41) Display all employee whose location is DALLAS?
SELECT * FROM employees 
JOIN departments
ON employees.department_id=departments.department_id
JOIN locations
ON departments.location_id=locations.location_id
WHERE locations.city='Oxford';                                   #Taking Oxford as Dallas does not exist

-- 42) Display ename, job, dname, deptno for each employee by using INLINE view?
SELECT employee_id, job_id, department_id, salary, hire_date
  FROM (
         SELECT * FROM employees EM1
       )EM;
       
-- 43) List ename, job, sal and department of all employees whose salary is not within the salary grade?
SELECT employees.first_name,employees.job_id,employees.salary,
  CASE
    WHEN
      salary > 15000
        THEN
          'Grade_A'
    WHEN
      salary > 10000 and salary <= 15000
        THEN
          'Grade_B'
	WHEN
      salary > 5000 and salary <= 10000
        THEN
          'Grade_C'
    ELSE
      'Grade_D'
  END AS Grade
FROM
  employees ORDER BY Grade;


-- 44 Use EMP and EMP1 table. Query should have only three columns. Display empno,ename,sal from both tables inluding duplicates. 
SELECT employee_id, first_name,salary FROM employees EMP
UNION
SELECT employee_id, first_name,salary FROM employees EMP1 ;

-- 45) Display the employees for empno which belongs to job PRESIDENT?
SELECT * FROM employees
JOIN jobs
ON employees.job_id=jobs.job_id
WHERE jobs.job_title='President';