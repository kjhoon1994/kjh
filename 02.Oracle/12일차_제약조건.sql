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
이미 생성된 객체의 구조를 변경
DROP 문
생성된 객체를 삭제
=>주의) 관리자에 의해 RESOURCE 권한을 부여 받은 사용자만 작업 가능
*/

    
---------------------------------------------
--무결성

/*
1. 무결성에는 개체 무결성(Entity Integrity), 참조 무결성(Relational Integrity), 도메인 무결성(Domain Integrity)가 있다.
2. 개체 무결성
7개체 무결성은 릴레이션에 저장되는 튜플(tuple)의 유일성을 보장하기 위한 제약조건이다.
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
--중복 불가, NULL 허용, 테이블 내에서 여러번 지정 가능

----------------------
CREATE TABLE table1 (-- NOT NULL은 여기에서 선언을 해준다.
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
    VALUES ('1234', 'HELLO');  --ORA-00001: unique constraint (MINJONG.TABLE1_COL2_UK) violated 중복 불가.
INSERT INTO table1 (col2)
    VALUES ('SAMPLE');          --ORA-01400: cannot insert NULL into ("WOGNS"."TABLE1"."COL1") NULL 허용 불가
COMMIT;

SELECT col1, col2
    FROM table1;


    
 
-------------------------------
--CHECK
-- 조건 지정에 의한 입력 범위 제한
-- ALTER TABLE로 설정 가능 -- 나중에도 설정가능하지만 , 전에 입력되어 있는 데이터가 제약조건을 만족해야하는 조건이 있음.
----------------------
CREATE TABLE table2 (
    col1 VARCHAR2(10) 
    ,col2 VARCHAR2(10)
);

ALTER TABLE table2
    ADD CONSTRAINT table2_col1_pk PRIMARY KEY(col1);
ALTER TABLE table2
    ADD CONSTRAINT table2_col2_ck CHECK(col2 IN ('JAVA', 'ORACLE', 'HTML', 'CSS')); -- NULL 허용 나머지 데이터는 입력거부

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
--DEFAULT 키워드
--사용자가 명시적인 값을 입력하지 않는 경우
--자동으로 지정된 값을 입력하는 설정
--NOT NULL 제약 지정된 컬럼에 자동으로 값 입력시 유용.

CREATE TABLE table3 (
    col1 VARCHAR2(10) 
    ,col2 VARCHAR2(10) DEFAULT 'NOTHING'
);

ALTER TABLE table3
    ADD CONSTRAINT table3_col1_pk PRIMARY KEY(col1);

INSERT INTO table3 (col1, col2)
    VALUES ('TEST', 'JAVA');
INSERT INTO table3 (col1)
    VALUES ('ABC');     -- col2에는 데이터를 입력하지 않아 원래는 NULL값이 들어가지만 default 조건 때문에 NOTHING이 들어가게 된다.
COMMIT;

SELECT col1, col2
    FROM table3;
    
    
----------------------------------
-- 제약 조건 수정
--> 제약 조건 삭제(ALTER TABLE ... DROP CONSTRAINT...) 후 추가(ATER TABLE ... ADD CONSTRAINT...)만 가능
--> NOT NULL은 ALTER TABLE ... MODIFY ... 명령으로 수정합니다.
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
--제약 분석 쿼리

/*
1. SELECT * -- 제약의 종류
  FROM user_constraints;
--CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
2.SELECT *  -- 제약이 걸려있는 종류
  FROM user_cons_columns;
--CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME  
3. SELECT * 1,2 번을 동시에 볼수 있는것
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

SELECT * FROM jobs;

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

-- jobs 테이블 삭제 불가
DROP TABLE jobs;

--employees 테이블에서 '김길동' 자료 삭제 시도. --O
DELETE FROM employees WHERE sid=2;

--employees 테이블 자료 확인
SELECT * FROM employees;

--jobs 테이블 자료 확인
SELECT * FROM jobs;

--jobs 테이블에서 '과장' 자료 삭제 시도. --X employees 가 참조중이기 때문에
DELETE FROM jobs WHERE jikwi_id=1;

--jobs 테이블에서 '사원' 자료 삭제 시도. --O 어떤 데이터도 참조하고 있지 않기 때문에
DELETE FROM jobs WHERE jikwi_id=3;

--jobs 테이블 자료 확인
SELECT * FROM jobs;

SELECT e.sid, e.name,j.jikwi_name FROM employees e , jobs j
    WHERE e.jikwi_id = j.jikwi_id;


--> ON DELETE CASCADE 옵션 지정이 필요합니다.
--> employees 테이블에서 FK 제약 제거 후 다시 FK 제약 지정
SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE 컬럼의 값 확인 -> NO_ACTION -> ON DELETE CASCADE 옵션 지정 X -> 부모 row 삭제시, 자식 row가 같이 삭제되지 않는다. 기본값.


--기존 FK 제약 삭제
ALTER TABLE employees
    DROP CONSTRAINT SYS_C007445;
    
----------------------------
--ON DELETE CASCADE 옵션 지정 후
ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_JIKWI_ID_FK
		FOREIGN KEY (jikwi_id)
		REFERENCES jobs(jikwi_id)
		ON DELETE CASCADE;


SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE 컬럼의 값 확인 -> CASCADE -> ON DELETE CASCADE 옵션 지정 O -> 부모 row 삭제시, 자식 row가 같이 삭제될 수 있다.
DELETE FROM jobs;
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
  
------------------------------------------------------------
--UPDATE

/*
1. 테이블에서 기존의 데이터를 변경한다.
2. UPDATE 테이블_명
	SET 컬럼_명= 변경할_값[, 컬럼_명= 변경할_값, ...]
	[WHERE 조건]; -- 수정 할 대상을 찾는다. -- 이 조건이 없다면 모든 데이터가 같은값으로 들어가게 된다. 필수적인 요소
*/


