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



-----------------------------------
--연관성 있는 서브쿼리 : 메인쿼리의 값이 서브쿼리에 참여하고, 서브쿼리의 값이 메인쿼리에 참여하는 형태
--형식
/*
SELECT column_list, ... , (서브쿼리) alias
    FROM table_source alias;
*/

SELECT employee_id
   , first_name
    , last_name
    , department_name
    FROM hr.employees e, HR.departments d
    WHERE e.department_id = d.department_id
    ORDER BY employee_id;

SELECT employee_id
   , first_name
    , last_name
    , (SELECT department_name FROM hr.departments
        WHERE department_id = e.department_id) department_name
    FROM hr.employees e
    ORDER BY employee_id;



SELECT employee_id
    , (SELECT first_name FROM hr.employees
        WHERE employee_id = jh.employee_id) first_name
    , (SELECT last_name FROM hr.employees
        WHERE employee_id = jh.employee_id) last_name
    , start_date, end_date
    , (SELECT job_title FROM hr.jobs
        WHERE job_id = jh.job_id) job_title
    , (SELECT department_name FROM hr.departments
        WHERE department_id = jh.department_id) department_name
    FROM hr.job_history jh
    ORDER BY employee_id;




--집계함수와 일반 컬럼을 같이 출력하는 서브 쿼리 작성
SELECT employee_id, first_name, last_name, department_id, salary
    , (SELECT ROUND(AVG(salary)) FROM hr.employees
        WHERE department_id = 60) avg_salary
    FROM hr.employees
    WHERE department_id = 60;
    
    
-------------------------------------------
--hr 계정(소유자)의 employees 테이블의 정보에서 
--부하 직원이 없는 직원 출력. Sub Query 사용.

--JOIN
SELECT e1.employee_id, e1.first_name, e1.last_name
    FROM hr.employees e1, hr.employees e2
    WHERE e1.employee_id =  e2.manager_id(+)
    AND e2.manager_id IS NULL
    ORDER BY e1.employee_id;

--SUB QUERY
SELECT employee_id, first_name, last_name
    FROM hr.employees e1
    WHERE NOT EXISTS (SELECT 1
        FROM hr.employees
        WHERE manager_id = e1.employee_id)
    ORDER BY employee_id;
    
    
--직급별 평균 급여보다 높게 받는 직원만 출력
SELECT employee_id, first_name, last_name, job_id, salary
    FROM hr.employees e1
    WHERE salary >= (SELECT AVG(salary) FROM hr.employees
                    WHERE job_id = e1.job_id);
    
    

    


--문제051)  hr 계정(소유자)의 employees 테이블의 정보에서 
--직원정보 출력시 직위명(hr.jobs 테이블의 job_title 컬럼)을 같이 출력. Sub Query 사용.

--JOIN
SELECT employee_id, first_name, job_title
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id
    ORDER BY employee_id;

    
--SUB QUERY
SELECT e.first_name, e.last_name, e.job_id
    , (SELECT job_title
             FROM hr.jobs j
             WHERE j.job_id = e.job_id) job_title
FROM hr.employees e;



--문제052)  hr 계정(소유자)의 departments 테이블의 정보에서 
--부서명(department_name), 부서장(manager)이름(first_name, last_name) 출력.  Sub Query 사용.

--JOIN
SELECT department_name, e2.first_name, e2.last_name
    FROM hr.departments d, HR.employees e2
    WHERE e2.employee_id = d.manager_id
    ORDER BY e2.employee_id;
    
--SUB QUERY
SELECT d.department_name,
        (SELECT first_name
        FROM hr.employees
        WHERE employee_id = d.manager_id) first_name,
        (SELECT last_name
        FROM hr.employees
        WHERE employee_id = d.manager_id) last_name
FROM hr.departments d;



--문제053) hr 계정(소유자)의 jobs 테이블의 정보에서 
--직무(job_id)별 최고급여액(max_salary 컬럼의 값) 받는 직원 정보 출력. 
--직무이름(job_title)을 같이 출력할 것.  Sub Query 사용.

--JOIN
SELECT employee_id, first_name, last_name, job_title, salary, j.max_salary
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id
    AND e.salary = j.max_salary 
    ORDER BY employee_id;
    
--SUB QUERY
SELECT first_name, last_name, salary
    , (SELECT job_title
            FROM hr.jobs j
           WHERE job_id = e.job_id) job_title
FROM hr.employees e
WHERE e.salary = (SELECT max_salary
                    FROM hr.jobs
                    WHERE job_id = e.job_id);                
    


--문제054) hr 계정(소유자)의 employees 테이블의 정보에서  
--부서(department_id)별 최고 급여를 받는 직원의 정보 출력. 
--부서 이름(department_name) 같이 출력. Sub Query 사용.
    
--SUB QUERY
SELECT  first_name, last_name, salary
    ,(SELECT department_name
        FROM hr.departments
        WHERE e.department_id = department_id) department_name
FROM hr.employees e
WHERE e.salary = (SELECT MAX(salary)
                    FROM hr.employees
                    WHERE e.department_id = department_id);





--------------------------------
--인라인뷰(Inline View)
--형식
/*
SELECT column_list, ... 
    FROM (서브쿼리) alias;
*/

SELECT department_id, COUNT(*) "count"
       FROM hr.employees
       GROUP BY department_id;
       HAVING COUNT(*) >= 5;
        

SELECT department_id, "count"
    FROM (SELECT department_id, COUNT(*) "count"
            FROM hr.employees
            GROUP BY department_id) a
    WHERE "count" >= 5;



