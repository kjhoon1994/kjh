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
   VALUES (104, "Lee", "질문", "2019-05-03", "111.111.111.113", 1, "5678", "강좌 시작일이 언제인가요?");   
   
   SELECT ssn, name_, title, sdate, ipaddress, blind, pw, contents FROM Guestbook;
   
   
   commit;
   SELECT (MAX(ssn)+1)
   FROM Guestbook;
      
   SELECT * FROM guestbook;
  