----------------------------
CREATE TABLE members (
    mid NUMBER   --PK 역할. 숫자 전용.
    , name_ NVARCHAR2(10)  --한글, 영숫자 가능. 10자 이내.
    , phone VARCHAR2(10) --영숫자 가능. 10자 이내.
);

--PK 제약 추가
--제약명 작성시 '테이블명_컬럼명_제약종류' 표기 권장
ALTER TABLE members
    ADD CONSTRAINT members_mid_pk PRIMARY KEY(mid);
    

--생성된 테이블에 샘플 데이터 입력
INSERT INTO members (mid, name_, phone) VALUES (1, '홍길동', '1234');
INSERT INTO members (mid, name_, phone) VALUES (2, '박길동', '5678');
COMMIT;

--생성된 테이블에 입력된 자료 확인
SELECT mid, name_, phone
    FROM members;


--------------------------
--한 개의 row를 상대로 한 개의 항목 수정
--원본 상태 확인
SELECT * FROM members;

--박길동 전화번호 변경 시도
--주의) 검색 조건 지정 중요
UPDATE members
    SET phone = '1111'
    WHERE mid = 2; --// unique 한 데이터를 사용하는것이 가장 좋다. 가능한 가장 작은 범위

--변경된 전화번호 확인
SELECT * FROM members;

COMMIT; ROLLBACK; -- 둘중 하나 해도 무방 (연습이기 떄문에) 확인 or 취소


---------------------
--한 개의 row를 상대로 여러개의 항목 수정
--원본 상태 확인
SELECT * FROM insa;
--basicpay 2610000	sudang 200000

--홍길동 기본급, 수당 변경 시도
--주의) 검색 조건 지정 중요
UPDATE insa
    SET basicpay = 3000000, sudang = 500000
    WHERE num=1001;
--COMMIT;

--변경된 기본급, 수당 확인
SELECT * FROM insa;
--basicpay 3000000	sudang 500000

ROLLBACK;

---------------------
--여러개의 row를 상대로 한 개의 항목 수정
--원본 상태 확인
SELECT * FROM insa
    WHERE buseo='개발부';
--sudang 102000 ~ 210000

--개발부 직원 전체의 수당 변경 시도
--주의) 검색 조건 지정 중요
UPDATE insa
    SET sudang = sudang + (sudang * 0.01)
    WHERE buseo='개발부';
--COMMIT;

--변경된 수당 확인
SELECT * FROM insa
    WHERE buseo='개발부';
--sudang 103020 ~ 212100

ROLLBACK;


-------------------------------------------------
--주의) WHERE 조건절을 지정하지 않거나, 잘못된 조건인 경우 원하지 않는 row까지 수정의 범위에 포함된다.

--홍길동의 전화번호 변경시 WHERE 조건절 지정 하지 않는 경우를 상정
SELECT * FROM insa
    WHERE num=1001; --조건 지정시 유일한 값(PK 컬럼의 값)을 가지고 검색 권장
