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


----------------------------------------------
--테이블 작성

/*
1. 테이블은 관계 데이터베이스에 데이터 저장을 위해 이용되는 객체이며, 행과 열 을 통해 spread sheet와 비슷한 방식으로 데이터를 표시한다.

예를 들어, 성적 정보 저장용 테이블이 있다면
column  column  column column column
번호(PK) 이름     국어   영어   수학
1        홍길동   100    100    100    -> row
2        박길동    90     80     90    -> row
3        최길동   100     70     80    -> row

2.
CREATE [GLOBAL TEMPORARY] TABLE [스키마.]테이블_이름 (
	열_이름 데이터타입 [DEFAULT 표현식] [제약조건]
	[, 열_이름 데이터타입 [DEFAULT 표현식] [제약조건] ]
	[ ,...]
);

테이블 생성시 PK 제약을 지정할 수 있는 컬럼을 반드시 추가할 것.

예를 들어, 성적 정보 저장용 테이블을 만든다면
--테이블 생성
CREATE TABLE sungjuk (
  sid NUMBER --고유번호 저장용 컬럼(PK). 필수 항목.
  ,name VARCHAR2(20) --이름 저장용 컬럼. 영숫자 20자 이내. 한글 저장시 NVARCHAR2(20) 한글 20자 이내.
  ,kor NUMBER(3) --과목 점수 저장용 컬럼. 0~100
  ,eng NUMBER(3) --과목 점수 저장용 컬럼. 0~100
  ,mat NUMBER(3) --과목 점수 저장용 컬럼. 0~100
);

--테이블 존재 확인
SELECT * FROM user_tables;

*/




-------------------------------------------
--데이터 타입(자료형)

/*
1. 오라클이 제공하는 데이터 타입은 단일 값을 저장하는 스칼라 데이터 타입, 여러 개의 데이터를 저장할 수 있는 컬렉션 데이터 타입 그리고, 컬럼이 다른 테이블 객체를 참조하는 관계 데이터 타입이있다.

2. VARCHAR2
형식 : VARCHAR2(n)
가변 길이 문자 데이터를 저장하며 최대 길이는 4000자이고, 반드시 길이를 명시해야 한다.
NLS(국가별 언어 집합)는 한글과 영문만 가능
VARCHAR 는 최대 2000개 문자를 저장하며 VARCHAR2와는 다르게 VARCHAR(10)로 선언하면 null을 채워 실제로는 10개의 공간을 사용한다. 하지만 VARCHAR2(10)는 필요한 문자까지만 저장하는 variable length이며 최대 4000개 문자까지 저장할 수 있다.

한글 저장용 NVARCHAR2(n) 자료형


3. NUMBER
형식 : NUMBER(P, S)
P(1~38)는 정밀도로 전체 자리수를 나타내며 기본 값이 38이고 S(-84~127)는 소수점 이하의 자릿수이다.
정수나 실수 저장하기 위한 가변길이의 표준 내부 형식이다.

4. DATE
『년/월/일 시:분:초』까지 저장하며, 기본적으로 년/월/일 정보를 출력한다.
*/



-------------------------------------------------
--INSERT

/*
1. INSERT 문은 테이블에 새 행(row)을 추가하는데 이용하며, single table insert이나 multi table insert를 수행할 수 있다.

Single table insert : 오직 하나의 테이블이나 뷰에 오직 하나의 행(row)의 값들을 삽입할 수 있다.

Multi table insert : 하나 이상의 테이블로부터 서브 쿼리로 얻은 여러 행(row)을 삽입하는 경우이다.

2.
INSERT INTO 테이블_명 [(컬럼_명1, 컬럼_명2, ...)] VALUES (값1, 값2, ...);

주의) 컬럼명과 값은 서로 일치(갯수, 순서, 자료형)해야 한다.
주의) INSERT 명령 실행시 메모리에서만 입력된 상태이므로, 물리적 저장이 필요하면 COMMIT; 명령 실행 필요.
*/


----------------------------------
--제약 조건

/*
Primary key - 고유한 값을 유지하는 제약. 중복된 자료가 입력되지 않도록 차단하는 역할.

제약 추가 방법은 테이블 생성시, 테이블 생성후 제약 추가 가능.

ALTER TABLE 테이블명
    ADD [CONSTRAINT 제약명] PRIMARY KEY(컬럼명);

제약명은 사용자가 작성하는 것을 권장한다.

*/




