-----------------------------------------------------------
--데이터베이스 객체

/*
1. 데이터베이스에 저장되는 것들은 테이블 외에 기타 여러 가지 것들이 저장되는데 이것을 데이터베이스 객체(Database Objects)라고 부른다.
2. TABLE
하나 또는 여러 컬럼(Column)들이 모여 하나의 레코드를 이루며, 이러한 레코드들이 모여 테이블이된다. 예를 들어 "사원" 테이블은 사번, 이름, 부서 등 여러 컬럼을 갖게 되고 사원수만큼의 레코드를 갖게 된다.
3.
CREATE 문
데이터베이스 내의 모든 객체를 생성할 때 사용하는 문장
ALTER 문
이미 생성된 객체의 구조를 변경 - ALTER가 지원이 안될경우 CREATE와 DROP를 이용하여 해야하지만, 많은 데이터가 사라질 위험이 있다.
DROP 문
생성된 객체를 삭제
=>주의) 관리자에 의해 RESOURCE 권한을 부여 받은 사용자만 작업 가능
*/

    
    
-----------------------------------------------
--테이블 관리

/*
***1. 새 테이블 생성
CREATE TABLE 테이블이름 (
	컬럼 자료형 [기타제약]
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
2. 기존 테이블 구조(컬럼명, 자료형) 확인
SELECT * 
  FROM user_tab_columns
  WHERE table_name='테이블명'; --테이블 이름 대문자로 표기할 것.
DESC 테이블이름;
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
SELECT * FROM members WHERE 1=0;  --조건 결과가 거짓이 나오도록 설정

DESC members;  --원본은 구조 외에 제약조건도 있다.
DESC members2; --사본은 구조만 복사되어 있다.

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
3. 기존 테이블 구조 복사해서 새 테이블 생성 (제약조건은 복사되지 않는다)
CREATE TABLE 새테이블명
AS
SELECT 컬럼리스트 FROM 기존테이블명 
WHERE 1=0; -- 일부러 false 만든다. 테이블 구조만 복사 하여 가져온다 ( 데이터는 없음)
*/

CREATE TABLE jobs
AS
SELECT * FROM hr.jobs WHERE 1=0;

SELECT * FROM jobs;
------------------------------------
/*
**4. 기존 테이블 구조 및 기존 자료 복사해서 새 테이블 생성 및 자료 입력 (제약조건은 복사되지 않는다)
CREATE TABLE 새테이블명
AS
SELECT 컬럼리스트 FROM 기존테이블명 [WHERE 조건식];
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
5. 기존 테이블에 새 열 추가
ALTER TABLE 기존테이블명
	ADD (열이름 자료형, ...);
--> 기존 테이블에 데이터가 있는 경우는 새로 만들어진 컬럼의 데이터는 NULL만 채워진다.
--> NULL이 채워진 컬럼에 자료를 채우려면 UPDATE 명령을 이용한다.
--> 컬럼 생성시 자동으로 기본값을 채우려면 DEFAULT 키워드를 이용한다.
*/

DESC members;
/*
MID   NOT NULL NUMBER        
NAME_          NVARCHAR2(10) 
PHONE          VARCHAR2(10) 
*/
--> 등록일(regDate) 컬럼 추가

ALTER TABLE members
	ADD (regDate DATE);
--> 컬럼은 추가되지만 자료는 NULL로 채워진다.

SELECT * FROM members;
--> regDate 컬럼은 NULL로 채워진 상태이다.
--> 자료를 입력하려면 UPDATE 쿼리 사용




--------------------------
/*
6. 기존 테이블에서 기존 열 자료형 변경
ALTER TABLE 기존테이블명
	MODIFY (기존열이름 새로운자료형);
--> 기존 테이블에 데이터가 있는 경우는 새로운 자료형이 기존 자료에 적합해야 한다.
*/

DESC members;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE 
*/
--> PHONE 컬럼의 크기 확장. 20->50

ALTER TABLE members
	MODIFY (phone VARCHAR2(50));
    
DESC members;
--> phone 컬럼의 크기 확인

SELECT * FROM members;
--> 기존 자료 그대로 남아 있다.




