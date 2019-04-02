-----------------------------------------------------------
--�����ͺ��̽� ��ü

/*
1. �����ͺ��̽��� ����Ǵ� �͵��� ���̺� �ܿ� ��Ÿ ���� ���� �͵��� ����Ǵµ� �̰��� �����ͺ��̽� ��ü(Database Objects)��� �θ���.
2. TABLE
�ϳ� �Ǵ� ���� �÷�(Column)���� �� �ϳ��� ���ڵ带 �̷��, �̷��� ���ڵ���� �� ���̺��̵ȴ�. ���� ��� "���" ���̺��� ���, �̸�, �μ� �� ���� �÷��� ���� �ǰ� �������ŭ�� ���ڵ带 ���� �ȴ�.
3.
CREATE ��
�����ͺ��̽� ���� ��� ��ü�� ������ �� ����ϴ� ����
ALTER ��
�̹� ������ ��ü�� ������ ����
DROP ��
������ ��ü�� ����
=>����) �����ڿ� ���� RESOURCE ������ �ο� ���� ����ڸ� �۾� ����
*/

    
---------------------------------------------
--���Ἲ

/*
1. ���Ἲ���� ��ü ���Ἲ(Entity Integrity), ���� ���Ἲ(Relational Integrity), ������ ���Ἲ(Domain Integrity)�� �ִ�.
2. ��ü ���Ἲ
7��ü ���Ἲ�� �����̼ǿ� ����Ǵ� Ʃ��(tuple)�� ���ϼ��� �����ϱ� ���� ���������̴�.
3.���� ���Ἲ
���� ���Ἲ�� �����̼� ���� �������� �ϰ����� �����ϱ� ���� ���������̴�.
4. ������ ���Ἲ
������ ���Ἲ�� �Ӽ����� ��� ������ ���� ������ �����ϱ� ���� ���������̴�.
���� ���, �л� ���� ����� ���̺��� ����ٸ�
--���̺� ����
CREATE TABLE member (     --���̺� �̸� member
	sid NUMBER        --������ȣ ����� �÷�
	,name VARCHAR2(10) --�̸�, 10���ڸ� ���
	,kor NUMBER(3)     --����, ���� 3�ڸ��� ���(0~999). 0~100 ����.
	,eng NUMBER(3)     --����, ���� 3�ڸ��� ���
	,mat NUMBER(3)     --����, ���� 3�ڸ��� ���
);
5. �������� ����
- PRIMARY KEY(PK) : �ش� �÷� ���� �ݵ�� �����ؾ� �ϸ�, �����ؾ� ��(NOT NULL�� UNIQUE ���������� ������ ����)
- FOREIGN KEY(FK) : �ش� �÷� ���� �����Ǵ� ���̺��� �÷� �� ���� �ϳ��� ��ġ�ϰų� NULL�� ����
- UNIQUE(UK) : ���̺����� �ش� �÷� ���� �׻� �����ؾ� ��
- NOT NULL : �÷��� NULL ���� ������ �� ����.
- CHECK(CK) : �ش� �÷��� ���� ������ ������ ���� ������ ���� ����
*/




-------------------------------
--NOT NULL


---------------------
CREATE TABLE table0 (
    col1 VARCHAR2(10) NOT NULL
    ,col2 VARCHAR2(10)
);

INSERT INTO table0 (col1, col2)
    VALUES ('TEST', 'HELLO');
INSERT INTO table0 (col1)
    VALUES ('TEST');
INSERT INTO table0 (col2)
    VALUES ('HELLO');       --ORA-01400: cannot insert NULL into ("MINJONG"."TABLE0"."COL1")   
INSERT INTO table0 (col1,col2)
    VALUES (NULL,'HELLO');  --ORA-01400: cannot insert NULL into ("MINJONG"."TABLE0"."COL1")

COMMIT;

SELECT col1, col2
    FROM table0;
    
DESC table0;    
    
SELECT * FROM user_constraints 
	WHERE table_name='INSA';    
    
    
 
-------------------------------
--UNIQUE
--�ߺ� �Ұ�, NULL ���, ���̺� ������ ������ ���� ����

----------------------
CREATE TABLE table1 (-- NOT NULL�� ���⿡�� ������ ���ش�.
    col1 VARCHAR2(10) 
    ,col2 VARCHAR2(10)
);

ALTER TABLE table1
    ADD CONSTRAINT table1_col1_pk PRIMARY KEY(col1);
ALTER TABLE table1
    ADD CONSTRAINT table1_col2_uk UNIQUE(col2);

