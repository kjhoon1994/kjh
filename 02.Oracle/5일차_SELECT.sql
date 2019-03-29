/*
SELECT : 특정 테이블(자료에 물리적 저장소)에 대한 조회 명령
주의)적절한 권한(CONNECT, RESOURCE role + SELECT ANY TABLE)이 부여된 경우만 조회 가능
형식
SELECT column1, column2....columnN
    FROM   table_name
    WHERE  condition
    GROUP BY column_name
    HAVING (arithematic function condition)
    ORDER BY column_name {ASC|DESC};
*/



/*
FUNCTION  : Functions are similar to operators in that they manipulate data items and return a result.
1. function(argument, argument, ...) 
2. 내장 함수(SQL, 오라클 제공 함수), 사용자 정의 함수(PL/SQL)
3. 단일 행 함수(Single-Row Functions), 복수 행 함수(Aggregate Functions)
4. 숫자 자료형 함수, 문자 자료형 함수, 날짜 자료형 함수, 형 변환 함수
*/



---------------------------------------------------------------------
--Aggregate function
--Aggregate functions return a single result row based on groups of rows, rather than on single rows

--주의) Aggregate function은 단독 실행해야 한다. 다른 함수(Single-Row Functions)와 같이 사용할 수 없다.

--COUNT : COUNT returns the number of rows returned by the query.
--SUM
--AVG
--MAX, MIN
--RANK
--DENSE_RANK
--주의) null 값은 집계 함수 연산에 참여하지 않는다.



------------------------------
SELECT employee_id, first_name, COUNT(*) "count"
    FROM hr.employees;
--ORA-00937: not a single-group group function

SELECT COUNT(*) "count"
    FROM hr.employees;
--107

SELECT COUNT(employee_id) "count"
    FROM hr.employees;
--107

SELECT COUNT(department_id) "count"
    FROM hr.employees;
--106
--NULL 값이 있는 연산 제외


SELECT COUNT(*) "count"
    FROM hr.employees
    WHERE manager_id IS NULL;
--1

SELECT COUNT(*) "count"
    FROM hr.employees
    WHERE department_id IS NULL;
--1


SELECT COUNT(employee_id) "count"
    FROM hr.employees;
--PK 제약이 있는 컬럼을 대상으로 COUNT() 함수 사용시 전체 카운팅
--107

SELECT COUNT(commission_pct) "count"
    FROM hr.employees;
--null이 있는 컬럼을 대상으로 COUNT() 함수 사용시 일부 카운팅. null 값은 카운팅 제외.
--35

SELECT COUNT(department_id) "count"
    FROM hr.employees;
--106


--DISTINCT 키워드는 중복 제거 역할
SELECT DISTINCT department_id 
    FROM hr.employees;
--12
--NULL 포함

SELECT COUNT(DISTINCT department_id) "count"
    FROM hr.employees;
--11
--NULL제외

SELECT DISTINCT job_id
    FROM hr.employees;
--19    
    


--문제26)  hr 계정(소유자)의 employees 테이블의 정보에서 
--commission_pct가 없는(값이 null인) 직원의 수를 출력하는 쿼리 작성. COUNT() 함수 사용.
SELECT COUNT(*) "count"
    FROM hr.employees
    WHERE commission_pct IS NULL;
--72


--추가문제) hr 계정(소유자)의 employees 테이블의 정보에서 
--입사년도가 2002년인 직원의 수를 출력하는 쿼리 작성.
--COUNT() 함수 사용
SELECT COUNT(*) "count"
    FROM hr.employees
    WHERE TO_CHAR(hire_date, 'YYYY') = '2002';
--7





-----------------------------------
SELECT SUM(salary) "Total"
     FROM hr.employees;
     
SELECT SUM(salary) "Total"
     FROM hr.employees
     WHERE department_id = 100;
     
SELECT AVG(salary) "Total"
     FROM hr.employees;
     
SELECT ROUND(AVG(salary), 1) "Total"
     FROM hr.employees
     WHERE department_id = 100;     
     
     
