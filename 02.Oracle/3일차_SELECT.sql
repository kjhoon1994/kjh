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




-------------------------------
--SQL AND/OR Clause
/*
SELECT column1, column2....columnN
FROM   table_name
WHERE  condition-1 {AND|OR} condition-2;
*/

SELECT employee_id, first_name, job_id, department_id
  FROM hr.employees
  WHERE job_id LIKE '%_CLERK'
    AND department_id = 30;
  
SELECT employee_id, first_name, job_id, department_id
  FROM hr.employees
  WHERE department_id = 20
    OR department_id = 30;

SELECT employee_id, first_name, job_id, department_id
  FROM hr.employees
  WHERE department_id IN (20, 30);


--문제015) hr 계정(소유자)의 employees 테이블의 정보에서 
--부서번호(department_id)가 30이면서, 
--입사년도(hire_date)가 2005년인 경우만 출력하는 쿼리 작성.

SELECT employee_id, first_name, job_id, department_id, hire_date
  FROM hr.employees
  WHERE department_id = 30
    AND TO_CHAR(hire_date, 'YYYY') = '2005';




------------------------------------------
--SQL ORDER BY Clause
/*
SELECT column1, column2....columnN alias
FROM   table_name
ORDER BY column_name1 {ASC|DESC}, alias {ASC|DESC}, ...;
*/

SELECT employee_id, first_name, job_id, department_id
  FROM hr.employees
  ORDER BY employee_id;

SELECT employee_id, first_name, job_id, department_id
  FROM hr.employees
  ORDER BY first_name;
  
SELECT employee_id, first_name, job_id, department_id
  FROM hr.employees
  ORDER BY department_id ASC;

SELECT employee_id, first_name, job_id, salary
  FROM hr.employees
  ORDER BY salary DESC;

SELECT employee_id, first_name, job_id, department_id, salary
  FROM hr.employees
  ORDER BY department_id ASC, salary DESC;


--문제016) hr 계정(소유자)의 employees 테이블의 정보에서 
--부서번호(department_id)가 30인 직원들을 
--입사일(hire_date) 순으로 정렬해서 출력하는 쿼리 작성.

SELECT employee_id, first_name, job_id, department_id, hire_date
    FROM hr.employees
    WHERE department_id = 30
    ORDER BY hire_date;






--------------------------------------
/*
FUNCTION  : Functions are similar to operators in that they manipulate data items and return a result.
1. function(argument, argument, ...) 
2. 내장 함수(SQL, 오라클 제공 함수), 사용자 정의 함수(PL/SQL)
3. 단일 행 함수(Single-Row Functions), 복수 행 함수(Aggregate Functions)
4. 숫자 자료형 함수, 문자 자료형 함수, 날짜 자료형 함수, 형 변환 함수
*/




--------------------------------
--Single-Row Functions : Single-row functions return a single result row for every row of a queried table or view.



---------------------------------
--Numeric Functions

--ROUND : ROUND returns n rounded to integer places to the right of the decimal point.

SELECT ROUND(15.193) "Round" FROM DUAL;
--15

SELECT ROUND(15.193,1) "Round" FROM DUAL;
--15.2

SELECT ROUND(15.193,-1) "Round" FROM DUAL;
--20

SELECT employee_id, first_name
    , salary * .00005
    , ROUND(salary * .00005, 1) "Round" 
    FROM hr.employees;



SELECT employee_id, first_name
    , salary
    , ROUND(salary, -3) "Round" 
    FROM hr.employees;




--TRUNC : The TRUNC (number) function returns n1 truncated to n2 decimal places.

SELECT TRUNC(15.193) "Trunc" FROM DUAL;
--15

SELECT TRUNC(15.193,1) "Trunc" FROM DUAL;
--15.1

SELECT TRUNC(15.193,-1) "Trunc" FROM DUAL;
-10

SELECT employee_id, first_name
    , salary * .00005
    , TRUNC(salary * .00005, 1) "Trunc" 
    FROM hr.employees;

SELECT employee_id, first_name
    , salary
    , TRUNC(salary, -3) "Trunc" 
    FROM hr.employees;
    
    
    
    
    
----------------------------------------
--Character Functions

--LOWER : LOWER returns char, with all letters lowercase.

SELECT LOWER('MR. SCOTT MCMILLAN') "Lowercase"
  FROM DUAL;
--mr. scott mcmillan

SELECT employee_id, first_name, LOWER(first_name) "FirstName"
    FROM hr.employees;  
  
--UPPER : UPPER returns char, with all letters uppercase.

SELECT UPPER('mr. scott mcmillan') "Uppercase"
  FROM DUAL;
