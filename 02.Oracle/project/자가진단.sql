/*----------------------------------------
table structure

NUM NOT NULL NUMBER (5) - ���� ��ȣ
NAME NOT NULL VARCHAR2 (20) - �̸�
SSN NOT NULL VARCHAR2 (14) - �ֹ� ��ȣ
IBSADATE NOT NULL DATE - �Ի���
TEL VARCHAR2 (15) - ��ȭ ��ȣ
CITY VARCHAR2 (10) - ����
BUSEO NOT NULL VARCHAR2 (15) - �μ�
JIKWI NOT NULL VARCHAR2 (15) - ����
BASICPAY NOT NULL NUMBER (10) - �⺻��
SUDANG NOT NULL NUMBER (10) - ����
----------------------------------------
HR.employees ���̺� ����

EMPLOYEE_ID NOT NULL NUMBER (6)    
FIRST_NAME VARCHAR2 (20) 
LAST_NAME NOT NULL VARCHAR2 (25) 
EMAIL NOT NULL VARCHAR2 (25) 
PHONE_NUMBER VARCHAR2 (20) 
HIRE_DATE NULL ��¥�� �ƴ�         
JOB_ID NOT NULL VARCHAR2 (10) 
SALARY NUMBER (8,2)  
COMMISSION_PCT NUMBER (2,2)  
MANAGER_ID NUMBER (6)    
DEPARTMENT_ID NUMBER (4) 
----------------------------------------
HR.departments ���̺� ����

DEPARTMENT_ID NOT NULL NUMBER (4)    
DEPARTMENT_NAME NOT NULL VARCHAR2 (30) 
MANAGER_ID NUMBER (6)    
LOCATION_ID NUMBER (4)   
----------------------------------------
HR.jobs ���̺� ����

JOB_ID NOT NULL VARCHAR2 (10) 
JOB_TITLE NOT NULL VARCHAR2 (35) 
MIN_SALARY NUMBER (6)    
MAX_SALARY NUMBER (6)  
----------------------------------------
*/

--���� 1) hr.employees ���̺��� �Ի��� (hire_date) ������ 1, 2, 3 �� �Ի��� �� ����ϴ� ��. IN ������ ���.

SELECT employee_id, first_name, last_name, hire_date, job_id,department_id
	FROM hr.employees 
	WHERE TO_CHAR(hire_date,'MM') IN ('01','02','03');

--���� 2) hr.employees ���̺��� job_id�� ������ ( 'SA_MAN', 'ST_MAN', 'PU_MAN', 'AC_MGR') IN ������ ���.
SELECT employee_id, first_name, last_name, hire_date, job_id, department_id 
	FROM hr.employees
	WHERE job_id IN ('SA_MAN', 'ST_MAN', 'PU_MAN', 'AC_MGR');

���� 3) hr.employees ���̺��� �޿� (salary)�� 10000 �̻��̸鼭 Ŀ�̼� (commission_pct)�� �������� ���߽��ϴ�. IS ������ ���.
SELECT employee_id, first_name, last_name, hire_date, job_id,department_id, salary, commission_pct
	FROM hr.employees
	WHERE salary>10000
	AND commission_pct IS NULL;

���� 4) hr.employees ���̺��� �޿� (�޿�) ���� 'A', 'B', 'C'���� ���� ���� �ۼ�. CASE ~ END ���� ���.
�޿��� 20000 �̻��� ��� 'A'
�޿��� 10000 �̻��� ��� 'B'
�޿��� 10000 �̸��� ��� 'C'

SELECT employee_id, first_name, last_name, hire_date, job_id,department_id, salary, CASE
	WHEN salary>10000 THEN 'B'
	WHEN salary>20000 THEN 'A'
	ELSE 'C'
	END AS salary_rank
	FROM hr.employees;
	


--����5) insa ���̺��� ��ȭ��ȣ(tel)�� ������ '-'�� �����ϰ� ����ϰ�, ������ '��ȭ��ȣ����'�� ����ϴ� ���� �ۼ�. DECODE, REPLACE �Լ� ���.
 
SELECT name, DECODE (tel, NULL, '��ȭ��ȣ����', REPLACE(tel, '-', '')) tel
FROM insa;

--����6) hr.employees ���̺��� �Ի���(hire_date) ���� �߿��� �⵵���� �ο��� ����ϴ� ���� �ۼ�. GROUP BY ����, COUNT �Լ� ���.
SELECT TO_CHAR(hire_date, 'YYYY'), COUNT(*) "�ο���"
FROM hr.employees
GROUP BY TO_CHAR(hire_date, 'YYYY');

--���� 7) ��ü �ο���, ���� �ο���, ���� �ο����� �ֿ켱 ������ ���� �ۼ�. COUNT, DECODE �Լ� ���.
��� ��)
��ü �ο��� ���� �ο��� ���� �ο���
   60 31 29
SELECT COUNT(*) "��ü �ο���" ,
    COUNT(*) DECODE(SUBSTR(ssn, 8, 1) , '1',1)) "����" ,
    COUNT(*) DECODE(SUBSTR(ssn, 8, 1) , '2',2)) "����"
FROM insa;

--����8) hr.employees ���̺��� �޿�(salary)�� ���� �޴� �������� ������� ����ϵ�, ���� �ο��ؼ� ����ϴ� ���� �ۼ�. ROW_NUMBER() �Լ� ���.
SELECT ROW_NUMBER() OVER(ORDER BY salary) numb, first_name, last_name, salary
FROM hr.employees;

--����9) hr.employees ���̺��� employee_id�� 150�� ����� ���� �޿��� �޴� ��� ����ϴ� ���� �ۼ�. ���� ���� ���.
SELECT employee_id, first_name, last_name, hire_date, job_id,department_id, salary
	FROM hr.employees
	WHERE salary =(SELECT salary
		FROM hr.employees
		WHERE employee_id =150);