INSERT INTO table1 (col1, col2)
    VALUES ('TEST', 'HELLO');
INSERT INTO table1 (col1)
    VALUES ('ABC');
INSERT INTO table1 (col1)
    VALUES ('DEF');
INSERT INTO table1 (col1, col2)
    VALUES ('1234', 'HELLO');  --ORA-00001: unique constraint (MINJONG.TABLE1_COL2_UK) violated �ߺ� �Ұ�.
INSERT INTO table1 (col2)
    VALUES ('SAMPLE');          --ORA-01400: cannot insert NULL into ("WOGNS"."TABLE1"."COL1") NULL ��� �Ұ�
COMMIT;

SELECT col1, col2
    FROM table1;


    
 
-------------------------------
--CHECK
-- ���� ������ ���� �Է� ���� ����
-- ALTER TABLE�� ���� ���� -- ���߿��� �������������� , ���� �ԷµǾ� �ִ� �����Ͱ� ���������� �����ؾ��ϴ� ������ ����.
----------------------
CREATE TABLE table2 (
    col1 VARCHAR2(10) 
    ,col2 VARCHAR2(10)
);

ALTER TABLE table2
    ADD CONSTRAINT table2_col1_pk PRIMARY KEY(col1);
ALTER TABLE table2
    ADD CONSTRAINT table2_col2_ck CHECK(col2 IN ('JAVA', 'ORACLE', 'HTML', 'CSS')); -- NULL ��� ������ �����ʹ� �Է°ź�

INSERT INTO table2 (col1, col2)
    VALUES ('TEST', 'JAVA');
INSERT INTO table2 (col1)
    VALUES ('ABC');
INSERT INTO table2 (col1, col2)
    VALUES ('1234', 'HELLO');  --ORA-02290: check constraint (MINJONG.TABLE2_COL2_CK) violated
COMMIT;

SELECT col1, col2
    FROM table2;
    
    
    
    
-----------------------------------------
--DEFAULT Ű����
--����ڰ� ������� ���� �Է����� �ʴ� ���
--�ڵ����� ������ ���� �Է��ϴ� ����
--NOT NULL ���� ������ �÷��� �ڵ����� �� �Է½� ����.

CREATE TABLE table3 (
    col1 VARCHAR2(10) 
    ,col2 VARCHAR2(10) DEFAULT 'NOTHING'
);

ALTER TABLE table3
    ADD CONSTRAINT table3_col1_pk PRIMARY KEY(col1);

INSERT INTO table3 (col1, col2)
    VALUES ('TEST', 'JAVA');
INSERT INTO table3 (col1)
    VALUES ('ABC');     -- col2���� �����͸� �Է����� �ʾ� ������ NULL���� ������ default ���� ������ NOTHING�� ���� �ȴ�.
COMMIT;

SELECT col1, col2
    FROM table3;
    
    
----------------------------------
-- ���� ���� ����
--> ���� ���� ����(ALTER TABLE ... DROP CONSTRAINT...) �� �߰�(ATER TABLE ... ADD CONSTRAINT...)�� ����
--> NOT NULL�� ALTER TABLE ... MODIFY ... ������� �����մϴ�.
ALTER TABLE table2
    DROP CONSTRAINT table2_col2_ck;
