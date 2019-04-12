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
     accountId VARCHAR2(10) -- 계좌고유번호(fk)
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
 
 -- 이름, 전화번호가 중복되지 않도록 제약 추가
ALTER TABLE AccountOwner_
    ADD CONSTRAINT accountOwnerName_Phone_UK UNIQUE(AccountOwnerName, AccountOwnerPhone);

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
INSERT INTO AccountOwner_ (accountOwnerId,accountOwnerName,accountOwnerPhone)
VALUES('A003', '김재훈', '010-1111-1113');
INSERT INTO AccountOwner_ (accountOwnerId,accountOwnerName,accountOwnerPhone)
VALUES('A004', '박길동', '010-1111-1114');

 
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-1', 'A001', 50000, '2019-03-03', '1234', '2019-04-01');
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-2', 'A001', 40000, '2019-03-03', '1234', '2019-04-01');
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-3', 'A002', 60000, '2019-03-01', '1234', '2019-03-20');
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-4', 'A003', 0, SYSDATE, '2345', SYSDATE);
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-5', 'A004', 0, SYSDATE, '2345', SYSDATE);

 
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-1',80000,'2019-03-03','입금',80000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-1',30000,'2019-04-01','출금',50000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-2',30000,'2019-03-03','입금',30000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-2',10000,'2019-03-03','입금',40000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-3',60000,'2019-03-01','입금',60000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-3',30000,'2019-04-01','출금',30000);
 
 
COMMIT;

SELECT accountId, balance, TO_CHAR(accountCreateDate,'YYYY-MM-DD') accountCreateDate, To_CHAR(lastUpdateDate,'YYYY-MM-DD') lastUpdateDate, accountOwnerName, accountOwnerPhone
    FROM account_ a , accountowner_ ao
    WHERE a.accountownerid = ao.accountownerid;
-----------------------------------------------------------------    
-- 현재 잔액 확인용 쿼리
SELECT balance
    FROM account_
    WHERE accountId= '111-1111-1';

-- 입금액션
INSERT INTO AccountHistory_ (accountId, money, inoutdate,gubun, balance)
    VALUES('111-1111-1',입금액, SYSDATE, '입금', (현재잔액+입금액));

-- 입금액션
UPDATE Account_
    SET balance = (현재잔액 +입금액), lastupdatedate =SYSDATE
    WHERE account_Id = '111-1111-1';
    
SELECT accountId, pw
     FROM account_ a , accountowner_ ao
    WHERE a.accountownerid = ao.accountownerid
    AND a.accountId = '111-1111-1'
    AND pw = '1234';

-- 계좌번호 자동 생성
-- 샘플 계좌번호 : 111-1111-1
-- 앞 3자리는 고유번호
-- 중간 4자리는 일련번호
-- 뒤 1자리는 일련번호
--111-1111-1, 111-1111-2,,... 111-1111-9 , 111-1112-0
-- 1111-1 -> 11111 => 11111+1 => 11112 => 1111-2 => 111-1111-2
SELECT CONCAT('111-',SUBSTR((REPLACE(SUBSTR(MAX(accountId),5),'-')+1),1,4)||'-'||SUBSTR((REPLACE(SUBSTR(MAX(accountId),5),'-')+1),5)) newaccountId
    FROM account_;
    
SELECT a.accountId,a.accountOwnerId,a.balance, a.accountCreateDate,a.pw,a.lastUpdateDate,ao.accountOwnerId
    FROM account_ a , accountOwner_ ao
    WHERE a.accountOwnerId= ao.accountOwnerId;

DELETE FROM accountOwner_
    WHERE accountOwnerId= 'A004';


