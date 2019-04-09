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

-- ��ü ��� ����
SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) TOTAL_, ROUND((sub1 + sub2 + sub3)/3, 2) AVG_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) RANK_
    FROM scores
    ORDER BY sid_;
    
-- �˻� ��� ����
-- ��ȣ ���� �˻� ���
SELECT sid_, name_, sub1, sub2, sub3, TOTAL_, AVG_, RANK_
FROM (SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) TOTAL_, ROUND((sub1 + sub2 + sub3)/3, 2) AVG_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) RANK_
    FROM scores)
    WHERE sid_ = 'G003'
    ORDER BY sid_;
    
-- �̸� ���� �˻� ���
SELECT sid_, name_, sub1, sub2, sub3, TOTAL_, AVG_, RANK_
FROM (SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) TOTAL_, ROUND((sub1 + sub2 + sub3)/3, 2) AVG_ , RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) RANK_
    FROM scores)
    WHERE INSTR(LOWER(name_) , LOWER('HONG')) >0
    ORDER BY sid_;
    
-- �並 �̿��� �̸� ���� �˻� ���
SELECT sid_, name_, sub1, sub2, sub3, TOTAL_, AVG_, RANK_
FROM scoresView
    WHERE INSTR(LOWER(name_) , LOWER('HONG')) >0
    ORDER BY sid_;    
    
-- �⺻ �� ����
CREATE OR REPLACE VIEW scoresView
AS 
SELECT sid_, name_, sub1, sub2, sub3, (sub1 + sub2 + sub3) TOTAL_, ROUND((sub1 + sub2 + sub3)/3, 2) AVG_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) RANK_
    FROM scores
    ORDER BY sid_;