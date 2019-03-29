/*
JOIN : 두 개 이상의 테이블을 결합해서 조회하는 명령
1. INNER JOIN : returns rows when there is a match in both tables.
2. LEFT JOIN : returns all rows from the left table, even if there are no matches in the right table.
3. RIGHT JOIN : returns all rows from the right table, even if there are no matches in the left table.
4. FULL JOIN : returns rows when there is a match in one of the tables.
5. SELF JOIN : is used to join a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.
6. CARTESIAN JOIN : returns the Cartesian product of the sets of records from the two or more joined tables.
*/



------------------------
/*
SELF JOIN : Alias 지정 필수
ANSI 표기법
    SELECT a.column_name, b.column_name...
    FROM table1 a INNER JOIN table1 b
    ON a.common_field = b.common_field;
Oracle 표기법
    SELECT a.column_name, b.column_name...
    FROM table1 a, table1 b
    WHERE a.common_field = b.common_field;
*/


--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1 INNER JOIN hr.employees e2
    ON e1.salary = e2.salary
    WHERE e1.first_name='David' AND e1.last_name='Austin';

--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1, hr.employees e2
    WHERE e1.salary = e2.salary
    AND e1.first_name='David' AND e1.last_name='Austin';
    
    
    
--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1 INNER JOIN hr.employees e2
    ON e1.department_id = e2.department_id
    WHERE e1.first_name='David' AND e1.last_name='Austin';    
    
--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1, hr.employees e2
    WHERE e1.department_id = e2.department_id
    AND e1.first_name='David' AND e1.last_name='Austin';


--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1, hr.employees e2
    WHERE e1.department_id = e2.department_id
    AND e1.hire_date <= e2.hire_date
    AND e1.first_name='Valli' AND e1.last_name='Pataballa';


--hr.employees e1, hr.employees e2
SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id, e2.hire_date
    FROM hr.employees e1, hr.employees e2
    WHERE e1.hire_date <= e2.hire_date
    AND e1.first_name='Valli' AND e1.last_name='Pataballa';


--문제039)  hr 계정(소유자)의 employees 테이블의 정보에서 
--first_name 'Donald', last_name 'OConnell'과 직위아이디(job_id)가 같은 직원 정보 출력하는 쿼리 작성. SELF JOIN 사용.

--ANSI 표기법
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.job_id 
    FROM hr.employees e1 INNER JOIN hr.employees e2 ON e1.job_id = e2.job_id 
    WHERE e1.first_name = 'Donald' AND e1.last_name = 'OConnell';

--Oracle 표기법
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.job_id 
    FROM hr.employees e1, hr.employees e2
    WHERE e1.job_id = e2.job_id AND e1.first_name = 'Donald' AND e1.last_name = 'OConnell';
    

--문제040)  hr 계정(소유자)의 employees, jobs 테이블의 정보에서 
--first_name 'Donald', last_name 'OConnell'과 직위명(job_title)가 같은 직원 정보 출력하는 쿼리 작성. SELF JOIN 사용.

--ANSI 표기법
SELECT e2.employee_id, e2.first_name, e2.last_name, j.job_title
    FROM hr.employees e1
        INNER JOIN hr.jobs j ON e1.job_id = j.job_id
        INNER JOIN hr.employees e2 ON e1.job_id = e2.job_id
    WHERE e1.first_name = 'Donald' AND e1.last_name = 'OConnell';


--Oracle 표기법
SELECT e2.employee_id, e2.first_name, e2.last_name, j.job_title
    FROM hr.employees e1, hr.employees e2, hr.jobs j 
    WHERE e1.job_id = j.job_id 
        AND e1.job_id = e2.job_id 
        AND e1.first_name = 'Donald' AND e1.last_name = 'OConnell';



----------------------
/*
CARTESIAN JOIN(or CROSS JOIN)
ANSI 표기법
    SELECT table1.column1, table2.column2...
    FROM  table1 CROSS JOIN table2;
Oracle 표기법
    SELECT table1.column1, table2.column2...
    FROM  table1, table2;
*/

