/*
public class Account  {
    // �ڷ� �׸� ���� �ʵ� ����
   // ->���¹�ȣ, �����ְ�����ȣ, �����ܾ�, ���»�����, ��й�ȣ, �������ŷ���
   private String accountId;
   private String accountOwnerId;
   private int balance;
   private String accountCreateDate;
   private String pw;
   private String lastUpdateDate;
*/

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
    accounthid VARCHAR2(10) -- ���� �����丮 id(pk)
     ,accountId VARCHAR2(10) -- ���°�����ȣ(fk)
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

ALTER TABLE AccountHistory_
ADD CONSTRAINT accounthid_pk PRIMARY KEY(accounthid);


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

INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-1', 'A001', 50000, '2019-03-03', '1234', '2019-04-01');
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-2', 'A001', 40000, '2019-03-03', '1234', '2019-04-01');
INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) 
VALUES('111-1111-3', 'A002', 60000, '2019-03-01', '1234', '2019-03-20');

INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h001','111-1111-1',80000,'2019-03-03','�Ա�',80000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h002','111-1111-1',30000,'2019-04-01','���',50000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h003','111-1111-2',30000,'2019-03-03','�Ա�',30000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h004','111-1111-2',10000,'2019-03-03','�Ա�',40000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h005','111-1111-3',70000,'2019-03-01','�Ա�',70000);
INSERT INTO AccountHistory_(accounthid,accountId,money,inoutdate,gubun,balance)
VALUES('h006','111-1111-3',10000,'2019-04-01','���',60000);


COMMIT;
--���� ������ ��ȸ ����(SELECT)
--(��ü)������ȸ
SELECT a1.accountId, a1.balance, a1.accountCreateDate, a1.lastUpdateDate, a2.accountOwnerName, a2.accountOwnerPhone
    FROM Account_ a1, AccountOwner_ a2
    WHERE a1.accountOwnerId = a2.accountOwnerId;
/*
���¹�ȣ / �ܾ� / ���»����� / �������ŷ��� / ������ / ��ȭ��ȣ
2017101001 / 200000 / 20171010 / 20180101 / �ڱ浿 / 010-5678-1234
2018030101 / 40000 / 20180301 / 20180301 / ȫ�浿 / 010-1234-1234
*/

--(���¹�ȣ)������ȸ
SELECT a1.accountId, a1.balance, a1.accountCreateDate, a1.lastUpdateDate, a2.accountOwnerName, a2.accountOwnerPhone
    FROM Account_ a1, AccountOwner_ a2
    WHERE a1.accountOwnerId = a2.accountOwnerId
    AND a1.accountId = '111-1111-1';
/*
���¹�ȣ / �ܾ� / ���»����� / �������ŷ��� / ������ / ��ȭ��ȣ
2017101001 / 200000 / 20171010 / 20180101 / �ڱ浿 / 010-5678-1234
*/

--(������)������ȸ
SELECT a1.accountId, a1.balance, a1.accountCreateDate, a1.lastUpdateDate, a2.accountOwnerName, a2.accountOwnerPhone
    FROM Account_ a1, AccountOwner_ a2
    WHERE a1.accountOwnerId = a2.accountOwnerId
    AND a2.accountOwnerName = 'ȫ�浿'; 
    AND e2.accountOwnerPhone = '010-1111-1111'
/*
���¹�ȣ / �ܾ� / ���»����� / �������ŷ��� / ������ / ��ȭ��ȣ
2018030101 / 40000 / 20180301 / 20180301 / ȫ�浿 / 010-1234-1234
*/

--��������ݳ���
SELECT accountId, money, inoutdate, gubun, balance
    FROM AccountHistory_
    WHERE accountId = '111-1111-1';
/*
���¹�ȣ / �ݾ� / ������� / ���� / �ܾ�
2018030101 / 10000 / 20180301 / �Ա� / 10000
2018030101 / 50000 / 20180301 / �Ա� / 60000
2018030101 / 20000 / 20180301 / ��� / 40000
*/

/*
drop table AccountHistory_;
drop table Account_;
drop table AccountOwner_;
@C:\Users\qkrck\team~1.sql;
*/
--�Ա�
--1�ܰ�
--���� �ܾ�+ �Աݾ� -> �ű��ܾ�
--SELECT

----2�ܰ� 
--INSERT INTO AcountHistory_(accountId,money,inoutdate,gubub,balance)
--    VALUES('111-1111-1',80000,SYSDATE,'�Ա�',�ű��ܾ�);

--3�ܰ�
--�������� ���̺��� �ܾ�, �������ŷ����� �����ϴ� ����
--UPDATE

--��� 
--1�ܰ� 
--�������� ���̺��� ��й�ȣ Ȯ�� -> ���� �ܾ� ��ȯ
--SELECT 

--2�ܰ�
--�����ܾ� - ��ݾ� -> �ű��ܾ�

--3�ܰ�
--INSERT INTO AcountHistory_(accountId,money,inoutdate,gubub,balance)
--    VALUES('111-1111-1',20000,SYSDATE,'���',�ű��ܾ�);

--4�ܰ�
--�������� ���̺��� �ֱܾ� �������ŷ����� �����ϴ� ����
--UPDATE...