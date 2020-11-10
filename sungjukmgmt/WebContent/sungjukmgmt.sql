ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER sungjukmgmt
IDENTIFIED BY sungjukmgmt
DEFAULT tablespace USERS
TEMPORARY tablespace temp;

ALTER USER sungjukmgmt
DEFAULT tablespace USERS
QUOTA UNLIMITED ON USERS;

GRANT resource, connect TO sungjukmgmt;

CREATE TABLE Student
(
	hakbun    CHAR(7),
	name      VARCHAR2(20)   CONSTRAINT student_name_nn NOT NULL,
	kor       NUMBER(3)   CONSTRAINT student_kor_nn NOT NULL,
	eng       NUMBER(3)   CONSTRAINT student_eng_nn NOT NULL,
	mat       NUMBER(3)   CONSTRAINT student_mat_nn NOT NULL,
	tot       NUMBER(3),
	avg       NUMBER(5,2),
	grade     CHAR(1),
	CONSTRAINT student_hakbun_pk PRIMARY KEY(hakbun),
	CONSTRAINT student_kor_ck CHECK(kor BETWEEN 0 AND 100),
	CONSTRAINT student_eng_ck CHECK(eng BETWEEN 0 AND 100),
	CONSTRAINT student_mat_ck CHECK(mat BETWEEN 0 AND 100),
	CONSTRAINT student_grade_ck CHECK(grade IN('A','B','C','D','F'))
)

CREATE OR REPLACE PROCEDURE sp_select_all
(
	student_record    OUT    SYS_REFCURSOR
)
AS
BEGIN
	OPEN student_record FOR
	SELECT hakbun, name, kor, eng, mat FROM Student
	ORDER BY tot DESC;
END;
