--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments CROSS JOIN hr.employees;


--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments, hr.employees;
    
    
    
    
----------------------
/*
FULL JOIN
ANSI 표기법
    SELECT table1.column1, table2.column2...
    FROM table1 FULL JOIN table2
    ON table1.common_field = table2.common_field;
주의) Oracle 표기법에서는 FULL JOIN 지원 안함
*/

--ANSI 표기법
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d FULL JOIN hr.employees e
    ON d.department_id = e.department_id;
    
--ORA-01468: a predicate may reference only one outer-joined table 
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id(+) = e.department_id(+);



--------------------------
--문제041) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name 'Steven', last_name 'King' 직원의 부하 직원 출력. 

SELECT e2.employee_id, e2.first_name, e2.last_name, e2.department_id, e2.job_id, e2.manager_id
    FROM hr.employees e1 
    INNER JOIN hr.employees e2 ON e1.employee_id = e2.manager_id
    WHERE e1.first_name = 'Steven' AND e1.last_name = 'King';
    
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.department_id, e2.job_id, e2.manager_id
    FROM hr.employees e1, hr.employees e2 
    WHERE e1.employee_id = e2.manager_id
    AND e1.first_name = 'Steven' AND e1.last_name = 'King';
    

--문제042) hr 계정(소유자)의 employees, jobs, job_history 테이블의 정보에서  
--employee_id가 101인 직원의 잡히스토리(first_name, last_name, start_date, end_date, job_title) 출력.

SELECT e.employee_id, first_name, last_name, start_date, end_date, job_title
    FROM hr.employees e, hr.job_history jh, hr.jobs jo
    WHERE e.employee_id = jh.employee_id
    AND jh.job_id = jo.job_id
    AND e.employee_id = 101;
    

--문제043) hr 계정(소유자)의 employees 테이블의 정보에서 
--부하 직원이 없는 직원 출력.
    
SELECT e1.employee_id, e1.first_name, e1.last_name, e1.job_id, e2.employee_id
    FROM hr.employees e1, hr.employees e2
    WHERE e1.employee_id = e2.manager_id(+)
    AND e2.employee_id IS NULL;

    

--문제044) hr 계정(소유자)의 employees 테이블의 정보에서 
--first_name 'Gerald', last_name 'Cambrault'의 salary보다 급여를 더 많이 받는 직원 정보 출력.

SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id
    FROM hr.employees e1, hr.employees e2
    WHERE e1.department_id = e2.department_id
    AND e1.salary <= e2.salary
    AND e1.first_name='Gerald' AND e1.last_name='Cambrault';

 



---------------------------------------
/*
Sub Query : A Subquery or Inner query or a Nested query is a query within another SQL query and embedded within the WHERE clause.
1. 서브쿼리는 () 안에 표기해야 한다.
2. 메인쿼리는 SELECT, INSERT, UPDATE, DELETE 등의 쿼리 사용 가능하지만, 
서브쿼리는 SELECT만 사용 가능.
3. 형식
SELECT column_list, ... , (서브쿼리) alias
    FROM table_source;
    
SELECT column_list, ... 
    FROM (서브쿼리) alias;
SELECT column_list, ... 
    FROM table_source
    WHERE column operator (서브쿼리);
*/

--JOIN
SELECT e.employee_id, first_name, last_name, department_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id = e.department_id
    AND department_name = 'Executive';
    
--Sub Query
SELECT  employee_id, first_name, last_name
    FROM hr.employees
    WHERE department_id = ??;

SELECT  employee_id, first_name, last_name
    FROM hr.employees
    WHERE department_id = (SELECT department_id FROM hr.departments 
                        WHERE department_name = 'Executive');


--SELF JOIN    
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.salary
    FROM hr.employees e1, hr.employees e2
    WHERE e1.salary = e2.salary
    AND e1.first_name='David' AND e1.last_name='Austin';
    
--단일행 서브쿼리 
--Sub Query    
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT salary FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin');
    
    
   