ALTER TABLE table2
    ADD CONSTRAINT table2_col2_ck
        CHECK(col2 IN('JAVA', 'ORACLE', 'HTML', 'CSS', 'MYSQL');
INSERT INTO table2
    VALUES ('1234', 'MYSQL');
SELECT * 
    FROM table2;
----------------------------------
--���� �м� ����

/*
1. SELECT * -- ������ ����
  FROM user_constraints;
--CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
2.SELECT *  -- ������ �ɷ��ִ� ����
  FROM user_cons_columns;
--CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME  
3. SELECT * 1,2 ���� ���ÿ� ���� �ִ°�
  FROM user_constraints UC, user_cons_columns UCC
  WHERE UC.CONSTRAINT_NAME = UC.CONSTRAINT_NAME;
--CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME, COLUMN_NAME
4. 
SELECT uc.TABLE_NAME AS TABLE_NAME
	, COLUMN_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
	, CONSTRAINT_TYPE
	, SEARCH_CONDITION
    , R_CONSTRAINT_NAME
    ,(SELECT R_TABLE_NAME
  FROM (SELECT uc.TABLE_NAME AS R_TABLE_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME)
    WHERE CONSTRAINT_NAME=uc.R_CONSTRAINT_NAME) AS R_TABLE_NAME
   ,(SELECT R_COLUMN_NAME
  FROM (SELECT COLUMN_NAME AS R_COLUMN_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME)
    WHERE CONSTRAINT_NAME=uc.R_CONSTRAINT_NAME) AS R_COLUMN_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME
  AND uc.table_name='EMPLOYEES';
  
5. 
SELECT utc.table_name AS table_name --������ ������ ���̺��
	, utc.column_name AS column_name --������ ������ �÷���
	, data_type   --������ ������ �÷��� �ڷ���
	, data_length   --������ ������ �÷��� ũ��(length)
	, data_precision   --������ ������ �÷��� ũ��(precision)
	, nullable    --������ ������ �÷��� NULL ��� ����
	, data_default    --������ ������ �÷��� DEFAULT ��
	, constraint_name    --�����
	, constraint_type     --��������
	, search_condition  --CHECK ������ ��� ���ǽ�
	, delete_rule    --FOREIGN KEY ������ ��� ON DELETE CASCADE ���� ����
	, r_table_name   --FOREIGN KEY ������ ��� ���� ���̺��
	, r_conlumn_name   --FOREIGN KEY ������ ��� ���� �÷���
	FROM 
	(SELECT  uc.table_name AS table_name
	, ucc.column_name AS column_name
	, uc.constraint_name AS constraint_name
	, uc.constraint_type AS constraint_type
	, uc.search_condition AS search_condition
	, uc.delete_rule AS delete_rule
	, (SELECT table_name 
		FROM user_cons_columns 
		WHERE constraint_name=uc.r_constraint_name) 
		AS r_table_name
	, (SELECT column_name 
		FROM user_cons_columns 
		WHERE constraint_name=uc.r_constraint_name) 
		AS r_conlumn_name
	FROM user_constraints uc, user_cons_columns ucc
	WHERE uc.constraint_name = ucc.constraint_name) ucc
		, user_tab_columns utc
	WHERE ucc.table_name(+)=utc.table_name
		AND ucc.column_name(+)=utc.column_name;
*/


SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
  FROM user_constraints
  WHERE table_name='JOBS';
  
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
  FROM user_constraints
  WHERE table_name='EMPLOYEES';  
  
  
SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME  
  FROM user_cons_columns
  WHERE table_name='EMPLOYEES';  
  
  
SELECT uc1.CONSTRAINT_NAME AS CONSTRAINT_NAME
	, CONSTRAINT_TYPE
	, uc1.TABLE_NAME AS TABLE_NAME
    , SEARCH_CONDITION
    , R_CONSTRAINT_NAME
    , COLUMN_NAME
  FROM user_constraints uc1, user_cons_columns ucc
  WHERE uc1.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME
    AND uc1.table_name='EMPLOYEES';  
  
  
--Ư�� ���̺� �߰��� ������ ���� Ȯ���ϴ� ����  
SELECT uc.TABLE_NAME AS TABLE_NAME
	, COLUMN_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
	, CONSTRAINT_TYPE
	, SEARCH_CONDITION
    , R_CONSTRAINT_NAME
    ,(SELECT R_TABLE_NAME
  FROM (SELECT uc.TABLE_NAME AS R_TABLE_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME)
    WHERE CONSTRAINT_NAME=uc.R_CONSTRAINT_NAME) AS R_TABLE_NAME
   ,(SELECT R_COLUMN_NAME
  FROM (SELECT COLUMN_NAME AS R_COLUMN_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME)
    WHERE CONSTRAINT_NAME=uc.R_CONSTRAINT_NAME) AS R_COLUMN_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME
  AND uc.table_name='EMPLOYEES';
  
  

--Ư�� ���̺� �߰��� ������ ���� Ȯ���ϴ� ����  -> ��� ��� (�� ���� ���� �ʿ�)
CREATE OR REPLACE VIEW constraintsCheckView
AS
SELECT uc.TABLE_NAME AS TABLE_NAME
	, COLUMN_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
	, CONSTRAINT_TYPE
	, SEARCH_CONDITION
    , R_CONSTRAINT_NAME
    ,(SELECT R_TABLE_NAME
  FROM (SELECT uc.TABLE_NAME AS R_TABLE_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME)
    WHERE CONSTRAINT_NAME=uc.R_CONSTRAINT_NAME) AS R_TABLE_NAME
   ,(SELECT R_COLUMN_NAME
  FROM (SELECT COLUMN_NAME AS R_COLUMN_NAME
	, uc.CONSTRAINT_NAME AS CONSTRAINT_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME)
    WHERE CONSTRAINT_NAME=uc.R_CONSTRAINT_NAME) AS R_COLUMN_NAME
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.CONSTRAINT_NAME=ucc.CONSTRAINT_NAME;
  

--�� ����� ���� ���� Ȯ�� ���� ����
SELECT *  
    FROM constraintsCheckView
  WHERE table_name='EMPLOYEES';
  
  
  
  
  
-------------------------------------------------------
--ON DELETE CASCADE �ɼ�
-- FK ���� ������ �θ� ���̺��� row(PK)�� ������ �� �ڽ� ���̺��� row(FK)�� ���� ���� ����




---------------------------
--ON DELETE CASCADE �ɼ� ���� ��
CREATE TABLE jobs (
	jikwi_id NUMBER
	,jikwi_name VARCHAR2(10)
	,CONSTRAINT JOBS_JIKWI_ID_PK PRIMARY KEY(jikwi_id)
);

INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (1, '����');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (2, '�븮');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (3, '���');
COMMIT;

SELECT * FROM jobs;

--FK ���� ����
CREATE TABLE employees (
	sid NUMBER PRIMARY KEY
	,name VARCHAR2(10) 
	,jikwi_id NUMBER REFERENCES jobs(jikwi_id)
);

INSERT INTO employees (sid, name, jikwi_id)
	VALUES (1, 'ȫ�浿', 1);
INSERT INTO employees (sid, name, jikwi_id)
	VALUES (2, '��浿', 2);
COMMIT;

--employees ���̺� �ڷ� Ȯ��
SELECT * FROM employees;

-- jobs ���̺� ���� �Ұ�
DROP TABLE jobs;

--employees ���̺��� '��浿' �ڷ� ���� �õ�. --O
DELETE FROM employees WHERE sid=2;

--employees ���̺� �ڷ� Ȯ��
SELECT * FROM employees;

--jobs ���̺� �ڷ� Ȯ��
SELECT * FROM jobs;

--jobs ���̺��� '����' �ڷ� ���� �õ�. --X employees �� �������̱� ������
DELETE FROM jobs WHERE jikwi_id=1;

--jobs ���̺��� '���' �ڷ� ���� �õ�. --O � �����͵� �����ϰ� ���� �ʱ� ������
DELETE FROM jobs WHERE jikwi_id=3;

--jobs ���̺� �ڷ� Ȯ��
SELECT * FROM jobs;

SELECT e.sid, e.name,j.jikwi_name FROM employees e , jobs j
    WHERE e.jikwi_id = j.jikwi_id;


--> ON DELETE CASCADE �ɼ� ������ �ʿ��մϴ�.
--> employees ���̺��� FK ���� ���� �� �ٽ� FK ���� ����
SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE �÷��� �� Ȯ�� -> NO_ACTION -> ON DELETE CASCADE �ɼ� ���� X -> �θ� row ������, �ڽ� row�� ���� �������� �ʴ´�. �⺻��.


--���� FK ���� ����
ALTER TABLE employees
    DROP CONSTRAINT SYS_C007445;
    
----------------------------
--ON DELETE CASCADE �ɼ� ���� ��
ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_JIKWI_ID_FK
		FOREIGN KEY (jikwi_id)
		REFERENCES jobs(jikwi_id)
		ON DELETE CASCADE;


SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE �÷��� �� Ȯ�� -> CASCADE -> ON DELETE CASCADE �ɼ� ���� O -> �θ� row ������, �ڽ� row�� ���� ������ �� �ִ�.
DELETE FROM jobs;
SELECT * FROM jobs;
SELECT * FROM employees;
        
--jobs ���̺��� '����' �ڷ� ���� �õ�. --O
DELETE FROM jobs WHERE jikwi_id=1;
--> employees ���̺��� �ڷᰡ ���� �����ȴ�.

SELECT * FROM jobs;
SELECT * FROM employees;



--DELETE_RULE Ȯ���� ���� ����� �� ����
CREATE OR REPLACE VIEW constraintsCheckView
AS
SELECT utc.table_name AS table_name --������ ������ ���̺��
	, utc.column_name AS column_name --������ ������ �÷���
	, data_type   --������ ������ �÷��� �ڷ���
	, data_length   --������ ������ �÷��� ũ��(length)
	, data_precision   --������ ������ �÷��� ũ��(precision)
	, nullable    --������ ������ �÷��� NULL ��� ����
	, data_default    --������ ������ �÷��� DEFAULT ��
	, constraint_name    --�����
	, constraint_type     --��������
	, search_condition  --CHECK ������ ��� ���ǽ�
	, delete_rule    --FOREIGN KEY ������ ��� ON DELETE CASCADE ���� ����
	, r_table_name   --FOREIGN KEY ������ ��� ���� ���̺��
	, r_conlumn_name   --FOREIGN KEY ������ ��� ���� �÷���
	FROM 
	(SELECT  uc.table_name AS table_name
	, ucc.column_name AS column_name
	, uc.constraint_name AS constraint_name
	, uc.constraint_type AS constraint_type
	, uc.search_condition AS search_condition
	, uc.delete_rule AS delete_rule
	, (SELECT table_name 
		FROM user_cons_columns 
		WHERE constraint_name=uc.r_constraint_name) 
		AS r_table_name
	, (SELECT column_name 
		FROM user_cons_columns 
		WHERE constraint_name=uc.r_constraint_name) 
		AS r_conlumn_name
	FROM user_constraints uc, user_cons_columns ucc
	WHERE uc.constraint_name = ucc.constraint_name) ucc
		, user_tab_columns utc
	WHERE ucc.table_name(+)=utc.table_name
		AND ucc.column_name(+)=utc.column_name;

--�� ����� ���� ���� Ȯ�� ���� ����
SELECT *  
    FROM constraintsCheckView
  WHERE table_name='EMPLOYEES';
  
------------------------------------------------------------
--UPDATE

/*
1. ���̺��� ������ �����͸� �����Ѵ�.
2. UPDATE ���̺�_��
	SET �÷�_��= ������_��[, �÷�_��= ������_��, ...]
	[WHERE ����]; -- ���� �� ����� ã�´�. -- �� ������ ���ٸ� ��� �����Ͱ� ���������� ���� �ȴ�. �ʼ����� ���
*/


----------------------------
CREATE TABLE members (
    mid NUMBER   --PK ����. ���� ����.
    , name_ NVARCHAR2(10)  --�ѱ�, ������ ����. 10�� �̳�.
    , phone VARCHAR2(10) --������ ����. 10�� �̳�.
);

--PK ���� �߰�
--����� �ۼ��� '���̺��_�÷���_��������' ǥ�� ����
ALTER TABLE members
    ADD CONSTRAINT members_mid_pk PRIMARY KEY(mid);
    

--������ ���̺� ���� ������ �Է�
INSERT INTO members (mid, name_, phone) VALUES (1, 'ȫ�浿', '1234');
INSERT INTO members (mid, name_, phone) VALUES (2, '�ڱ浿', '5678');
COMMIT;

--������ ���̺� �Էµ� �ڷ� Ȯ��
SELECT mid, name_, phone
    FROM members;


--------------------------
--�� ���� row�� ���� �� ���� �׸� ����
--���� ���� Ȯ��
SELECT * FROM members;

--�ڱ浿 ��ȭ��ȣ ���� �õ�
--����) �˻� ���� ���� �߿�
UPDATE members
    SET phone = '1111'
    WHERE mid = 2; --// unique �� �����͸� ����ϴ°��� ���� ����. ������ ���� ���� ����

--����� ��ȭ��ȣ Ȯ��
SELECT * FROM members;

COMMIT; ROLLBACK; -- ���� �ϳ� �ص� ���� (�����̱� ������) Ȯ�� or ���


---------------------
--�� ���� row�� ���� �������� �׸� ����
--���� ���� Ȯ��
SELECT * FROM insa;
--basicpay 2610000	sudang 200000

--ȫ�浿 �⺻��, ���� ���� �õ�
--����) �˻� ���� ���� �߿�
UPDATE insa
    SET basicpay = 3000000, sudang = 500000
    WHERE num=1001;
--COMMIT;

--����� �⺻��, ���� Ȯ��
SELECT * FROM insa;
--basicpay 3000000	sudang 500000

ROLLBACK;

---------------------
--�������� row�� ���� �� ���� �׸� ����
--���� ���� Ȯ��
SELECT * FROM insa
    WHERE buseo='���ߺ�';
--sudang 102000 ~ 210000

--���ߺ� ���� ��ü�� ���� ���� �õ�
--����) �˻� ���� ���� �߿�
UPDATE insa
    SET sudang = sudang + (sudang * 0.01)
    WHERE buseo='���ߺ�';
--COMMIT;

--����� ���� Ȯ��
SELECT * FROM insa
    WHERE buseo='���ߺ�';
