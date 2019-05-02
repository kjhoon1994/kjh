use TEST;
create table Employees
   (
      id int not null,
      age int not null,
      first varchar (255),
      last varchar (255)
   );

insert INTO Employees(id, age, first, last) VALUES (100, 18, 'Zara','Ali');
insert INTO Employees(id, age, first, last) VALUES (101, 16, 'Magnaz','Fatma');	

SELECT * FROM Employees;