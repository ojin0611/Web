ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER salmgmt  IDENTIFIED BY salmgmt
DEFAULT tablespace USERS
TEMPORARY tablespace TEMP;

ALTER USER salmgmt DEFAULT tablespace USERS
QUOTA UNLIMINTED ON USERS;

GRANT connect, resource TO salmgmt;

CREATE TABLE Department
(
	code                  CHAR(1)  NOT NULL ,
	dname                 VARCHAR2(20)  NOT NULL 
);

CREATE UNIQUE INDEX Department_idx ON Department
(code  ASC);

ALTER TABLE Department
	ADD CONSTRAINT  department_code_pk PRIMARY KEY (code);

INSERT INTO Department VALUES('A', '영업부');
INSERT INTO Department VALUES('B', '시설부');
INSERT INTO Department VALUES('C', '자재부');
INSERT INTO Department VALUES('D', '관리부');
INSERT INTO Department VALUES('E', '경리부');
INSERT INTO Department VALUES('F', '총무부');
INSERT INTO Department VALUES('G', '운용부');
INSERT INTO Department VALUES('H', '연구부');
COMMIT;

CREATE TABLE Salgrade
(
	grade                 CHAR(1)  NOT NULL ,
	money                 NUMBER(6)  NOT NULL 
);

CREATE UNIQUE INDEX Salgrade_idx ON Salgrade
(grade  ASC);

ALTER TABLE Salgrade
	ADD CONSTRAINT  salgrade_grade_pk PRIMARY KEY (grade);	
	
INSERT INTO Salgrade VALUES('1', 730000);
INSERT INTO Salgrade VALUES('2', 630000);
INSERT INTO Salgrade VALUES('3', 590000);
INSERT INTO Salgrade VALUES('4', 510000);
INSERT INTO Salgrade VALUES('5', 430000);
INSERT INTO Salgrade VALUES('6', 390000);
INSERT INTO Salgrade VALUES('7', 340000);
INSERT INTO Salgrade VALUES('8', 310000);
INSERT INTO Salgrade VALUES('9', 290000);
COMMIT;

CREATE TABLE Employee
(
	sabun                 CHAR(4)  NOT NULL ,
	hobong                NUMBER(1)  NOT NULL ,
	night                 NUMBER(2)  NOT NULL ,
	family                NUMBER(2)  NOT NULL ,
	gibon                 NUMBER(5)  NULL ,
	money                 NUMBER(6)  NULL ,
	nightmoney            NUMBER(6)  NULL ,
	familymoney           NUMBER(6)  NULL ,
	salary                NUMBER(7)  NULL ,
	tax                   NUMBER(6)  NULL ,
	sum                   NUMBER(7)  NULL ,
	code                  CHAR(1)  NULL 
);

CREATE UNIQUE INDEX Employee_idx ON Employee
(sabun  ASC);

ALTER TABLE Employee
	ADD CONSTRAINT  employee_sabun_pk PRIMARY KEY (sabun);

ALTER TABLE Employee
	ADD (CONSTRAINT  employee_code_fk FOREIGN KEY (code) REFERENCES Department(code));

	
CREATE OR REPLACE PROCEDURE employee_all_select
(
	out_employee_all  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_employee_all 
	FOR
	SELECT sabun, dname, gibon, money, nightmoney, 
	            familymoney, salary, tax, sum
	FROM Employee, Department
	WHERE Employee.code = Department.code
	ORDER BY sum DESC;
END;
/	
	
CREATE OR REPLACE PROCEDURE select_get_money
(
	v_grade   IN   salgrade.grade%TYPE, 
	out_money  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_money 
	FOR
	SELECT money
	FROM salgrade
	WHERE grade = v_grade;
END;
/	

CREATE OR REPLACE PROCEDURE select_get_dname
(
	v_code   IN   Department.code%TYPE, 
	out_dname  OUT  SYS_REFCURSOR
)
AS
BEGIN
	OPEN out_dname 
	FOR
	SELECT dname
	FROM Department
	WHERE code = v_code;
END;
/	

CREATE OR REPLACE PROCEDURE employee_insert
(
	v_sabun                  employee.sabun%TYPE,
	v_hobong                employee.hobong%TYPE,
	v_night                   employee.night%TYPE,
	v_family                 employee.family%TYPE,
	v_gibon                  employee.gibon%TYPE,
	v_money                employee.money%TYPE,
	v_nightmoney         employee.nightmoney%TYPE,
	v_familymoney       employee.familymoney%TYPE,
	v_salary                employee.salary%TYPE,
	v_tax                    employee.tax%TYPE,
	v_sum                   employee.sum%TYPE,
	v_code                  employee.code%TYPE 
)
IS
BEGIN
	INSERT INTO Employee
	VALUES(v_sabun, v_hobong, v_night, v_family, v_gibon, v_money,
	              v_nightmoney, v_familymoney, v_salary, v_tax, v_sum, v_code);
	COMMIT;
END;
/