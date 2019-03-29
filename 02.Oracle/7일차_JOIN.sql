/*
JOIN : �� �� �̻��� ���̺��� �����ؼ� ��ȸ�ϴ� ���
1. INNER JOIN : returns rows when there is a match in both tables.
2. LEFT JOIN : returns all rows from the left table, even if there are no matches in the right table.
3. RIGHT JOIN : returns all rows from the right table, even if there are no matches in the left table.
4. FULL JOIN : returns rows when there is a match in one of the tables.
5. SELF JOIN : is used to join a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.
6. CARTESIAN JOIN : returns the Cartesian product of the sets of records from the two or more joined tables.
*/



------------------------
/*
SELF JOIN : Alias ���� �ʼ�
ANSI ǥ���
    SELECT a.column_name, b.column_name...
    FROM table1 a INNER JOIN table1 b
    ON a.common_field = b.common_field;
Oracle ǥ���
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


--����039)  hr ����(������)�� employees ���̺��� �������� 
--first_name 'Donald', last_name 'OConnell'�� �������̵�(job_id)�� ���� ���� ���� ����ϴ� ���� �ۼ�. SELF JOIN ���.

--ANSI ǥ���
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.job_id 
    FROM hr.employees e1 INNER JOIN hr.employees e2 ON e1.job_id = e2.job_id 
    WHERE e1.first_name = 'Donald' AND e1.last_name = 'OConnell';

--Oracle ǥ���
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.job_id 
    FROM hr.employees e1, hr.employees e2
    WHERE e1.job_id = e2.job_id AND e1.first_name = 'Donald' AND e1.last_name = 'OConnell';
    

--����040)  hr ����(������)�� employees, jobs ���̺��� �������� 
--first_name 'Donald', last_name 'OConnell'�� ������(job_title)�� ���� ���� ���� ����ϴ� ���� �ۼ�. SELF JOIN ���.

--ANSI ǥ���
SELECT e2.employee_id, e2.first_name, e2.last_name, j.job_title
    FROM hr.employees e1
        INNER JOIN hr.jobs j ON e1.job_id = j.job_id
        INNER JOIN hr.employees e2 ON e1.job_id = e2.job_id
    WHERE e1.first_name = 'Donald' AND e1.last_name = 'OConnell';


--Oracle ǥ���
SELECT e2.employee_id, e2.first_name, e2.last_name, j.job_title
    FROM hr.employees e1, hr.employees e2, hr.jobs j 
    WHERE e1.job_id = j.job_id 
        AND e1.job_id = e2.job_id 
        AND e1.first_name = 'Donald' AND e1.last_name = 'OConnell';



----------------------
/*
CARTESIAN JOIN(or CROSS JOIN)
ANSI ǥ���
    SELECT table1.column1, table2.column2...
    FROM  table1 CROSS JOIN table2;
Oracle ǥ���
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
ANSI ǥ���
    SELECT table1.column1, table2.column2...
    FROM table1 FULL JOIN table2
    ON table1.common_field = table2.common_field;
����) Oracle ǥ��������� FULL JOIN ���� ����
*/

--ANSI ǥ���
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d FULL JOIN hr.employees e
    ON d.department_id = e.department_id;
    
--ORA-01468: a predicate may reference only one outer-joined table 
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id(+) = e.department_id(+);



--------------------------
--����041) hr ����(������)�� employees ���̺��� ��������  
--first_name 'Steven', last_name 'King' ������ ���� ���� ���. 

SELECT e2.employee_id, e2.first_name, e2.last_name, e2.department_id, e2.job_id, e2.manager_id
    FROM hr.employees e1 
    INNER JOIN hr.employees e2 ON e1.employee_id = e2.manager_id
    WHERE e1.first_name = 'Steven' AND e1.last_name = 'King';
    
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.department_id, e2.job_id, e2.manager_id
    FROM hr.employees e1, hr.employees e2 
    WHERE e1.employee_id = e2.manager_id
    AND e1.first_name = 'Steven' AND e1.last_name = 'King';
    

--����042) hr ����(������)�� employees, jobs, job_history ���̺��� ��������  
--employee_id�� 101�� ������ �������丮(first_name, last_name, start_date, end_date, job_title) ���.

SELECT e.employee_id, first_name, last_name, start_date, end_date, job_title
    FROM hr.employees e, hr.job_history jh, hr.jobs jo
    WHERE e.employee_id = jh.employee_id
    AND jh.job_id = jo.job_id
    AND e.employee_id = 101;
    

--����043) hr ����(������)�� employees ���̺��� �������� 
--���� ������ ���� ���� ���.
    
SELECT e1.employee_id, e1.first_name, e1.last_name, e1.job_id, e2.employee_id
    FROM hr.employees e1, hr.employees e2
    WHERE e1.employee_id = e2.manager_id(+)
    AND e2.employee_id IS NULL;

    

--����044) hr ����(������)�� employees ���̺��� �������� 
--first_name 'Gerald', last_name 'Cambrault'�� salary���� �޿��� �� ���� �޴� ���� ���� ���.

