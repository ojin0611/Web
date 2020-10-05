# Do it! 오라클로 배우는 데이터베이스 입문

# 1. 데이터베이스 개념잡기

Database는 table, view, index, synonym, sequence등으로 구성돼있다.

Database를 조작하는 프로그램을 DBMS라고 한다. 그중 관계형 DB를 조작하는 프로그램을 RDBMS라고 한다. 우리가 아는 Oracle, MySQL, MariaDB 등이 여기 속한다.

근데 RDBMS를 사용하기 위한 툴들이 또 있는데, SQL*Plus(오라클 내장, cmd로 진행해서 불편), SQL Developer(오라클 전용), WorkBench(MySQL 전용)가 여기 속한다.


8/26

[갓주영님의 정리](https://docs.google.com/document/d/1U0XinMyf8pfwH0eGmcYyl2psefuA-oSjr37NrGv_1y4/edit?usp=sharing)

[Oracle 수업교안]([https://github.com/swacademy/Oracle/blob/master/1.%20Introduction.pdf](https://github.com/swacademy/Oracle/blob/master/1. Introduction.pdf))



계정생성방법 (scott)

우선 접속여부부터 확인하자

orcl 서비스가 올라왔는지 확인해야함
[ lsnrctl stop ] : 멈춰보세요
[ lsnrctl start ] : 실행해보세요이때 여기서 orcl이 잘 올라왔는지 확인하면 된다.지금 아래를 보면 안보인다.서비스(services.msc)에서 잘 동작하는지 확인하고 아니라면 재실행

```
# 명령프롬프트 접속 > sqlplus > conn sys as sysdba
alter session set "_ORACLE_SCRIPT" = true;

create user scott
identified by tiger 
default tablespace users
temporary tablespace temp;

# 여기서부터 관리자 권한으로 명령프롬프트 접속
alter user scott
default tablespace users
quota unlimited on users;

grant resource, connect to scott;
```



> 입력한다음 ed를 누르면 현재 buffer에 있는 명령어가 나온다. 버퍼에 있는 명령어를 다시실행하고싶으면 / 또는 run을 입력하면 된다.
>
> 이를 활용해서, 메모장에서 buffer에 직접 접근하여 명령어 편집을 쉽게 할 수 있다. (sqlplus 안쓰면되긴함)



그 다음에 scott.sql 에 저장돼있는 쿼리문을 실행하면 (sqlplus나 sql developer) scott 계정 내에 테이블들이 생성된다. 



# 2. 실무에서 가장 많이 사용하는 SQL, 조회

위에서 가져온 scott 계정 내의 테이블들로 실습한다.

- EMP : 사원정보
- DEPT : 부서정보
- SALGRADE : 급여정보
- BONUS : 보너스

##  SELECT

SELECT의 기능

1. Selection : row 에 대한 필터링 (where)
2. Projection : column 에 대한 필터링 (select)
3. Join : 여러 테이블에서의 검색



### AS

별칭지정을 위해 `AS`를 사용하도록 하자.

```
SELECT ENAME, SAL, SAL*12+COM AS ANNSAL, COMM FROM EMP;
```

별칭 줄 때 띄어쓰기 등이 있으면 쌍따옴표 `"` 를 써준다. 오라클에서 유일하게 쌍따옴표가 쓰이는 곳이다. 다른 문자열에서는 따옴표 `'`를 이용해줘야한다.



### NVL

Null 값을 대체하는 함수

> NVL(comm, 0) >> comm 컬럼에 있는 null을 0으로 대체





### ||

자바에선 “hAAA” + “AAAA” 에서처럼 `+`가 string concatenation 연산자였지만, 오라클에선 `||`이 concat operation이다.



위를 종합하면 아래와 같은 표현식이 나온다.

```
SELECT [ALL | DISTINCT] {* | column1, column2 [AS [alias]] | expr}
FROM table_name
WHERE condition
ORDER BY column [ASC | DESC]
```



### IN

```
SELECT *
FROM EMP
WHERE JOB IN ('MANAGEER', 'SALESMAN', 'CLERK');
```



### Like , 와일드카드

`_`를 쓰면 해당 위치의 문자가 무엇이든 상관없음. 1개!

`%`를 쓰면 길이와 상관없이 모든 문자 데이터를 의미.

> 해당 문자가 포함되어있는지를 확인하고싶으면 `\_` 또는 `\%`를 이용한다.

```
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';
```



### 집합연산자 

SELECT를 통해 선택한 열의 개수와 각각의 자료형이 같을 때 두 개 이상의 SELECT문 테이블을 합칠 수 있다. 



**집합연산자의 종류**

| 종류      | 설명                                                         |
| --------- | ------------------------------------------------------------ |
| UNION     | 연결된 SELECT문의 결과값들의 합집합. 중복값 제거             |
| UNION ALL | 연결된 SELECT문의 결과값들의 합집합. 중복값 포함             |
| MINUS     | 먼저 작성한 SELECT문 결과값에서 다음 SELECT문의 결과값 차집합 처리. |
| INTERSECT | 먼저 작성한 SELECT문과 다음 SELECT문 결과값이 같은 데이터만 출력. 교집함 |



### 날짜 포맷 변경

```
ALTER SESSION
SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
```



# 데이터 처리와 가공을 위한 오라클 함수

### 문자열 함수

upper, lower, initcap (첫번째 글자만 대문자), 

length, substr (문자열 일부 추출)

instr (특정문자 위치를 찾는 함수)

> 오라클은 인덱스가 1부터 시작된다.

```
SELECT INSTR('HELLO ORACLE', 'L', 4, 2) AS INSTR_1
FROM DUAL;
-- 4번 위치에서부터 검색하면 2번째로 등장하는 'L'은 몇 번 인덱스니? : 11
-- 없으면 0 반환
```



replace, lpad, rpad (데이터의 빈공간을 특정문자로 채우는 함수)

```
SELECT LPAD('ORACLE', 10, '#') AS LPAD_1 
FROM DUAL
-- 10칸중 ORACLE 제외한 나머지를 '#'으로 채우면? :####ORACLE
```

concat, trim, ltrim, rtrim



### 숫자 데이터 함수

round, trunc (버리기), ceil, floor, mod
```
select trunc(1234.5678, 2) as TRUNC_2 from dual;
-- 1234.56
```

nullif, coallesce (널값 검사)

decode(if else와 비슷), case(앞과 비슷)


### 날짜 데이터 함수

add_months (특정날짜 + 개월수), months_between(두 날짜의 개월수 차이), next_day(돌아오는 요일), last_day(달의 마지막 날의 요일)

round, trunc 

sysdate(실행시킬 때의 시간)


### 자료형 변환 함수

to_char (날짜, 숫자 -> 문자)
```
select to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss') as 현재날짜시간
from dual;
```

위의 yyyy, mm 등은 날짜 데이터를 표현하기 위한 형식이다. 

특정 언어에 맞춰서 날짜를 출력하기 위해서는 `nls_date_language = 'KOREAN'`를 이용해주자.

to_number (문자 -> 숫자)
`TO_NUMBER('[문자열 데이터(필수)]', '[인식될 숫자형태(필수)]')`

to+date (문자 -> 날짜)


### Null 처리 함수

NVL (위에서 언급)
```
select nvl(comm, 0)
from employees;
```

NVL2 (null이 아닐때 반환할 데이터를 추가로 지정할 수 있다)
```
select nvl(comm, 'O', 'X')
from emp;
```

### 상황에 따라 다른 데이터 반환

DECODE (switch-case와 유사)
```
select decode(job,
'manager', sal*1.1,
'salesman', sal*1.05,
'analyst', sal,
sal*1.03) as upsal
from emp;
```


CASE (위와 비슷한데 속도가 더 빠름. 가독성도 좋음. CASE 사용하자)

```
select 
case job
    when 'manager' then sal*1.1
    when 'salesman' then sal*1.05
    when 'analyst', sal
    else sal*1.03
end as upsal
from emp;
```

# 다중행 함수와 데이터 그룹화

SUM, COUNT, MAX, MIN, AVG

GROUP BY (순서는 아래와 같다)
```
select [조회할 열 이름]
from [조회할 테이블 이름]
where [조건식]
group by [그룹화할 열 지정]
order by [정렬하려는 열 지정]
```

### group by 절에 조건 줄 때 사용하는 HAVING절

그룹화된 결과 중 출력 그룹을 선별하는 조건식을 지정한다.

where가 having보다 먼저 실행된다.
```
select [조회할 열 이름]
from [조회할 테이블 이름]
where [조건식]
group by [그룹화할 열 지정]
having [출력 그룹을 제한하는 조건식]
order by [정렬하려는 열 지정]
```

### 그룹화와 관련된 함수들
group by 절에 지정할 수 있는 특수 함수들이 있습니다.

ROLLUP (명시한 열을 소그룹부터 대그룹의 순서로 각 그룹별 결과를 출력하고, 마지막에 총 데이터의 결과를 출력)


CUBE (지정한 모든 열에서 가능한 조합의 결과를 모두 출력)


GROUPING SETS (같은 수준의 그룹화 열이 여러개일 때 각 열별 그룹화를 통해 결과 값을 출력)

grouping (그룹화 여부 표시), listagg (데이터 가로로 나열)

pivot, unpivot

# Join

집합 연산자와 다르게 join은 테이블을 **가로**로 연결한 것이다.

테이블 명은 별칭으로 표현할 수 있다.

```
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
PRDER BY EMPNO;
```

조인의 종류는 데이터를 어떻게 연결하느냐에 따라 **등가 조인**, **비등가 조인**, **자체 조인**, **외부 조인** 등으로 구분한다.

## 등가 조인 
a.k.a 내부조인(inner join), 단순 조인(simple join)

특정 열 값이 일치한 출력 결과를 사용하는 방식으로 일반적으로 가장많이 사용되는 조인방식이다.


## 비등가 조인

등가조인 외의 방식을 비등가조인이라고 한다. 자주사용되지는 않지만, 특정 열의 일치여부를 검사하는 방식 외에 다른 방식(두 값의 사이)을 조건으로 사용하고 싶을 때 사용된다.

## 자체 조인

똑같은 테이블을 하나 더 만들어 조인해주는 것을 자체 조인이라고 한다.

## 외부 조인

두 테이블간 조인 수행에서 조인 기줄 열의 어느 한 쪽이 NULL이어도 강제로 출력하는 방식을 외부조인이라고 한다. 좌우를 따로 나누어 지정하며, 기준 열 중 한쪽에 (+) 기호를 붙여준다.

```
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
E2.EMPNO AS MGR_EMPNO,
E2.ENAME AS MGR_ENAME,
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;
```


## 표준 문법 - 조인

SQL 표준문법에서 사용되는 키워드들의 사용법

### NATURAL JOIN

등가 조인을 대신해 사용할 수 있는 조인방식.

두 테이블에 이름과 자료형이 같은 열을 찾은 후, 그 열을 기준으로 등가 조인을 해주는 방식이다. 조인 기준 열을 SELECT 절에 명시할 때 테이블 이름을 붙이면 안된다.

### JOIN ~ USING

NATURAL JOIN은 자동으로 조인 기준열을 지정하는 반면, USING 키워드를 이용하면 키워드에 조인 기준으로 사용할 열을 명시하여 조인할 수 있다. 

### JOIN ~ ON

가장 범용성있는 키워드. 기존 where 절에 있는 조인 조건식을 ON 키워드 옆에 작성합니다. 조인 기준 조건식은 ON에 명시하고, 그 밖의 출력행을 걸러내기 위해 where 조건식을 따로 사용합니다.

### OUTER JOIN

외부 조인에 사용한다. 위의 외부 조인 코드를 아래와 같이 변경한다.

```
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
E2.EMPNO AS MGR_EMPNO,
E2.ENAME AS MGR_ENAME,
FROM EMP E1, EMP E2 OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;
```

### 3개 이상의 테이블 조인

1. 아래와 같이 사용해도 무방
```
FROM TABLE1, TABLE2, TABLE3
WHERE TABLE1.COL = TABLE2.COL
AND TABLE2.COL = TABLE3.COL
```

2. 조건이 필요할 때

```
FROM TABLE1 JOIN TABLE2 ON (조건식)
JOIN TABLE3 ON (조건식)
```

---
> 10 : DML (INSERT, UPDATE,DELETE)
> 
> 11 : TCL (COMMIT, ROLLBACK)
> 
> 12 : DDL (CREATE, DROP, ALTER, TRUNCATE, COMMENT)
>
> 13 : DICTIONARY (VIEW, Synonym, Index, Sequence)
>
> 14 : Constraints (default, PK, FK, UK, CK, NN)
>
> 15 : DCL (GRANT, ROLE)

# 데이터 조작어 : 추가,수정,삭제 - Data Manipulation Language (DML)

DML이라고도 부르고 INSERT, UPDATE, DELETE문이 있다.

## INSERT

```
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (50, 'DATABASE', 'SEOUL');
```

열의 개수와 각 열에 입력할 데이터 개수가 일치해야한다.

자료형이 같아야 한다.

열 지정을 생략하면 순서대로 입력된다.

NULL을 입력하고싶을 땐, 명시적으로 `NULL`을 입력하거나, 아예 열 이름을 비운다.



## UPDATE

```sql
-- 데이터 전체 수정
UPDATE DEPT_TEMP
    SET LOC = 'SEOUL'
```

`ROLLBACK` : 수정한 내용 되돌리기 (COMMIT 반대)

```sql
-- 일부분 수정
UPDATE DEMP_TEMP
SET LOC = 'SEOUL'
WHERE DEPTNO = 40;
```

## DELETE

```sql
DELETE FROM EMP_TEMP
WHERE JOB='MANAGER'
```

DELETE는 ROLLBACK이 가능하다. (DML이기때문)

반면, TRUNCATE는 ROLLBACK할 수 없다.

# 데이터 정의어 - Data Definition Language (DDL)

데이터정의어는 데이터베이스 데이터를 보관하고 관리하기위해 제공되는 여러 객체의 생성,변경,삭제 관련 기능을 수행한다.

DML과 달리 명령어를 수행하자마자 데이터베이스에 수행한 내용이 바로 반영된다. 따라서 ROLLBACK이 불가능하다.

## CREATE

```SQL
CREATE TABLE EMP_DDL{
    EMPNO       NUMBER(4),
    ENAME       VARCHAR2(10),
    JOB         VARCHAR2(9),
    MGR         NUMBER(4),
    HIREDATE    DATE,
    SAL         NUMBER(7,2), -- 실수
    COMM        NUMBER(7,2),
    DEPTNO      NUMBER(2)
};

CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP
```

## ALTER

이미 생성된 오라클 데이터베이스 객체를 변경할 때 사용한다.

```SQL
-- 열 추가 ADD
ALTER TABLE EMP_ALTER
    ADD HP VARCHAR2(20)

-- 열 이름 변경 RENAME
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;

-- 열 자료형 변경 MODIFY
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

-- 특정 열 삭제
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;
```


## 테이블 이름 변경 RENAME

```SQL
RENAME EMP_ALTER TO EMP_RENAME;
```

## TRUNCATE

테이블의 모든 데이터만 삭제한다. 테이블 구조에는 영향이 없다.
```SQL
TRUNCATE TABLE EMP_RENAME;
```

## DROP

데이터베이스 객체를 삭제한다. 테이블이 통째로 삭제된다.

```SQL
DROP TABLE EMP_RENAME;
DESC EMP_RENAME; -- NOT FOUND
```


# 제약 조건
> NOT NULL : NULL 저장 허용하지 않음.  
> UNIQUE : 유일한 값을 가져야함. NULL은 중복에서 제외  
> PRIMARY KEY  
> FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능  
> CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능

## 제약 조건 확인
USER_CONSTRAINTS 데이터 사전을 활용한다.

열 이름 : 설명
> OWNER : 제약 조건 소유 계정  
> CONSTRAINT_NAME : 제약조건 이름  
> CONSTRAINT_TYPE : 제약조건 종류  
> TABLE_NAME : 테이블 이름

```SQL
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;
```

## 제약조건 이름 직접지정

```SQL
CREATE TABLE TABLE_NOTNULL2(
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL
);
```

## 기존 테이블에 제약조건 지정
```SQL
ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);
```
## 제약조건 삭제, 이름수정

```SQL
ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBLNN2_TBL_NN;

ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN3_TBL_NN
```


## NOT NULL

```SQL
CREATE TABLE TABLE_NOTNULL{
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
};
```

UNIQUE, PRIMARY KEY는 위의 NOT NULL을 바꿔쓰기만 하면 된다.

## FOREIGN KEY

```SQL
CREATE TABLE 테이블이름(
    ...(다른 열 정의),
    열 자료형 CONSTRAINT [제약 조건 이름] REFERENCES 참조테이블(참조할 열)
);

CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPT_NO)
);
```

### FOREIGN KEY로 참조 행 데이터 삭제하기
원래는 FOREIGN KEY로 참조하고 있는 부모 테이블의 열의 값을 삭제할 수 없다. 이를 삭제하는 3가지 방법이 있다.

1. 현재 삭제하려는 열 값을 참조하는 데이터를 먼저 삭제
```SQL
CONSTRAINT [제약조건 이름] REFERENCES 참조테이블(참조할 열) ON DELETE CASCADE;
-- 부모 테이블의 데이터 삭제하면 해당 값 참조하는 자식 테이블의 데이터들이 삭제된다.
```

2. 현재 삭제라혀는 열 값을 참조하는 데이터를 수정
```SQL
CONSTRAINT [제약조건 이름] REFERENCES 참조테이블(참조할 열) ON DELETE SET NULL;
-- 부모 테이블의 데이터 삭제하면 해당 값 참조하는 자식 테이블의 데이터들이 NULL로 수정된다.

```

3. 현재 삭제하려는 열을 참조하는 자식 테이블의 FOREIGN KEY 제약 조건 해제



## 데이터 형태와 범위를 정하는 CHECK
```SQL
CREATE TABLE TABLE_CHECK(
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK (LENGTH(LOGIN_PWD)>3)
);
```

## 기본값을 정하는 DEFAULT

제약조건과 별개로, 특정 열에 저장할 값이 지정되지 않았을 경우에 기본값을 지정할 수 있다.
```SQL
CREATE TABLE TABLE_DEFAULT(
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234
)

```




# 객체 종류
테이블 외에도 자주 사용하는 객체들은 다음과 같습니다.
- 데이터 사전
- 인덱스
- 뷰
- 시퀀스
- 동의어

## 데이터 사전

데이터베이스가 생성되는 시점에 자동으로 만들어지고, 데이터베이스 메모리/성능/사용자/권한/객체 등 오라클 데이터베이스 운영에 중요한 데이터가 보관돼있다.

이 데이터에 문제가 발생하면 오라클 데이터베이스 사용이 불가능해질수도 있고, 때문에 데이터 사전에는 직접 접근할 수 없다. 대신 데이터 사전 뷰를 제공하여 SELECT로 정보 열람을 할 수 있다.

### USER_ 접두어
현재 오라클에 접속해있는 사용자가 소유한 객체 정보.
```SQL
SELECT TABLE_NAME
FROM USER_TABLES;
```

### ALL_ 접두어
접속중인 사용자가 소유한 객체 및 다른 사용자가 소유한 객체 중 사용이 허락되어 있는 객체 정보
```SQL
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;
```

### DBA_ 접두어
데이터베이스 관리 권한을 가진 사용자만 조회할 수 있는 테이블
```SQL
SELEVT * FROM DBA_TABLES;
```

## 인덱스

```SQL
-- 소유한 인덱스 정보
SELECT * FROM USER_INDEXES;

-- 소유한 인덱스 컬럼 정보
SELECT * FROM USER_IND_COLUMNS;
```

### 생성, 삭제

```SQL
-- 생성
CREATE INDEX IDX_EMP_SAL
ON EMP(SAL)

-- 삭제
DROP INDEX IDX_EMP_SAL
```

## 뷰

뷰는 가상테이블로, 하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체다.

뷰의 목적은 편리성(SELECT 문의 복잡도 완화)과 보안성(테이블의 특정 열 가리기)이다.

뷰를 생성하기위해서는 `GRANT CREATE VIEW TO SCOTT`로 권한을 부여해줘야한다. 

```SQL
-- 생성
CREATE [OR REPLACE] [FORCE || NOFORCE] VIEW 뷰이름 (열이름1, 열이름2, ...)
AS (저장할 SELECT문)
[WITH CHECK OPTION [CONSTRAINT 제약조건]] -- 제약조건 만족하면 DML 작업 가능하도록
[WITH READ ONLY [CONSTRAINT 제약조건]]

-- 삭제는 DROP
```

### ROWNUM 
의사 열(pseudo column)이라는 특수 열. 실제 테이블에 존재하지는 않지만 특정 목적을 위해 테이블에 저장돼있는 열처럼 사용 가능한 열.

ROWNUM 열 데이터 번호는 테이블에 저장된 행이 조회된 순서대로 매겨진 일련번호다.



## 시퀀스

시퀀스는 오라클 데이터베이스에서 특정 규칙에 맞는 연속 숫자를 생성하는 객체다.

```SQL
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10 -- 10씩 증가
    START WITH 10 -- 10부터 시작
    MAXVALUE 90 -- 최대값
    MINVALUE 0 -- 최소값
    NOCYCLE -- 90 도달하면 0으로 안가고, 종료
    CACHE 2 -- 시퀀스가 생성할 번호 메모리에 미리 할당해 놓은 수 지정.
```

### 시퀀스 사용
`시퀀스이름.CURRVAL` 은 마지막으로 생성한 번호를 반환한다. 
`시퀀스이름.NEXTVAL` 은 다음 번호를 생성한다.

```SQL
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT SQT_DEPT_SEQUENCE.CURRVAL
FROM DUAL;
```

수정은 ALTER, 삭제는 DROP을 이용한다.

## 동의어

객체 이름 대신 사용할 수 있는 다른 이름을 부여하는 객체.
```SQL
CREATE SYNONYM E FOR EMP;

SELECT * FROM E; -- EMP와 동일
```


# 서브쿼리

SQL문 내부에서 사용하는 SELECT문.  서브쿼리 결과값을 사용하여 기능을 수행하는 영역을 메인쿼리라고 부른다.

## 특징

1. 비교 또는 조회 대상의 오른쪽에 놓이며 괄호로 묶어서 사용
2. 대부분 ORDER BY 사용 불가능
3. 비교대상과 같은 자료형과 같은 개수로 지정
4. 메인쿼리의 연산자 종류와 호환 가능


## 단일행 서브쿼리

실행결과가 단 하나의 행으로 나오는 서브쿼리.

단일행 연산자 
`> >= = <= < <> ^= !=`

## 다중행 서브쿼리

실행결과 행이 여러개로 나오는 서브쿼리.

다중행 연산자
`IN` : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있으면 true

```SQL
SELECT * 
FROM EMP
WHERE SAL IN (
            SELECT MAX(SAL)
            FROM EMP
            GROUP BY DEPTNO
            );
```

`ANY,SOME` : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
```SQL
-- IN과 같은 결과
SELECT *
FROM EMP
WHERE SAL = ANY ( -- SOME도 같은 결과
            SELECT MAX(SAL)
            FROM EMP
            GROUP BY DEPTNO
);

-- < MAX(SAL)과 같은 결과
SELECT *
FROM EMP
WHERE SAL < ANY (
    SELECT SAL
    FROM EMP
    WHERE DEPTNO = 30)
ORDER BY SAL,EMPNO
```

`ALL` : 메인쿼리의 조건식을 서브쿼리의 결과가 모두 만족하면 true

```SQL
SELECT *
FROM EMP
WHERE SAL > ALL (
    SELECT SAL
    FROM EMP
    WHERE DEPTNO = 30
);
```

`EXISTS` : 서브쿼리의 결과가 존재하면 (즉, 행이 1개 이상일 경우) true

```SQL
-- 모든 행
SELECT *
FROM EMP
WHERE EXISTS (
    SELECT DNAME
    FROM DEPT
    WHERE DEPTNO = 10
);

-- 결과값 존재하지 않음
SELECT *
FROM EMP
WHERE EXISTS (
    SELECT DNAME
    FROM DEPT
    WHERE DEPTNO = 50
);

```

## 다중열 서브쿼리

서브쿼리의 SELECT절에 비교할 데이터(열)를 여러개 지정하는 방식.

```SQL
SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN (
    SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO
);
```

## FROM절에 사용하는 서브쿼리, WITH절

```SQL
-- FROM 절에 들어가는 서브쿼리를 WITH절로 빼서 아래처럼 사용할 수 있다.
WITH 
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;
```

## SELECT절에 사용하는 서브쿼리

```SQL
SELECT EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE
    FROM SALGRADE
    WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
    DEPTNO,
    (SELECT DNAME 
    FROM DEPT
    WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;
```



# 트랜잭션 제어와 세션

## 트랜잭션

트랜잭션은 기능 한 가지를 수행하는 SQL문 덩어리로, 더 이상 분할할 수 없는 최소 수행 단위를 뜻하며 계좌이체와 같이 하나의 작업 또는 밀접하게 연관된 작업을 수행하기 위해 한 개 이상의 데이터 조작 명령어(DML)로 이루어진다. 

### ALL OR NOTHING
하나의 트랜잭션 내에 있는 여러 명령어를 한 번에 수행하여 작업을 완료하거나 아예 모두 수행하지 않는 상태, 즉 모든 작업을 취소한다.

트랜잭션을 제어하기 위해 사용하는 명령어를 TCL(Transaction Control Language)이라고 한다.

## 트랜잭션의 암시적 처리
자동 커밋이 되는 상황
- DDL (CREATE, DROP, ALTER, TRUNCATE, COMMENT)
- DCL (GRANT, ROLE)
- COMMIT 또는 ROLLBACK 실행되지않은채 SQL PLUS 정상종료한 경우
- SQLPLUS의 비정상종료, 시스템 장애 발생시

## 트랜잭션 제어 명령어 - Transaction Control Language (TCL)

### ROLLBACK

ROLLBACK은 `현재 트랜잭션에 포함된` 데이터 조작 관련 명령어(DML)의 수행을 모두 취소한다.

### COMMIT

지금까지 수행한 트랜잭션 명령어를 데이터베이스에 영구히 반영할 때 COMMIT 명령어를 사용한다. COMMIT 명령어 사용을 기점으로 ROLLBACK 명령어가 소용없다.


## 세션

오라클 데이터베이스에서 세션은 데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 후 접속을 종료하기까지 전체 기간을 의미한다.sqlplus와 sqldeveloper로 각각 scott 계정으로 접속하면 세션이 두개다.

COMMIT을 해줘야 다른 세션에서도 해당 테이블이 변경된 것을 확인할 수 있다.



## LOCK

한 세션이 조작중인 데이터는 트랜잭션이 완료되기 전까지 다른 세션에서 조작할 수 없다. 이렇게 데이터가 잠기는 현상을 LOCK이라고 한다. 1번 세션에서 데이터 조작 후 COMMIT을 하지 않은 상태에서 2번 세션이 해당 데이터를 조작하려고하면 세션이 멈추고, COMMIT(트랜잭션 완료)을 하면 그 때 2번 세션의 SQL문이 진행된다.

행 레벨 록(row level rock)과 테이블 레벨 록(table level rock)이 있다.


# 사용자, 권한, 롤 관리

## 사용자
관리자 권한을 가진 계정으로 접속해서 아래 코드를 진행한다.

```sql
-- 사용자 생성
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE

-- 권한 부여
GRANT CREATE SESSION TO ORCLSTUDY;

-- 사용자와 객체 모두 삭제
DROP USER ORCLSTUDY CASCADE; -- CASCADE 빼면 사용자만 삭제
```

## 권한

### 시스템 권한

사용자 생성과 정보 수정 및 삭제, 데이터베이스 접근, 오라클 데이터베이스의 여러 자원과 객체 생성 및 관리 등의 권한 포함
```SQL
GRANT [시스템권한] 
TO [사용자이름/ROLE이름/PUBLIC]
[WITH ADMIN OPTION] -- 사용자이름이 시스템권한을 부여할 수 있는 권한 갖는다.

-- 취소
REVOKE [시스템권한] FROM [사용자이름/ROLE이름/PUBLIC]

```


### 객체 권한

테이블 인덱스 뷰 시퀀스 등과 관련된 권한

```sql
GRANT [객체권한/ALL PRIVILEGES]
ON [스키마.객체이름]
TO [사용자이름/ROLE이름/PUBLIC]

-- 취소
REVOKE [객체권한/ALL PRIVILEGES]
ON [스키마.객체이름]
FROM [사용자이름/ROLE이름/PUBLIC]
[CASCADE CONSTRAINTS/FORCE] -- OPTIONAL
```

## 롤
롤은 여러 종류의 권한을 묶어놓은 그룹이다.
- CONNECT : 데이터베이스에 접속하는데 필요한 CREATE SESSION 권한
- RESOURCE : 기본 시스템 권한 묶음

### 사용자 롤
사용법은 아래와 같다.
1. CREATE ROLE 문으로 롤 생성
2. GRANT 명령어로 ROLE에 권한 포함
3. GRANT 명령어로 사용자에게 롤 부여
4. REVOKE로 롤 취소


# PL/SQL