---------------------------------------
/*
7. 기존 테이블에서 기존 열 이름 변경
ALTER TABLE 기존테이블명
	RENAME COLUMN 기존열이름 TO 새열이름;
--> 기존 테이블에 데이터가 있어도 가능하다.
*/

DESC members;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE   
*/
--> phone 컬럼명은 tel 컬럼명으로 변경

ALTER TABLE members
	RENAME COLUMN phone TO tel;
    
DESC members;
--> 컬럼명이 변경되어 있다.




----------------------------------
/*
8. 기존 테이블에서 기존 열 삭제
ALTER TABLE 기존테이블명
	DROP (열이름, ...);
--> 기존 테이블에 기존 데이터가 같이 삭제된다. 복구 불가. 항상 조심해야한다. 
*/

DESC members;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE   
*/
--> regDate 컬럼을 삭제

ALTER TABLE members
	DROP (regDate);
    
DESC members;
--> 컬럼이 삭제되어 있다.




----------------------------------
/*
9. 기존 테이블 이름 변경
RENAME 기존테이블명 TO 새로운테이블명;
*/

SELECT * FROM user_tables;
--> INSA 테이블명을 EMP 테이블명으로 변경

SELECT * FROM insa;

RENAME insa TO emp;

SELECT * FROM emp;

RENAME score TO score_tbl;


----------------------------
/*
10. 기존 테이블 삭제 (휴지통 기능 있음)
DROP TABLE 테이블이름;
--> 테이블 삭제시 관련 객체(제약조건, 인덱스, 트리거 등)들이 같이 삭제된다.
--> 참조 관계가 있는 테이블은 제약조건에 따라서 삭제 안되는 경우가 있다.
--> 단독 테이블은 항상 삭제 가능.
*/

CREATE TABLE test1 (
    col NUMBER
);

INSERT INTO test1 (col) VALUES (1);
COMMIT;

SELECT * FROM test1;

SELECT * FROM user_tables;
--> test1 테이블 존재 확인

DROP TABLE test1;  --휴지통 사용. 복구 가능.

SELECT * FROM user_tables;
--> test1 테이블 삭제 확인

DROP TABLE test2;


------------------------------------------------
/*
--휴지통에 있는 객체 확인
SELECT *
	FROM recyclebin;
--휴지통에 있는 객체 복원 (테이블명은 휴지통 내에서 부여된 임시 객체명)
FLASHBACK TABLE 테이블명 TO BEFORE DROP;
--휴지통 비우기
PURGE recyclebin;
DROP TABLE 테이블이름 PURGE;
*/

SELECT *
	FROM recyclebin;
--> 삭제한 테이블 객체 확인 가능

FLASHBACK TABLE "BIN$3Md0r6iqQDqFXRUYJpJKdg==$0" TO BEFORE DROP;

SELECT * FROM user_tables;
--> 사용자 전용 테이블 존재 확인
SELECT * FROM ALL_tables;
--> 모든 사용자 테이블 존재 확인
SELECT * FROM DBA_tables;
--> 관리자 전용 
SELECT * FROM ALL_USERS;


SELECT * FROM test1;
--> 기존 자료 확인


--휴지통 비우기
PURGE recyclebin;
--> 복원 불가

--휴지통 기능을 거치지 않고 직접 삭제
DROP TABLE test1 PURGE;
--> 복원 불가

---------------------------------------------
--무결성