SELECT e2.first_name, e2.last_name, e2.salary, e2.department_id, e2.job_id
    FROM hr.employees e1, hr.employees e2
    WHERE e1.department_id = e2.department_id
    AND e1.salary <= e2.salary
    AND e1.first_name='Gerald' AND e1.last_name='Cambrault';

 



---------------------------------------
/*
Sub Query : A Subquery or Inner query or a Nested query is a query within another SQL query and embedded within the WHERE clause.
1. ���������� () �ȿ� ǥ���ؾ� �Ѵ�.
2. ���������� SELECT, INSERT, UPDATE, DELETE ���� ���� ��� ����������, 
���������� SELECT�� ��� ����.
3. ����
SELECT column_list, ... , (��������) alias
    FROM table_source;
    
SELECT column_list, ... 
    FROM (��������) alias;
SELECT column_list, ... 
    FROM table_source
    WHERE column operator (��������);
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
    
--������ �������� 
--Sub Query    
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT salary FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin');
    
    
   
--����) Sub Query ���� �����ڰ� = �� ���� Sub Query ����� ���� ������� �Ѵ�.
--> ������ IN ����ϸ� ����
SELECT salary FROM hr.employees
                        WHERE first_name='David';

SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT salary FROM hr.employees
                        WHERE first_name='David');
-->ORA-01427: single-row subquery returns more than one row


--������ ���� ����
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary IN (SELECT salary FROM hr.employees
                        WHERE first_name='David');
    
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE EXISTS (SELECT salary FROM hr.employees
                        WHERE first_name='David');    

--���������� ����� 5000, 6000�� ��� 5000 �����ؼ� < ����     
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary <ALL (SELECT salary FROM hr.employees
                        WHERE first_name='David'); 

--���������� ����� 5000, 6000�� ��� 6000 �����ؼ� < ����                  
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary <ANY (SELECT salary FROM hr.employees
                        WHERE first_name='David'); 
                  
                  
                        
--���� �÷� ���� ����
--�������� �÷�, ������� ���� �� ����    
SELECT salary, department_id FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin';    
SELECT  employee_id, first_name, last_name, salary, department_id
    FROM hr.employees
    WHERE (salary, department_id) IN (SELECT salary, department_id FROM hr.employees
                        WHERE first_name='David' AND last_name='Austin');


--���� �Լ��� ������� ������ ���ǽ� �ۼ�
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
                        
                        
                        
--����045) hr ����(������)�� employees ���̺��� �������� �޿�(salary)�� ���� ���� ���� ���. Sub Query ���.
SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT MIN(salary)
                        FROM hr.employees);
                        
                        
--����046) hr ����(������)�� employees ���̺��� �������� �޿�(salary)�� ���� ���� ���� ���. Sub Query ���.
SELECT employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT MAX(salary)
                        FROM hr.employees);
                        
                        
--����047) hr ����(������)�� employees ���̺��� ��������  
--first_name�� 'Donald', last_name�� 'OConnell'�� ������ �޿�(salary)�� ���� �޿� �޴� ���� ���� ���.  Sub Query ���.
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary = (SELECT salary FROM hr.employees
                        WHERE first_name='Donald' AND last_name='OConnell');
    
                        
--����048) hr ����(������)�� employees ���̺��� �������� 
--first_name 'Gerald', last_name 'Cambrault'�� salary���� �޿��� �� ���� �޴� ���� ���� ���. Sub Query ���.
SELECT  employee_id, first_name, last_name, salary
    FROM hr.employees
    WHERE salary > (SELECT salary FROM hr.employees
                        WHERE first_name='Gerald' AND last_name='Cambrault');
                        
                        
--����049) hr ����(������)�� employees ���̺��� ��������  
--first_name�� 'Donald', last_name�� 'OConnell'�� ������ �Ի���(hire_date)�� ���� �Ի����� ���� ���� ���.  Sub Query ���.
SELECT  employee_id, first_name, last_name, hire_date
    FROM hr.employees
    WHERE hire_date = (SELECT hire_date FROM hr.employees
                        WHERE first_name='Donald' AND last_name='OConnell');
                       
--����050) hr ����(������)�� employees ���̺��� ��������  
--first_name 'Steven', last_name 'King' ������ ���� ���� ���.  Sub Query ���.
SELECT  employee_id, first_name, last_name, hire_date
    FROM hr.employees
    WHERE manager_id = (SELECT employee_id FROM hr.employees
                        WHERE first_name='Steven' AND last_name='King');
                       
                  
--�߰�����) hr ����(������)�� employees ���̺��� ��������  
--first_name 'Steven', last_name 'King' ������ ���� �μ� ���� ���� ���.  Sub Query ���.
SELECT  employee_id, first_name, last_name, hire_date
    FROM hr.employees
    WHERE (department_id, manager_id) IN (SELECT department_id, employee_id FROM hr.employees
                        WHERE first_name='Steven' AND last_name='King');