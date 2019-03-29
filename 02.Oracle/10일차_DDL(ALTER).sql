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
�̹� ������ ��ü�� ������ ���� - ALTER�� ������ �ȵɰ�� CREATE�� DROP�� �̿��Ͽ� �ؾ�������, ���� �����Ͱ� ����� ������ �ִ�.
DROP ��
������ ��ü�� ����
=>����) �����ڿ� ���� RESOURCE ������ �ο� ���� ����ڸ� �۾� ����
*/

    
    
-----------------------------------------------
--���̺� ����

/*
***1. �� ���̺� ����
CREATE TABLE ���̺��̸� (
	�÷� �ڷ��� [��Ÿ����]
	,...
);
*/
CREATE TABLE members(
    mid NUMBER
    ,name_ VARCHAR2(20)
    ,phone VARCHAR2(20)
);
INSERT INTO members(mid, name_,phone)
    VALUES(1, 'HONG', '1234');
INSERT INTO members(mid, name_,phone)
    VALUES(2, 'park', '5567');    
COMMIT;
SELECT * FROM members;
------------------------------------
/*
2. ���� ���̺� ����(�÷���, �ڷ���) Ȯ��
SELECT * 
  FROM user_tab_columns
  WHERE table_name='���̺��'; --���̺� �̸� �빮�ڷ� ǥ���� ��.
DESC ���̺��̸�;
*/
SELECT * 
  FROM user_tab_columns
  WHERE table_name='INSA';

SELECT * 
  FROM user_tab_columns
  WHERE table_name='MEMBERS';

DESC members;

CREATE TABLE members2
AS
SELECT * FROM members WHERE 1=0;  --���� ����� ������ �������� ����

DESC members;  --������ ���� �ܿ� �������ǵ� �ִ�.
DESC members2; --�纻�� ������ ����Ǿ� �ִ�.

SELECT * FROM members2; -- 0 rows

CREATE TABLE employees 
AS 
SELECT * FROM hr.employees;

SELECT * FROM employees;

CREATE TABLE employees2
AS 
SELECT employee_id, first_name, last_name, email, phone_number
FROM hr.employees;

SELECT *
FROM employees2;

CREATE TABLE employees3
AS
SELECT employee_id, first_name, last_name, email, phone_number
FROM hr.employees
WHERE department_id = 80;

SELECT * 
FROM employees3;


------------------------------------
/*
3. ���� ���̺� ���� �����ؼ� �� ���̺� ���� (���������� ������� �ʴ´�)
CREATE TABLE �����̺��
AS
SELECT �÷�����Ʈ FROM �������̺�� 
WHERE 1=0; -- �Ϻη� false �����. ���̺� ������ ���� �Ͽ� �����´� ( �����ʹ� ����)
*/

CREATE TABLE jobs
AS
SELECT * FROM hr.jobs WHERE 1=0;

SELECT * FROM jobs;
------------------------------------
/*
**4. ���� ���̺� ���� �� ���� �ڷ� �����ؼ� �� ���̺� ���� �� �ڷ� �Է� (���������� ������� �ʴ´�)
CREATE TABLE �����̺��
AS
SELECT �÷�����Ʈ FROM �������̺�� [WHERE ���ǽ�];
*/

CREATE TABLE members3
AS
SELECT * FROM members;

SELECT * FROM members3; --2 rows


CREATE TABLE members4
AS
SELECT * FROM members WHERE mid = 1;

SELECT * FROM members4; --1 rows


CREATE TABLE members5
AS
SELECT mid, name_ FROM members WHERE mid = 1;

SELECT * FROM members5; --1 rows




------------------------------
/*
5. ���� ���̺� �� �� �߰�
ALTER TABLE �������̺��
	ADD (���̸� �ڷ���, ...);
--> ���� ���̺� �����Ͱ� �ִ� ���� ���� ������� �÷��� �����ʹ� NULL�� ä������.
--> NULL�� ä���� �÷��� �ڷḦ ä����� UPDATE ����� �̿��Ѵ�.
--> �÷� ������ �ڵ����� �⺻���� ä����� DEFAULT Ű���带 �̿��Ѵ�.
*/

