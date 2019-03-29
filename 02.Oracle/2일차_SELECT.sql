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


----------------------------------------------
--Selecting All Columns + All Rows of a Table
/*
SELECT *
FROM   table_name;
*/

SELECT * 
    FROM hr.employees;

SELECT *
    FROM hr.departments;
    
    
--문제001) hr 계정(소유자)의 jobs 테이블의 정보를 전체 출력하는 쿼리 작성.
SELECT *
    FROM hr.jobs;



------------------------------------------
--Selecting Specific Columns + All Rows of a Table
/*
SELECT column1, column2....columnN
FROM   table_name;
*/

SELECT employee_id, first_name, phone_number
    FROM hr.employees;

SELECT department_id, department_name
    FROM hr.departments;
    
--문제002) hr 계정(소유자)의 jobs 테이블의 정보에서 
-- job_id, job_title 컬럼 정보만 출력하는 쿼리 작성.
SELECT job_id, job_title
    FROM hr.jobs;
    

------------------------------------------
--Displaying Selected Columns Under New Headings
/*
형식1)
SELECT column1 alias1, column2 alias2, ....columnN  aliasN
FROM   table_name;
형식2)
SELECT column1 AS alias1, column2 AS alias2, ....columnN AS aliasN
FROM   table_name;
형식3)
SELECT column1 "alias1", column2 "alias2", ....columnN  "aliasN"
FROM   table_name;
*/

SELECT employee_id eid, first_name fname, phone_number phone
    FROM hr.employees;
SELECT employee_id AS eid, first_name AS fname, phone_number AS phone
    FROM hr.employees;    
SELECT employee_id "Employee Id", first_name "First Name", phone_number "Phone Number"
    FROM hr.employees;
    
    
    

--문제003) hr 계정(소유자)의 jobs 테이블의 정보에서 
-- job_id 컬럼은 "Job Id", job_title 컬럼은 "Job Title"로 타이틀 변경해서 출력하는 쿼리 작성.
SELECT job_id "Job_Id", job_title "Job_Title"
    FROM hr.jobs;



------------------------------------------
--Selecting Data that Satisfies Specified Conditions
/*
SELECT column1, column2....columnN
FROM   table_name
WHERE  condition;

=, !=, <, >, <=, >=
IS [NOT] NULL, LIKE, [NOT] BETWEEN, [NOT] IN, EXISTS, IS OF type
NOT, AND, OR

주의) 연산자를 이용해서 조건식 작성시 자료형(data type) 확인 필요. NUMBER(숫자), VARCHAR2(문자열), DATE(날짜), ...
*/

SELECT employee_id, first_name, phone_number, salary
    FROM hr.employees
    WHERE salary = 10000;
--4 rows

SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE department_id = 100;
--6 rows

SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE department_id = '100';
--6 rows


--문제004) hr 계정(소유자)의 employees 테이블의 정보에서 
-- job_id가 'ST_CLERK'인 경우만 출력하는 쿼리 작성.
SELECT *
    FROM hr.employees
    WHERE job_id = 'ST_CLERK';


/*
인 경우 =
이상인 경우 <=
이하인 경우 >=
초과인 경우 <
미만인 경우 >
*/


--문제005) hr 계정(소유자)의 employees 테이블의 정보에서 
-- salary가 10000 이상인 경우만 출력하는 쿼리 작성.
SELECT *
    FROM hr.employees
    WHERE salary >= 10000;


--문제006) hr 계정(소유자)의 employees 테이블의 정보에서 
-- salary가 5000 이하인 경우만 출력하는 쿼리 작성.
SELECT *
    FROM hr.employees
    WHERE salary <= 5000;



-------------------------------------------
SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE department_id = ANY (90, 100);

SELECT employee_id, first_name, phone_number, salary
    FROM hr.employees
    WHERE salary >= ALL (9000, 10000);
    
    
    
    
--------------------------------------------
SELECT employee_id, first_name, hire_date
    FROM hr.employees;
    


SELECT SYSDATE
    FROM dual;
--19/03/19
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    FROM dual;
--2019-03-19
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') today
    FROM dual;
--2019-03-19



--yy/mm/dd
--날짜형식 지정시 yyyy-mm-dd로 변환 가능. TO_CHAR() function
SELECT employee_id, first_name
    , TO_CHAR(hire_date, 'YYYY-MM-DD') AS hire_date1
    , TO_CHAR(hire_date, 'YYYY-MM') AS hire_date2
    , TO_CHAR(hire_date, 'YYYY') AS hire_date3
    FROM hr.employees;

SELECT employee_id, first_name, department_id, hire_date
    FROM hr.employees
    WHERE TO_CHAR(hire_date, 'YYYY') = '2005';

SELECT employee_id, first_name, department_id, hire_date
    FROM hr.employees
    WHERE TO_CHAR(hire_date, 'YYYY') = 2005;
    
    
