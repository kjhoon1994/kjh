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



/*
FUNCTION  : Functions are similar to operators in that they manipulate data items and return a result.
1. function(argument, argument, ...) 
2. ���� �Լ�(SQL, ����Ŭ ���� �Լ�), ����� ���� �Լ�(PL/SQL)
3. ���� �� �Լ�(Single-Row Functions), ���� �� �Լ�(Aggregate Functions)
4. ���� �ڷ��� �Լ�, ���� �ڷ��� �Լ�, ��¥ �ڷ��� �Լ�, �� ��ȯ �Լ�
*/



---------------------------------------------------------------------
--Aggregate function
--Aggregate functions return a single result row based on groups of rows, rather than on single rows

--����) Aggregate function�� �ܵ� �����ؾ� �Ѵ�. �ٸ� �Լ�(Single-Row Functions)�� ���� ����� �� ����.

--COUNT : COUNT returns the number of rows returned by the query.
--SUM
--AVG
--MAX, MIN
--RANK
--DENSE_RANK
--����) null ���� ���� �Լ� ���꿡 �������� �ʴ´�.



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
--NULL ���� �ִ� ���� ����


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
--PK ������ �ִ� �÷��� ������� COUNT() �Լ� ���� ��ü ī����
--107

SELECT COUNT(commission_pct) "count"
    FROM hr.employees;
--null�� �ִ� �÷��� ������� COUNT() �Լ� ���� �Ϻ� ī����. null ���� ī���� ����.
--35

SELECT COUNT(department_id) "count"
    FROM hr.employees;
--106


--DISTINCT Ű����� �ߺ� ���� ����
SELECT DISTINCT department_id 
    FROM hr.employees;
--12
--NULL ����

SELECT COUNT(DISTINCT department_id) "count"
    FROM hr.employees;
--11
--NULL����

SELECT DISTINCT job_id
    FROM hr.employees;
--19    
    


--����26)  hr ����(������)�� employees ���̺��� �������� 
--commission_pct�� ����(���� null��) ������ ���� ����ϴ� ���� �ۼ�. COUNT() �Լ� ���.
SELECT COUNT(*) "count"
    FROM hr.employees
    WHERE commission_pct IS NULL;
--72


--�߰�����) hr ����(������)�� employees ���̺��� �������� 
--�Ի�⵵�� 2002���� ������ ���� ����ϴ� ���� �ۼ�.
--COUNT() �Լ� ���
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
     
     
--����027) hr ����(������)�� employees ���̺��� �������� 
--Ư�� ����(job_id)�� ���� ������ �޿�(salary) �� �� ��� ����ϴ� ���� �ۼ�.
--��� ��½� �Ҽ����� ���ڸ��� ���.
--'CLERK'���� ������ ������ ���� ���� ���. 
--REGEXP_LIKE() �Լ� ���.
-->SH_CLERK, ST_CLERK, PU_CLERK
SELECT employee_id, first_name, job_id 
     FROM hr.employees
     WHERE REGEXP_LIKE(job_id, '_CLERK$');

SELECT ROUND(AVG(salary), 1) "AVG", SUM(salary) "SUM" 
     FROM hr.employees
     WHERE REGEXP_LIKE(job_id, '_CLERK$');


--�߰�����) hr ����(������)�� employees ���̺��� �������� 
--Ư�� ����(job_id)�� ���� ������ �޿�(salary) �� �� ��� ����ϴ� ���� �ۼ�.
--��� ��½� �Ҽ����� ���ڸ��� ���.
--'MAN' �Ǵ� 'MGR'�� ������ ������ ���� ���� ���. 
--REGEXP_LIKE() �Լ� ���.
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
--�м��Լ�
--RANK() OVER() : 1, 2, 2, 4, ...
--DENSE_RANK() OVER() : 1, 2, 2, 3, ...
--ROW_NUMBER() OVER() : 1, 2, 3, 4, ...
--SUM() OVER() : ���� ��� ��ȯ