DESC members;
/*
MID   NOT NULL NUMBER        
NAME_          NVARCHAR2(10) 
PHONE          VARCHAR2(10) 
*/
--> �����(regDate) �÷� �߰�

ALTER TABLE members
	ADD (regDate DATE);
--> �÷��� �߰������� �ڷ�� NULL�� ä������.

SELECT * FROM members;
--> regDate �÷��� NULL�� ä���� �����̴�.
--> �ڷḦ �Է��Ϸ��� UPDATE ���� ���




--------------------------
/*
6. ���� ���̺��� ���� �� �ڷ��� ����
ALTER TABLE �������̺��
	MODIFY (�������̸� ���ο��ڷ���);
--> ���� ���̺� �����Ͱ� �ִ� ���� ���ο� �ڷ����� ���� �ڷῡ �����ؾ� �Ѵ�.
*/

DESC members;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE 
*/
--> PHONE �÷��� ũ�� Ȯ��. 20->50

ALTER TABLE members
	MODIFY (phone VARCHAR2(50));
    
DESC members;
--> phone �÷��� ũ�� Ȯ��

SELECT * FROM members;
--> ���� �ڷ� �״�� ���� �ִ�.




---------------------------------------
/*
7. ���� ���̺��� ���� �� �̸� ����
ALTER TABLE �������̺��
	RENAME COLUMN �������̸� TO �����̸�;
--> ���� ���̺� �����Ͱ� �־ �����ϴ�.
*/

DESC members;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE   
*/
--> phone �÷����� tel �÷������� ����

ALTER TABLE members
	RENAME COLUMN phone TO tel;
    
DESC members;
--> �÷����� ����Ǿ� �ִ�.




----------------------------------
/*
8. ���� ���̺��� ���� �� ����
ALTER TABLE �������̺��
	DROP (���̸�, ...);
--> ���� ���̺� ���� �����Ͱ� ���� �����ȴ�. ���� �Ұ�. �׻� �����ؾ��Ѵ�. 
*/

DESC members;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE   
*/
--> regDate �÷��� ����

ALTER TABLE members
	DROP (regDate);
    
DESC members;
--> �÷��� �����Ǿ� �ִ�.




----------------------------------
/*
9. ���� ���̺� �̸� ����
RENAME �������̺�� TO ���ο����̺��;
*/

SELECT * FROM user_tables;
--> INSA ���̺���� EMP ���̺������ ����

SELECT * FROM insa;

RENAME insa TO emp;

SELECT * FROM emp;

RENAME score TO score_tbl;


----------------------------
/*
10. ���� ���̺� ���� (������ ��� ����)
DROP TABLE ���̺��̸�;
--> ���̺� ������ ���� ��ü(��������, �ε���, Ʈ���� ��)���� ���� �����ȴ�.
--> ���� ���谡 �ִ� ���̺��� �������ǿ� ���� ���� �ȵǴ� ��찡 �ִ�.
--> �ܵ� ���̺��� �׻� ���� ����.
*/

CREATE TABLE test1 (
    col NUMBER
);

INSERT INTO test1 (col) VALUES (1);
COMMIT;

SELECT * FROM test1;

SELECT * FROM user_tables;
--> test1 ���̺� ���� Ȯ��

DROP TABLE test1;  --������ ���. ���� ����.

SELECT * FROM user_tables;
--> test1 ���̺� ���� Ȯ��

DROP TABLE test2;


------------------------------------------------
/*
--�����뿡 �ִ� ��ü Ȯ��
SELECT *
	FROM recyclebin;
--�����뿡 �ִ� ��ü ���� (���̺���� ������ ������ �ο��� �ӽ� ��ü��)
FLASHBACK TABLE ���̺�� TO BEFORE DROP;
--������ ����
PURGE recyclebin;
DROP TABLE ���̺��̸� PURGE;
*/

