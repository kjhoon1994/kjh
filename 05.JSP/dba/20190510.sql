/* 로그인, 로그아웃 테이블 */

/* 로그인 테이블 */
CREATE TABLE login
(	
	id_ varchar(4),
    pw_ varchar(20),
    grade_ INT
);

/* 회원 정보 테이블 */
CREATE TABLE members(
	mid_ varchar(4) /* PK */
    ,name_ varchar(20)
    ,phone varchar(20)
    ,email varchar(50)
);

/* 과목 정보 테이블 */
CREATE TABLE subject_(
	sid VARCHAR(4) /* 과목 번호 */
    , subjectId VARCHAR(4) /* 시험 번호 OS001, OS002, ... */
    , sname VARCHAR(50)
    , sdate VARCHAR(50)
    , scount INT /* 1차, 2차, 3차, ... */
    , examcount INT /* 시험문제 갯수. 초기값 0 */
	, status_ VARCHAR(2) /* 예정(default), 진행중, 종료 */
);

/* 시험문제 테이블 */
CREATE TABLE exam(
	eid VARCHAR(4) /* PK */
    , sid VARCHAR(4) /* PK, FK 같은 과목에 같은 문제를 낼수는 없다 */ 
    , etitle VARCHAR(100) /* 문제 */
    , econtent VARCHAR(100) /* 보기 */
    , eanswer VARCHAR(1) /* 정답 */
);    




