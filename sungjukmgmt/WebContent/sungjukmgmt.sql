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

CREATE OR REPLACE PROCEDURE sp_student_insert
(
    hakbun     IN   student.hakbun%TYPE,
    name     IN      student.name%TYPE,
    kor     IN      student.kor%TYPE,
    eng     IN      student.eng%TYPE,
    mat     IN      student.mat%TYPE
)
IS
    v_tot     student.tot%TYPE;
    v_avg     student.avg%TYPE;
    v_grade     student.grade%TYPE;
BEGIN
    v_tot := kor + eng + mat;
    v_avg := v_tot / 3;
    IF v_avg >= 90 AND v_avg <= 100 THEN
        v_grade := 'A';
    ELSIF v_avg >= 80 THEN
        v_grade := 'B';
    ELSIF v_avg >= 70 THEN
        v_grade := 'C';
    ELSIF v_avg >= 60 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'F';
    END IF;
    
    INSERT INTO Student 
    VALUES(hakbun, name, kor, eng, mat, v_tot, v_avg, v_grade);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE sp_select
(
    v_hakbun   IN   student.hakbun%TYPE,
    student_record  OUT    SYS_REFCURSOR
)
AS
BEGIN
    OPEN student_record FOR
    SELECT * FROM Student
    WHERE hakbun = v_hakbun;
END;

CREATE OR REPLACE PROCEDURE sp_delete
(
    v_hakbun   IN   student.hakbun%TYPE
)
IS
BEGIN
    DELETE FROM Student
    WHERE hakbun = v_hakbun;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE sp_update
(
    v_hakbun   IN   student.hakbun%TYPE,
    v_kor      IN   student.kor%TYPE,
    v_eng      IN   student.eng%TYPE,
    v_mat      IN   student.mat%TYPE
)
IS
    v_tot      student.tot%TYPE;
    v_avg      student.avg%TYPE;
    v_grade    student.grade%TYPE;
BEGIN
    v_tot := v_kor + v_eng + v_mat;
    v_avg := v_tot / 3;
    IF v_avg >= 90 AND v_avg <= 100 THEN
        v_grade := 'A';
    ELSIF v_avg >= 80 THEN
        v_grade := 'B';
    ELSIF v_avg >= 70 THEN
        v_grade := 'C';
    ELSIF v_avg >= 60 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'F';
    END IF;
    
    UPDATE Student
    SET kor = v_kor, eng = v_eng, mat = v_mat,
    tot = v_tot, avg = v_avg, grade = v_grade
    WHERE hakbun = v_hakbun;
    
    COMMIT;
END;








