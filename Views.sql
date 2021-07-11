
-- Q1. Create a view to fetch the employees data 
-- EmployeeId, EmployeeName, EmployeeSalary, EmployeeManager, EmployeeDepartment
CREATE VIEW employees_data AS
SELECT employee_id,first_name,salary,manager_id,department_id
FROM employees;
-- Q2. Create a view to fetch all the employees data working on jobs with 
-- minimum salary > 2000 and maximum salary < 5000;
CREATE VIEW salary_filter AS
SELECT *
FROM employees
WHERE salary > 2000 AND salary < 5000;
-- Q3. Create a view to fetch employee data 
-- EMPLOYEEID,EMPLOYEENAME,EMPLOYEEDEPARTMENT,EMPLOYEESALARY,EMPLOYEECOUNTRY,EMPLOYEELOCATION
CREATE VIEW deploc AS
SELECT E.employee_id,E.first_name,D.department_name,E.salary,L.country_id,L.street_address
FROM employees E 
JOIN departments D 
ON E.department_id=D.department_id
JOIN locations L
ON L.location_id=D.location_id;
-- Q3. CREATE A VIEW FOR Q3 AND DISPLAY ONLY THOSE EMPLOYEES WHOSE DEPARTMENTID = 30 AND SALARY < 5000;
CREATE VIEW Q3 AS
SELECT * FROM employees WHERE department_id=30 AND salary <5000;
-- Q4. CREATE A VIEW TO FETCH ALL EMPLOYEES DATA WITH THERE APPRAISED SALARY FOR THE CURRENT YEAR.
CREATE VIEW APPRAISED AS
SELECT employees.first_name,employees.salary, CASE
    WHEN
      salary > 2000 AND salary <= 10000
        THEN
          ((salary / 100) * 10 + salary)
    WHEN
      salary > 10000 AND salary <= 15000
        THEN
          (salary / 100) * 8 + salary
	WHEN
      salary > 15000 AND salary <= 20000
        THEN
          (salary / 100) * 6 + salary
    ELSE
      (salary / 100) * 5 + salary
  END AS APPRAISED_SALARY FROM employees;
-- EG : CURRENT SALARY = 3000
-- COMM : 300
-- APPRAISED SALARY RULE : 
-- 		PEOPLE GETTING SALARY 2000 - 10000 :: 10%
-- 		PEOPLE GETTING SALARY 10001 -15000 :: 8%
-- 		PEOPLE GETTING SALARY 15000 - 20000 :: 6%
-- 		PEOPLE GETTING SALARY > 20000 :: 5%
-- 		
-- 		
-- Q5. CREATE A VIEW ON THE EMPLOYEES TABLE WITH EMPNO , EMPNAME, EMPSALARY
CREATE VIEW basicinfo AS
SELECT employee_id,first_name,salary FROM employees;

SELECT * FROM basicinfo;

-- 	1. UPDATE THE SALARY OF EMPLOYEE ID = 105;
#SELECT * FROM basicinfo WHERE employee_id = 105;
UPDATE basicinfo SET salary= 5000.00 WHERE employee_id = 105;

-- 	2. DELETE THE ROW OF THE EMPLOYEE ID = 106;
#SELECT * FROM basicinfo WHERE employee_id = 106;
DELETE FROM basicinfo WHERE  employee_id = 106;

-- 	3. UPDATE THE EMPLOYEE DEPARTMET ID OF THE EMPLOYEEID = 108
-- 	OBSERVE THE PARENT TABLE EMPLOYEES
 	SELECT * FROM basicinfo WHERE employee_id = 108;
    SELECT * FROM employees WHERE employee_id = 108;
    UPDATE basicinfo SET department_id=222 WHERE employee_id=108;
    
-- Q6. CREATE A VIEW ON EMPLOYEES AND DEPARTMENT WITH DEPARTMENTID COMPARISON
CREATE VIEW empdep AS
Select *
    from employees JOIN departments USING(department_id,manager_id);
    
-- 	1. TRY TO DO UPDATE 
SELECT * FROM empdep;	
UPDATE empdep SET first_name='patty' WHERE employee_id=202;	
-- 		
-- 		
-- 		