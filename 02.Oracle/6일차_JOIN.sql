/*
JOIN : 두 개 이상의 테이블을 결합해서 조회하는 명령
1. INNER JOIN : returns rows when there is a match in both tables.
2. LEFT JOIN : returns all rows from the left table, even if there are no matches in the right table.
3. RIGHT JOIN : returns all rows from the right table, even if there are no matches in the left table.
4. FULL JOIN : returns rows when there is a match in one of the tables.
5. SELF JOIN : is used to join a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.
6. CARTESIAN JOIN : returns the Cartesian product of the sets of records from the two or more joined tables.
*/



/*
INNER JOIN : = (같음을 비교하는 연산자)를 이용한 조인 조건 설정
주의) PK, FK 제약을 지정한 컬럼을 대상으로 조인 조건 지정
ANSI [American National Standards Institute] 표기법
    SELECT table1.column1, table2.column2...
    FROM table1
    INNER JOIN table2
    ON table1.common_field = table2.common_field;
    --WHERE 조건식
Oracle 표기법
    SELECT table1.column1, table2.column2...
    FROM table1, table2
    WHERE table1.common_field = table2.common_field;
    --AND 조건식
*/

--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments INNER JOIN hr.employees
    ON hr.departments.department_id = hr.employees.department_id;

--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments, hr.employees
    WHERE hr.departments.department_id = hr.employees.department_id;
   
    
--Alias 적용
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id = e.department_id;
 
    
    
--Alias 적용
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d INNER JOIN hr.employees e
    ON d.department_id = e.department_id; 
    
    
    
    
--hr.jobs, hr.employees 
SELECT employee_id, first_name, last_name, job_title
    FROM hr.jobs j, hr.employees e
    WHERE j.job_id = e.job_id
    ORDER BY employee_id;
   
    
--hr.jobs, hr.employees 
SELECT employee_id, first_name, last_name, job_title
    FROM hr.jobs j INNER JOIN hr.employees e
    ON j.job_id = e.job_id
    ORDER BY employee_id;
    
    
--hr.jobs, hr.employees, hr.departments
SELECT employee_id, first_name, last_name, job_title, department_name
    FROM hr.jobs j 
    INNER JOIN hr.employees e ON j.job_id = e.job_id
    INNER JOIN hr.departments d ON e.department_id = d.department_id
    --WHERE 일반조건식
    ORDER BY employee_id;
    
    
--hr.jobs, hr.employees, hr.departments
SELECT employee_id, first_name, last_name, job_title, department_name
    FROM hr.jobs j, hr.employees e, hr.departments d
    WHERE j.job_id = e.job_id
    AND e.department_id = d.department_id
    --AND 일반조건식
    ORDER BY employee_id;
    
--hr.jobs, hr.employees, hr.departments
SELECT employee_id, first_name, last_name, job_title, department_name
    FROM hr.jobs j, hr.employees e, hr.departments d
    WHERE j.job_id = e.job_id
    AND e.department_id = d.department_id
    AND department_name = 'IT' 
    ORDER BY employee_id;    


--문제031) hr 계정(소유자)의 employees, departments 테이블의 정보에서 
--부서아이디, 부서명 및 부서장의 개인정보(직원아이디, 이름, 전화번호)를 같이 출력하는 쿼리 작성. 
--INNER JOIN 사용.

--ANSI 표기법
SELECT d.department_id, department_name, d.manager_id, first_name, phone_number
    FROM hr.departments d INNER JOIN hr.employees e 
    ON d.manager_id = e.employee_id;
    
--Oracle 표기법
SELECT d.department_id, department_name, d.manager_id, first_name, phone_number 
    FROM hr.departments d, hr.employees e 
    WHERE d.manager_id = e.employee_id; 



--문제032) hr 계정(소유자)의 employees, departments, locations, countries, regions 테이블의 정보에서 
--직원 정보(직원아이디, 이름, 부서명, 부서위치)를 출력하는 쿼리 작성. 
--INNER JOIN 사용.

--ANSI 표기법
SELECT employee_id, first_name, last_name, d.department_name, l.city, c.country_name, r.region_name
    FROM hr.employees e
    INNER JOIN hr.departments d ON e.department_id = d.department_id
    INNER JOIN hr.locations l ON d.location_id = l.location_id
    INNER JOIN hr.countries c ON l.country_id = c.country_id
    INNER JOIN hr.regions r ON c.region_id = r.region_id;
    
--Oracle 표기법
SELECT employee_id, first_name, last_name, d.department_name, l.city, c.country_name, r.region_name
    FROM hr.employees e ,hr.departments d, hr.locations l, hr.countries c ,hr.regions r
    WhERE e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND l.country_id = c.country_id
    AND c.region_id = r.region_id;




----------------------------
-- Non-Equi Join
-- =(equal)이 아닌 연산자(>, <, >=, <=)를 사용하는 조인 방법
SELECT employee_id, first_name, phone_number, job_title
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id 
    AND j.job_title IN ('Stock Manager', 'Stock Clerk', 'Shipping Clerk');




------------------------
/*
LEFT JOIN (OUTER JOIN)
ANSI 표기법
    SELECT table1.column1, table2.column2...
    FROM table1  LEFT OUTER JOIN table2
    ON table1.common_field = table2.common_field;
    
Oracle 표기법
    SELECT table1.column1, table2.column2...
    FROM table1, table2
    WHERE table1.common_field = table2.common_field(+);
*/

