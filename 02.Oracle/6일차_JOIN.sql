/*
JOIN : �� �� �̻��� ���̺��� �����ؼ� ��ȸ�ϴ� ���
1. INNER JOIN : returns rows when there is a match in both tables.
2. LEFT JOIN : returns all rows from the left table, even if there are no matches in the right table.
3. RIGHT JOIN : returns all rows from the right table, even if there are no matches in the left table.
4. FULL JOIN : returns rows when there is a match in one of the tables.
5. SELF JOIN : is used to join a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.
6. CARTESIAN JOIN : returns the Cartesian product of the sets of records from the two or more joined tables.
*/



/*
INNER JOIN : = (������ ���ϴ� ������)�� �̿��� ���� ���� ����
����) PK, FK ������ ������ �÷��� ������� ���� ���� ����
ANSI [American National Standards Institute] ǥ���
    SELECT table1.column1, table2.column2...
    FROM table1
    INNER JOIN table2
    ON table1.common_field = table2.common_field;
    --WHERE ���ǽ�
Oracle ǥ���
    SELECT table1.column1, table2.column2...
    FROM table1, table2
    WHERE table1.common_field = table2.common_field;
    --AND ���ǽ�
*/

--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments INNER JOIN hr.employees
    ON hr.departments.department_id = hr.employees.department_id;

--hr.departments, hr.employees 
SELECT hr.departments.department_id, department_name, employee_id, first_name
    FROM hr.departments, hr.employees
    WHERE hr.departments.department_id = hr.employees.department_id;
   
    
--Alias ����
SELECT d.department_id, department_name, employee_id, first_name
    FROM hr.departments d, hr.employees e
    WHERE d.department_id = e.department_id;
 
    
    
--Alias ����
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
    --WHERE �Ϲ����ǽ�
    ORDER BY employee_id;
    
    
--hr.jobs, hr.employees, hr.departments
SELECT employee_id, first_name, last_name, job_title, department_name
    FROM hr.jobs j, hr.employees e, hr.departments d
    WHERE j.job_id = e.job_id
    AND e.department_id = d.department_id
    --AND �Ϲ����ǽ�
    ORDER BY employee_id;
    
--hr.jobs, hr.employees, hr.departments
SELECT employee_id, first_name, last_name, job_title, department_name
    FROM hr.jobs j, hr.employees e, hr.departments d
    WHERE j.job_id = e.job_id
    AND e.department_id = d.department_id
    AND department_name = 'IT' 
    ORDER BY employee_id;    


--����031) hr ����(������)�� employees, departments ���̺��� �������� 
--�μ����̵�, �μ��� �� �μ����� ��������(�������̵�, �̸�, ��ȭ��ȣ)�� ���� ����ϴ� ���� �ۼ�. 
--INNER JOIN ���.

--ANSI ǥ���
SELECT d.department_id, department_name, d.manager_id, first_name, phone_number
    FROM hr.departments d INNER JOIN hr.employees e 
    ON d.manager_id = e.employee_id;
    
--Oracle ǥ���
SELECT d.department_id, department_name, d.manager_id, first_name, phone_number 
    FROM hr.departments d, hr.employees e 
    WHERE d.manager_id = e.employee_id; 



--����032) hr ����(������)�� employees, departments, locations, countries, regions ���̺��� �������� 
--���� ����(�������̵�, �̸�, �μ���, �μ���ġ)�� ����ϴ� ���� �ۼ�. 
--INNER JOIN ���.

--ANSI ǥ���
SELECT employee_id, first_name, last_name, d.department_name, l.city, c.country_name, r.region_name
    FROM hr.employees e
    INNER JOIN hr.departments d ON e.department_id = d.department_id
    INNER JOIN hr.locations l ON d.location_id = l.location_id
    INNER JOIN hr.countries c ON l.country_id = c.country_id
    INNER JOIN hr.regions r ON c.region_id = r.region_id;
    
--Oracle ǥ���
SELECT employee_id, first_name, last_name, d.department_name, l.city, c.country_name, r.region_name
    FROM hr.employees e ,hr.departments d, hr.locations l, hr.countries c ,hr.regions r
    WhERE e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND l.country_id = c.country_id
    AND c.region_id = r.region_id;




----------------------------
-- Non-Equi Join
-- =(equal)�� �ƴ� ������(>, <, >=, <=)�� ����ϴ� ���� ���
SELECT employee_id, first_name, phone_number, job_title
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id 
    AND j.job_title IN ('Stock Manager', 'Stock Clerk', 'Shipping Clerk');




------------------------
/*
LEFT JOIN (OUTER JOIN)
ANSI ǥ���
    SELECT table1.column1, table2.column2...
    FROM table1  LEFT OUTER JOIN table2
    ON table1.common_field = table2.common_field;
    
Oracle ǥ���
    SELECT table1.column1, table2.column2...
    FROM table1, table2
    WHERE table1.common_field = table2.common_field(+);
*/