/*
1. 무결성에는 개체 무결성(Entity Integrity), 참조 무결성(Relational Integrity), 도메인 무결성(Domain Integrity)가 있다.
2. 개체 무결성
개체 무결성은 릴레이션에 저장되는 튜플(tuple)의 유일성을 보장하기 위한 제약조건이다.
3.참조 무결성
참조 무결성은 릴레이션 간의 데이터의 일관성을 보장하기 위한 제약조건이다.
4. 도메인 무결성
도메인 무결성은 속성에서 허용 가능한 값의 범위를 지정하기 위한 제약조건이다.
예를 들어, 학생 정보 저장용 테이블을 만든다면
--테이블 생성
CREATE TABLE member (     --테이블 이름 member
	sid NUMBER        --고유번호 저장용 컬럼
	,name VARCHAR2(10) --이름, 10글자만 허용
	,kor NUMBER(3)     --국어, 숫자 3자리만 허용(0~999). 0~100 제한.
	,eng NUMBER(3)     --영어, 숫자 3자리만 허용
	,mat NUMBER(3)     --수학, 숫자 3자리만 허용
);
5. 제약조건 종류
- PRIMARY KEY(PK) : 해당 컬럼 값은 반드시 존재해야 하며, 유일해야 함(NOT NULL과 UNIQUE 제약조건을 결합한 형태)
- FOREIGN KEY(FK) : 해당 컬럼 값은 참조되는 테이블의 컬럼 값 중의 하나와 일치하거나 NULL을 가짐
- UNIQUE(UK) : 테이블내에서 해당 컬럼 값은 항상 유일해야 함
- NOT NULL : 컬럼은 NULL 값을 포함할 수 없다.
- CHECK(CK) : 해당 컬럼에 저장 가능한 데이터 값의 범위나 조건 지정
*/



------------------------------------------------
--***PRIMARY KEY (PK)

/*
1. 테이블에 대한 기본 키를 생성한다.
2. 테이블에서 각 행을 유일하게 식별하는 컬럼 또는 컬럼의 집합이다. 기본 키는 테이블 당 하나만 존재한다. 그러나, 반드시 하나의 컬럼으로 만 구성되는 것은 아니다. NULL 값이 입력될 수 없고, 이미 테이블에 존재하고 있는 데이터를 다시 입력할 수 없다. UNIQUE INDEX가 자동으로 만들어 진다.
3.
컬럼 레벨의 형식
컬럼명 데이터타입 [CONSTRAINT constraint명] PRIMARY KEY
테이블 레벨의 형식
컬럼명 데이터타입,
컬럼명 데이터타입,
...
[CONSTRAINT constraint명] PRIMARY KEY(컬럼1명, 컬럼2명,...)
4. constraint를 추가 시에 constraint 명을 생략하면 오라클 서버가 자동적으로 constraint 명을 부여한다. 일반적으로 constraint명은 테이블명_컬럼명_constraint약자'처럼 기술한다.
*/


--제약 없는 경우
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
--PK 지정 테스트 - (테이블 생성시 제약 추가) 컬럼 레벨의 형식
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
	VALUES (2, 'ABCD');  --ORA-00001 (중복된 번호 입력 불가)
INSERT INTO test1 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400 (NULL 입력 불가)
COMMIT;


DESC test1;
/*
이름   널        유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(3)      -->PK 제약 확인 불가
COL2          VARCHAR2(10) 
*/


--제약 조건 확인
SELECT * FROM user_constraints;

SELECT * FROM user_constraints 
	WHERE table_name='TEST1'; --테이블 이름 대문자

--제약이 지정된 컬럼 확인
SELECT * FROM user_cons_columns
  WHERE table_name='TEST1'; --테이블 이름 대문자

--제약이 걸린 소유주, 제약명, 테이블, 제약종류, 컬럼 정보 확인
SELECT uc.owner, uc.constraint_name, uc.table_name, uc.constraint_type, ucc.column_name
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.constraint_name = ucc.constraint_name
    AND uc.table_name='TEST1';  --테이블 이름 대문자




-------------------------------
--PK 지정 테스트 -  (테이블 생성시 제약 추가) 테이블 레벨의 형식
--> 제약명을 사용자가 결정한다
--> 제약명은 '테이블명_컬럼명_PK' 형식으로 작성한다.

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

--제약이 걸린 소유주, 제약명, 테이블, 제약종류, 컬럼 정보 확인
SELECT uc.owner, uc.constraint_name, uc.table_name, uc.constraint_type, ucc.column_name
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.constraint_name = ucc.constraint_name
    AND uc.table_name='TEST2';  --테이블 이름 대문자


--------------------------------------
--PK 지정 테스트 - 다중 컬럼 PK 지정 (복합키)
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
	VALUES (3, 'ABCD'); --col1은 다른 데이터, col2는 같은 데이터
INSERT INTO test3 (col1, col2) 
	VALUES (2, 'KOREA'); --col1은 같은 데이터, col2는 다른 데이터