--------------------------------------
--샘플 테이블 생성 쿼리
--이름, 전화번호 저장용 테이블 생성
--PK(고유한 값을 저장하는 역할) 컬럼 추가 필요
/*
CREATE TABLE 테이블명 (
    컬럼 자료형
    , 컬럼 자료형
    , ...
);
*/


CREATE TABLE members (
    mid NUMBER   --PK 역할. 숫자 전용.
    , name_ NVARCHAR2(10)  --한글, 영숫자 가능. 10자 이내.
    , phone VARCHAR2(10) --영숫자 가능. 10자 이내.
);

--PK 제약 추가
--제약명 작성시 '테이블명_컬럼명_제약종류' 표기 권장
ALTER TABLE members
    ADD CONSTRAINT members_mid_pk PRIMARY KEY(mid);
    

--생성된 테이블 확인
SELECT * 
    FROM user_tables;
    
--생성된 테이블 구조(컬럼명, 자료형, null 여부) 확인
DESC members;

--생성된 테이블에 샘플 데이터 입력
INSERT INTO members (mid, name_, phone) VALUES (1, '홍길동', '1234');
INSERT INTO members (mid, name_, phone) VALUES (2, '박길동', '5678');
COMMIT;

--생성된 테이블에 입력된 자료 확인
SELECT mid, name_, phone
    FROM members;






----------------------------------------
--NUMBER 자료형 테스트
CREATE TABLE test1 (
	col1 NUMBER       --38자리
	,col2 NUMBER(3)   --3자리
	,col3 NUMBER(5,2) --5자리, 소수 이하 2자리
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
--VARCHAR2 자료형 테스트
CREATE TABLE test2 (
	col0 VARCHAR2     --ORA-00906: missing left parenthesis
);
--> 테이블 생성 실패

CREATE TABLE test2 (
	col0 VARCHAR2(5000)     --ORA-00910: specified length too long for its datatype
);
--> 테이블 생성 실패

CREATE TABLE test2 (
	col1 VARCHAR2(1)     --1글자(영문, 숫자 기준)
	,col2 VARCHAR2(10)   --10글자(10byte)
	,col3 VARCHAR2(4000) --MAX
);
-->테이블 생성 성공


INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', 'TEST', 'TEST');
SELECT * FROM test2;

INSERT INTO test2 (col1, col2, col3)
	VALUES ('TEST', 'TEST', 'TEST');  --ORA-12899: value too large for column "MINJONG"."TEST2"."COL1" (actual: 4, maximum: 1)
SELECT * FROM test2;



INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', '홍길동', '홍길동');
SELECT * FROM test2;

INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', '대한민국', '대한민국');  --ORA-12899: value too large for column "MINJONG"."TEST2"."COL2" (actual: 12, maximum: 10)
SELECT * FROM test2;

COMMIT;

DROP TABLE test2;





-----------------------------------
--NVARCHAR2 자료형 테스트
CREATE TABLE test3 (
	col1 NVARCHAR2(1)     --1글자(한글, 영문, 숫자 기준)
	,col2 NVARCHAR2(10)   --10글자
	,col3 NVARCHAR2(2000) --MAX
);
-->테이블 생성 성공

INSERT INTO test3 (col1, col2, col3)
	VALUES ('T', '대한민국', '대한민국');
SELECT * FROM test3;

COMMIT;

DROP TABLE test3;





---------------------------------------
--DATE 자료형 테스트
CREATE TABLE test4 (
	col1 DATE     --년/월/일 시:분:초 저장
	,col2 DATE
);

--날짜와 시간 정보 모두 저장되므로 
--SYSDATE인 경우는 현재 시간까지 저장된다.
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, TO_DATE('20120118')); --문자를 날짜형으로 변환
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, '20120118'); --문자를 자동 형변환
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, SYSDATE);
COMMIT;

SELECT * FROM test4; --년/월/일만 출력됨.
SELECT TO_CHAR(col1, 'YYYY-MM-DD HH24:MI:SS') AS col1
	,TO_CHAR(col2, 'YYYY-MM-DD HH24:MI:SS') AS col2
	FROM test4; --년-월-일 시:분:초로 출력됨

