/*
public class Account  {
    // 자료 항목에 따른 필드 구성
   // ->계좌번호, 계좌주고유번호, 현재잔액, 계좌생성일, 비밀번호, 마지막거래일
   private String accountId;
   private String accountOwnerId;
   private int balance;
   private String accountCreateDate;
   private String pw;
   private String lastUpdateDate;
*/

--Account 테이블
CREATE TABLE Account_ (
    accountId VARCHAR2(10) -- 계좌번호(pk)
    ,accountOwnerId VARCHAR2(5) -- 계좌주고유번호(fk)
    ,balance NUMBER -- 현재잔액
    ,accountCreateDate DATE -- 계좌개설일
    ,pw NUMBER -- 비밀번호
    ,lastUpdateDate DATE -- 마지막거래일
);

--AccountOwner 테이블
CREATE TABLE AccountOwner_ (
    accountOwnerId VARCHAR2(5) -- 계좌주고유번호(pk)
    ,accountOwnerName VARCHAR2(20) --계좌주이름
    ,accountOwnerPhone VARCHAR2(13) --계좌주전화번호
);

--AccountHistory 테이블
CREATE TABLE AccountHistory_ (
    accounthid VARCHAR2(10) -- 계좌 히스토리 id(pk)
     ,accountId VARCHAR2(10) -- 계좌고유번호(fk)
     ,money NUMBER -- 거래금액
     ,inoutdate DATE -- 거래일
     ,gubun VARCHAR2(10) -- 구분(입/출금)
     ,balance NUMBER -- 잔액
);

--제약조건
ALTER TABLE Account_
ADD CONSTRAINT accountId_pk PRIMARY KEY(accountId);

ALTER TABLE AccountOwner_
ADD CONSTRAINT accountOwnerId_pk PRIMARY KEY(accountOwnerId);

ALTER TABLE AccountHistory_
ADD CONSTRAINT accounthid_pk PRIMARY KEY(accounthid);


ALTER TABLE Account_
ADD CONSTRAINT accountOwnerId_fk FOREIGN KEY(accountOwnerId)
REFERENCES AccountOwner_(accountOwnerId);

ALTER TABLE AccountHistory_
ADD CONSTRAINT accountId_fk FOREIGN KEY(accountId)
REFERENCES Account_(accountId);

--샘플 데이터 입력 쿼리
INSERT INTO AccountOwner_ (accountOwnerId,accountOwnerName,accountOwnerPhone)
VALUES('A001', '홍길동', '010-1111-1111');
INSERT INTO AccountOwner_ (accountOwnerId,accountOwnerName,accountOwnerPhone)
VALUES('A002', '유리야', '010-1111-1112');

INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-1', 'A001', 50000, '2019-03-03', '1234', '2019-04-01');
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-2', 'A001', 40000, '2019-03-03', '1234', '2019-04-01');
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-3', 'A002', 60000, '2019-03-01', '1234', '2019-03-20');

INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h001','111-1111-1',80000,'2019-03-03','입금',80000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h002','111-1111-1',30000,'2019-04-01','출금',50000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h003','111-1111-2',30000,'2019-03-03','입금',30000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h004','111-1111-2',10000,'2019-03-03','입금',40000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h005','111-1111-3',70000,'2019-03-01','입금',70000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h006','111-1111-3',10000,'2019-04-01','출금',60000);


COMMIT;
--샘플 데이터 조회 쿼리(SELECT)
--(전체)계좌조회
SELECT a1.accountId, a1.balance, a1.accountCreateDate, a1.lastUpdateDate, a2.accountOwnerName, a2.accountOwnerPhone
    FROM Account_ a1, AccountOwner_ a2
    WHERE a1.accountOwnerId = a2.accountOwnerId;
/*
계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호
2017101001 / 200000 / 20171010 / 20180101 / 박길동 / 010-5678-1234
2018030101 / 40000 / 20180301 / 20180301 / 홍길동 / 010-1234-1234
*/

--(계좌번호)계좌조회
SELECT a1.accountId, a1.balance, a1.accountCreateDate, a1.lastUpdateDate, a2.accountOwnerName, a2.accountOwnerPhone
    FROM Account_ a1, AccountOwner_ a2
    WHERE a1.accountOwnerId = a2.accountOwnerId
    AND a1.accountId = '111-1111-1';
/*
계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호
2017101001 / 200000 / 20171010 / 20180101 / 박길동 / 010-5678-1234
*/

--(계좌주)계좌조회
SELECT a1.accountId, a1.balance, a1.accountCreateDate, a1.lastUpdateDate, a2.accountOwnerName, a2.accountOwnerPhone
    FROM Account_ a1, AccountOwner_ a2
    WHERE a1.accountOwnerId = a2.accountOwnerId
    AND a2.accountOwnerName = '홍길동'; 
    AND e2.accountOwnerPhone = '010-1111-1111'
/*
계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호
2018030101 / 40000 / 20180301 / 20180301 / 홍길동 / 010-1234-1234
*/

--계좌입출금내역
SELECT accountId, money, inoutdate, gubun, balance
    FROM AccountHistory_
    WHERE accountId = '111-1111-1';
/*
계좌번호 / 금액 / 입출금일 / 구분 / 잔액
2018030101 / 10000 / 20180301 / 입금 / 10000
2018030101 / 50000 / 20180301 / 입금 / 60000
2018030101 / 20000 / 20180301 / 출금 / 40000
*/

/*
drop table AccountHistory_;
drop table Account_;
drop table AccountOwner_;
@C:\Users\qkrck\team~1.sql;
*/
--입금
--1단계
--현재 잔액+ 입금액 -> 신규잔액
--SELECT

----2단계 
--INSERT INTO AcountHistory_(accountId,money,inoutdate,gubub,balance)
--    VALUES('111-1111-1',80000,SYSDATE,'입금',신규잔액);

--3단계
--계좌정보 테이블에서 잔액, 마지막거래일을 수정하는 쿼리
--UPDATE

--출금 
--1단계 
--계좌정보 테이블에서 비밀번호 확인 -> 현재 잔액 반환
--SELECT 

--2단계
--현재잔액 - 출금액 -> 신규잔액

--3단계
--INSERT INTO AcountHistory_(accountId,money,inoutdate,gubub,balance)
--    VALUES('111-1111-1',20000,SYSDATE,'출금',신규잔액);

--4단계
--계좌정보 테이블에서 잔애그 마지막거래일을 수정하는 쿼리
--UPDATE...