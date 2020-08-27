# Do it! 오라클로 배우는 데이터베이스 입문

# 1. 데이터베이스 개념잡기

Database는 table, view, index, synonym, sequence등으로 구성돼있다.

Database를 조작하는 프로그램을 DBMS라고 한다. 그중 관계형 DB를 조작하는 프로그램을 RDBMS라고 한다. 우리가 아는 Oracle, MySQL, MariaDB 등이 여기 속한다.

근데 RDBMS를 사용하기 위한 툴들이 또 있는데, SQL*Plus(오라클 내장, cmd로 진행해서 불편), SQL Developer(오라클 전용), WorkBench(MySQL 전용)가 여기 속한다.



SQL 5대 객체

1. 테이블
2. 뷰
3. 인덱스
4. 시퀀스
5. 동의어


----

1. 프로시저
2. 함수
3. 커서
4. 트리거
5. 패키지



8/26

[갓 주영님의 정리](https://docs.google.com/document/d/1U0XinMyf8pfwH0eGmcYyl2psefuA-oSjr37NrGv_1y4/edit?usp=sharing)

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



## 오라클 함수

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

### 날짜 데이터 함수
