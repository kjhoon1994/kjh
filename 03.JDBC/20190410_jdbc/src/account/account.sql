--Account ���̺�
CREATE TABLE Account_ (
    accountId VARCHAR2(10) -- ���¹�ȣ(pk)
    ,accountOwnerId VARCHAR2(5) -- �����ְ�����ȣ(fk)
    ,balance NUMBER -- �����ܾ�
    ,accountCreateDate DATE -- ���°�����
    ,pw NUMBER -- ��й�ȣ
    ,lastUpdateDate DATE -- �������ŷ���
);
 
--AccountOwner ���̺�
CREATE TABLE AccountOwner_ (
    accountOwnerId VARCHAR2(5) -- �����ְ�����ȣ(pk)
    ,accountOwnerName VARCHAR2(20) --�������̸�
    ,accountOwnerPhone VARCHAR2(13) --��������ȭ��ȣ
);
 
--AccountHistory ���̺�
CREATE TABLE AccountHistory_ (
     accountId VARCHAR2(10) -- ���°�����ȣ(fk)
     ,money NUMBER -- �ŷ��ݾ�
     ,inoutdate DATE -- �ŷ���
     ,gubun VARCHAR2(10) -- ����(��/���)
     ,balance NUMBER -- �ܾ�
);
 
--��������
ALTER TABLE Account_
ADD CONSTRAINT accountId_pk PRIMARY KEY(accountId);
 
ALTER TABLE AccountOwner_
ADD CONSTRAINT accountOwnerId_pk PRIMARY KEY(accountOwnerId);
 
 -- �̸�, ��ȭ��ȣ�� �ߺ����� �ʵ��� ���� �߰�
ALTER TABLE AccountOwner_
    ADD CONSTRAINT accountOwnerName_Phone_UK UNIQUE(AccountOwnerName, AccountOwnerPhone);

ALTER TABLE Account_
ADD CONSTRAINT accountOwnerId_fk FOREIGN KEY(accountOwnerId)
REFERENCES AccountOwner_(accountOwnerId);
 
ALTER TABLE AccountHistory_
ADD CONSTRAINT accountId_fk FOREIGN KEY(accountId)
REFERENCES Account_(accountId);
 
--���� ������ �Է� ����
INSERT INTO AccountOwner_ (accountOwnerId,accountOwnerName,accountOwnerPhone)
VALUES('A001', 'ȫ�浿', '010-1111-1111');
INSERT INTO AccountOwner_ (accountOwnerId,accountOwnerName,accountOwnerPhone)
VALUES('A002', '������', '010-1111-1112');
INSERT INTO AccountOwner_ (accountOwnerId,accountOwnerName,accountOwnerPhone)
VALUES('A003', '������', '010-1111-1113');
INSERT INTO AccountOwner_ (accountOwnerId,accountOwnerName,accountOwnerPhone)
VALUES('A004', '�ڱ浿', '010-1111-1114');

 
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
VALUES('111-1111-1',80000,'2019-03-03','�Ա�',80000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-1',30000,'2019-04-01','���',50000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-2',30000,'2019-03-03','�Ա�',30000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-2',10000,'2019-03-03','�Ա�',40000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-3',60000,'2019-03-01','�Ա�',60000);
INSERT INTO AccountHistory_(accountId,money,inoutdate,gubun,balance)
VALUES('111-1111-3',30000,'2019-04-01','���',30000);
 
 
COMMIT;

SELECT accountId, balance, TO_CHAR(accountCreateDate,'YYYY-MM-DD') accountCreateDate, To_CHAR(lastUpdateDate,'YYYY-MM-DD') lastUpdateDate, accountOwnerName, accountOwnerPhone
    FROM account_ a , accountowner_ ao
    WHERE a.accountownerid = ao.accountownerid;
-----------------------------------------------------------------    
-- ���� �ܾ� Ȯ�ο� ����
SELECT balance
    FROM account_
    WHERE accountId= '111-1111-1';

-- �Աݾ׼�
INSERT INTO AccountHistory_ (accountId, money, inoutdate,gubun, balance)
    VALUES('111-1111-1',�Աݾ�, SYSDATE, '�Ա�', (�����ܾ�+�Աݾ�));

-- �Աݾ׼�
UPDATE Account_
    SET balance = (�����ܾ� +�Աݾ�), lastupdatedate =SYSDATE
    WHERE account_Id = '111-1111-1';
    
SELECT accountId, pw
     FROM account_ a , accountowner_ ao
    WHERE a.accountownerid = ao.accountownerid
    AND a.accountId = '111-1111-1'
    AND pw = '1234';

-- ���¹�ȣ �ڵ� ����
-- ���� ���¹�ȣ : 111-1111-1
-- �� 3�ڸ��� ������ȣ
-- �߰� 4�ڸ��� �Ϸù�ȣ
-- �� 1�ڸ��� �Ϸù�ȣ
--111-1111-1, 111-1111-2,,... 111-1111-9 , 111-1112-0
-- 1111-1 -> 11111 => 11111+1 => 11112 => 1111-2 => 111-1111-2
SELECT CONCAT('111-',SUBSTR((REPLACE(SUBSTR(MAX(accountId),5),'-')+1),1,4)||'-'||SUBSTR((REPLACE(SUBSTR(MAX(accountId),5),'-')+1),5)) newaccountId
    FROM account_;
    
SELECT a.accountId,a.accountOwnerId,a.balance, a.accountCreateDate,a.pw,a.lastUpdateDate,ao.accountOwnerId
    FROM account_ a , accountOwner_ ao
    WHERE a.accountOwnerId= ao.accountOwnerId;

DELETE FROM accountOwner_
    WHERE accountOwnerId= 'A004';