--주의) Sub Query 사용시 연산자가 = 인 경우는 Sub Query 결과가 단일 결과여야 한다.
--> 연산자 IN 사용하면 가능
SELECT salary FROM hr.employees
                        WHERE first_name='David';

SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT salary FROM hr.employees
                        WHERE first_name='David');
-->ORA-01427: single-row subquery returns more than one row


--다중행 서브 쿼리
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary IN (SELECT salary FROM hr.employees
                        WHERE first_name='David');
    
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE EXISTS (SELECT salary FROM hr.employees
                        WHERE first_name='David');    

--서브쿼리의 결과가 5000, 6000인 경우 5000 선택해서 < 연산     
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary <ALL (SELECT salary FROM hr.employees
                        WHERE first_name='David'); 

--서브쿼리의 결과가 5000, 6000인 경우 6000 선택해서 < 연산                  
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary <ANY (SELECT salary FROM hr.employees
                        WHERE first_name='David'); 
                  
                  
                        
--다중 컬럼 서브 쿼리
--복수개의 컬럼, 결과값을 동시 비교 가능    
SELECT salary, department_id FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin';    
SELECT  employee_id, first_name, last_name, salary, department_id
    FROM hr.employees
    WHERE (salary, department_id) IN (SELECT salary, department_id FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin');


--집계 함수의 결과값을 가지고 조건식 작성
SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary >= (SELECT AVG(salary)
                        FROM hr.employees);
                        

SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary <= (SELECT AVG(salary)
                        FROM hr.employees);
                   
SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT MAX(salary)
                        FROM hr.employees);                  

SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT MIN(salary)
                        FROM hr.employees);
            
SELECT employee_id, first_name, last_name, department_id, salary
    FROM hr.employees
    WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
                        FROM hr.employees
                        GROUP BY department_id);            
                        
                        
                        
--문제045) hr 계정(소유자)의 employees 테이블의 정보에서 급여(salary)가 가장 적은 직원 출력. Sub Query 사용.
SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT MIN(salary)
                        FROM hr.employees);
                        
                        
--문제046) hr 계정(소유자)의 employees 테이블의 정보에서 급여(salary)가 가장 많은 직원 출력. Sub Query 사용.
SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT MAX(salary)
                        FROM hr.employees);
                        
                        
--문제047) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name이 'Donald', last_name이 'OConnell'인 직원의 급여(salary)와 같은 급여 받는 직원 정보 출력.  Sub Query 사용.
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT salary FROM hr.employees
                        WHERE first_name='Donald' AND last_name='OConnell');
    
                        
--문제048) hr 계정(소유자)의 employees 테이블의 정보에서 
--first_name 'Gerald', last_name 'Cambrault'의 salary보다 급여를 더 많이 받는 직원 정보 출력. Sub Query 사용.
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary > (SELECT salary FROM hr.employees
                        WHERE first_name='Gerald' AND last_name='Cambrault');
                        
                        
--문제049) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name이 'Donald', last_name이 'OConnell'인 직원의 입사일(hire_date)와 같은 입사일인 직원 정보 출력.  Sub Query 사용.
SELECT  employee_id, first_name, last_name, hire_date
    FROM hr.employees
    WHERE hire_date = (SELECT hire_date FROM hr.employees
                        WHERE first_name='Donald' AND last_name='OConnell');
                       
--문제050) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name 'Steven', last_name 'King' 직원의 부하 직원 출력.  Sub Query 사용.
SELECT  employee_id, first_name, last_name, hire_date
    FROM hr.employees
    WHERE manager_id = (SELECT employee_id FROM hr.employees
                        WHERE first_name='Steven' AND last_name='King');
                       
                  
--추가문제) hr 계정(소유자)의 employees 테이블의 정보에서  
--first_name 'Steven', last_name 'King' 직원의 같은 부서 부하 직원 출력.  Sub Query 사용.
SELECT  employee_id, first_name, last_name, hire_date
    FROM hr.employees
    WHERE (department_id, manager_id) IN (SELECT department_id, employee_id FROM hr.employees
                        WHERE first_name='Steven' AND last_name='King');