--문제007) hr 계정(소유자)의 employees 테이블의 정보에서 
--이달(3월달)의 입사자만 출력하는 쿼리 작성. TO_CHAR() 함수 사용.

SELECT *
    FROM hr.employees
    WHERE TO_CHAR(hire_date, 'MM') = '03';




------------------------------------------------
--SQL IN Clause
/*
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name [NOT] IN (val-1, val-2,...val-N);
*/
SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE department_id IN (90, 100);
    
SELECT employee_id, first_name, phone_number, salary
    FROM hr.employees
    WHERE salary IN (8000, 9000, 10000);
    
    
--문제008) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정달(8월달, 9월달) 입사자만 출력하는 쿼리 작성. IN 연산자 사용.
SELECT *
    FROM hr.employees
    WHERE TO_CHAR(hire_date, 'MM') IN ('08', '09');
        
         
----------------------------------------
--SQL [NOT] BETWEEN Clause
/*
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name [NOT] BETWEEN val-1 AND val-2;
*/
SELECT employee_id, first_name, phone_number, salary
    FROM hr.employees
    WHERE salary BETWEEN 2000 AND 3000;
  
SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE department_id BETWEEN 10 AND 50;

SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE first_name BETWEEN 'A' AND 'B';

SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE first_name BETWEEN 'B' AND 'C';
    
SELECT employee_id, first_name, phone_number, salary
    FROM hr.employees
    WHERE salary NOT BETWEEN 2000 AND 3000;
    
SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE first_name NOT BETWEEN 'A' AND 'B';    
 
 
--문제010) hr 계정(소유자)의 employees 테이블의 정보에서 
--전화번호(phone_number)가 앞자리가 500번대인 경우만 출력하는 쿼리 작성
--문자열의 일부만 추출하는 함수 필요
--515.XXX.XXXX, 590.XXX.XXXX
--BETWEEN ~ AND 연산자 사용
SELECT employee_id, first_name, phone_number, department_id
    FROM hr.employees
    WHERE phone_number BETWEEN '500' AND '600'; 





----------------------------------------
--SQL IS [NOT] Clause
/*
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name IS [NOT] NULL;
*/

SELECT employee_id, first_name, department_id
    FROM hr.employees;
    

SELECT employee_id, first_name, department_id
    FROM hr.employees
    WHERE department_id = NULL;
--0 rows

SELECT employee_id, first_name, department_id
    FROM hr.employees
    WHERE department_id IS NULL;
--1 rows    


SELECT employee_id, first_name, department_id
    FROM hr.employees
    WHERE department_id IS NOT NULL;
--106 rows


SELECT employee_id, first_name
    , manager_id
    , department_id, commission_pct
    FROM hr.employees;



--문제011) hr 계정(소유자)의 employees 테이블의 정보에서 
--commission_pct가 NULL인 경우만 출력하는 쿼리 작성.
SELECT employee_id, first_name, manager_id, department_id, commission_pct
    FROM hr.employees    
    WHERE commission_pct IS NULL;


--문제012) hr 계정(소유자)의 employees 테이블의 정보에서 
--commission_pct가 유효한 값(NULL이 아닌 값)을 가진 경우만 출력하는 쿼리 작성.
SELECT employee_id, first_name, manager_id, department_id, commission_pct
    FROM hr.employees    
    WHERE commission_pct IS NOT NULL;


--문제013) hr 계정(소유자)의 employees 테이블의 정보에서 
--manager_id가 NULL인 경우만 출력하는 쿼리 작성.
--manager_id 컬럼은 현재 직원의 상사에 대한 정보를 저장한 컬럼
SELECT employee_id, first_name, last_name, manager_id, job_id
    FROM hr.employees    
    WHERE manager_id IS NULL;




------------------------------
--SQL [NOT] LIKE Clause
/*
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name [NOT] LIKE { PATTERN };
*/
-- % or _


SELECT employee_id, first_name, last_name
    FROM hr.employees 
     WHERE last_name LIKE 'R%';

SELECT employee_id, first_name, last_name
    FROM hr.employees 
     WHERE first_name LIKE 'A%';

SELECT employee_id, first_name, last_name
    FROM hr.employees 
     WHERE last_name LIKE 'R___';
     
SELECT employee_id, first_name, last_name
    FROM hr.employees 
     WHERE first_name LIKE 'A___';     

SELECT employee_id, first_name, last_name
    FROM hr.employees 
     WHERE last_name LIKE 'Ra%';

SELECT employee_id, first_name, last_name
    FROM hr.employees 
     WHERE last_name LIKE 'R%y';


--문제014) hr 계정(소유자)의 employees 테이블의 정보에서 
--전화번호(phone_number)가 앞자리가 '515'로 시작하는 경우만 출력하는 쿼리 작성. LIKE 연산자 사용.
--515.XXX.XXXX
SELECT employee_id, first_name, last_name, phone_number
    FROM hr.employees 
     WHERE phone_number LIKE '515%';