INSERT INTO test3 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400
INSERT INTO test3 (col1, col2) 
	VALUES (2, 'ABCD'); --col1, col2 모두 같은 데이터. ORA-00001

COMMIT;


----------------------------------
--***PK 지정 테스트 - 테이블 생성 후 제약 추가
CREATE TABLE test4 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10) 
);

--ALTER TABLE 테이블명
--	ADD CONSTRAINT 제약명 PRIMARY KEY(컬럼명);

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
1. 참조 키 또는 외래 키(FK)는 두 테이블의 데이터 간 연결을 설정하고 강제 적용하는 데 사용되는 열이
다. 한 테이블의 기본 키 값이 있는 열을 다른 테이블에 추가하면 테이블 간 연결을 설정할 수 있다. 이 
때 두 번째 테이블에 추가되는 열이 외래 키가 된다.
외래 키가 적용된 컬럼에는 데이터 입력시 기본 키 값 범위 내에서만 입력 가능.
2. 부모 테이블이 먼저 생성된 후 자식 테이블(foreign key를 포함하는 테이블)이 생성되어야 한다.
3.
컬럼 레벨의 형식
컬럼명 데이터타입 CONSTRAINT constraint명
	REFERENCES 참조_테이블명 (참조_컬럼명)
	[ON DELETE CASCADE | ON DELETE SET NULL]
테이블레벨의 형식
컬럼명 데이터타입,
컬럼명 데이터타입,
...
CONSTRAINT constraint명 FOREIGN KEY(컬럼)
	REFERENCES 참조_테이블명 (참조_컬럼명)
	[ON DELETE CASCADE | ON DELETE SET NULL]
    
    
테이블 생성후 제약 추가
ALTER TABLE 테이블명
	ADD CONSTRAINT 제약명 FOREIGN KEY(컬럼명)
			REFERENCES 참조_테이블명 (참조_컬럼명);
4. FOREIGN KEY 생성 시 주의사항
- 참조하고자 하는 부모 테이블을 먼저 생성해야 한다.
- 참조하고자 하는 컬럼이 PRIMARY KEY 또는 UNIQUE 제약조건이 있어야 한다.
- 테이블 사이에 PRIMARY KEY와 FOREIGN KEY가 정의 되어 있으면, primary key 삭제 시 foreign key 컬럼에 그 값이 입력되어 있으면 삭제가 안 된다. (단, FK 선언 때 ON DELETE CASCADE나 ON DELETE SET NULL옵션을 사용한 경우에는 삭제된다.)
- 부모 테이블을 삭제하기 위해서는 자식 테이블을 먼저 삭제해야 한다.
- 서로 제약에 의해 참조하는 경우는 서로 삭제되지 않는다. 제약조건을 먼저 삭제해야 한다.
5. 제약 삭제
ALTER TABLE 테이블명
	DROP CONSTRAINT (참조)제약명;
--> 잘못 지정된 제약을 수정하려면 삭제 후 추가해야 한다.
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
  VALUES (3, 'choi', 2); --FK 중복 허용. O
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (3, 'kim', 3); --PK 중복 X. X
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (4, 'hwang', 5); --FK 허용 범위 초과. X
COMMIT;

SELECT sid, name, e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
  
  
  
----------------------------------
--제약 분석 쿼리

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
SELECT utc.table_name AS table_name --제약이 지정된 테이블명
	, utc.column_name AS column_name --제약이 지정된 컬럼명
	, data_type   --제약이 지정된 컬럼의 자료형
	, data_length   --제약이 지정된 컬럼의 크기(length)
	, data_precision   --제약이 지정된 컬럼의 크기(precision)
	, nullable    --제약이 지정된 컬럼의 NULL 허용 여부
	, data_default    --제약이 지정된 컬럼의 DEFAULT 값
	, constraint_name    --제약명
	, constraint_type     --제약종류
	, search_condition  --CHECK 제약인 경우 조건식
	, delete_rule    --FOREIGN KEY 제약인 경우 ON DELETE CASCADE 지정 여부
	, r_table_name   --FOREIGN KEY 제약인 경우 참조 테이블명
	, r_conlumn_name   --FOREIGN KEY 제약인 경우 참조 컬럼명
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
  
  
--특정 테이블에 추가된 제약의 종류 확인하는 쿼리  
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
  
  