--sudang 103020 ~ 212100

ROLLBACK;


-------------------------------------------------
--����) WHERE �������� �������� �ʰų�, �߸��� ������ ��� ������ �ʴ� row���� ������ ������ ���Եȴ�.

--ȫ�浿�� ��ȭ��ȣ ����� WHERE ������ ���� ���� �ʴ� ��츦 ����
SELECT * FROM insa
    WHERE num=1001; --���� ������ ������ ��(PK �÷��� ��)�� ������ �˻� ����
--011-2356-4528

--�ùٸ� ���� ��    
UPDATE insa
    SET tel = '010-1234-1234'
    WHERE num=1001;
COMMIT;

SELECT * FROM insa
    WHERE num=1001;
--010-1234-1234

--�߸��� ���� ��    
UPDATE insa
    SET tel = '010-1234-1234';
--COMMIT;

SELECT * FROM insa;
-->��� ������ ��ȭ��ȣ�� ������ ��ȭ��ȣ�� ����� ���°� �ȴ�.

ROLLBACK;



------------------------------------------------------
--hr ��Ű���� ���̺��� �����ؼ� �纻 ���̺� ���� - �������� ������ ��ġ�� �ʴ´�. -- ������
--����) ���������� ������� �ʴ´�.

CREATE TABLE employees
AS
SELECT * FROM hr.employees;

