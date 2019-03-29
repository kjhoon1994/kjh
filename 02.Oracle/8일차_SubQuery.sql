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



-----------------------------------
--������ �ִ� �������� : ���������� ���� ���������� �����ϰ�, ���������� ���� ���������� �����ϴ� ����
--����
/*
SELECT column_list, ... , (��������) alias
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




--�����Լ��� �Ϲ� �÷��� ���� ����ϴ� ���� ���� �ۼ�
SELECT employee_id, first_name, last_name, department_id, salary
    , (SELECT ROUND(AVG(salary)) FROM hr.employees
        WHERE department_id = 60) avg_salary
    FROM hr.employees
    WHERE department_id = 60;
    
    
-------------------------------------------
--hr ����(������)�� employees ���̺��� �������� 
--���� ������ ���� ���� ���. Sub Query ���.

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
    
    
--���޺� ��� �޿����� ���� �޴� ������ ���
SELECT employee_id, first_name, last_name, job_id, salary
    FROM hr.employees e1
    WHERE salary >= (SELECT AVG(salary) FROM hr.employees
                    WHERE job_id = e1.job_id);
    
    

    


--����051)  hr ����(������)�� employees ���̺��� �������� 
--�������� ��½� ������(hr.jobs ���̺��� job_title �÷�)�� ���� ���. Sub Query ���.

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



--����052)  hr ����(������)�� departments ���̺��� �������� 
--�μ���(department_name), �μ���(manager)�̸�(first_name, last_name) ���.  Sub Query ���.

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



--����053) hr ����(������)�� jobs ���̺��� �������� 
--����(job_id)�� �ְ�޿���(max_salary �÷��� ��) �޴� ���� ���� ���. 
--�����̸�(job_title)�� ���� ����� ��.  Sub Query ���.

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
    


--����054) hr ����(������)�� employees ���̺��� ��������  
--�μ�(department_id)�� �ְ� �޿��� �޴� ������ ���� ���. 
--�μ� �̸�(department_name) ���� ���. Sub Query ���.
    
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
--�ζ��κ�(Inline View)
--����
/*
SELECT column_list, ... 
    FROM (��������) alias;
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
--hr ����(������)�� employees ���̺��� ��������  
--�μ��� �ְ� �޿��� �޴� ������ ���� ���. 
--�μ� �̸�(department_name) ���� ���.

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


--hr ����(������)�� employees, jobs ���̺��� �������� 
--first_name 'Donald', last_name 'OConnell'�� 
--������(job_title)�� ���� ���� ���� ����ϴ� ���� �ۼ�.
SELECT �÷�����Ʈ
    FROM �������̺�1 a, �������̺�2 b
    WHERE a.job_title = b.job_title;

--�������̺�1    
SELECT employee_id, first_name, last_name
    , job_title
    FROM hr.employees e1, hr.jobs j
    WHERE e1.job_id = j.job_id
    AND first_name='Donald' AND last_name='OConnell';

--�������̺�2    
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



--����055) hr ����(������)�� employees ���̺��� �������� 
--�޿�(salary) ������ ���� ������ 10���� ���� ���. RANK() OVER() �Լ� ���.
SELECT employee_id, first_name, last_name, salary, rank_
    FROM (SELECT   employee_id, first_name, last_name, salary
        , RANK() OVER(ORDER BY salary DESC) rank_
        FROM hr.employees) emp
    WHERE rank_ <= 10;
    
    

--����056) hr ����(������)�� employees ���̺��� �������� 
--�Ի���(hire_date) ������ ���� ������ 10���� ���� ���. RANK() OVER() �Լ� ���.
SELECT employee_id, first_name, last_name, hire_date, "RANK" 
    FROM (SELECT employee_id, first_name, last_name, hire_date
                , DENSE_RANK() OVER(ORDER BY hire_date) "RANK" 
            FROM hr.employees) emp
    WHERE "RANK" < 11;
    

--����057) hr ����(������)�� employees ���̺��� �������� 
--�޿�(salary) ������ ���� ������ �� ��° ���� ���. RANK() OVER() �Լ� ���.
SELECT employee_id, first_name, last_name, salary, "RANK"  
    FROM (SELECT employee_id, first_name, last_name, salary
            , DENSE_RANK() OVER(ORDER BY salary DESC) "RANK" 
        FROM hr.employees) emp
    WHERE "RANK" = 2;


--����058) hr ����(������)�� employees ���̺��� �������� 
--���� �������� �޿��� �μ��� ��� �޿����� ���� ���. AVG() OVER() �Լ� ���.
SELECT employee_id, first_name, last_name, department_id, salary, "D_avg_salary", salary - "D_avg_salary" "����"
    FROM (SELECT employee_id, first_name, last_name, department_id, salary
            , ROUND(AVG(salary) OVER(PARTITION BY department_id)) "D_avg_salary"
        FROM hr.employees) emp;
        
        

--����059) hr ����(������)�� employees ���̺��� ��������
--�μ��� �޿��� �� ���. 
--�� ������ �޿��� �μ� ��ü�� �޿� �տ��� �����ϴ� ���� ���.
--���� ����� ROUND((������ �޿� / �μ� ��ü �޿� ��) * 100) �� �Ѵ�.

SELECT employee_id, first_name, last_name, department_id, salary, "D_sum_salary", ROUND((salary / "D_sum_salary") * 100) "����"
    FROM (SELECT employee_id, first_name, last_name, department_id, salary
            , SUM(salary) OVER(PARTITION BY department_id) "D_sum_salary" 
        FROM hr.employees) emp;

SELECT employee_id, first_name, last_name, department_name, salary, "D_sum_salary", ROUND((salary / "D_sum_salary") * 100) "����"
    FROM (SELECT employee_id, first_name, last_name, department_id, salary
            , SUM(salary) OVER(PARTITION BY department_id) "D_sum_salary" 
        FROM hr.employees) emp, hr.departments d
    WHERE emp.department_id = d.department_id;