--ANSI ǥ���
SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d LEFT OUTER JOIN hr.employees e
    ON d.department_id = e.department_id;
    
--ANSI ǥ���
SELECT d.department_id, department_name, d.manager_id, employee_id, first_name, last_name
    FROM hr.departments d LEFT JOIN hr.employees e
    ON d.department_id = e.department_id;

--Oracle ǥ���
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



--����033) hr ����(������)�� jobs, employees ���̺��� �������� 
--���� ������ �������� ���� ������ ���� ����ϴ� ���� �ۼ�. 
--LEFT JOIN ���.

--ANSI ǥ���
SELECT j.job_id, job_title, min_salary, max_salary, e.employee_id, first_name, last_name
    FROM hr.jobs j LEFT JOIN hr.employees e
    ON j.job_id = e.job_id;

--Oracle ǥ���
SELECT j.job_id, job_title, min_salary, max_salary, e.employee_id, first_name, last_name
    FROM hr.jobs j, hr.employees e
    WHERE j.job_id = e.job_id(+);




--����034) hr ����(������)�� employees, job_history ���̺��� �������� 
--���� ������ �������� �μ�, ���� ���� ������ ���� ����ϴ� ���� �ۼ�. LEFT JOIN ���.

--ANSI ǥ���
SELECT e.employee_id, first_name, last_name, e.job_id, jh.job_id, jh.start_date, jh.end_date
    FROM hr.employees e LEFT JOIN hr.job_history jh
    ON e.employee_id = jh.employee_id
    ORDER BY e.employee_id;
    
    
--Oracle ǥ���
SELECT e.employee_id, first_name, last_name, e.job_id, jh.job_id, jh.start_date, jh.end_date
    FROM hr.employees e, hr.job_history jh
    WHERE e.employee_id = jh.employee_id(+)
    ORDER BY e.employee_id;


----------------------------------
--����035) hr ����(������)�� employees, jobs ���̺��� ��������  
--first_name 'Neena', last_name 'Kochhar' ������ ������(job_title)���� ���. INNER JOIN ���.

--ANSI ǥ���
SELECT e.employee_id, first_name, last_name, job_title
    FROM hr.employees e
        INNER JOIN hr.jobs j ON e.job_id = j.job_id
    WHERE first_name = 'Neena' AND last_name = 'Kochhar';
    
--Oracle ǥ���
SELECT e.employee_id, first_name, last_name, job_title
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id
        AND first_name = 'Neena' AND last_name = 'Kochhar';




--����036)  hr ����(������)�� employees, jobs ���̺��� �������� 
--������(job_title)�� �ּұ޿�(min_salary)�� �޴� ���� ���. INNER JOIN ���.
--3��

--ANSI ǥ���
SELECT e.employee_id, first_name, last_name, job_title, min_salary, salary
    FROM hr.employees e
        INNER JOIN hr.jobs j ON e.job_id = j.job_id
    WHERE j.min_salary = e.salary;
    
--Oracle ǥ���
SELECT e.employee_id, first_name, last_name, job_title, min_salary, salary
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id 
    AND j.min_salary = e.salary;


--����037) hr ����(������)�� employees, jobs ���̺��� ��������
--������(job_title)�� ������ �� ���.  INNER JOIN ���.

--ANSI ǥ���
SELECT job_title, COUNT(job_title) "COUNT"
    FROM hr.employees e
        INNER JOIN hr.jobs j ON e.job_id = j.job_id
    GROUP BY job_title
    ORDER BY job_title;
    
--Oracle ǥ���
SELECT job_title, COUNT(job_title) "COUNT"
    FROM hr.employees e, hr.jobs j
    WHERE e.job_id = j.job_id
    GROUP BY job_title
    ORDER BY job_title;


--����038)  hr ����(������)�� employees, departments ���̺��� �������� 
--first_name 'David', last_name 'Austin' ������ ���� 
--�μ���(department_name), �μ���(manager)�̸�(first_name, last_name) ���.  INNER JOIN ���.

--ANSI ǥ���
SELECT e1.employee_id, e1.first_name, e1.last_name, department_name
    , e2.employee_id, e2.first_name, e2.last_name
    FROM hr.employees e1
        INNER JOIN hr.departments d ON e1.department_id = d.department_id
        INNER JOIN hr.employees e2 ON d.manager_id = e2.employee_id
    WHERE e1.first_name='David' AND e1.last_name='Austin';

--Oracle ǥ���
SELECT e1.employee_id, e1.first_name, e1.last_name, department_name
    , e2.employee_id, e2.first_name, e2.last_name
    FROM hr.employees e1, hr.departments d, hr.employees e2
    WHERE e1.department_id = d.department_id
        AND d.manager_id = e2.employee_id
        AND e1.first_name='David' AND e1.last_name='Austin';
        