SELECT department_id, last_name, salary
       ,RANK() OVER (ORDER BY salary DESC) "RANK"
       ,DENSE_RANK() OVER (ORDER BY salary DESC) "DENSE_RANK"
       ,ROW_NUMBER() OVER (ORDER BY salary DESC) "ROW_NUMBER"
  FROM hr.employees;



--����028) hr ����(������)�� employees ���̺��� �������� 
--�Ի�����(hire_date)�� ���� ������ ��� �ο� ����ϴ� ���� �ۼ�.
--���� ��¥�� ��� ���� ��� ���.
--DENSE_RANK() OVER() �Լ� ���
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
--����) GROUP BY Ű���忡 ����ϴ� �÷��� �ߺ��� �ڷᰡ �ִ� �÷�(FK ������ �ִ� �÷�) ����. PK, UK ������ �ִ� �÷��� ������ ����� �ƴϴ�.

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

     
--����029) hr ����(������)�� employees ���̺��� �������� 
--Ư�� ����(job_id)�� ������ �޿� �� �� ��� ����ϴ� ���� �ۼ�.
--'CLERK'���� ������ ������ ���� ���� ���. 
--REGEXP_LIKE() �Լ� ���.
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
--HAVING Ű����� GROUP BY Ű���尡 ���� ����Ѵ�. �ܵ� ���� ����.
--HAVING Ű���忡�� ���ǽ� �ۼ��� �����Լ��� ����Ѵ�.

SELECT department_id, COUNT(*) "COUNT", SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    ORDER BY "COUNT";

SELECT department_id, COUNT(*) "COUNT", SUM(salary)
    FROM  hr.employees
    GROUP BY department_id
    HAVING COUNT(*) >= 10
    ORDER BY "COUNT";

--����030) hr ����(������)�� employees ���̺��� �������� 
--'CLERK'���� ������ ������ ���� ���� ���. REGEXP_LIKE() �Լ� ���. WHERE ����
--Ư�� ����(job_id)�� ������ �޿� �� �� ��� ����ϴ� ���� �ۼ�. GROUP BY ����.
--�޿� ����� ���� ����(3000) �̻��� ��츸 ���. HAVING ����.

SELECT job_id , SUM(salary) "SUM", AVG(salary) "AVG" 
    FROM  hr.employees 
    WHERE  REGEXP_LIKE(job_id,'CLERK$') 
    GROUP BY job_id
    HAVING AVG(salary) >= 3000;



---------------------------------------------------------
--�м� �Լ� ���� Ư�� �׷��� ���� �Ŀ� �Լ� ����
--PARTITION BY Ű���� ���

SELECT department_id, last_name, salary,
       RANK() OVER (PARTITION BY department_id  ORDER BY salary DESC) "RANK"
  FROM hr.employees;

SELECT department_id, last_name, salary,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) "DENSE_RANK"
  FROM hr.employees;
  
  
--�߰�����) hr ����(������)�� employees ���̺��� �������� 
--'CLERK'���� ������ ������ ���� ���� ���. REGEXP_LIKE() �Լ� ���. WHERE ����
--Ư�� ����(job_id)�� �޿� ���� �޴� ������ ���� �ο� ���.
--DENSE_RANK() OVER() �Լ�
SELECT employee_id, department_id, last_name, salary, job_id,
     DENSE_RANK() OVER (PARTITION BY job_id  ORDER BY salary DESC) "DENSE_RANK"
     FROM hr.employees
     WHERE REGEXP_LIKE (job_id, '_CLERK$');



-----------------------------------
--SUM()��  SUM() OVER()�� ����
SELECT employee_id, first_name
    , salary, SUM(salary) "TOTAL_SAL"
    FROM hr.employees;

SELECT employee_id, first_name
    , salary, SUM(salary) OVER() "TOTAL_SAL"
    FROM hr.employees;
  
  
------------------------------
--ROWID, ROWNUM
--���� ����� ����� ���������� �ο��Ǵ� ������ȣ
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