--ANSI 표기법
SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d LEFT OUTER JOIN hr.employees e
    ON d.department_id = e.department_id;
    
--ANSI 표기법
SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d LEFT JOIN hr.employees e
    ON d.department_id = e.department_id;

--Oracle 표기법
SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id = e.department_id(+);




SELECT  employee_id, first_name, last_name, d.department_id, department_name, d.manager_id
    FROM hr.employees e LEFT JOIN hr.departments d
    ON e.department_id = d.department_id;    

SELECT  employee_id, first_name, last_name, d.department_id, department_name, d.manager_id
    FROM hr.employees e, hr.departments d
    WHERE e.department_id = d.department_id(+);


SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d LEFT JOIN hr.employees e
    ON d.manager_id = e.employee_id;

SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d, hr.employees e
    WHERE d.manager_id = e.employee_id(+);



--문제033) hr 계정(소유자)의 jobs, employees 테이블의 정보에서 
--직위 정보를 기준으로 직원 정보를 같이 출력하는 쿼리 작성. 
--LEFT JOIN 사용.

--ANSI 표기법
SELECT j.job_id, job_title, min_salary, max_salary, e.employee_id, first_name, last_name
    FROM hr.jobs j LEFT JOIN hr.employees e
    ON j.job_id = e.job_id;

--Oracle 표기법
SELECT j.job_id, job_title, min_salary, max_salary, e.employee_id, first_name, last_name
    FROM hr.jobs j, hr.employees e
    WHERE j.job_id = e.job_id(+);




--문제034) hr 계정(소유자)의 employees, job_history 테이블의 정보에서 
--직원 정보를 기준으로 부서, 직위 변동 정보를 같이 출력하는 쿼리 작성. LEFT JOIN 사용.

--ANSI 표기법
SELECT e.employee_id, first_name, last_name, e.job_id, jh.job_id, jh.start_date, jh.end_date
    FROM hr.employees e LEFT JOIN hr.job_history jh
    ON e.employee_id = jh.employee_id
    ORDER BY e.employee_id;
    
    
--Oracle 표기법
SELECT e.employee_id, first_name, last_name, e.job_id, jh.job_id, jh.start_date, jh.end_date
    FROM hr.employees e, hr.job_history jh
    WHERE e.employee_id = jh.employee_id(+)
    ORDER BY e.employee_id;


----------------------------------
--문제035) hr 계정(소유자)의 employees, jobs 테이블의 정보에서  
--first_name 'Neena', last_name 'Kochhar' 직원의 직무명(job_title)까지 출력. INNER JOIN 사용.

--ANSI 표기법
SELECT e.employee_id, first_name, last_name, job_title
    FROM hr.employees e
        INNER JOIN hr.jobs j ON e.job_id = j.job_id
    WHERE first_name = 'Neena' AND last_name = 'Kochhar';
    
--Oracle 표기법
SELECT e.employee_id, first_name, last_name, job_title
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id
        AND first_name = 'Neena' AND last_name = 'Kochhar';




--문제036)  hr 계정(소유자)의 employees, jobs 테이블의 정보에서 
--직위명(job_title)별 최소급여(min_salary)를 받는 직원 출력. INNER JOIN 사용.
--3명

--ANSI 표기법
SELECT e.employee_id, first_name, last_name, job_title, min_salary, salary
    FROM hr.employees e
        INNER JOIN hr.jobs j ON e.job_id = j.job_id
    WHERE j.min_salary = e.salary;
    
--Oracle 표기법
SELECT e.employee_id, first_name, last_name, job_title, min_salary, salary
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id 
    AND j.min_salary = e.salary;


--문제037) hr 계정(소유자)의 employees, jobs 테이블의 정보에서
--직위명(job_title)별 직원의 수 출력.  INNER JOIN 사용.

--ANSI 표기법
SELECT job_title, COUNT(job_title) "COUNT"
    FROM hr.employees e
        INNER JOIN hr.jobs j ON e.job_id = j.job_id
    GROUP BY job_title
    ORDER BY job_title;
    
--Oracle 표기법
SELECT job_title, COUNT(job_title) "COUNT"
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id
    GROUP BY job_title
    ORDER BY job_title;


--문제038)  hr 계정(소유자)의 employees, departments 테이블의 정보에서 
--first_name 'David', last_name 'Austin' 직원이 속한 
--부서명(department_name), 부서장(manager)이름(first_name, last_name) 출력.  INNER JOIN 사용.

--ANSI 표기법
SELECT e1.employee_id, e1.first_name, e1.last_name, department_name
    , e2.employee_id, e2.first_name, e2.last_name
    FROM hr.employees e1
        INNER JOIN hr.departments d ON e1.department_id = d.department_id
        INNER JOIN hr.employees e2 ON d.manager_id = e2.employee_id
    WHERE e1.first_name='David' AND e1.last_name='Austin';

--Oracle 표기법
SELECT e1.employee_id, e1.first_name, e1.last_name, department_name
    , e2.employee_id, e2.first_name, e2.last_name
    FROM hr.employees e1, hr.departments d, hr.employees e2
    WHERE e1.department_id = d.department_id
        AND d.manager_id = e2.employee_id
        AND e1.first_name='David' AND e1.last_name='Austin';
        