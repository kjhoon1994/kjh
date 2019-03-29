/*
SELECT : Ư�� ���̺�(�ڷῡ ������ �����)�� ���� ��ȸ ���
����)������ ����(CONNECT, RESOURCE role + SELECT ANY TABLE)�� �ο��� ��츸 ��ȸ ����
����
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


--����015) hr ����(������)�� employees ���̺��� �������� 
--�μ���ȣ(department_id)�� 30�̸鼭, 
--�Ի�⵵(hire_date)�� 2005���� ��츸 ����ϴ� ���� �ۼ�.

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


--����016) hr ����(������)�� employees ���̺��� �������� 
--�μ���ȣ(department_id)�� 30�� �������� 
--�Ի���(hire_date) ������ �����ؼ� ����ϴ� ���� �ۼ�.

SELECT employee_id, first_name, job_id, department_id, hire_date
    FROM hr.employees
    WHERE department_id = 30
    ORDER BY hire_date;






--------------------------------------
/*
FUNCTION  : Functions are similar to operators in that they manipulate data items and return a result.
1. function(argument, argument, ...) 
2. ���� �Լ�(SQL, ����Ŭ ���� �Լ�), ����� ���� �Լ�(PL/SQL)
3. ���� �� �Լ�(Single-Row Functions), ���� �� �Լ�(Aggregate Functions)
4. ���� �ڷ��� �Լ�, ���� �ڷ��� �Լ�, ��¥ �ڷ��� �Լ�, �� ��ȯ �Լ�
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
--����) ���ڿ� �ε����� 1���� ���

SELECT SUBSTR('ABCDEFG',3) "Substring"
     FROM DUAL;
--CDEFG

SELECT SUBSTR('ABCDEFG',3,4) "Substring"
     FROM DUAL;
--CDEF

SELECT SUBSTR('ABCDEFG',-5,4) "Substring"
     FROM DUAL;
--CDEF

     
--����017) hr ����(������)�� employees ���̺��� �������� 
--��ȭ��ȣ(phone_number)���� �� 4�ڸ��� �����ؼ� ����ϴ� ���� �ۼ�. SUBSTR() �Լ� ���.
--650.121.XXXX
--011.44.1344.XXXXXX ������ ����.

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




--����018) hr ����(������)�� employees ���̺��� �������� 
--��ȭ��ȣ(phone_number)���� �� 4�ڸ��� '*'�� ����ϴ� ���� �ۼ�. RPAD() �Լ� ���.
--650.121.****
--011.44.1344.XXXXXX ������ ����.

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
     
     
     

--����019) hr ����(������)�� employees ���̺��� �������� 
--��ȭ��ȣ(phone_number)���� 650.121.XXXX �� 650.1212.XXXX�� �����ϴ� ���� �ۼ�. REPLACE() �Լ� ���.
--650.121.4567 => 650.1212.4567

SELECT employee_id, first_name, phone_number,department_id
    , REPLACE(phone_number, '650.121.', '650.1212.') "newPhoneNumber"
    FROM hr.employees;
    

     

--����020) hr ����(������)�� employees ���̺��� �������� 
--Ư�� �μ�(department_id�� 50�� ���)�� ��ȭ��ȣ(650.501.XXXX)�� 
--650.5012.XXXX�� �����ϴ� ���� �ۼ�. REPLACE() �Լ� ���.
SELECT employee_id, department_id, first_name,department_id, phone_number
    , REPLACE(phone_number, '650.501.', '650.5012.') "newPhoneNumber"
    FROM hr.employees
    WHERE SUBSTR(department_id, 1,2) IN 50;


--�߰�����) hr ����(������)�� employees ���̺��� �������� 
--Ư�� �μ�(department_id�� 50�� ���)�� �̸�(firstname) ��½�
--3,4��° ���ڸ� '-'���� ��ü�ؼ� ���.  REPLACE() �Լ� ���.
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



 
--����021) hr ����(������)�� employees ���̺��� �������� 
--first_name�� �� ���ڷ� ������ ��츸 ����ϴ� ���� �ۼ�. LENGTH() �Լ� ���.
--Guy, Den, Pat, Lex
SELECT employee_id, first_name, last_name, phone_number
    FROM hr.employees
    WHERE LENGTH(first_name) = 3;




--����022) hr ����(������)�� employees ���̺��� �������� 
--��ȭ��ȣ(phone_number)���� �� 4�ڸ� �Ǵ� 6�ڸ��� '*'�� ����ϴ� ���� �ۼ�. RPAD(), INSTR(), LENGTH() �Լ� ���.
--650.121.****
--011.44.1344.******
SELECT employee_id, first_name, last_name, department_id phone_number
   , RPAD(SUBSTR(phone_number, 1, INSTR(phone_number, '.', -1)), LENGTH(phone_number), '*') phone_number_
   FROM hr.employees;