SELECT * FROM employees;

CREATE TABLE departments
AS
SELECT * FROM hr.departments;

CREATE TABLE jobs
AS
SELECT * FROM hr.jobs;

--PK, FK �������� ���� ����

ALTER TABLE departments
    ADD CONSTRAINT departments_department_id_pk PRIMARY KEY(department_id);
    
ALTER TABLE jobs
    ADD CONSTRAINT jobs_job_id_pk PRIMARY KEY(job_id);

ALTER TABLE employees
    ADD CONSTRAINT employees_employee_id_pk PRIMARY KEY(employee_id);
    
ALTER TABLE employees
    ADD (CONSTRAINT employees_job_id_fk FOREIGN KEY(job_id)
            REFERENCES jobs(job_id)
    , CONSTRAINT employees_department_id_fk FOREIGN KEY(department_id)
            REFERENCES departments(department_id)
    , CONSTRAINT employees_manager_id_fk FOREIGN KEY(manager_id)
            REFERENCES employees(employee_id)
    , CONSTRAINT employees_email_uk UNIQUE(email)); -- ���� �ּҸ� 2�� ������ ���� (��, NULL�� ���)
      
ALTER TABLE departments
    ADD CONSTRAINT departments_manager_id_fk FOREIGN KEY(manager_id)
            REFERENCES employees(employee_id);
SELECT * 
    FROM employees e, departments d, jobs j
    WHERE e.department_id=d.department_id
    AND e.job_id=j.job_id;

SELECT *
    FROM employees;

SELECT phone_number ,CONCAT('515.1234.',SUBSTR(phone_number,-4)) phone
    FROM employees
    WHERE REGEXP_LIKE(phone_number,'^515.123.');

UPDATE employees    
    SET phone_number = CONCAT('515.1234', SUBSTR(phone_number,-4))
    WHERE REGEXP_LIKE(phone_number,'^515.123.');

COMMIT;






------------------------------------------------------
--���������� UPDATE ������ �Ϻη� ��� ����

/*
UPDATE ���̺��
    SET �÷��� = (��������)
    WHERE (���������� �̿��� ���ǽ�);
    
    
���� ���,
UPDATE employees
	SET salary = salary*1.1
	WHERE department_id IN (SELECT department_id
				 FROM departments
				 WHERE department_name='IT');
                 
                 
UPDATE (��������-JOIN ������ �̿��� ���� ���̺�)
    SET �÷��� = ��
    WHERE ���ǽ�;
    -
���� ���,
UPDATE (SELECT e.first_name, e.last_name, e.salary, d.department_name
	FROM employees e, departments d
	WHERE e.department_id = d.department_id)  
  SET salary=salary*1.1
  WHERE department_name='IT';
  
*/

--���� ���� Ȯ��
SELECT employee_id, first_name, d.department_name, salary
    FROM employees e, departments d
    WHERE e.department_id = d.department_id
    AND department_name='IT';
    ORDER BY employee_id;

--���� �׼�(���1)
UPDATE employees
	SET salary = salary*1.1
	WHERE department_id IN (SELECT department_id
				 FROM departments
				 WHERE department_name='IT');
                 
    
ROLLBACK; --�������� ���ư���.


--���� �׼�(���2)
UPDATE (SELECT *
    FROM employees e, departments d
    WHERE e.department_id = d.department_id)
	SET salary = salary*1.1
	WHERE  department_name='IT';


--������ ��� Ȯ��          
SELECT employee_id, first_name, department_id, salary
    FROM employees
    ORDER BY employee_id;