--MR. SCOTT MCMILLAN

SELECT employee_id, first_name
    , UPPER(first_name) "FirstName"
    FROM hr.employees;  

SELECT employee_id, first_name
    , email
    FROM hr.employees;  
    
    

--SUBSTR : The SUBSTR functions return a portion of char, beginning at character position, substring_length characters long.
--주의) 문자열 인덱스는 1부터 출발

SELECT SUBSTR('ABCDEFG',3) "Substring"
     FROM DUAL;
--CDEFG

SELECT SUBSTR('ABCDEFG',3,4) "Substring"
     FROM DUAL;
--CDEF

SELECT SUBSTR('ABCDEFG',-5,4) "Substring"
     FROM DUAL;
--CDEF

     
--문제017) hr 계정(소유자)의 employees 테이블의 정보에서 
--전화번호(phone_number)에서 끝 4자리만 추출해서 출력하는 쿼리 작성. SUBSTR() 함수 사용.
--650.121.XXXX
--011.44.1344.XXXXXX 형식은 제외.

SELECT employee_id, first_name
    , phone_number
    , SUBSTR(phone_number, -4, 4) "SUBSTR(phone_number)"
    FROM hr.employees
    WHERE SUBSTR(phone_number, 1, 3) NOT IN '011';
     
     
     
     
     

--CONCAT : CONCAT returns char1 concatenated with char2. 

SELECT CONCAT('A', 'B') "concat"
    FROM DUAL;
--AB

SELECT CONCAT(CONCAT('A', 'B'), 'C') "concat"
    FROM DUAL;
--ABC

SELECT 'A'||'B'||'C' "concat"
    FROM DUAL;
--ABC