SELECT TO_CHAR(col1, 'HH24:MI') AS col1
	,TO_CHAR(col2, 'YYYY-MM-DD') AS col2
	FROM test4; --년-월-일 시:분:초로 출력됨

DROP TABLE test4;




------------------------------------------------
--성적 처리용 자료 저장 테이블 생성
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

--전체 출력
SELECT sid_, name_, sub1, sub2, sub3
    --총점, 평균, 석차
    FROM score
    ORDER BY sid_;

--검색 출력
SELECT sid_, name_, sub1, sub2, sub3
    --총점, 평균, 석차
    FROM score
    WHERE LOWER(sid_) = LOWER('G001')
    ORDER BY sid_;
SELECT sid_, name_, sub1, sub2, sub3
    --총점, 평균, 석차
    FROM score
    WHERE INSTR(LOWER(name_), LOWER('Hong')) > 0
    ORDER BY sid_;

--자료 건수 출력
SELECT COUNT(*) count_
    FROM score;


--총점, 평균 출력
SELECT sid_, name_, sub1, sub2, sub3
    , (sub1 + sub2 + sub3) tot
    , ROUND((sub1 + sub2 + sub3) / 3, 1) ave
    FROM score
    ORDER BY sid_;


--석차 출력
SELECT sid_, name_, sub1, sub2, sub3
    , (sub1 + sub2 + sub3) tot
    , ROUND((sub1 + sub2 + sub3) / 3, 1) ave
    , DENSE_RANK() OVER
          (ORDER BY (sub1 + sub2 + sub3) DESC) rank_
    FROM score
    ORDER BY sid_;
    
    
    
    
-----------------------------------------------
--문제) 아래와 같은 형태의 자료가 저장될 수 있는 테이블 구성
--자료 입력, 출력, 검색 쿼리 작성
--번호(S001, S002, ...), 날짜(YYYY-MM-DD), 내용(200자 이내)
--검색 기준은 1.오늘일정 2.특정일일정 3.특정월일정 4.특정단어포함일정 5.전체일정 
--출력시 날짜 기준 정렬 출력한다
/*
---------------------
번호 / 날짜 / 내용
S001 / 2018-01-01 / 신정
S002 / 2018-02-16 / 설날
S003 / 2018-03-01 / 삼일절
S004 / 2018-05-05 / 어린이날
S005 / 2018-05-22 / 부처님오신날
S006 / 2018-06-06 / 현충일
S012 / 2018-07-19 / 일정관리 프로그램 작성
S007 / 2018-08-15 / 광복절
S008 / 2018-09-24 / 추석
S009 / 2018-10-03 / 개천절
S011 / 2018-10-09 / 한글날
S010 / 2018-12-25 / 성탄절
총 12건
*/
    
    
CREATE TABLE schedule(
    sid_ VARCHAR(4)
    , wdate DATE
    , content_ NVARCHAR2(200)
);

INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S001', '2018-01-01', '신정');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S002', '2018-02-16', '설날');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S003', '2018-03-01', '삼일절');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S004', '2018-05-05', '어린이날');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S005', '2018-05-22', '부처님오신날');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S006', '2018-06-06', '현충일');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S007', '2018-08-15', '광복절');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S008', '2018-09-24', '추석');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S009', '2018-10-03', '개천절');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S010', '2019-10-09', '한글날');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S011', '2019-03-28', '일정관리 v2.0 오라클 버전');
INSERT INTO schedule (sid_, wdate, content_)
    VALUES('S012', '2018-07-19', '일정관리 프로그램 작성');

COMMIT; 

--전체 일정 출력
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    ORDER BY wdate;



--오늘 일정 검색
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    WHERE INSTR(wdate, SYSDATE) > 0;
   
 

--특정일 일정 출력
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    WHERE INSTR(TO_CHAR(wdate,'YYYY-MM-DD'),'2019-10-09') > 0;
    


--특정월 일정 출력
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    WHERE INSTR(TO_CHAR(wdate,'YYYY-MM'), '2018-05') > 0
    ORDER BY wdate;
    


--특정단어포함일정
SELECT sid_, TO_CHAR(wdate, 'YYYY-MM-DD') wdate, content_ 
    FROM schedule
    WHERE INSTR(LOWER(content_), LOWER('일정')) > 0
    ORDER BY wdate;
    


DROP TABLE schedule;