ROLLBACK;

-------------------------------
CREATE TABLE jobs (
	jikwi_id NUMBER
	,jikwi_name VARCHAR2(10)
);

ALTER TABLE jobs
	 ADD CONSTRAINT JOBS_JIKWI_ID_PK PRIMARY KEY(jikwi_id);

INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (1, 'CLERK');
INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (2, 'MANAGER');
INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (3, 'PRESIDENT');
INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (4, 'VICE PRES'); --O
COMMIT;


CREATE TABLE employees (
	sid NUMBER
	,name VARCHAR2(10) 
	,jikwi_id NUMBER
);

ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_SID_PK PRIMARY KEY(sid);
ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_JIKWI_ID_FK 
			FOREIGN KEY(jikwi_id)
			REFERENCES jobs(jikwi_id);

INSERT INTO employees (sid, name, jikwi_id)
  VALUES (1, 'hong', 1); --O
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (2, 'park', 2); --O
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (3, 'choi', 2); --FK �ߺ� ���. O
COMMIT;


--���� �׸� �߰� + �⺻�� �߰�
ALTER TABLE employees
    ADD (extrapay NUMBER DEFAULT 100000);


--���� ���� Ȯ��
SELECT sid, name, e.extrapay , e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
/*  
1	hong	100000	1	CLERK
2	park	100000	2	MANAGER
3	choi	100000	2	MANAGER
*/


--jobs.jikwi_name �� 'CLERK'�� ������ ����(employees.extrapay) ����
UPDATE employees
    SET extrapay = 20000
    WHERE jikwi_name = 'CLERK'; --ORA-00904: "JIKWI_NAME": invalid identifier
    
--���1    
UPDATE employees
    SET extrapay = 20000
    WHERE jikwi_id = (SELECT jikwi_id FROM jobs WHERE jikwi_name = 'CLERK');    
    
--���2
UPDATE (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    SET extrapay = 20000
    WHERE jikwi_name = 'CLERK';
COMMIT;

--������ ���� Ȯ��
SELECT sid, name, e.extrapay , e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
/*  
1	hong	20000	1	CLERK
2	park	100000	2	MANAGER
3	choi	100000	2	MANAGER
*/  


--jobs.jikwi_name�� 'CLERK'�� ������ ����(employees.extrapay) 20% �λ�. jobs.jikwi_name�� 'MANAGER'�� ������ ����(employees.extrapay) 10% �λ�.
--> DECODE() �Լ� ���.
UPDATE (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    SET extrapay = DECODE(jikwi_name, 'CLERK', extrapay*1.2, 'MANAGER', extrapay*1.1, extrapay);
COMMIT;

--������ ���� Ȯ��
SELECT sid, name, e.extrapay , e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
/*  
1	hong	24000	1	CLERK
2	park	110000	2	MANAGER
3	choi	110000	2	MANAGER
*/











------------------------------------------------
--DELETE
-- ���� ���ϰ� �������� ������ �Ұ����ϴ�. 
/*
1. ���̺��� ������ ���� �����ϴµ� ����Ѵ�.
2. DELETE [FROM] ���̺�_�� [WHERE ����];
*/



--------------------------
--�� ���� row�� ���� ����
--���� ���� Ȯ��
SELECT * FROM members;

--�ڱ浿 �ڷ� ���� �õ�
--����) �˻� ���� ���� �߿�
DELETE FROM members
    WHERE mid=2;
COMMIT;

--������ ���� Ȯ��
SELECT * FROM members;




--------------------------
--���� ���� row�� ���� ����
--���� ���� Ȯ��
SELECT * FROM insa;

--'���ߺ�' ��ü �ڷ� ���� �õ�
--����) �˻� ���� ���� �߿�
DELETE FROM insa
    WHERE buseo='���ߺ�';
COMMIT;

--������ ���� Ȯ��
SELECT * FROM insa;



-------------------------------------------------
--����) WHERE �������� �������� �ʰų�, �߸��� ������ ��� ������ �ʴ� row���� ������ ������ ���Եȴ�.
--��λ���
DELETE FROM insa;
--COMMIT;

ALTER TABLE employees
    DROP CONSTRAINT EMPLOYEES_MANAGER_ID_FK;

ALTER TABLE departments
    DROP CONSTRAINT DEPARTMENTS_MANAGER_ID_FK;

DELETE FROM employees;
ROLLBACK;
SELECT * FROM employees;
--������ ���� Ȯ��
SELECT * FROM insa;
--> ��� �ڷᰡ ������ �����̴�.
--> ROLLBACK;



