CREATE TABLE user_(
UserId VARCHAR2(4) --PK ȸ��ID
,UserPhone VARCHAR2(20) --ȸ�� ����ó
,UserPoint VARCHAR(20) -- ȸ�� ����Ʈ
);

CREATE TABLE PointHistory(
PointHistoryId VARCHAR2(4) --PK HistoryId
,LastPaymentId VARCHAR2(4) --FK ���系��ID
,PaymentListId VARCHAR2(4) --FK ��������ID
,UserId VARCHAR2(4) --FK ȸ��ID
,Point NUMBER -- ����Ʈ �ݾ�
,Gubun VARCHAR2(5) -- ����
);

CREATE TABLE detailPayment (
    detailPaymentId VARCHAR2(4), --�����󼼳���ID, PK
    lastPaymentId VARCHAR2(4), --��������ID, FK
    itemId VARCHAR2(4), --ǰ��ID, FK
    price NUMBER, --�ǸŰ���
    Cnt NUMBER --ǰ�񰹼�
);
    
CREATE TABLE paymentList(
    paymentListId VARCHAR2(4), --��������ID, PK
    paymentListName VARCHAR2(20) --����������
);

CREATE TABLE Admin_ (
    adminId VARCAHR2(20) --PK.������ID
    ,adminPw VARCAHR2(20) --������PW
);

CREATE TABLE Payment (
    lastPaymentId VARCAHR2(4) --PK.FK.��������ID
    ,paymentListId VARCAHR2(4) --PK.FK.��������ID
    ,paymentMoney NUMBER --�����ݾ�
);

CREATE TABLE LastPayment (
    lastPaymentId VARCAHR2(4) --PK.��������ID
    ,lastPaymentDat DATE --������¥
    ,lastPaymentMoney NUMBER --�Ѱ����ݾ�
);

ALTER TABLE User_
    ADD CONSTRAINT User_UserId_PK PRIMARY KEY(UserId);
ALTER TABLE PointHistory
    ADD CONSTRAINT PointHistory_HistoryId_PK PRIMARY KEY(PointHistoryId);

ALTER TABLE PointHistory
    ADD CONSTRAINT PointHistory_UserId_FK FOREIGN KEY(UserId) REFERENCES User_(UserId);
ALTER TABLE PointHistory    
    ADD CONSTRAINT PointHistory_LastPaymentId_FK FOREIGN KEY(LastPaymentId, PaymentListId) REFERENCES Payment(LastPaymentId, PaymentListId);

    