SELECT CONCAT(CONCAT(last_name, '''s job category is '), job_id) "Job" 
  FROM hr.employees; 
  
  
SELECT employee_id, first_name, email
    , CONCAT(email, '@HR.COM') "Email1"
    , LOWER(CONCAT(email, '@HR.COM')) "Email2"
    FROM hr.employees;





--LTRIM : LTRIM removes from the left end of char all of the characters contained in set. 
SELECT LTRIM('       BROWNING      ') "LTRIM Example"
  FROM DUAL;
--'BROWNING      '

SELECT LTRIM('<=====>BROWNING<=====>', '<>=') "LTRIM Example"
  FROM DUAL;
--'BROWNING<=====>'



--RTRIM : RTRIM removes from the right end of char all of the characters that appear in set.
SELECT RTRIM('       BROWNING      ') "RTRIM Example"
  FROM DUAL;
--'       BROWNING'

SELECT RTRIM('<=====>BROWNING<=====>', '<>=') "RTRIM Example"
  FROM DUAL;
--'<=====>BROWNING'


  
--TRIM : TRIM enables you to trim leading or trailing characters (or both) from a character string.
SELECT TRIM('       BROWNING      ') "TRIM Example"
  FROM DUAL;
--'BROWNING'  

SELECT TRIM('--------BROWNING---------') "TRIM Example"
  FROM DUAL;
--'--------BROWNING---------'

SELECT TRIM(BOTH '-' FROM '--------BROWNING---------') "TRIM Example"
  FROM DUAL;
--'BROWNING'

SELECT TRIM(LEADING '-' FROM '--------BROWNING---------') "TRIM Example"
  FROM DUAL;
--'BROWNING---------'

SELECT TRIM(TRAILING '-' FROM '--------BROWNING---------') "TRIM Example"
  FROM DUAL;
--'--------BROWNING'




--LPAD : LPAD returns expr1, left-padded to length n characters with the sequence of characters in expr2. 
SELECT LPAD('Page 1',15,'*') "LPAD example"
  FROM DUAL;
--'*********Page 1'

--RPAD : RPAD returns expr1, right-padded to length n characters with expr2, replicated as many times as necessary.
SELECT RPAD('Page 1',15,'*') "RPAD example"
  FROM DUAL;
--'Page 1*********'

SELECT RPAD(SUBSTR(first_name, 1, 2),10,'*') "RPAD example"
  FROM hr.employees;




--문제018) hr 계정(소유자)의 employees 테이블의 정보에서 
--전화번호(phone_number)에서 끝 4자리를 '*'로 출력하는 쿼리 작성. RPAD() 함수 사용.
--650.121.****
--011.44.1344.XXXXXX 형식은 제외.

SELECT employee_id
    , phone_number
    , RPAD(SUBSTR(phone_number,1,8), 12, '*') AS "Phone_Number"
    FROM HR.employees
    WHERE SUBSTR(phone_number,1,3) NOT IN '011';





--REPLACE : REPLACE returns char with every occurrence of search_string replaced with replacement_string.

SELECT REPLACE('JACK and JUE','J') "Changes"
     FROM DUAL;
--'ACK and UE'

SELECT REPLACE('JACK and JUE','J','BL') "Changes"
     FROM DUAL;
--'BLACK and BLUE'     

SELECT employee_id, first_name, phone_number
    , REPLACE(phone_number, '.') "newPhoneNumber"
    FROM hr.employees;

SELECT employee_id, first_name, phone_number
    , REPLACE(phone_number, '.', '-') "newPhoneNumber"
    FROM hr.employees;
    
SELECT employee_id, first_name, phone_number
    , REPLACE(phone_number, '011.44.', '010.') "newPhoneNumber"
    FROM hr.employees;
     
     
     

--문제019) hr 계정(소유자)의 employees 테이블의 정보에서 
--전화번호(phone_number)에서 650.121.XXXX 가 650.1212.XXXX로 변경하는 쿼리 작성. REPLACE() 함수 사용.
--650.121.4567 => 650.1212.4567

SELECT employee_id, first_name, phone_number,department_id
    , REPLACE(phone_number, '650.121.', '650.1212.') "newPhoneNumber"
    FROM hr.employees;
    

     

--문제020) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정 부서(department_id가 50인 경우)의 전화번호(650.501.XXXX)를 
--650.5012.XXXX로 변경하는 쿼리 작성. REPLACE() 함수 사용.
SELECT employee_id, department_id, first_name,department_id, phone_number
    , REPLACE(phone_number, '650.501.', '650.5012.') "newPhoneNumber"
    FROM hr.employees
    WHERE SUBSTR(department_id, 1,2) IN 50;


--추가문제) hr 계정(소유자)의 employees 테이블의 정보에서 
--특정 부서(department_id가 50인 경우)의 이름(firstname) 출력시
--3,4번째 문자만 '-'으로 대체해서 출력.  REPLACE() 함수 사용.
SELECT employee_id, first_name
    , REPLACE(first_name, SUBSTR(first_name, 2,3), '--') "newfirst_name"
    , phone_number, department_id
    FROM hr.employees
    WHERE SUBSTR(department_id, 1,2) IN 50;


     

--INSTR : The INSTR functions search string for substring.
SELECT INSTR('CORPORATE FLOOR','OR') "Instring"
  FROM DUAL;
--2  

SELECT INSTR('CORPORATE FLOOR','OR', 3) "Instring"
  FROM DUAL;
--5

SELECT INSTR('CORPORATE FLOOR','OR', 3, 2) "Instring"
  FROM DUAL;
--14

SELECT INSTR('CORPORATE FLOOR','OR', -3) "Reversed Instring"
  FROM DUAL;
--5

SELECT INSTR('CORPORATE FLOOR','OR', -3, 2) "Reversed Instring"
  FROM DUAL;
--2


SELECT INSTR('CORPORATE FLOOR','AB') "Instring"
  FROM DUAL;
--0 


SELECT INSTR('CORPORATE FLOOR','or') "Instring"
  FROM DUAL;
--0


SELECT INSTR(LOWER('CORPORATE FLOOR'),LOWER('or')) "Instring"
  FROM DUAL;
--2


SELECT employee_id, first_name, department_id, job_id
    FROM hr.employees
    WHERE INSTR(job_id, 'MGR') > 0;



--LENGTH : The LENGTH functions return the length of char.

SELECT LENGTH('CANDIDE') "Length in characters"
  FROM DUAL;
--7

SELECT employee_id, first_name, LENGTH(first_name) "Length in characters"
    FROM hr.employees;



 
--문제021) hr 계정(소유자)의 employees 테이블의 정보에서 
--first_name이 세 글자로 구성된 경우만 출력하는 쿼리 작성. LENGTH() 함수 사용.
--Guy, Den, Pat, Lex
SELECT employee_id, first_name, last_name, phone_number
    FROM hr.employees
    WHERE LENGTH(first_name) = 3;




--문제022) hr 계정(소유자)의 employees 테이블의 정보에서 
--전화번호(phone_number)에서 끝 4자리 또는 6자리를 '*'로 출력하는 쿼리 작성. RPAD(), INSTR(), LENGTH() 함수 사용.
--650.121.****
--011.44.1344.******
SELECT employee_id, first_name, last_name, department_id phone_number
   , RPAD(SUBSTR(phone_number, 1, INSTR(phone_number, '.', -1)), LENGTH(phone_number), '*') phone_number_
   FROM hr.employees;