--011-2356-4528

--올바른 수정 예    
UPDATE insa
    SET tel = '010-1234-1234'
    WHERE num=1001;
COMMIT;

SELECT * FROM insa
    WHERE num=1001;
--010-1234-1234

--잘못된 수정 예    
UPDATE insa
    SET tel = '010-1234-1234';
--COMMIT;

SELECT * FROM insa;
-->모든 직원의 전화번호가 동일한 전화번호로 변경된 상태가 된다.

ROLLBACK;



------------------------------------------------------
--hr 스키마의 테이블을 복사해서 사본 테이블 생성 - 원본에는 영향을 미치지 않는다. -- 연습용
--주의) 제약조건은 복사되지 않는다.

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

--PK, FK 제약조건 별도 지정

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
    , CONSTRAINT employees_email_uk UNIQUE(email)); -- 같은 주소를 2번 쓸수는 없다 (단, NULL은 허용)
      
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
--서브쿼리를 UPDATE 구문의 일부로 사용 가능

/*
UPDATE 테이블명
    SET 컬럼명 = (서브쿼리)
    WHERE (서브쿼리를 이용한 조건식);
    
    
예를 들어,
UPDATE employees
	SET salary = salary*1.1
	WHERE department_id IN (SELECT department_id
				 FROM departments
				 WHERE department_name='IT');
                 
                 
UPDATE (서브쿼리-JOIN 쿼리를 이용한 가상 테이블)
    SET 컬럼명 = 값
    WHERE 조건식;
    -
예를 들어,
UPDATE (SELECT e.first_name, e.last_name, e.salary, d.department_name
	FROM employees e, departments d
	WHERE e.department_id = d.department_id)  
  SET salary=salary*1.1
  WHERE department_name='IT';
  
*/

--원본 상태 확인
SELECT employee_id, first_name, d.department_name, salary
    FROM employees e, departments d
    WHERE e.department_id = d.department_id
    AND department_name='IT';
    ORDER BY employee_id;

--수정 액션(방법1)
UPDATE employees
	SET salary = salary*1.1
	WHERE department_id IN (SELECT department_id
				 FROM departments
				 WHERE department_name='IT');
                 
    
ROLLBACK; --원본으로 돌아간다.


--수정 액션(방법2)
UPDATE (SELECT *
    FROM employees e, departments d
    WHERE e.department_id = d.department_id)
	SET salary = salary*1.1
	WHERE  department_name='IT';


--수정된 결과 확인          
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
  VALUES (3, 'choi', 2); --FK 중복 허용. O
COMMIT;


--수당 항목 추가 + 기본값 추가
ALTER TABLE employees
    ADD (extrapay NUMBER DEFAULT 100000);


--원본 상태 확인
SELECT sid, name, e.extrapay , e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
/*  
1	hong	100000	1	CLERK
2	park	100000	2	MANAGER
3	choi	100000	2	MANAGER
*/


--jobs.jikwi_name 이 'CLERK'인 직원의 수당(employees.extrapay) 변경
UPDATE employees
    SET extrapay = 20000
    WHERE jikwi_name = 'CLERK'; --ORA-00904: "JIKWI_NAME": invalid identifier
    
--방법1    
UPDATE employees
    SET extrapay = 20000
    WHERE jikwi_id = (SELECT jikwi_id FROM jobs WHERE jikwi_name = 'CLERK');    
    
--방법2
UPDATE (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    SET extrapay = 20000
    WHERE jikwi_name = 'CLERK';
COMMIT;

--수정된 상태 확인
SELECT sid, name, e.extrapay , e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
/*  
1	hong	20000	1	CLERK
2	park	100000	2	MANAGER
3	choi	100000	2	MANAGER
*/  


--jobs.jikwi_name이 'CLERK'인 직원의 수당(employees.extrapay) 20% 인상. jobs.jikwi_name이 'MANAGER'인 직원의 수당(employees.extrapay) 10% 인상.
--> DECODE() 함수 사용.
UPDATE (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    SET extrapay = DECODE(jikwi_name, 'CLERK', extrapay*1.2, 'MANAGER', extrapay*1.1, extrapay);
COMMIT;

--수정된 상태 확인
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
-- 참조 당하고 있을때는 삭제가 불가능하다. 
/*
1. 테이블에서 지정한 행을 삭제하는데 사용한다.
2. DELETE [FROM] 테이블_명 [WHERE 조건];
*/



--------------------------
--한 개의 row를 상대로 삭제
--원본 상태 확인
SELECT * FROM members;

--박길동 자료 삭제 시도
--주의) 검색 조건 지정 중요
DELETE FROM members
    WHERE mid=2;
COMMIT;

--삭제된 상태 확인
SELECT * FROM members;




--------------------------
--여러 개의 row를 상대로 삭제
--원본 상태 확인
SELECT * FROM insa;

--'개발부' 전체 자료 삭제 시도
--주의) 검색 조건 지정 중요
DELETE FROM insa
    WHERE buseo='개발부';
