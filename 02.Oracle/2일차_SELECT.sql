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
    
    
--����001) hr ����(������)�� jobs ���̺��� ������ ��ü ����ϴ� ���� �ۼ�.
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
    
--����002) hr ����(������)�� jobs ���̺��� �������� 
-- job_id, job_title �÷� ������ ����ϴ� ���� �ۼ�.
SELECT job_id, job_title
    FROM hr.jobs;
    

------------------------------------------
--Displaying Selected Columns Under New Headings
/*
����1)
SELECT column1 alias1, column2 alias2, ....columnN  aliasN
FROM   table_name;
����2)
SELECT column1 AS alias1, column2 AS alias2, ....columnN AS aliasN
FROM   table_name;
����3)
SELECT column1 "alias1", column2 "alias2", ....columnN  "aliasN"
FROM   table_name;
*/

SELECT employee_id eid, first_name fname, phone_number phone
    FROM hr.employees;
SELECT employee_id AS eid, first_name AS fname, phone_number AS phone
    FROM hr.employees;    
SELECT employee_id "Employee Id", first_name "First Name", phone_number "Phone Number"
    FROM hr.employees;
    
    
    

--����003) hr ����(������)�� jobs ���̺��� �������� 
-- job_id �÷��� "Job Id", job_title �÷��� "Job Title"�� Ÿ��Ʋ �����ؼ� ����ϴ� ���� �ۼ�.
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

����) �����ڸ� �̿��ؼ� ���ǽ� �ۼ��� �ڷ���(data type) Ȯ�� �ʿ�. NUMBER(����), VARCHAR2(���ڿ�), DATE(��¥), ...
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


--����004) hr ����(������)�� employees ���̺��� �������� 
-- job_id�� 'ST_CLERK'�� ��츸 ����ϴ� ���� �ۼ�.
SELECT *
    FROM hr.employees
    WHERE job_id = 'ST_CLERK';


/*
�� ��� =
�̻��� ��� <=
������ ��� >=
�ʰ��� ��� <
�̸��� ��� >
*/


--����005) hr ����(������)�� employees ���̺��� �������� 
-- salary�� 10000 �̻��� ��츸 ����ϴ� ���� �ۼ�.
SELECT *
    FROM hr.employees
    WHERE salary >= 10000;


--����006) hr ����(������)�� employees ���̺��� �������� 
-- salary�� 5000 ������ ��츸 ����ϴ� ���� �ۼ�.
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
--��¥���� ������ yyyy-mm-dd�� ��ȯ ����. TO_CHAR() function
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
    
    
--����007) hr ����(������)�� employees ���̺��� �������� 
--�̴�(3����)�� �Ի��ڸ� ����ϴ� ���� �ۼ�. TO_CHAR() �Լ� ���.

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
    
    
--����008) hr ����(������)�� employees ���̺��� �������� 
--Ư����(8����, 9����) �Ի��ڸ� ����ϴ� ���� �ۼ�. IN ������ ���.
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
 
 
--����010) hr ����(������)�� employees ���̺��� �������� 
--��ȭ��ȣ(phone_number)�� ���ڸ��� 500������ ��츸 ����ϴ� ���� �ۼ�
--���ڿ��� �Ϻθ� �����ϴ� �Լ� �ʿ�
--515.XXX.XXXX, 590.XXX.XXXX
--BETWEEN ~ AND ������ ���
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



--����011) hr ����(������)�� employees ���̺��� �������� 
--commission_pct�� NULL�� ��츸 ����ϴ� ���� �ۼ�.
SELECT employee_id, first_name, manager_id, department_id, commission_pct
    FROM hr.employees    
    WHERE commission_pct IS NULL;


--����012) hr ����(������)�� employees ���̺��� �������� 
--commission_pct�� ��ȿ�� ��(NULL�� �ƴ� ��)�� ���� ��츸 ����ϴ� ���� �ۼ�.
SELECT employee_id, first_name, manager_id, department_id, commission_pct
    FROM hr.employees    
    WHERE commission_pct IS NOT NULL;


--����013) hr ����(������)�� employees ���̺��� �������� 
--manager_id�� NULL�� ��츸 ����ϴ� ���� �ۼ�.
--manager_id �÷��� ���� ������ ��翡 ���� ������ ������ �÷�
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


--����014) hr ����(������)�� employees ���̺��� �������� 
--��ȭ��ȣ(phone_number)�� ���ڸ��� '515'�� �����ϴ� ��츸 ����ϴ� ���� �ۼ�. LIKE ������ ���.
--515.XXX.XXXX
SELECT employee_id, first_name, last_name, phone_number
    FROM hr.employees 
     WHERE phone_number LIKE '515%';