SELECT *
	FROM recyclebin;
--> ������ ���̺� ��ü Ȯ�� ����

FLASHBACK TABLE "BIN$3Md0r6iqQDqFXRUYJpJKdg==$0" TO BEFORE DROP;

SELECT * FROM user_tables;
--> ����� ���� ���̺� ���� Ȯ��
SELECT * FROM ALL_tables;
--> ��� ����� ���̺� ���� Ȯ��
SELECT * FROM DBA_tables;
--> ������ ���� 
SELECT * FROM ALL_USERS;


SELECT * FROM test1;
--> ���� �ڷ� Ȯ��


--������ ����
PURGE recyclebin;
--> ���� �Ұ�

--������ ����� ��ġ�� �ʰ� ���� ����
DROP TABLE test1 PURGE;
--> ���� �Ұ�

---------------------------------------------
--���Ἲ

/*
1. ���Ἲ���� ��ü ���Ἲ(Entity Integrity), ���� ���Ἲ(Relational Integrity), ������ ���Ἲ(Domain Integrity)�� �ִ�.
2. ��ü ���Ἲ
��ü ���Ἲ�� �����̼ǿ� ����Ǵ� Ʃ��(tuple)�� ���ϼ��� �����ϱ� ���� ���������̴�.
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



------------------------------------------------
--***PRIMARY KEY (PK)

/*
1. ���̺� ���� �⺻ Ű�� �����Ѵ�.
2. ���̺��� �� ���� �����ϰ� �ĺ��ϴ� �÷� �Ǵ� �÷��� �����̴�. �⺻ Ű�� ���̺� �� �ϳ��� �����Ѵ�. �׷���, �ݵ�� �ϳ��� �÷����� �� �����Ǵ� ���� �ƴϴ�. NULL ���� �Էµ� �� ����, �̹� ���̺� �����ϰ� �ִ� �����͸� �ٽ� �Է��� �� ����. UNIQUE INDEX�� �ڵ����� ����� ����.
3.
�÷� ������ ����
�÷��� ������Ÿ�� [CONSTRAINT constraint��] PRIMARY KEY
���̺� ������ ����
�÷��� ������Ÿ��,
�÷��� ������Ÿ��,
...
[CONSTRAINT constraint��] PRIMARY KEY(�÷�1��, �÷�2��,...)
4. constraint�� �߰� �ÿ� constraint ���� �����ϸ� ����Ŭ ������ �ڵ������� constraint ���� �ο��Ѵ�. �Ϲ������� constraint���� ���̺��_�÷���_constraint����'ó�� ����Ѵ�.
*/


--���� ���� ���
CREATE TABLE test0 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10)
);

INSERT INTO test0 (col1, col2) 
	VALUES (NULL, NULL);
COMMIT;

SELECT col1, col2
  FROM test0;



-------------------------------------------
--PK ���� �׽�Ʈ - (���̺� ������ ���� �߰�) �÷� ������ ����
CREATE TABLE test1 (
	col1 NUMBER(3) PRIMARY KEY
	,col2 VARCHAR2(10)
);

INSERT INTO test1 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test1 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test1 (col1, col2) 
	VALUES (3, NULL);
INSERT INTO test1 (col1, col2) 
	VALUES (2, 'ABCD');  --ORA-00001 (�ߺ��� ��ȣ �Է� �Ұ�)
INSERT INTO test1 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400 (NULL �Է� �Ұ�)
COMMIT;


DESC test1;
/*
�̸�   ��        ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(3)      -->PK ���� Ȯ�� �Ұ�
COL2          VARCHAR2(10) 
*/


--���� ���� Ȯ��
SELECT * FROM user_constraints;

SELECT * FROM user_constraints 
	WHERE table_name='TEST1'; --���̺� �̸� �빮��

--������ ������ �÷� Ȯ��
SELECT * FROM user_cons_columns
  WHERE table_name='TEST1'; --���̺� �̸� �빮��

--������ �ɸ� ������, �����, ���̺�, ��������, �÷� ���� Ȯ��
SELECT uc.owner, uc.constraint_name, uc.table_name, uc.constraint_type, ucc.column_name
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.constraint_name = ucc.constraint_name
    AND uc.table_name='TEST1';  --���̺� �̸� �빮��




-------------------------------
--PK ���� �׽�Ʈ -  (���̺� ������ ���� �߰�) ���̺� ������ ����
--> ������� ����ڰ� �����Ѵ�
--> ������� '���̺��_�÷���_PK' �������� �ۼ��Ѵ�.

CREATE TABLE test2 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10)
	,CONSTRAINT TEST2_COL1_PK PRIMARY KEY(col1)
);

INSERT INTO test2 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test2 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test2 (col1, col2) 
	VALUES (3, NULL);
INSERT INTO test2 (col1, col2) 
	VALUES (2, 'ABCD');  --ORA-00001
INSERT INTO test2 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400
COMMIT;

--������ �ɸ� ������, �����, ���̺�, ��������, �÷� ���� Ȯ��
SELECT uc.owner, uc.constraint_name, uc.table_name, uc.constraint_type, ucc.column_name
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.constraint_name = ucc.constraint_name
    AND uc.table_name='TEST2';  --���̺� �̸� �빮��


--------------------------------------
--PK ���� �׽�Ʈ - ���� �÷� PK ���� (����Ű)
CREATE TABLE test3 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10)
	,CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(col1, col2)
);

INSERT INTO test3 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test3 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test3 (col1, col2) 
	VALUES (3, NULL); --ORA-01400
INSERT INTO test3 (col1, col2) 
	VALUES (3, 'ABCD'); --col1�� �ٸ� ������, col2�� ���� ������
INSERT INTO test3 (col1, col2) 
	VALUES (2, 'KOREA'); --col1�� ���� ������, col2�� �ٸ� ������
INSERT INTO test3 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400
INSERT INTO test3 (col1, col2) 
	VALUES (2, 'ABCD'); --col1, col2 ��� ���� ������. ORA-00001

COMMIT;


----------------------------------
--***PK ���� �׽�Ʈ - ���̺� ���� �� ���� �߰�
CREATE TABLE test4 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10) 
);

--ALTER TABLE ���̺��
--	ADD CONSTRAINT ����� PRIMARY KEY(�÷���);

ALTER TABLE test4
	ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(col1);

INSERT INTO test4 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test4 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test4 (col1, col2) 
	VALUES (3, NULL);
INSERT INTO test4 (col1, col2) 
	VALUES (2, 'ABCD');  --ORA-00001
INSERT INTO test4 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400
COMMIT;

DROP TABLE test4;






----------------------------------------------------
--***FOREIGN KEY (FK)

