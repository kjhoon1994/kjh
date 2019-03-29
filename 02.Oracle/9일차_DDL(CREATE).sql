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


----------------------------------------------
--���̺� �ۼ�

/*
1. ���̺��� ���� �����ͺ��̽��� ������ ������ ���� �̿�Ǵ� ��ü�̸�, ��� �� �� ���� spread sheet�� ����� ������� �����͸� ǥ���Ѵ�.

���� ���, ���� ���� ����� ���̺��� �ִٸ�
column  column  column column column
��ȣ(PK) �̸�     ����   ����   ����
1        ȫ�浿   100    100    100    -> row
2        �ڱ浿    90     80     90    -> row
3        �ֱ浿   100     70     80    -> row

2.
CREATE [GLOBAL TEMPORARY] TABLE [��Ű��.]���̺�_�̸� (
	��_�̸� ������Ÿ�� [DEFAULT ǥ����] [��������]
	[, ��_�̸� ������Ÿ�� [DEFAULT ǥ����] [��������] ]
	[ ,...]
);

���̺� ������ PK ������ ������ �� �ִ� �÷��� �ݵ�� �߰��� ��.

���� ���, ���� ���� ����� ���̺��� ����ٸ�
--���̺� ����
CREATE TABLE sungjuk (
  sid NUMBER --������ȣ ����� �÷�(PK). �ʼ� �׸�.
  ,name VARCHAR2(20) --�̸� ����� �÷�. ������ 20�� �̳�. �ѱ� ����� NVARCHAR2(20) �ѱ� 20�� �̳�.
  ,kor NUMBER(3) --���� ���� ����� �÷�. 0~100
  ,eng NUMBER(3) --���� ���� ����� �÷�. 0~100
  ,mat NUMBER(3) --���� ���� ����� �÷�. 0~100
);

--���̺� ���� Ȯ��
SELECT * FROM user_tables;

*/




-------------------------------------------
--������ Ÿ��(�ڷ���)

/*
1. ����Ŭ�� �����ϴ� ������ Ÿ���� ���� ���� �����ϴ� ��Į�� ������ Ÿ��, ���� ���� �����͸� ������ �� �ִ� �÷��� ������ Ÿ�� �׸���, �÷��� �ٸ� ���̺� ��ü�� �����ϴ� ���� ������ Ÿ�����ִ�.

2. VARCHAR2
���� : VARCHAR2(n)
���� ���� ���� �����͸� �����ϸ� �ִ� ���̴� 4000���̰�, �ݵ�� ���̸� ����ؾ� �Ѵ�.
NLS(������ ��� ����)�� �ѱ۰� ������ ����
VARCHAR �� �ִ� 2000�� ���ڸ� �����ϸ� VARCHAR2�ʹ� �ٸ��� VARCHAR(10)�� �����ϸ� null�� ä�� �����δ� 10���� ������ ����Ѵ�. ������ VARCHAR2(10)�� �ʿ��� ���ڱ����� �����ϴ� variable length�̸� �ִ� 4000�� ���ڱ��� ������ �� �ִ�.

�ѱ� ����� NVARCHAR2(n) �ڷ���


3. NUMBER
���� : NUMBER(P, S)
P(1~38)�� ���е��� ��ü �ڸ����� ��Ÿ���� �⺻ ���� 38�̰� S(-84~127)�� �Ҽ��� ������ �ڸ����̴�.
������ �Ǽ� �����ϱ� ���� ���������� ǥ�� ���� �����̴�.

4. DATE
����/��/�� ��:��:�ʡ����� �����ϸ�, �⺻������ ��/��/�� ������ ����Ѵ�.
*/



-------------------------------------------------
--INSERT

/*
1. INSERT ���� ���̺� �� ��(row)�� �߰��ϴµ� �̿��ϸ�, single table insert�̳� multi table insert�� ������ �� �ִ�.

Single table insert : ���� �ϳ��� ���̺��̳� �信 ���� �ϳ��� ��(row)�� ������ ������ �� �ִ�.

Multi table insert : �ϳ� �̻��� ���̺�κ��� ���� ������ ���� ���� ��(row)�� �����ϴ� ����̴�.

2.
INSERT INTO ���̺�_�� [(�÷�_��1, �÷�_��2, ...)] VALUES (��1, ��2, ...);

����) �÷���� ���� ���� ��ġ(����, ����, �ڷ���)�ؾ� �Ѵ�.
����) INSERT ��� ����� �޸𸮿����� �Էµ� �����̹Ƿ�, ������ ������ �ʿ��ϸ� COMMIT; ��� ���� �ʿ�.
*/


----------------------------------
--���� ����

/*
Primary key - ������ ���� �����ϴ� ����. �ߺ��� �ڷᰡ �Էµ��� �ʵ��� �����ϴ� ����.

���� �߰� ����� ���̺� ������, ���̺� ������ ���� �߰� ����.

ALTER TABLE ���̺��
    ADD [CONSTRAINT �����] PRIMARY KEY(�÷���);

������� ����ڰ� �ۼ��ϴ� ���� �����Ѵ�.

*/