���� 10) hr.employees ���̺��� department_id 100 �̷� �������� job_id, salary�� ��ġ�ϴ� �׸� ��� �� �ۼ��ϱ�. ���� ���� ���.
SELECT e2.employee_id, e2.first_name, e2.last_name, e2.job_id, e2.department_id, e2.salary
    FROM hr.employees e1, hr.employees e2
    WHERE e1.salary= e2.salary
    AND e1.job_id = e2. job_id;

--���� 11) hr.employees ���̺��� ��� ���� ��½�, �μ���(hr.departments ���̺��� department_name)�� ���� ����ϴ� ���� �ۼ�. ���� �������� ���.
SELECT e.employee_id, e.first_name, e.last_name ,(SELECT department_name FROM hr.departments 
        WHERE department_id = e.department_id) department_name
    FROM hr.employees e;

--���� 12) hr.employees, hr.jobs ���̺��� �����Ͻʽÿ� job_title�� 'Stock Manager', 'Stock Clerk'�η� ������ ����ϴ� ���Դϴ�. Oracle JOIN ǥ��� ���.
SELECT e.employee_id, e.first_name, e.last_name, j.job_title
	FROM hr.employees e, hr.jobs j
	WHERE e.job_id = j.job_id
	AND j.job_title IN ('Stock Manager', 'Stock Clerk');

--����13) hr.departments ���̺��� ������ ���� �μ� ���� ����ϴ� ���� �ۼ�. LEFT OUTER JOIN ���.  Oracle JOIN ǥ��� ���.
 
SELECT department_name
FROM hr.departments d, hr.employees e
WHERE d.department_id = e.department_id(+)
AND e.employee_id IS NULL;
 
 --����14) hr.employees ���̺��� ���� ����(���� ������ ���� ����) ���� ����ϴ� ���� �ۼ�.  SELF JOIN + OUTER JOIN ���.  Oracle JOIN ǥ��� ���.
 
SELECT e1.employee_id, e1.first_name, e1.last_name
FROM hr.employees e1, hr.employees e2
WHERE e1.employee_id = e2.manager_id(+)
AND e2.employee_id IS NULL;
 



--����15) �������� ���� �� Ư¡ ����.
 /*
PRIMARY KEY - �ߺ� �Ұ�, NULL�� ���� �Ұ�
FOREIGN KEY - �ٸ� ���̺��� Ư�� �÷��� ����, �ش� ���̺� ���� ���� �Է� �Ұ�
CHECK - ���ǿ� ������ ���鸸 �Է��� �� ����
UNIQUE - �ߺ� �Ұ�, NULL�� ���� ����
NOT NULL - NULL�� ���� �Ұ�*/

-- ���� 16) ����16) �Ʒ� �׸�(�÷�)���� ������ insa ���̺� ���� �� NUM �÷��� Primary Key ���� ���� ����, ���� �ڷ�(2�� ���� �ڷ�) �Է� ���� �ۼ�.


ALTER TABLE hr.employees 
	ADD CONSTRAINT EMPLOYEES_num_PK PRIMARY KEY(num);
ALTER TABLE hr.departments 
	ADD CONSTRAINT DEPARTMENTS_department_Id_PK PRIMARY KEY(department_Id);
ALTER TABLE hr.jobs
	ADD CONSTRAINT JOBS_job_Id_PK PRIMARY KEY(job_Id);

�⺻ Ű ���� ���� �ۼ�, �Է� �ڷ� (2 �� ���� �ڷ�) �Է� �ۼ� �ۼ���.
NUM NOT NULL NUMBER (5) - PK
NAME NOT NULL NVARCHAR2 (20) 
SSN NOT NULL VARCHAR2 (14)  
IBSADATE NOT NULL DATE          
TEL VARCHAR2 (15)  
CITY NVARCHAR2 (10) 
BUSEO NOT NULL NVARCHAR2 (15) 
JIKWI NOT NULL NVARCHAR2 (15) 
BASICPAY NOT NULL NUMBER (10)    
SUDANG NOT NULL NUMBER (10) 

CREATE TABLE insa_ (
    NUM NUMBER(5) NOT NULL,      --PK
    NAME NVARCHAR2(20) NOT NULL,
    SSN VARCHAR2(14) NOT NULL, 
    IBSADATE DATE NOT NULL,
    TEL VARCHAR2(15),
    CITY NVARCHAR2(10),
    BUSEO NVARCHAR2(15) NOT NULL,
    JIKWI NVARCHAR2(15) NOT NULL,
    BASICPAY NUMBER(10) NOT NULL,
    SUDANG NUMBER(10) NOT NULL
);
 
ALTER TABLE insa_
ADD CONSTRAINT insa__pk PRIMARY KEY (num);

--����17) employees, jobs ���̺��� job_title�� 'Stock Clerk'�� ������ �޿�(salary) 20% �λ�, job_title�� 'Stock Manager'�� ������ �޿�(salary) 10% �λ��ϴ� ���� �ۼ�. InlineView + JOIN + UPDATE ���.
 
UPDATE employees e
SET e.basicpay = (SELECT DECODE (j.job_title, 'Stock Clerk', e.basicpay * 1.2, 'Stock Manager', e.basicpay * 1.1, basicpay)
                FROM jobs j
                WHERE e.jobId = j.jobId);
 
 
 
--����18) employees, jobs ���̺��� job_title�� 'Stock Clerk'�� ���� ���� �����ϴ� ���� �ۼ�. InlineView + JOIN + DELETE ���.
 
DELETE FROM employees
WHERE jobId = (SELECT jobId
        FROM jobs
        WHERE job_title = 'Stock Clerk');



--------------------------------------