/*
1. ���� Ű �Ǵ� �ܷ� Ű(FK)�� �� ���̺��� ������ �� ������ �����ϰ� ���� �����ϴ� �� ���Ǵ� ����
��. �� ���̺��� �⺻ Ű ���� �ִ� ���� �ٸ� ���̺� �߰��ϸ� ���̺� �� ������ ������ �� �ִ�. �� 
�� �� ��° ���̺� �߰��Ǵ� ���� �ܷ� Ű�� �ȴ�.
�ܷ� Ű�� ����� �÷����� ������ �Է½� �⺻ Ű �� ���� �������� �Է� ����.
2. �θ� ���̺��� ���� ������ �� �ڽ� ���̺�(foreign key�� �����ϴ� ���̺�)�� �����Ǿ�� �Ѵ�.
3.
�÷� ������ ����
�÷��� ������Ÿ�� CONSTRAINT constraint��
	REFERENCES ����_���̺�� (����_�÷���)
	[ON DELETE CASCADE | ON DELETE SET NULL]
���̺����� ����
�÷��� ������Ÿ��,
�÷��� ������Ÿ��,
...
CONSTRAINT constraint�� FOREIGN KEY(�÷�)
	REFERENCES ����_���̺�� (����_�÷���)
	[ON DELETE CASCADE | ON DELETE SET NULL]
    
    
���̺� ������ ���� �߰�
ALTER TABLE ���̺��
	ADD CONSTRAINT ����� FOREIGN KEY(�÷���)
			REFERENCES ����_���̺�� (����_�÷���);
4. FOREIGN KEY ���� �� ���ǻ���
- �����ϰ��� �ϴ� �θ� ���̺��� ���� �����ؾ� �Ѵ�.
- �����ϰ��� �ϴ� �÷��� PRIMARY KEY �Ǵ� UNIQUE ���������� �־�� �Ѵ�.
- ���̺� ���̿� PRIMARY KEY�� FOREIGN KEY�� ���� �Ǿ� ������, primary key ���� �� foreign key �÷��� �� ���� �ԷµǾ� ������ ������ �� �ȴ�. (��, FK ���� �� ON DELETE CASCADE�� ON DELETE SET NULL�ɼ��� ����� ��쿡�� �����ȴ�.)
- �θ� ���̺��� �����ϱ� ���ؼ��� �ڽ� ���̺��� ���� �����ؾ� �Ѵ�.
- ���� ���࿡ ���� �����ϴ� ���� ���� �������� �ʴ´�. ���������� ���� �����ؾ� �Ѵ�.
5. ���� ����
ALTER TABLE ���̺��
	DROP CONSTRAINT (����)�����;
--> �߸� ������ ������ �����Ϸ��� ���� �� �߰��ؾ� �Ѵ�.
*/

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
  VALUES (3, 'VICE PRES'); --X
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
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (3, 'kim', 3); --PK �ߺ� X. X
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (4, 'hwang', 5); --FK ��� ���� �ʰ�. X
COMMIT;

SELECT sid, name, e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
  
  
  
----------------------------------
--���� �м� ����

/*
1. SELECT *
  FROM user_constraints;
--CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
2.SELECT *
  FROM user_cons_columns;
--CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME  
3. SELECT *
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
  
  

-----------------------------------
/*
���� ���谡 �ִ� ���̺��� ������ �ȵǴ� ��찡 �ִ�.
���� �ϴ� �ʿ��� ���� ���� ROW�� �����ؾ� ���� ���ϴ� ���̺��� ������ �� �ִ�.
�Ǵ� CASCADE �ɼ��� �߰��ϸ� �ȴ�.
*/

CREATE TABLE test1 (
    col2 NUMBER --PK ����
);
--> ���� ���谡 ������ �Ŀ��� ���̺� ���� �Ұ�
--> FK ������ ������ �� ���̺� ���� �õ��ϸ� ���� ����
--> FK ������ �ִ� ���̺��� ���� �����ؾ� �ڱ� �ڽ� ���� ����
--> CASCADE �ɼ� ������ ���·� ���� �õ��ϸ� ���� ����


CREATE TABLE test2 (
    col2 NUMBER --FK ���� (���� ����)
);
--> ���� ���谡 ������ �Ŀ��� ���̺� ���� ����


--���� ���� ����
ALTER TABLE test1
    ADD CONSTRAINT test1_col2_pk PRIMARY KEY(col2);
ALTER TABLE test2
    ADD CONSTRAINT test2_col2_fk FOREIGN KEY(col2)
            REFERENCES test1(col2);

    
DROP TABLE test1;
--ORA-02449: unique/primary keys in table referenced by foreign keys
--> test1 ���̺��� ���� ���ϴ� �����̹Ƿ� ���� �Ұ�

DROP TABLE test1 CASCADE CONSTRAINTS;
--> test1 ���̺��� �����ȴ�. ���������� FK ������ ������ ��, ���̺� �����Ѵ�.

SELECT * FROM user_tables;
--> test2 ���̺��� �״�� ���� �ִ�. ��, FK ������ ������ �����̴�.

  
  
  
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

