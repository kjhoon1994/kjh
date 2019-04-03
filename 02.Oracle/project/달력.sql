CREATE TABLE calendar(
numb_ VARCHAR(4),
date_ DATE ,
stroy NVARCHAR2(200)
);
INSERT INTO calendar
    VALUES ('S001', '2018-01-01', '신정');
INSERT INTO calendar
    VALUES ('S003', '2018-03-01', '삼일절');
INSERT INTO calendar
    VALUES ('S002', '2018-02-16', '설날');
INSERT INTO calendar
    VALUES('S012', '2018-07-19', '일정관리 프로그램 작성');
INSERT INTO calendar
    VALUES('S008', '2018-09-24', '추석');
INSERT INTO calendar
    VALUES('S006', '2018-06-06', '현충일');
INSERT INTO calendar
    VALUES ('S004', '2018-05-05', '어린이날');
INSERT INTO calendar
    VALUES('S007', '2018-08-15', '광복절');
INSERT INTO calendar
    VALUES('S005', '2018-05-22', '부처님오신날'); 
INSERT INTO calendar    
    VALUES('S015', '2019-03-28', '달력만들기');
INSERT INTO calendar
    VALUES('S011', '2018-10-09', '한글날');
INSERT INTO calendar
    VALUES('S009', '2018-10-03', '개천절');
COMMIT;
 
 
-- 1. 오늘 일정    
SELECT *
    FROM calendar
    WHERE date_ = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    ORDER BY date_;
-- 2. 특정일 일정
SELECT *   
    FROM calendar
    WHERE date_ = TO_CHAR(TO_DATE('2018-05-22'), 'YYYY-MM-DD')
    ORDER BY date_;
-- 3. 특정월 일정 
SELECT *
    FROM calendar
    WHERE TO_CHAR(date_,'MM') = '05'
    ORDER BY date_;
-- 4. 특정단어 포함 일정
SELECT *
    FROM calendar
    WHERE INSTR(stroy, '날')>0
    ORDER BY date_; 
-- 5.전체 출력
SELECT *
    FROM calendar
    ORDER BY date_;   
