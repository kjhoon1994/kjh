-- 테이블 생성
-- 번호, 이름, 과목1, 과목2, 과목3

CREATE TABLE scores(
    sid_ VARCHAR2(4) --PK. 동일한 번호가 나오지 않도록) G001, G002, ...
    , name_ NVARCHAR2(50)
    , sub1 NUMBER(3) --CHECK. 0~100
    , sub2 NUMBER(3) --CHECK. 0~100
    , sub3 NUMBER(3) --CHECK. 0~100
);

-- 제약 조건
ALTER TABLE scores 
    ADD CONSTRAINT scores_sid_PK PRIMARY KEY(sid_);
ALTER TABLE scores 
    ADD CONSTRAINT scores_sub1_CH CHECK(sub1 BETWEEN 0 AND 100);
ALTER TABLE scores 
    ADD CONSTRAINT scores_sub1_CH CHECK(sub2 BETWEEN 0 AND 100);
ALTER TABLE scores 
    ADD CONSTRAINT scores_sub1_CH CHECK(sub3 BETWEEN 0 AND 100);

-- 샘플 자료 준비
INSERT INTO scores(sid_, name_, sub1, sub2, sub3)
    VALUES ('G001', 'Hong', 100, 90, 90);
INSERT INTO scores(sid_, name_, sub1, sub2, sub3)
    VALUES ('G002', 'Kim', 90, 80, 90);
INSERT INTO scores(sid_, name_, sub1, sub2, sub3)
    VALUES ('G003', 'Kang', 70, 80, 90);
COMMIT;

-- 전체 출력 쿼리
SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) TOTAL_, ROUND((sub1 + sub2 + sub3)/3, 2) AVG_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) RANK_
    FROM scores
    ORDER BY sid_;
    
-- 검색 출력 쿼리
-- 번호 기준 검색 출력
SELECT sid_, name_, sub1, sub2, sub3, TOTAL_, AVG_, RANK_
FROM (SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) TOTAL_, ROUND((sub1 + sub2 + sub3)/3, 2) AVG_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) RANK_
    FROM scores)
    WHERE sid_ = 'G003'
    ORDER BY sid_;
    
-- 이름 기준 검색 출력
SELECT sid_, name_, sub1, sub2, sub3, TOTAL_, AVG_, RANK_
FROM (SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) TOTAL_, ROUND((sub1 + sub2 + sub3)/3, 2) AVG_ , RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) RANK_
    FROM scores)
    WHERE INSTR(LOWER(name_) , LOWER('HONG')) >0
    ORDER BY sid_;
    
-- 뷰를 이용한 이름 기준 검색 출력
SELECT sid_, name_, sub1, sub2, sub3, TOTAL_, AVG_, RANK_
FROM scoresView
    WHERE INSTR(LOWER(name_) , LOWER('HONG')) >0
    ORDER BY sid_;    
    
-- 기본 뷰 생성
CREATE OR REPLACE VIEW scoresView
AS 
SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) TOTAL_, ROUND((sub1 + sub2 + sub3)/3, 2) AVG_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) RANK_
    FROM scores
    ORDER BY sid_;