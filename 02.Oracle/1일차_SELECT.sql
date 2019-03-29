/*
DB(Database) : ������ ����ҿ� ����� �ڷ� ����
DBMS(Database Management System) : DB � ���� ����Ʈ����. ��ǥ������ Oracle, MySQL, ...
SQL : DBMS���� ����ϴ� (ǥ��)��ɾ� ����
SQL is a language to operate databases; it includes database creation, deletion, fetching rows, modifying rows, etc. 
DDL - Data Definition Language
CREATE
ALTER
DROP
DML - Data Manipulation Language
SELECT
INSERT
UPDATE
DELETE
DCL - Data Control Language
GRANT
REVOKE
*/


/*
Ư�� ���̺�(�ڷῡ ������ �����)�� ���� ��ȸ ���
����)������ ����(CONNECT, RESOURCE role + SELECT ANY TABLE)�� �ο��� ��츸 ��ȸ ����
SELECT [�÷���] 
    FROM [���̺��];
Ư�� ���̺��� �ڷ� ��ȸ
�÷��� ������ *(���ϵ�ī��) ��� ����
SELECT column1, column2....columnN
    FROM   table_name
    WHERE  condition
    GROUP BY column_name
    HAVING (arithematic function condition)
    ORDER BY column_name {ASC|DESC};
    
*/



--------------------------------------------
--��� �÷� ��ȸ�ϱ�
--> �÷� ����Ʈ�� *(���ϵ� ī��) ���

--hr ������ employees ���̺� ���� SELECT ���� ����
SELECT * 
    FROM hr.employees;
    
--hr ������ departments ���̺� ���� SELECT ���� ����
SELECT *  
    FROM hr.departments;


--------------------------------------------
--���ϴ� �÷� ��ȸ�ϱ�
--> �÷� ����Ʈ�� column1, column2....columnN ����
--> ���� ���, ������ȣ, �̸�, ��ȭ��ȣ �׸� ��ȸ

SELECT employee_id, first_name, last_name, phone_number
    FROM hr.employees;