--문제027) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정 직위(job_id)를 가진 직원의 급여(salary) 합 및 평균 출력하는 쿼리 작성.
--평균 출력시 소수이하 한자리만 출력.
--'CLERK'으로 끝나는 직위를 가진 직원 대상. 
--REGEXP_LIKE() 함수 사용.
-->SH_CLERK, ST_CLERK, PU_CLERK
SELECT employee_id, first_name, job_id 
     FROM hr.employees
     WHERE REGEXP_LIKE(job_id, '_CLERK$');

SELECT ROUND(AVG(salary), 1) "AVG", SUM(salary) "SUM" 
     FROM hr.employees
     WHERE REGEXP_LIKE(job_id, '_CLERK$');


--추가문제) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정 직위(job_id)를 가진 직원의 급여(salary) 합 및 평균 출력하는 쿼리 작성.
--평균 출력시 소수이하 한자리만 출력.
--'MAN' 또는 'MGR'로 끝나는 직위를 가진 직원 대상. 
--REGEXP_LIKE() 함수 사용.
SELECT employee_id, first_name, job_id 
    FROM HR.employees
    WHERE REGEXP_LIKE(job_id, '_MAN$|_MGR$');
    
SELECT COUNT(*) "COUNT", SUM(salary) "SUM"
    , ROUND(AVG(salary),1) "AVG"
    FROM HR.employees
    WHERE REGEXP_LIKE(job_id, '_MAN$|_MGR$');

SELECT MAX(salary) "MAX", MIN(salary) "MIN"
    FROM hr.employees;






--------------------------------
--분석함수
--RANK() OVER() : 1, 2, 2, 4, ...
--DENSE_RANK() OVER() : 1, 2, 2, 3, ...
--ROW_NUMBER() OVER() : 1, 2, 3, 4, ...
--SUM() OVER() : 누적 결과 반환

SELECT department_id, last_name, salary
       ,RANK() OVER (ORDER BY salary DESC) "RANK"
       ,DENSE_RANK() OVER (ORDER BY salary DESC) "DENSE_RANK"
       ,ROW_NUMBER() OVER (ORDER BY salary DESC) "ROW_NUMBER"
  FROM hr.employees;



--문제028) hr 계정(소유자)의 employees 테이블의 정보에서 
--입사년월일(hire_date)가 빠른 순으로 등수 부여 출력하는 쿼리 작성.
--같은 날짜인 경우 같은 등수 출력.
--DENSE_RANK() OVER() 함수 사용
SELECT employee_id, last_name, hire_date
        ,DENSE_RANK() OVER (ORDER BY hire_date) "DENSE_RANK"
 FROM hr.employees;



SELECT salary, SUM(salary) OVER(ORDER BY salary) "SUM" 
     FROM hr.employees
     WHERE REGEXP_LIKE(job_id, '_CLERK$');





--------------------------------------------------------
--SQL GROUP BY Clause
--Specify the GROUP BY clause if you want the database to group the selected rows based on the value of expr(s) for each row and return a single row of summary information for each group.
/*
SELECT column_name1, SUM(column_name2), ...
FROM   table_name
GROUP BY column_name1;
*/
--주의) GROUP BY 키워드에 사용하는 컬럼은 중복된 자료가 있는 컬럼(FK 제약이 있는 컬럼) 선정. PK, UK 제약이 있는 컬럼은 적절한 대상이 아니다.

SELECT department_id, COUNT(*), SUM(salary)
    FROM  hr.employees
    GROUP BY department_id;
    
SELECT department_id  depId, COUNT(*), SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    ORDER BY department_id;
    
SELECT department_id  deptId, COUNT(*), SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    ORDER BY deptId;    

SELECT MIN(salary), MAX(salary)
    FROM hr.employees;

SELECT department_id, MIN(salary), MAX(salary)
    FROM hr.employees
    GROUP BY department_id
    ORDER BY department_id;
   
SELECT job_id, COUNT(*) "COUNT", AVG(salary)
    FROM hr.employees
    GROUP BY job_id
    ORDER BY job_id;
    