--jobs.jikwi_name �� 'CLERK'�� ����(employees ���̺�)�� ���� �õ�
DELETE FROM (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    WHERE jikwi_name = 'CLERK';
COMMIT;

--������ ���� Ȯ��
SELECT *
        FROM employees emp, jobs j
        WHERE emp.jikwi_id = j.jikwi_id;
      
      
--����) jobs ���̺��� row�� �����ϴ� ���(���� ���ϴ� ��� ���� �Ұ�)        
SELECT * FROM jobs;

DELETE FROM employees
    WHERE job_id ='SH_CLERK';
DELETE FROM jobs
    WHERE job_id= 'SH_CLERK';
DELETE FROM jobs
    WHERE jikwi_id = 2; --ORA-02292: integrity constraint (MINJONG.EMPLOYEES_JIKWI_ID_FK) violated - child record found

ROLLBACK;
--> FK ���� ������ ON DELETE CASCADE �ɼ� �����ϸ� ���� ����


---------------------------------------
--���� ���ϴ� �ڷ�� ���� �Ұ�
SELECT *
    FROM departments;

DELETE FROM departments
    WHERE department_id = 60; --ORA-02292: integrity constraint (MINJONG.EMPLOYEES_DEPARTMENT_ID_FK) violated - child record found
    
DELETE FROM departments
    WHERE department_id = 210; --���� ����

ROLLBACK;

DELETE FROM departments; 
--��ü ���� �Ұ� 
--> ���1) ���� ���� �ؼ� �ʿ� 
--> ���2) FK ���� ������ ���̺��� FK ���� ������ ON DELETE CASCADE �ɼ� �����ϸ� ���� ����



---------------------------------------
-- ON DELETE CASCADE �ɼ� �߰�
ALTER TABLE employees
    DROP CONSTRAINT EMPLOYEES_DEPARTMENT_ID_FK;
    
ALTER TABLE departments
    DROP CONSTRAINT DEPARTMENTS_MANAGER_ID_FK;

ALTER TABLE employees   
    ADD CONSTRAINT EMPLOYEES_DEPARTMENT_ID_FK FOREIGN KEY(department_id)
        REFERENCES departments(department_id)
        ON DELETE CASCADE;
-->PK �ڷ� ������ FK �ڷᰡ ���� �����ȴ�.

DELETE FROM departments
    WHERE department_id = 60;
COMMIT;

DELETE FROM departments
    WHERE department_id = 100;
COMMIT;

SELECT * 
    FROM departments;
SELECT *
    FROM employees
    ORDER BY  department_id;
--------------------------------------------
--TRUNCATE
-- ���������� ������ ���� �и� -> ������ ��ü�� �����ϴ� ȿ��
-- ROLLBACK�� COMMIT ��� X
TRUNCATE TABLE employees;    
--------------------------------------------
--����060) HR ���� employees ���̺��� job_title�� 'Sales Manager'�� �������� 
--salary�� �ش� ������ �ְ� �޿�(max_salary)�� ����. 
--��, �Ի���(hire_date)�� 2005�� ����(�ش� �⵵ ����) �Ի��ڿ� ���ؼ� ������.
UPDATE
    (SELECT e.employee_id, e.job_id, j.job_title, e.hire_date, e.salary, j.max_salary
            FROM employees e, jobs j
            WHERE e.job_id = j.job_id
            AND job_title ='Sales Manager'
            AND TO_CHAR(hire_date, 'YYYY') <= '2005')
        SET salary = max_salary;
        COMMIT;

SELECT e.employee_id, e.job_id, j.job_title,e.hire_date,e.salary, j.max_salary
    FROM employees e, jobs j
    WHERE e.job_id= j.job_id
    AND job_title = 'Sales Manager'
    AND TO_CHAR(hire_date ,'YYYY') < '2005';

--����061) HR ���� employees ���̺��� ��� ������ salary�� �ش� ������ ����(job_id) �ְ� �޿�(max_salary)�� ����.
--���� ���, AD_PRES�� 40000, AD_VP�� 30000, IT_PROG�� 10000���� ������.

UPDATE
(SELECT e.employee_id, e.job_id, j.job_title, e.salary, j.max_salary
    FROM employees e, jobs j
    WHERE e.job_id = j.job_id) 
    SET salary = max_salary;
    COMMIT;

SELECT e.employee_id, e.job_id, j.job_title, e.salary, j.max_salary
    FROM employees e, jobs j
    WHERE e.job_id = j.job_id
    ORDER BY e.employee_id;

