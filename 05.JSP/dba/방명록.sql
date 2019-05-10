create table Guestbook
   (
      ssn int primary key,
      name_ varchar (20),
      title varchar (50),
      sdate date,
      ipaddress varchar(15),
      blind int,
      pw varchar(20),
      contents varchar(500)
   );
   
   INSERT INTO Guestbook (ssn, name_, title, sdate, ipaddress, blind, pw, contents) 
   VALUES (101, "Park", "질문", "2019-05-01", "111.111.111.111", 0, "1234", "강의 질문합니다.");
   
   INSERT INTO Guestbook (ssn, name_, title, sdate, ipaddress, blind, pw, contents) 
   VALUES (102, "Hong", "상담", "2019-05-02", "111.111.111.112", 0, "5678", "상담신청합니다.");
   
INSERT INTO Guestbook (ssn, name_, title, sdate, ipaddress, blind, pw, contents) 
   VALUES (104, "Lee", "질문", "2019-05-03", "111.111.111.113", 0, "5678", "강좌 시작일이 언제인가요?");   
   
   SELECT ssn, name_, title, sdate, ipaddress, blind, pw, contents FROM Guestbook;
   
   UPDATE guestbook SET blind = 0 WHERE ssn = 104;
   
   commit;
   SELECT (MAX(ssn)+1)
   FROM Guestbook;
      
DELETE FROM guestbook WHERE ssn= 105 ;
   
CREATE TABLE login(
	id_ varchar(4), /* Members 테이블의 사번(mid_) 기준 FK 지정. */ 
    pw varchar(20),
    grade INT
);   

SELECT * FROM members;
SELECT * FROM login;

ALTER TABLE login
	ADD CONSTRAINT login_id_fk FOREIGN KEY (id_)
			REFERENCES members(id);
            
INSERT INTO login(id_, pw, grade) VALUES ('M001', '1234', 0);
  
SELECT * FROM(SELECT id_ , pw, grade, name_, phone, m.email  
	FROM login l , members m
    WHERE l.id_ = m.id
    AND l.id_ = 'M001'
    AND l.pw = '1234'
    AND l.grade = 0) login;
COMMIT;


    
CREATE TABLE picture(
	pid varchar(50),
    pname varchar(50),
    pcontents varchar(50)
);

ALTER TABLE picture
	ADD CONSTRAINT picture_pid_pk PRIMARY KEY(pid);

INSERT INTO picture(pid, pname, pcontents) VALUES('P001','la.jpg','LA 배경사진');
INSERT INTO picture(pid, pname, pcontents) VALUES('P002','chicago.jpg','시카고 밴드 공연');    
INSERT INTO picture(pid, pname, pcontents) VALUES('P003','ny.jpg','뉴욕 콘서트 사진');

SELECT CONCAT('P',LPAD((SUBSTR(MAX(pid),2,4)+1),3,0)) AS pid
	FROM picture;
SELECT * FROM picture;
SELECT pname, pcontents
	FROM picture;
    
DELETE FROM picture
		WHERE pid ='P004';