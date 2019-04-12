CREATE TABLE user_(
UserId VARCHAR2(4) --PK 회원ID
,UserPhone VARCHAR2(20) --회원 연락처
,UserPoint VARCHAR(20) -- 회원 포인트
);

CREATE TABLE PointHistory(
PointHistoryId VARCHAR2(4) --PK HistoryId
,LastPaymentId VARCHAR2(4) --FK 결재내역ID
,PaymentListId VARCHAR2(4) --FK 결제종류ID
,UserId VARCHAR2(4) --FK 회원ID
,Point NUMBER -- 포인트 금액
,Gubun VARCHAR2(5) -- 구분
);

CREATE TABLE detailPayment (
    detailPaymentId VARCHAR2(4), --결제상세내역ID, PK
    lastPaymentId VARCHAR2(4), --결제내역ID, FK
    itemId VARCHAR2(4), --품목ID, FK
    price NUMBER, --판매가격
    Cnt NUMBER --품목갯수
);
    
CREATE TABLE paymentList(
    paymentListId VARCHAR2(4), --결제종류ID, PK
    paymentListName VARCHAR2(20) --결제종류명
);

CREATE TABLE Admin_ (
    adminId VARCAHR2(20) --PK.관리자ID
    ,adminPw VARCAHR2(20) --관리자PW
);

CREATE TABLE Payment (
    lastPaymentId VARCAHR2(4) --PK.FK.결제내역ID
    ,paymentListId VARCAHR2(4) --PK.FK.결제종류ID
    ,paymentMoney NUMBER --결제금액
);

CREATE TABLE LastPayment (
    lastPaymentId VARCAHR2(4) --PK.결제내역ID
    ,lastPaymentDat DATE --결제날짜
    ,lastPaymentMoney NUMBER --총결제금액
);

ALTER TABLE User_
    ADD CONSTRAINT User_UserId_PK PRIMARY KEY(UserId);
ALTER TABLE PointHistory
    ADD CONSTRAINT PointHistory_HistoryId_PK PRIMARY KEY(PointHistoryId);

ALTER TABLE PointHistory
    ADD CONSTRAINT PointHistory_UserId_FK FOREIGN KEY(UserId) REFERENCES User_(UserId);
ALTER TABLE PointHistory    
    ADD CONSTRAINT PointHistory_LastPaymentId_FK FOREIGN KEY(LastPaymentId, PaymentListId) REFERENCES Payment(LastPaymentId, PaymentListId);

    