--employees ���̺��� '��浿' �ڷ� ���� �õ�. --O
DELETE FROM employees WHERE sid=2;

--employees ���̺� �ڷ� Ȯ��
SELECT * FROM employees;

--jobs ���̺� �ڷ� Ȯ��
SELECT * FROM jobs;

--jobs ���̺��� '����' �ڷ� ���� �õ�. --X
DELETE FROM jobs WHERE jikwi_id=1;

--jobs ���̺��� '���' �ڷ� ���� �õ�. --O
DELETE FROM jobs WHERE jikwi_id=3;

--jobs ���̺� �ڷ� Ȯ��
SELECT * FROM jobs;

--> ON DELETE CASCADE �ɼ� ������ �ʿ��մϴ�.
--> employees ���̺��� FK ���� ���� �� �ٽ� FK ���� ����
SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE �÷��� �� Ȯ�� -> NO_ACTION -> ON DELETE CASCADE �ɼ� ���� X -> �θ� row ������, �ڽ� row�� ���� �������� �ʴ´�. �⺻��.


--���� FK ���� ����
ALTER TABLE employees
    DROP CONSTRAINT SYS_C007031;
    
----------------------------
--ON DELETE CASCADE �ɼ� ���� ��
ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_JIKWI_ID_FK
		FOREIGN KEY (jikwi_id)
		REFERENCES jobs(jikwi_id)
		ON DELETE CASCADE;


SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE �÷��� �� Ȯ�� -> CASCADE -> ON DELETE CASCADE �ɼ� ���� O -> �θ� row ������, �ڽ� row�� ���� ������ �� �ִ�.

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
  



-----------------------------------------
--����)
--���°��� v1.0������ �ڷ��� Ŭ������ ���� ���̺� ���� �� ��ȸ ���� �ۼ�

/*
//�ڷ��� Ŭ���� ����
public class Account  {
    // �ڷ� �׸� ���� �ʵ� ����
	// ->���¹�ȣ, �����ְ�����ȣ, �����ܾ�, ���»�����, ��й�ȣ, �������ŷ���
	private String accountId;
	private String accountOwnerId;
	private int balance;
	private String accountCreateDate;
	private String pw;
	private String lastUpdateDate;
    
}
*/
--�غ�� �ڷ� ������ �´� ���̺� ����


--Account ���̺�
CREATE TABLE account_ (
    accountId VARCHAR2(10) --���¹�ȣ, '2017101001' ����
    ,accountOwnerId VARCHAR2(5) --�����ְ�����ȣ, 'A0001' ����
    --������ ��� ����
    
    
);

--AccountOwner ���̺�

--AccountHistory ���̺�


--���� ������ �Է� ����


COMMIT;

--���� ������ ��ȸ ����(SELECT)
--(��ü)������ȸ
/*
���¹�ȣ / �ܾ� / ���»����� / �������ŷ��� / ������ / ��ȭ��ȣ
2017101001 / 200000 / 20171010 / 20180101 / �ڱ浿 / 010-5678-1234
2018030101 / 40000 / 20180301 / 20180301 / ȫ�浿 / 010-1234-1234
*/
--(���¹�ȣ)������ȸ
/*
���¹�ȣ / �ܾ� / ���»����� / �������ŷ��� / ������ / ��ȭ��ȣ
2017101001 / 200000 / 20171010 / 20180101 / �ڱ浿 / 010-5678-1234
*/
--(������)������ȸ
/*
���¹�ȣ / �ܾ� / ���»����� / �������ŷ��� / ������ / ��ȭ��ȣ
2018030101 / 40000 / 20180301 / 20180301 / ȫ�浿 / 010-1234-1234
*/
--��������ݳ���
/*
���¹�ȣ / �ݾ� / ������� / ���� / �ܾ�
2018030101 / 10000 / 20180301 / �Ա� / 10000
2018030101 / 50000 / 20180301 / �Ա� / 60000
2018030101 / 20000 / 20180301 / ��� / 40000
*/