--특정 테이블에 추가된 제약의 종류 확인하는 쿼리  -> 뷰로 등록 (뷰 생성 권한 필요)
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
  

--뷰 등록후 제약 조건 확인 쿼리 실행
SELECT *  
    FROM constraintsCheckView
  WHERE table_name='EMPLOYEES';
  
  

-----------------------------------
/*
참조 관계가 있는 테이블은 삭제가 안되는 경우가 있다.
참조 하는 쪽에서 먼저 관련 ROW를 삭제해야 참조 당하는 테이블을 삭제할 수 있다.
또는 CASCADE 옵션을 추가하면 된다.
*/

CREATE TABLE test1 (
    col2 NUMBER --PK 제약
);
--> 참조 관계가 설정된 후에는 테이블 삭제 불가
--> FK 제약을 제거한 후 테이블 삭제 시도하면 삭제 가능
--> FK 제약이 있는 테이블을 먼저 삭제해야 자기 자신 삭제 가능
--> CASCADE 옵션 지정한 상태로 삭제 시도하면 삭제 가능


CREATE TABLE test2 (
    col2 NUMBER --FK 제약 (참조 관계)
);
--> 참조 관계가 설정된 후에도 테이블 삭제 가능


--참조 관계 설정
ALTER TABLE test1
    ADD CONSTRAINT test1_col2_pk PRIMARY KEY(col2);
ALTER TABLE test2
    ADD CONSTRAINT test2_col2_fk FOREIGN KEY(col2)
            REFERENCES test1(col2);

    
DROP TABLE test1;
--ORA-02449: unique/primary keys in table referenced by foreign keys
--> test1 테이블은 참조 당하는 입장이므로 삭제 불가

DROP TABLE test1 CASCADE CONSTRAINTS;
--> test1 테이블은 삭제된다. 내부적으로 FK 제약을 삭제한 후, 테이블 삭제한다.

SELECT * FROM user_tables;
--> test2 테이블은 그대로 남아 있다. 단, FK 제약은 삭제된 상태이다.

  
  
  
-------------------------------------------------------
--ON DELETE CASCADE 옵션
-- FK 제약 지정시 부모 테이블의 row(PK)가 삭제될 때 자식 테이블의 row(FK)의 삭제 여부 결정




---------------------------
--ON DELETE CASCADE 옵션 지정 전
CREATE TABLE jobs (
	jikwi_id NUMBER
	,jikwi_name VARCHAR2(10)
	,CONSTRAINT JOBS_JIKWI_ID_PK PRIMARY KEY(jikwi_id)
);

INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (1, '과장');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (2, '대리');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (3, '사원');
COMMIT;


--FK 제약 지정
CREATE TABLE employees (
	sid NUMBER PRIMARY KEY
	,name VARCHAR2(10) 
	,jikwi_id NUMBER REFERENCES jobs(jikwi_id)
);

INSERT INTO employees (sid, name, jikwi_id)
	VALUES (1, '홍길동', 1);
INSERT INTO employees (sid, name, jikwi_id)
	VALUES (2, '김길동', 2);
COMMIT;

--employees 테이블 자료 확인
SELECT * FROM employees;

--employees 테이블에서 '김길동' 자료 삭제 시도. --O
DELETE FROM employees WHERE sid=2;

--employees 테이블 자료 확인
SELECT * FROM employees;

--jobs 테이블 자료 확인
SELECT * FROM jobs;

--jobs 테이블에서 '과장' 자료 삭제 시도. --X
DELETE FROM jobs WHERE jikwi_id=1;

--jobs 테이블에서 '사원' 자료 삭제 시도. --O
DELETE FROM jobs WHERE jikwi_id=3;

--jobs 테이블 자료 확인
SELECT * FROM jobs;

--> ON DELETE CASCADE 옵션 지정이 필요합니다.
--> employees 테이블에서 FK 제약 제거 후 다시 FK 제약 지정
SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE 컬럼의 값 확인 -> NO_ACTION -> ON DELETE CASCADE 옵션 지정 X -> 부모 row 삭제시, 자식 row가 같이 삭제되지 않는다. 기본값.


