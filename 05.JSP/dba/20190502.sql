create table Employees
(
	id int not null,
    age int not null,
	first varchar (255),
	last varchar (255)
);

insert INTO Employees(id, age, first, last) VALUES (100, 18, 'Zara','Ali');
insert INTO Employees(id, age, first, last) VALUES (101, 16, 'Magnaz','Fatma');	

SELECT id, age, first, last FROM Employees;

SELECT INSTR('MySQL INSTR','SS') ;

CREATE TABLE members
	(
		id varchar(4),
        name_ varchar (50),
        phone varchar (20),
        email varchar (50)
    );
ALTER TABLE members 
	ADD CONSTRAINT members_id_PK PRIMARY KEY(id);
    
INSERT INTO members(id, name_, phone, email) VALUES ('M001', 'hong', '010-1111-2222', 'hong@naver.com');		
INSERT INTO members(id, name_, phone, email) VALUES ('M002', 'park', '010-1111-3333', 'park@naver.com');
INSERT INTO members(id, name_, phone, email) VALUES ('M003', 'kim', '010-1111-4444', 'kim@naver.com');
commit;

SELECT id, name_, phone, email FROM members;

DELETE FROM members;
SET SQL_SAFE_UPDATES = 0; /*0 삭제 가능하게 해준다 1 삭제 불가능하게 해준다 */

DELETE FROM members WHERE id='M004';