COMMIT;

--삭제된 상태 확인
SELECT * FROM insa;



-------------------------------------------------
--주의) WHERE 조건절을 지정하지 않거나, 잘못된 조건인 경우 원하지 않는 row까지 삭제의 범위에 포함된다.
--모두삭제
DELETE FROM insa;
--COMMIT;

ALTER TABLE employees
    DROP CONSTRAINT EMPLOYEES_MANAGER_ID_FK;

ALTER TABLE departments
    DROP CONSTRAINT DEPARTMENTS_MANAGER_ID_FK;

DELETE FROM employees;
ROLLBACK;
SELECT * FROM employees;
--삭제된 상태 확인
SELECT * FROM insa;
--> 모든 자료가 삭제된 상태이다.
--> ROLLBACK;



--jobs.jikwi_name 이 'CLERK'인 직원(employees 테이블)만 삭제 시도
DELETE FROM (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    WHERE jikwi_name = 'CLERK';
COMMIT;

--삭제된 상태 확인
SELECT *
        FROM employees emp, jobs j
        WHERE emp.jikwi_id = j.jikwi_id;
      
      
--주의) jobs 테이블의 row를 삭제하는 경우(참조 당하는 경우 삭제 불가)        
SELECT * FROM jobs;

DELETE FROM employees
    WHERE job_id ='SH_CLERK';
DELETE FROM jobs
    WHERE job_id= 'SH_CLERK';
DELETE FROM jobs
    WHERE jikwi_id = 2; --ORA-02292: integrity constraint (MINJONG.EMPLOYEES_JIKWI_ID_FK) violated - child record found

ROLLBACK;
--> FK 제약 생성시 ON DELETE CASCADE 옵션 지정하면 삭제 가능


---------------------------------------
--참조 당하는 자료는 삭제 불가
SELECT *
    FROM departments;

DELETE FROM departments
    WHERE department_id = 60; --ORA-02292: integrity constraint (MINJONG.EMPLOYEES_DEPARTMENT_ID_FK) violated - child record found
    
DELETE FROM departments
    WHERE department_id = 210; --삭제 가능

ROLLBACK;

DELETE FROM departments; 
--전체 삭제 불가 
--> 방법1) 참조 관계 해소 필요 
--> 방법2) FK 제약 지정한 테이블에서 FK 제약 생성시 ON DELETE CASCADE 옵션 지정하면 삭제 가능



---------------------------------------
-- ON DELETE CASCADE 옵션 추가
ALTER TABLE employees
    DROP CONSTRAINT EMPLOYEES_DEPARTMENT_ID_FK;
    
ALTER TABLE departments
    DROP CONSTRAINT DEPARTMENTS_MANAGER_ID_FK;

ALTER TABLE employees   
    ADD CONSTRAINT EMPLOYEES_DEPARTMENT_ID_FK FOREIGN KEY(department_id)
        REFERENCES departments(department_id)
        ON DELETE CASCADE;
-->PK 자료 삭제시 FK 자료가 같이 삭제된다.

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
-- 구조영역과 데이터 영역 분리 -> 데이터 전체를 삭제하는 효과
-- ROLLBACK과 COMMIT 명령 X
TRUNCATE TABLE employees;    
--------------------------------------------
--문제060) HR 계정 employees 테이블에서 job_title이 'Sales Manager'인 직원들의 
--salary를 해당 직무의 최고 급여(max_salary)로 수정. 
--단, 입사일(hire_date)가 2005년 이전(해당 년도 포함) 입사자에 한해서 적용함.
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

--문제061) HR 계정 employees 테이블에서 모든 직원의 salary를 해당 직원의 직무(job_id) 최고 급여(max_salary)로 수정.
--예를 들어, AD_PRES는 40000, AD_VP는 30000, IT_PROG는 10000으로 수정됨.

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