--기존 FK 제약 삭제
ALTER TABLE employees
    DROP CONSTRAINT SYS_C007031;
    
----------------------------
--ON DELETE CASCADE 옵션 지정 후
ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_JIKWI_ID_FK
		FOREIGN KEY (jikwi_id)
		REFERENCES jobs(jikwi_id)
		ON DELETE CASCADE;


SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE 컬럼의 값 확인 -> CASCADE -> ON DELETE CASCADE 옵션 지정 O -> 부모 row 삭제시, 자식 row가 같이 삭제될 수 있다.

SELECT * FROM jobs;
SELECT * FROM employees;
        
--jobs 테이블에서 '과장' 자료 삭제 시도. --O
DELETE FROM jobs WHERE jikwi_id=1;
--> employees 테이블의 자료가 같이 삭제된다.

SELECT * FROM jobs;
SELECT * FROM employees;



--DELETE_RULE 확인을 위한 사용자 뷰 생성
CREATE OR REPLACE VIEW constraintsCheckView
AS
SELECT utc.table_name AS table_name --제약이 지정된 테이블명
	, utc.column_name AS column_name --제약이 지정된 컬럼명
	, data_type   --제약이 지정된 컬럼의 자료형
	, data_length   --제약이 지정된 컬럼의 크기(length)
	, data_precision   --제약이 지정된 컬럼의 크기(precision)
	, nullable    --제약이 지정된 컬럼의 NULL 허용 여부
	, data_default    --제약이 지정된 컬럼의 DEFAULT 값
	, constraint_name    --제약명
	, constraint_type     --제약종류
	, search_condition  --CHECK 제약인 경우 조건식
	, delete_rule    --FOREIGN KEY 제약인 경우 ON DELETE CASCADE 지정 여부
	, r_table_name   --FOREIGN KEY 제약인 경우 참조 테이블명
	, r_conlumn_name   --FOREIGN KEY 제약인 경우 참조 컬럼명
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

--뷰 등록후 제약 조건 확인 쿼리 실행
SELECT *  
    FROM constraintsCheckView
  WHERE table_name='EMPLOYEES';
  



-----------------------------------------
--문제)
--계좌관리 v1.0에서의 자료형 클래스에 대한 테이블 생성 및 조회 쿼리 작성

/*
//자료형 클래스 선언
public class Account  {
    // 자료 항목에 따른 필드 구성
	// ->계좌번호, 계좌주고유번호, 현재잔액, 계좌생성일, 비밀번호, 마지막거래일
	private String accountId;
	private String accountOwnerId;
	private int balance;
	private String accountCreateDate;
	private String pw;
	private String lastUpdateDate;
    
}
*/
--준비된 자료 구조에 맞는 테이블 생성


--Account 테이블
CREATE TABLE account_ (
    accountId VARCHAR2(10) --계좌번호, '2017101001' 형식
    ,accountOwnerId VARCHAR2(5) --계좌주고유번호, 'A0001' 형식
    --나머지 멤버 구성
    
    
);

--AccountOwner 테이블

--AccountHistory 테이블


--샘플 데이터 입력 쿼리


COMMIT;

--샘플 데이터 조회 쿼리(SELECT)
--(전체)계좌조회
/*
계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호
2017101001 / 200000 / 20171010 / 20180101 / 박길동 / 010-5678-1234
2018030101 / 40000 / 20180301 / 20180301 / 홍길동 / 010-1234-1234
*/
--(계좌번호)계좌조회
/*
계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호
2017101001 / 200000 / 20171010 / 20180101 / 박길동 / 010-5678-1234
*/
--(계좌주)계좌조회
/*
계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호
2018030101 / 40000 / 20180301 / 20180301 / 홍길동 / 010-1234-1234
*/
--계좌입출금내역
/*
계좌번호 / 금액 / 입출금일 / 구분 / 잔액
2018030101 / 10000 / 20180301 / 입금 / 10000
2018030101 / 50000 / 20180301 / 입금 / 60000
2018030101 / 20000 / 20180301 / 출금 / 40000
*/
