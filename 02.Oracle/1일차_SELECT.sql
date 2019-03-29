/*
DB(Database) : 물리적 저장소에 저장된 자료 집합
DBMS(Database Management System) : DB 운영 전용 소프트웨어. 대표적으로 Oracle, MySQL, ...
SQL : DBMS에서 사용하는 (표준)명령어 집합
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
특정 테이블(자료에 물리적 저장소)에 대한 조회 명령
주의)적절한 권한(CONNECT, RESOURCE role + SELECT ANY TABLE)이 부여된 경우만 조회 가능
SELECT [컬럼명] 
    FROM [테이블명];
특정 테이블의 자료 조회
컬럼명 나열시 *(와일드카드) 사용 가능
SELECT column1, column2....columnN
    FROM   table_name
    WHERE  condition
    GROUP BY column_name
    HAVING (arithematic function condition)
    ORDER BY column_name {ASC|DESC};
    
*/



--------------------------------------------
--모든 컬럼 조회하기
--> 컬럼 리스트에 *(와일드 카드) 사용

--hr 계정의 employees 테이블에 대한 SELECT 쿼리 실행
SELECT * 
    FROM hr.employees;
    
--hr 계정의 departments 테이블에 대한 SELECT 쿼리 실행
SELECT *  
    FROM hr.departments;


--------------------------------------------
--원하는 컬럼 조회하기
--> 컬럼 리스트에 column1, column2....columnN 나열
--> 예를 들어, 직원번호, 이름, 전화번호 항목만 조회

SELECT employee_id, first_name, last_name, phone_number
    FROM hr.employees;