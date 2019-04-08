-- id_, age, first_, last_
CREATE TABLE employees(
   id_ NUMBER
   ,age NUMBER
   ,first_ VARCHAR(20)
   ,last_ VARCHAR(20)
);

--id- employees ���̺� id_ �÷��� PK���� ����

ALTER TABLE employees 
    ADD CONSTRAINT emps_id_PK PRIMARY KEY(id_);

INSERT INTO Employees(id_, age, first_, last_) VALUES (100, 18, 'Zara', 'Ali');
INSERT INTO Employees(id_, age, first_, last_) VALUES (101, 25, 'Mahnaz', 'Fatma');
INSERT INTO Employees(id_, age, first_, last_) VALUES (102, 30, 'Zaid', 'Khan');
INSERT INTO Employees(id_, age, first_, last_) VALUES (103, 28, 'Sumit', 'Mittal');
COMMIT;

SELECT id_, age, first_, last_
    FROM employees;