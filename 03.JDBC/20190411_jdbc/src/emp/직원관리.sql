CREATE TABLE login (
	id_ VARCHAR2(20) --PK
	, pw_ VARCHAR2(20)
);

ALTER TABLE login
 ADD CONSTRAINT login_id_pk PRIMARY KEY(id_);

INSERT INTO login (id_, pw_)
    VALUES ('admin', '1234');
COMMIT;


CREATE TABLE regions (
	regId VARCHAR2(5)   --PK. REG01, REG02, ...
	,reg_name  NVARCHAR2(20)
);

ALTER TABLE regions
 ADD CONSTRAINT regions_regId_pk PRIMARY KEY(regId);


INSERT INTO regions (regId, reg_name)
    VALUES ((SELECT CONCAT('REG', LPAD(NVL(SUBSTR(MAX(regId), 4), 0) + 1, 2, 0)) 
	AS newId FROM regions), '서울');
COMMIT;

-- (employees 테이블에서 regId를 참조하는지 확인)삭제가능여부
SELECT regId, reg_name , (SELECT COUNT(*) FROM employees WHERE regId = r.regId) count_
    FROM regions r
    ORDER BY regId;

DELETE FROM regions WHERE regId='REG01';


CREATE TABLE departments (
	deptId VARCHAR2(67)   --PK. DEPT01, DEPT02, ...
	,dept_name  NVARCHAR2(20) NOT NULL
);

ALTER TABLE departments
 ADD CONSTRAINT departments_deptId_pk PRIMARY KEY(deptId);


INSERT INTO departments (deptId, dept_name)
    VALUES ((SELECT CONCAT('DEPT', LPAD(NVL(SUBSTR(MAX(deptId), 5), 0) + 1, 2, 0)) 
	AS newId FROM departments), '개발부');
COMMIT;




CREATE TABLE jobs (
	jobId VARCHAR2(5)   --PK. JOB01, JOB02, ...
	,job_title  NVARCHAR2(20) NOT NULL
	,min_basicPay NUMBER
);

ALTER TABLE jobs
 ADD CONSTRAINT jobs_jobId_pk PRIMARY KEY(jobId);


INSERT INTO jobs (jobId, job_title, min_basicPay)
    VALUES ((SELECT CONCAT('JOB', LPAD(NVL(SUBSTR(MAX(jobId), 4), 0) + 1, 2, 0)) 
        AS newId FROM jobs), '사원', 2000000);
COMMIT;



CREATE TABLE employees (
        empId VARCHAR2(6) --PK. EMP001, EMP002, ...
       ,name_ NVARCHAR2(20) NOT NULL
       ,ssn  VARCHAR2(14) NOT NULL
       ,hiredate DATE     NOT NULL
       ,phone   VARCHAR2(15)
       ,regId VARCHAR2(5)
       ,deptId VARCHAR2(6)
       ,jobId VARCHAR2(5)
       ,basicpay NUMBER NOT NULL
       ,extrapay NUMBER NOT NULL
);

ALTER TABLE employees
    ADD (CONSTRAINTS employees_empid_pk PRIMARY KEY(empId)
        , CONSTRAINTS employees_regId_fk FOREIGN KEY(regId)
            REFERENCES regions(regId)
        , CONSTRAINTS employees_deptId_fk FOREIGN KEY(deptId)
            REFERENCES departments(deptId)
        , CONSTRAINTS employees_jobId_fk FOREIGN KEY(jobId)
            REFERENCES jobs(jobId));


INSERT INTO employees  (empId, name_, ssn, hiredate, phone
    , regId, deptId, jobId, basicpay, extrapay)
    VALUES ((SELECT CONCAT('EMP', LPAD(NVL(SUBSTR(MAX(empId), 4), 0) + 1, 3, 0)) 
        AS newId FROM employees), '홍길동', '901010-1234567', '2010-10-10'
        , '010-1234-1234', 'REG01', 'DEPT01', 'JOB01', 3000000, 1000000);
COMMIT;

CREATE OR REPLACE VIEW empView
AS
SELECT empId, name_, ssn, hiredate, phone
    ,e.regId, reg_name, e.deptId, dept_name, e.jobId, job_title
    ,basicpay, extrapay, (basicpay+extrapay) pay
    FROM employees e, regions r, departments d, jobs j
    WHERE e.regId = r.regId
    AND e.deptId = d.deptId
    AND e. jobId = j.jobId;
 
SELECT empId, name_, ssn, hiredate, phone
    ,regId, reg_name, deptId, dept_name, jobId, job_title
    ,basicpay, extrapay, (basicpay+extrapay) pay
    FROM empView
    ORDER BY empId;