--------------------------------------
--���� ���̺� ���� ����
--�̸�, ��ȭ��ȣ ����� ���̺� ����
--PK(������ ���� �����ϴ� ����) �÷� �߰� �ʿ�
/*
CREATE TABLE ���̺�� (
    �÷� �ڷ���
    , �÷� �ڷ���
    , ...
);
*/


CREATE TABLE members (
    mid NUMBER   --PK ����. ���� ����.
    , name_ NVARCHAR2(10)  --�ѱ�, ������ ����. 10�� �̳�.
    , phone VARCHAR2(10) --������ ����. 10�� �̳�.
);

--PK ���� �߰�
--����� �ۼ��� '���̺��_�÷���_��������' ǥ�� ����
ALTER TABLE members
    ADD CONSTRAINT members_mid_pk PRIMARY KEY(mid);
    

--������ ���̺� Ȯ��
SELECT * 
    FROM user_tables;
    
--������ ���̺� ����(�÷���, �ڷ���, null ����) Ȯ��
DESC members;

--������ ���̺� ���� ������ �Է�
INSERT INTO members (mid, name_, phone) VALUES (1, 'ȫ�浿', '1234');
INSERT INTO members (mid, name_, phone) VALUES (2, '�ڱ浿', '5678');
COMMIT;

--������ ���̺� �Էµ� �ڷ� Ȯ��
SELECT mid, name_, phone
    FROM members;






----------------------------------------
--NUMBER �ڷ��� �׽�Ʈ
CREATE TABLE test1 (
	col1 NUMBER       --38�ڸ�
	,col2 NUMBER(3)   --3�ڸ�
	,col3 NUMBER(5,2) --5�ڸ�, �Ҽ� ���� 2�ڸ�
);

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123, 123);  --123, 123, 123
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123.45, 123.45); --123, 123, 123.45
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123.456, 123.456); --123, 123, 123.46
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 1234, 1234); --ORA-01438: value larger than specified precision allowed for this column
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123, 123456); --ORA-01438: value larger than specified precision allowed for this column
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123, 123.456); --123, 123, 123.46
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123456789000, 123, 123.45); --123456789000, 123, 123.46
SELECT * FROM test1;

COMMIT; --or ROLLBACK;

DROP TABLE test1;





----------------------------------
--VARCHAR2 �ڷ��� �׽�Ʈ
CREATE TABLE test2 (
	col0 VARCHAR2     --ORA-00906: missing left parenthesis
);
--> ���̺� ���� ����

CREATE TABLE test2 (
	col0 VARCHAR2(5000)     --ORA-00910: specified length too long for its datatype
);
--> ���̺� ���� ����

CREATE TABLE test2 (
	col1 VARCHAR2(1)     --1����(����, ���� ����)
	,col2 VARCHAR2(10)   --10����(10byte)
	,col3 VARCHAR2(4000) --MAX
);
-->���̺� ���� ����


INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', 'TEST', 'TEST');
SELECT * FROM test2;

INSERT INTO test2 (col1, col2, col3)
	VALUES ('TEST', 'TEST', 'TEST');  --ORA-12899: value too large for column "MINJONG"."TEST2"."COL1" (actual: 4, maximum: 1)
SELECT * FROM test2;



INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', 'ȫ�浿', 'ȫ�浿');
SELECT * FROM test2;

INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', '���ѹα�', '���ѹα�');  --ORA-12899: value too large for column "MINJONG"."TEST2"."COL2" (actual: 12, maximum: 10)
SELECT * FROM test2;

COMMIT;

DROP TABLE test2;





-----------------------------------
--NVARCHAR2 �ڷ��� �׽�Ʈ
CREATE TABLE test3 (
	col1 NVARCHAR2(1)     --1����(�ѱ�, ����, ���� ����)
	,col2 NVARCHAR2(10)   --10����
	,col3 NVARCHAR2(2000) --MAX
);
-->���̺� ���� ����

INSERT INTO test3 (col1, col2, col3)
	VALUES ('T', '���ѹα�', '���ѹα�');
SELECT * FROM test3;

COMMIT;

DROP TABLE test3;





---------------------------------------
--DATE �ڷ��� �׽�Ʈ
CREATE TABLE test4 (
	col1 DATE     --��/��/�� ��:��:�� ����
	,col2 DATE
);

--��¥�� �ð� ���� ��� ����ǹǷ� 
--SYSDATE�� ���� ���� �ð����� ����ȴ�.
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, TO_DATE('20120118')); --���ڸ� ��¥������ ��ȯ
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, '20120118'); --���ڸ� �ڵ� ����ȯ
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, SYSDATE);
COMMIT;

SELECT * FROM test4; --��/��/�ϸ� ��µ�.
SELECT TO_CHAR(col1, 'YYYY-MM-DD HH24:MI:SS') AS col1
	,TO_CHAR(col2, 'YYYY-MM-DD HH24:MI:SS') AS col2
	FROM test4; --��-��-�� ��:��:�ʷ� ��µ�

SELECT TO_CHAR(col1, 'HH24:MI') AS col1
	,TO_CHAR(col2, 'YYYY-MM-DD') AS col2
	FROM test4; --��-��-�� ��:��:�ʷ� ��µ�

DROP TABLE test4;




------------------------------------------------
--���� ó���� �ڷ� ���� ���̺� ����
CREATE TABLE score (
    sid_ VARCHAR2(4)   --G001, G002, ...
    , name_ VARCHAR2(20) --hong, park, choi, ...
    , sub1 NUMBER(3)  --0~100
    , sub2 NUMBER(3)  --0~100
    , sub3 NUMBER(3)  --0~100
);

INSERT INTO score (sid_, name_, sub1, sub2, sub3)
     VALUES ('G001', 'HONG', 60, 80, 90);
INSERT INTO score (sid_, name_, sub1, sub2, sub3)
     VALUES ('G002', 'PARK', 80, 95, 90);
INSERT INTO score (sid_, name_, sub1, sub2, sub3)
     VALUES ('G003', 'CHOI', 100, 85, 90);
INSERT INTO score (sid_, name_, sub1, sub2, sub3)
     VALUES ('G004', 'KIM', 90, 95, 80);
COMMIT;

--��ü ���
SELECT sid_, name_, sub1, sub2, sub3
    --����, ���, ����
    FROM score
    ORDER BY sid_;

--�˻� ���
SELECT sid_, name_, sub1, sub2, sub3
    --����, ���, ����
    FROM score
    WHERE LOWER(sid_) = LOWER('G001')
    ORDER BY sid_;
SELECT sid_, name_, sub1, sub2, sub3
    --����, ���, ����
    FROM score
    WHERE INSTR(LOWER(name_), LOWER('Hong')) > 0
    ORDER BY sid_;

--�ڷ� �Ǽ� ���
SELECT COUNT(*) count_
    FROM score;


--����, ��� ���
SELECT sid_, name_, sub1, sub2, sub3
    , (sub1 + sub2 + sub3) tot
    , ROUND((sub1 + sub2 + sub3) / 3, 1) ave
    FROM score
    ORDER BY sid_;


--���� ���
SELECT sid_, name_, sub1, sub2, sub3
    , (sub1 + sub2 + sub3) tot
    , ROUND((sub1 + sub2 + sub3) / 3, 1) ave
    , DENSE_RANK() OVER
          (ORDER BY (sub1 + sub2 + sub3) DESC) rank_
    FROM score
    ORDER BY sid_;
    
    
    
    
-----------------------------------------------
--����) �Ʒ��� ���� ������ �ڷᰡ ����� �� �ִ� ���̺� ����
--�ڷ� �Է�, ���, �˻� ���� �ۼ�
--��ȣ(S001, S002, ...), ��¥(YYYY-MM-DD), ����(200�� �̳�)
--�˻� ������ 1.�������� 2.Ư�������� 3.Ư�������� 4.Ư���ܾ��������� 5.��ü���� 
--��½� ��¥ ���� ���� ����Ѵ�
/*
---------------------
��ȣ / ��¥ / ����
S001 / 2018-01-01 / ����
S002 / 2018-02-16 / ����
S003 / 2018-03-01 / ������
S004 / 2018-05-05 / ��̳�
S005 / 2018-05-22 / ��ó�Կ��ų�
S006 / 2018-06-06 / ������
S012 / 2018-07-19 / �������� ���α׷� �ۼ�
S007 / 2018-08-15 / ������
S008 / 2018-09-24 / �߼�
S009 / 2018-10-03 / ��õ��
S011 / 2018-10-09 / �ѱ۳�
S010 / 2018-12-25 / ��ź��
�� 12��
*/
    
    
CREATE TABLE schedule(
    sid_ VARCHAR(4)
    , wdate DATE
    , content_ NVARCHAR2(200)
);

INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S001', '2018-01-01', '����');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S002', '2018-02-16', '����');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S003', '2018-03-01', '������');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S004', '2018-05-05', '��̳�');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S005', '2018-05-22', '��ó�Կ��ų�');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S006', '2018-06-06', '������');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S007', '2018-08-15', '������');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S008', '2018-09-24', '�߼�');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S009', '2018-10-03', '��õ��');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S010', '2019-10-09', '�ѱ۳�');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S011', '2019-03-28', '�������� v2.0 ����Ŭ ����');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S012', '2018-07-19', '�������� ���α׷� �ۼ�');

COMMIT; 

--��ü ���� ���
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    ORDER BY wdate;



--���� ���� �˻�
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    WHERE INSTR(wdate, SYSDATE) > 0;
   
 

--Ư���� ���� ���
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    WHERE INSTR(TO_CHAR(wdate,'YYYY-MM-DD'),'2019-10-09') > 0;
    


--Ư���� ���� ���
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    WHERE INSTR(TO_CHAR(wdate,'YYYY-MM'), '2018-05') > 0
    ORDER BY wdate;
    


--Ư���ܾ���������
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    WHERE INSTR(LOWER(content_), LOWER('����')) > 0
    ORDER BY wdate;
    


DROP TABLE schedule;