------------------------
--hr 계정(소유자)의 employees 테이블의 정보에서  
--부서별 최고 급여를 받는 직원의 정보 출력. 
--부서 이름(department_name) 같이 출력.

--Sub Query
SELECT employee_id, first_name, last_name, salary, department_id 
    , (SELECT department_name  FROM hr.departments 
        WHERE department_id=e.department_id) department_name 
    FROM hr.employees e
    WHERE (department_id, salary) IN (SELECT department_id, MAX(salary) 
                    FROM hr.employees GROUP BY department_id) 
    ORDER BY employee_id;

--Inline View
SELECT department_id, first_name, last_name, salary
    , (SELECT department_name  FROM hr.departments 
        WHERE department_id=e.department_id) department_name 
FROM (SELECT department_id, first_name, last_name, salary,
       RANK() OVER(PARTITION BY department_id  ORDER BY salary DESC) "RANK"
  FROM hr.employees) e
  WHERE "RANK" = 1;


--Inline View + JOIN
SELECT e.department_id, first_name, last_name, salary
    , department_name
FROM (SELECT department_id, first_name, last_name, salary,
       RANK() OVER(PARTITION BY department_id  ORDER BY salary DESC) "RANK"
  FROM hr.employees) e, hr.departments d
  WHERE e.department_id = d.department_id
  AND "RANK" = 1;


--hr 계정(소유자)의 employees, jobs 테이블의 정보에서 
--first_name 'Donald', last_name 'OConnell'과 
--직위명(job_title)이 같은 직원 정보 출력하는 쿼리 작성.
SELECT 컬럼리스트
    FROM 가상테이블1 a, 가상테이블2 b
    WHERE a.job_title = b.job_title;

--가상테이블1    
SELECT employee_id, first_name, last_name
    , job_title
    FROM hr.employees e1, hr.jobs j
    WHERE e1.job_id = j.job_id
    AND first_name='Donald' AND last_name='OConnell';

--가상테이블2    
SELECT  job_title, employee_id, first_name, last_name
    FROM hr.jobs j, hr.employees e2
    WHERE j.job_id = e2.job_id;

--Inline View + JOIN    
SELECT b.employee_id, b.first_name, b.last_name, b.job_title
    FROM (SELECT employee_id, first_name, last_name, job_title
        FROM hr.employees e1, hr.jobs j
        WHERE e1.job_id = j.job_id
        AND first_name='Donald' AND last_name='OConnell') a
    , (SELECT  job_title, employee_id, first_name, last_name
        FROM hr.jobs j, hr.employees e2
        WHERE j.job_id = e2.job_id) b
    WHERE a.job_title = b.job_title;



--문제055) hr 계정(소유자)의 employees 테이블의 정보에서 
--급여(salary) 순위가 높은 순으로 10명의 직원 출력. RANK() OVER() 함수 사용.
SELECT employee_id, first_name, last_name, salary, rank_
    FROM (SELECT   employee_id, first_name, last_name, salary
        , RANK() OVER(ORDER BY salary DESC) rank_
        FROM hr.employees) emp
    WHERE rank_ <= 10;
    
    

--문제056) hr 계정(소유자)의 employees 테이블의 정보에서 
--입사일(hire_date) 순위가 높은 순으로 10명의 직원 출력. RANK() OVER() 함수 사용.
SELECT employee_id, first_name, last_name, hire_date, "RANK" 
    FROM (SELECT employee_id, first_name, last_name, hire_date
                , DENSE_RANK() OVER(ORDER BY hire_date) "RANK" 
            FROM hr.employees) emp
    WHERE "RANK" < 11;
    

--문제057) hr 계정(소유자)의 employees 테이블의 정보에서 
--급여(salary) 순위가 높은 순으로 두 번째 직원 출력. RANK() OVER() 함수 사용.
SELECT employee_id, first_name, last_name, salary, "RANK"  
    FROM (SELECT employee_id, first_name, last_name, salary
            , DENSE_RANK() OVER(ORDER BY salary DESC) "RANK" 
        FROM hr.employees) emp
    WHERE "RANK" = 2;


--문제058) hr 계정(소유자)의 employees 테이블의 정보에서 
--직원 개개인의 급여와 부서별 평균 급여와의 차이 출력. AVG() OVER() 함수 사용.
SELECT employee_id, first_name, last_name, department_id, salary, "D_avg_salary", salary - "D_avg_salary" "차이"
    FROM (SELECT employee_id, first_name, last_name, department_id, salary
            , ROUND(AVG(salary) OVER(PARTITION BY department_id)) "D_avg_salary"
        FROM hr.employees) emp;
        
        

--문제059) hr 계정(소유자)의 employees 테이블의 정보에서
--부서별 급여의 합 출력. 
--각 개인의 급여가 부서 전체의 급여 합에서 차지하는 비중 출력.
--비중 계산은 ROUND((개인의 급여 / 부서 전체 급여 합) * 100) 로 한다.

SELECT employee_id, first_name, last_name, department_id, salary, "D_sum_salary", ROUND((salary / "D_sum_salary") * 100) "비율"
    FROM (SELECT employee_id, first_name, last_name, department_id, salary
            , SUM(salary) OVER(PARTITION BY department_id) "D_sum_salary" 
        FROM hr.employees) emp;

SELECT employee_id, first_name, last_name, department_name, salary, "D_sum_salary", ROUND((salary / "D_sum_salary") * 100) "비율"
    FROM (SELECT employee_id, first_name, last_name, department_id, salary
            , SUM(salary) OVER(PARTITION BY department_id) "D_sum_salary" 
        FROM hr.employees) emp, hr.departments d
    WHERE emp.department_id = d.department_id;