CREATE TABLE calendar(
numb_ VARCHAR(4),
date_ DATE ,
stroy NVARCHAR2(200)
);
INSERT INTO calendar
    VALUES ('S001', '2018-01-01', '����');
INSERT INTO calendar
    VALUES ('S003', '2018-03-01', '������');
INSERT INTO calendar
    VALUES ('S002', '2018-02-16', '����');
INSERT INTO calendar
    VALUES('S012', '2018-07-19', '�������� ���α׷� �ۼ�');
INSERT INTO calendar
    VALUES('S008', '2018-09-24', '�߼�');
INSERT INTO calendar
    VALUES('S006', '2018-06-06', '������');
INSERT INTO calendar
    VALUES ('S004', '2018-05-05', '��̳�');
INSERT INTO calendar
    VALUES('S007', '2018-08-15', '������');
INSERT INTO calendar
    VALUES('S005', '2018-05-22', '��ó�Կ��ų�'); 
INSERT INTO calendar    
    VALUES('S015', '2019-03-28', '�޷¸����');
INSERT INTO calendar
    VALUES('S011', '2018-10-09', '�ѱ۳�');
INSERT INTO calendar
    VALUES('S009', '2018-10-03', '��õ��');
COMMIT;
 
 
-- 1. ���� ����    
SELECT *
    FROM calendar
    WHERE date_ = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    ORDER BY date_;
-- 2. Ư���� ����
SELECT *   
    FROM calendar
    WHERE date_ = TO_CHAR(TO_DATE('2018-05-22'), 'YYYY-MM-DD')
    ORDER BY date_;
-- 3. Ư���� ���� 
SELECT *
    FROM calendar
    WHERE TO_CHAR(date_,'MM') = '05'
    ORDER BY date_;
-- 4. Ư���ܾ� ���� ����
SELECT *
    FROM calendar
    WHERE INSTR(stroy, '��')>0
    ORDER BY date_; 
-- 5.��ü ���
SELECT *
    FROM calendar
    ORDER BY date_;   
