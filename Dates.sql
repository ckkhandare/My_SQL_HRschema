SELECT * FROM employees;

-- 1) Display total number of records in Emp table?
SELECT COUNT(*) FROM employees;

-- 2) Display emp table with salary descending order?
SELECT * FROM employees ORDER BY salary DESC;

-- 3) Display all the records in emp table order by ascending deptno, descending salary?
SELECT * FROM employees ORDER BY department_id ASC, salary DESC;

-- 4) Display all employees with how many years they have been servicing in the company?
SELECT first_name, year(now())-year(hire_date) as service FROM employees;      #in years

-- Date diff 
SELECT datediff(curdate(),hire_date) as dif_indate from employees;             #in days

-- Arithematic operators :-
SELECT date_format(now(),'%Y')-date_format(hire_date,'%Y') AS datefor_diff FROM employees;       #in years

-- Select hire_date + 1 from employees limit 1;
SELECT date_add(hire_date, INTERVAL 1 DAY) AS hire_date_plus_1day FROM employees LIMIT 1;

-- Select hire_date + interval 1 month from employees limit 1;
SELECT date_add(hire_date, INTERVAL 1 MONTH) AS hire_date_plus_1month FROM employees LIMIT 1;

-- Select hire_date - interval 1 year from employees limit 1;
SELECT date_add(hire_date, INTERVAL 1 YEAR) AS hire_date_plus_1year FROM employees LIMIT 1;

-- Function :- 

-- datediff() : return the number of days between two days
SELECT DATEDIFF("2017-06-25", "2017-06-15") AS date_diff;

-- 5) Add 3 months with hiredate in EMP table and display the result?
SELECT hire_date, date_add(hire_date, INTERVAL 3 MONTH) AS hire_date_plus_3months FROM employees;

-- 6) Find the date, 15 days after today’s date.
SELECT hire_date, date_add(hire_date, INTERVAL 15 DAY) AS hire_date_plus_15days FROM employees;

-- 7) Write a query to display current date?
SELECT curdate();

-- 8) Display distinct job from emp table?
SELECT DISTINCT job_id FROM employees;

-- 9) Display all the records in emp table where employee hired after 28-SEP-81 and before 03-DEC-81?
SELECT * FROM employees WHERE date_format(hire_date, '%Y-%M-%d') > date_format('28-SEP-81', '%d-%b-%y') AND date_format(hire_date, '%Y-%M-%d') < date_format('03-DEC-81', '%d-%b-%y');
select * from employees where hire_date between '01-jan-81' and '31-dec-81';
select * from employees where hire_date between date('28-SEP-81') and date('03-DEC-81');

-- 10) Write a query that displays the employee’s names with the first letter capitalized and all other letters lowercase for all employees whose name starts with J, A, or M
Select CONCAT(UPPER(SUBSTRING(first_name,1,1)),LOWER(SUBSTRING(first_name,2))) AS Name from employees WHERE first_name LIKE 'J%' OR first_name LIKE 'A%' OR first_name LIKE 'M%';

-- 11) Display all jobs that are in department 10. Include the location of department in the output.
SELECT employees.job_id,locations.location_id,locations.street_address,employees.department_id from employees 
JOIN departments 
ON  employees.department_id=departments.department_id
JOIN locations
ON departments.location_id=locations.location_id
WHERE employees.department_id=10;

-- 12) Write a query to display the employee name, department name of all employees who earn a commission
SELECT employees.first_name,employees.last_name,departments.department_name,employees.commission_pct FROM employees
JOIN departments
ON employees.department_id=departments.department_id
WHERE employees.commission_pct IS NOT NULL;

-- 13) Display the empno, ename, sal, and salary increased by 15%.
SELECT employee_id,first_name,salary, (salary / 100) * 15 + salary AS INC_salary FROM employees;
-- 14) Display ename, sal, grade. Use emp, salgrade table

-- 			Salary > 15000 Grade A
-- 			Salary > 10000 and < 15000 Grade B
-- 			Salary between  5000 abd 10000  Grade C
-- 			Salary < 5000 Grade D
-- 			
-- 			And Sort on the basis of Grades

SELECT employees.first_name,employees.last_name,employees.salary,
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
