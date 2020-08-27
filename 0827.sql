select deptno, dname
from dept
where loc = 'BOSTON';


select deptno, dname
from dept
where loc = 'BOSTON';

select parameter, value
from NLS_SESSION_PARAMETERS;

alter session
set NLS_DATE_FORMAT = 'YYYY-MM-DD';

select hiredate
from emp
where deptno = 10;



create table emp_clerk
as
select * from emp
where job = 'CLERK';

create table emp_manager
as
select * from emp
where job = 'MANAGER';

create table emp_tf
as
select * from emp_clerk
union
select * from emp_manager;

select * from emp
where ename like '%S';

SELECT * FROM EMP
WHERE SAL<2000 OR SAL>3000;

SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30 AND (SAL NOT BETWEEN 1000 AND 2000);

SELECT * FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK')
  AND ENAME NOT LIKE '_L%'
  AND MGR IS NOT NULL
  AND COMM IS NULL;
  
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= '1983-01-01'
;

SELECT ENAME, SAL, COMM, SAL+COMM AS TOTAL
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY TOTAL DESC;

SELECT ENAME, SAL, SAL * 0.13 AS BONUS, DEPTNO
FROM EMP
WHERE DEPTNO = 10;


select * from emp
where job = upper('salesman');

select lower(ename) from emp
where job = upper('salesman');

SELECT INSTR('HELLO ORACLE', 'L', 4, 2) AS INSTR_1
FROM DUAL;
