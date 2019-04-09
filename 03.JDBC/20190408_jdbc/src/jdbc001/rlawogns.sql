-- id_, age, first_, last_
CREATE TABLE employees(
   id_ NUMBER
   ,age NUMBER
   ,first_ VARCHAR(20)
   ,last_ VARCHAR(20)
);

--id- employees 테이블 id_ 컬럼에 PK제약 지정

ALTER TABLE employees 
    ADD CONSTRAINT emps_id_PK PRIMARY KEY(id_);

INSERT INTO Employees(id_, age, first_, last_) VALUES (100, 18, 'Zara', 'Ali');
INSERT INTO Employees(id_, age, first_, last_) VALUES (101, 25, 'Mahnaz', 'Fatma');
INSERT INTO Employees(id_, age, first_, last_) VALUES (102, 30, 'Zaid', 'Khan');
INSERT INTO Employees(id_, age, first_, last_) VALUES (103, 28, 'Sumit', 'Mittal');
COMMIT;

SELECT id_, age, first_, last_
    FROM employees;
    
CREATE TABLE members(
    mid VARCHAR(4) -- PK.  M001, M002, ...
    , name_ NVARCHAR2(20)
    , phone VARCHAR2(20)
    , email VARCHAR2(50)
);

ALTER TABLE members
ADD CONSTRAINT members_mid_PK PRIMARY KEY(mid);
INSERT INTO members(mid, name_, phone, email) VALUES ('M001', 'kim', '010-5067-7822','kjh@naver,com');
INSERT INTO members(mid, name_, phone, email) VALUES ('M002', 'eric', '010-4564-1232','eric@naver,com');
INSERT INTO members(mid, name_, phone, email) VALUES ('M003', 'sam', '010-1111-3422','sam@naver,com');

-- 전체 출력
SELECT mid, name_, phone, email
    FROM members
    ORDER BY mid;
    
-- 검색 출력
SELECT mid, name_, phone, email
    FROM members
    WHERE INSTR(LOWER(name_), LOWER('SAM')) > 0
    ORDER BY mid;
    
    
    
    
    