SELECT department_id, job_id, COUNT(*)
    FROM hr.employees
    GROUP BY department_id, job_id
    ORDER BY department_id, job_id;    

     
--문제029) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정 직위(job_id)별 직원의 급여 합 및 평균 출력하는 쿼리 작성.
--'CLERK'으로 끝나는 직위를 가진 직원 대상. 
--REGEXP_LIKE() 함수 사용.
-->SH_CLERK, ST_CLERK, PU_CLERK


SELECT job_id, ROUND(AVG(salary), 1) "AVG", SUM(salary) "SUM" 
     FROM hr.employees
     WHERE REGEXP_LIKE(job_id, '_CLERK$')
     GROUP BY job_id;



------------------------------------
--SQL HAVING Clause
/*
SELECT column_name1, SUM(column_name2), ...
FROM   table_name
GROUP BY column_name1
HAVING (arithematic function condition);
*/
--HAVING 키워드는 GROUP BY 키워드가 같이 사용한다. 단독 실행 가능.
--HAVING 키워드에는 조건식 작성시 집계함수를 사용한다.

SELECT department_id, COUNT(*) "COUNT", SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    ORDER BY "COUNT";

SELECT department_id, COUNT(*) "COUNT", SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    HAVING COUNT(*) >= 10
    ORDER BY "COUNT";

--문제030) hr 계정(소유자)의 employees 테이블의 정보에서 
--'CLERK'으로 끝나는 직위를 가진 직원 대상. REGEXP_LIKE() 함수 사용. WHERE 구문
--특정 직위(job_id)별 직원의 급여 합 및 평균 출력하는 쿼리 작성. GROUP BY 구문.
--급여 평균이 일정 기준(3000) 이상인 경우만 출력. HAVING 구문.

SELECT job_id , SUM(salary) "SUM", AVG(salary) "AVG" 
    FROM  hr.employees 
    WHERE  REGEXP_LIKE(job_id,'CLERK$') 
    GROUP BY job_id
    HAVING AVG(salary) >= 3000;



---------------------------------------------------------
--분석 함수 사용시 특정 그룹을 만든 후에 함수 적용
--PARTITION BY 키워드 사용

SELECT department_id, last_name, salary,
       RANK() OVER (PARTITION BY department_id  ORDER BY salary DESC) "RANK"
  FROM hr.employees;

SELECT department_id, last_name, salary,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) "DENSE_RANK"
  FROM hr.employees;
  
  
--추가문제) hr 계정(소유자)의 employees 테이블의 정보에서 
--'CLERK'으로 끝나는 직위를 가진 직원 대상. REGEXP_LIKE() 함수 사용. WHERE 구문
--특정 직위(job_id)별 급여 많이 받는 순으로 순위 부여 출력.
--DENSE_RANK() OVER() 함수
SELECT employee_id, department_id, last_name, salary, job_id,
     DENSE_RANK() OVER (PARTITION BY job_id  ORDER BY salary DESC) "DENSE_RANK"
     FROM hr.employees
     WHERE REGEXP_LIKE (job_id, '_CLERK$');



-----------------------------------
--SUM()과  SUM() OVER()의 차이
SELECT employee_id, first_name
    , salary, SUM(salary) "TOTAL_SAL"
    FROM hr.employees;

SELECT employee_id, first_name
    , salary, SUM(salary) OVER() "TOTAL_SAL"
    FROM hr.employees;
  
  
------------------------------
--ROWID, ROWNUM
--쿼리 실행시 결과에 내부적으로 부여되는 고유번호
SELECT ROWNUM,  employee_id, first_name, phone_number
    FROM hr.employees;

SELECT  *
    FROM (SELECT ROWNUM rn,  employee_id, first_name, phone_number
        FROM hr.employees)
    WHERE rn BETWEEN 1 AND 10;

SELECT  *
    FROM (SELECT ROWNUM rn,  employee_id, first_name, phone_number
        FROM hr.employees)
    WHERE rn BETWEEN 11 AND 20;  
  
----------------------------------------------------------