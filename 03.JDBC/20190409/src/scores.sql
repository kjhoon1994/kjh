-- ���̺� ����
-- ��ȣ, �̸�, ����1, ����2, ����3

CREATE TABLE scores(
    sid_ VARCHAR2(4) --PK. ������ ��ȣ�� ������ �ʵ���) G001, G002, ...
    , name_ NVARCHAR2(50)
    , sub1 NUMBER(3) --CHECK. 0~100
    , sub2 NUMBER(3) --CHECK. 0~100
    , sub3 NUMBER(3) --CHECK. 0~100
);

-- ���� ����
ALTER TABLE scores 
    ADD CONSTRAINT scores_sid_PK PRIMARY KEY(sid_);
ALTER TABLE scores 
    ADD CONSTRAINT scores_sub1_CH CHECK(sub1 BETWEEN 0 AND 100);
ALTER TABLE scores 
    ADD CONSTRAINT scores_sub1_CH CHECK(sub2 BETWEEN 0 AND 100);
ALTER TABLE scores 
    ADD CONSTRAINT scores_sub1_CH CHECK(sub3 BETWEEN 0 AND 100);

-- ���� �ڷ� �غ�
INSERT INTO scores(sid_, name_, sub1, sub2, sub3)
    VALUES ('G001', 'Hong', 100, 90, 90);
INSERT INTO scores(sid_, name_, sub1, sub2, sub3)
    VALUES ('G002', 'Kim', 90, 80, 90);
INSERT INTO scores(sid_, name_, sub1, sub2, sub3)
    VALUES ('G003', 'Kang', 70, 80, 90);
COMMIT;

-- �⺻ �� ����
CREATE OR REPLACE VIEW scoresView
AS 
SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) total_, ROUND((sub1 + sub2 + sub3)/3, 2) avg_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) rank_
    FROM scores
    ORDER BY sid_;
    
-- ��ü ��� ����
SELECT sid_, name_, sub1, sub2, sub3, total_, avg_, rank_
    FROM scoresView
    ORDER BY sid_;
    
-- �˻� ��� ����
-- ��ȣ ���� �˻� ���
SELECT sid_, name_, sub1, sub2, sub3, total_, avg_, rank_
FROM (SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) total_, ROUND((sub1 + sub2 + sub3)/3, 2) avg_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) rank_
    FROM scores)
    WHERE sid_ = 'G003'
    ORDER BY sid_;
    
-- �̸� ���� �˻� ���
SELECT sid_, name_, sub1, sub2, sub3, total_, avg_, rank_
FROM (SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) total_, ROUND((sub1 + sub2 + sub3)/3, 2) avg_ , RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) rank_
    FROM scores)
    WHERE INSTR(LOWER(name_) , LOWER('HONG')) >0
    ORDER BY sid_;
    
-- �並 �̿��� �̸� ���� �˻� ���
SELECT sid_, name_, sub1, sub2, sub3, total_, avg_, rank_
FROM scoresView
    WHERE INSTR(LOWER(name_) , LOWER('HONG')) >0
    ORDER BY sid_;    

-- ��ȣ �ڵ� ���� ���� 
SELECT MAX(sid_)
    FROM scores;

SELECT SUBSTR(MAX(sid_),2)+1 max_
    FROM scores;
    
SELECT TO_CHAR(SUBSTR(MAX(sid_),2)+1,'000') max_
    FROM scores;    

SELECT TRIM(TO_CHAR(SUBSTR(MAX(sid_),2)+1,'000')) max_
    FROM scores;    
    
SELECT CONCAT('G',TO_CHAR(SUBSTR(MAX(sid_),2)+1,'000')) max_
    FROM scores;    
    
SELECT CONCAT('G',TRIM(TO_CHAR(SUBSTR(MAX(sid_),2)+1,'000'))) newSid_
    FROM scores;    