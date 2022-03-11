-- 모든 직업 조회
SELECT * FROM jobs;

--모든 직원 정보
SELECT *
FROM EMPLOYEES e; 

--사원의 이름과 사원정보 가져오기
SELECT FIRST_NAME , LAST_NAME , EMPLOYEE_ID 
FROM EMPLOYEES e2 ;
--사원의 이름과 사원번호, 직무, 급여 가져온다.
SELECT  FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID ,JOB_ID ,SALARY 
FROM EMPLOYEES e ;

--부서 번호와 부서이름을 가져온다.
SELECT DEPARTMENT_ID ,DEPARTMENT_NAME 
FROM DEPARTMENTS d; 

--각 사원들의 급여액과 급여액에서 1000을 더한 값, 200을 뺀 값, 2를 곱한 값, 2로 나눈 값을 가져온다.
SELECT SALARY , SALARY +1000, SALARY -200, SALARY *2, SALARY /2
FROM EMPLOYEES e2 ;
--각 사원의 급여액, 커미션, 급여 + 커미션 액수를 가져온다.
SELECT SALARY , NVL(COMMISSION_PCT,0) , NVL(SALARY * COMMISSION_PCT,0) --nvl null값을 없엠
FROM EMPLOYEES e ;

--사원들의 이름과 직무를 다음 양식으로 가져온다.000 사원의 담당 직무는 XXX 입니다.
SELECT FIRST_NAME || LAST_NAME || JOB_ID 
FROM EMPLOYEES e ;
SELECT FIRST_NAME || LAST_NAME || '사원의 담당직무는 ' || JOB_ID || '입니다.'
FROM EMPLOYEES e ;

--사원들이 근무하고 있는 근무 부서의 번호를 가져온다.
SELECT DISTINCT LOCATION_ID -- destinct : 중복제외
FROM DEPARTMENTS d ;

--근무 부서가 101번인 사원들의 사원번호, 이름, 근무 부서를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE EMPLOYEE_ID = 101;
--근무 부서 번호가 101번이 아닌 사원들의 사원번호, 이름, 근무 부서 번호를 가져온다.
SELECT FIRST_NAME , LAST_NAME , EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE EMPLOYEE_ID != 101; 
--급여가 9000이상인 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE SALARY >=9000;
--이름이 steavn 사원의 사원번호, 이름, 직무, 급여를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE LAST_NAME = 'King';
--직무가 IT_PROG인 사원의 사원번호, 이름, 직무를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG';
--직무가 IT_PROG이 아닌 사원의 사원번호, 이름, 직무를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE JOB_ID <> 'IT_PROG';
--2005년 1월 1일 이후에 입사한 사원의 사원번호, 이름, 입사일을 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , HIRE_DATE 
FROM EMPLOYEES e3 
WHERE HIRE_DATE >= '2005/01/01';

--102번 부서에서 근무하고 있는 직무가 MANAGER인 사원의 사원번호, 이름, 근무부서, 직무를 가져온다.
SELECT  EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE MANAGER_ID = 102 AND JOB_ID = 'IT_PROG';
--입사년도가 1981년인 사원중에 급여가 1500 이상인 사원의 사원번호, 이름, 급여, 입사일을 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY , HIRE_DATE 
FROM EMPLOYEES e2 
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE <= '2020/01/01' AND SALARY >= 1500;

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY , HIRE_DATE 
FROM EMPLOYEES e2 
WHERE HIRE_DATE BETWEEN '2005/01/01'AND'2020/01/01'AND SALARY >= 1500; 

--30번 부서에 근무하고 있는 사원 중에 급여가 2700 이상인 사원의 사원번호, 이름, 부서번호, 급여를 가져온다.
SELECT  EMPLOYEE_ID , FIRST_NAME , LAST_NAME , DEPARTMENT_ID , SALARY 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 30 AND SALARY >= 2700 ;
--직속상관 사원 번호가 122번인 사원중에 직무가 CLERK인 사원의 사원번호, 이름, 직속상관번호, 직무를 가져온다.
SELECT  EMPLOYEE_ID , FIRST_NAME , LAST_NAME , DEPARTMENT_ID , JOB_ID 
FROM EMPLOYEES e2 
WHERE MANAGER_ID = 122 AND JOB_ID = 'ST_CLERK';
--급여가 2000보다 크거나 1000보다 작은 사원의 사원번호, 이름, 급여를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE SALARY > 2000 OR SALARY <1000 ;

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE not(SALARY >= 1000 AND SALARY <= 2000);

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE not(SALARY BETWEEN 1000 AND 2000);
--부서번호가 50이거나 80 인 사원의 사원번호, 이름, 부서번호를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 50 OR DEPARTMENT_ID = 80;
--직무가 CLERK, SALESMAN, ANALYST인 사원의 사원번호, 이름, 직무를 가져온다.
SELECT DEPARTMENT_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'ST_CLERK' OR JOB_ID = 'IT_PROG' OR JOB_ID = 'ST_MAN';
SELECT DEPARTMENT_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE JOB_ID IN('ST_CLERK','IT_PROG','ST_MAN');
--사원 번호가 100, 101, 102가 아닌 사원들의 사원번호, 이름을 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME 
FROM EMPLOYEES e 
WHERE NOT (EMPLOYEE_ID IN(100,101,102));

--이름이 A로 시작하는 사원의 이름과 사원 번호를 가져온다.
SELECT FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE FIRST_NAME LIKE 'A%';
--이름이 g로 끝나는 사원의 이름과 사원 번호를 가져온다.
SELECT FIRST_NAME , LAST_NAME , EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE LAST_NAME LIKE '%g';
--이름에 a가 포함되어 있는 사원의 이름과 사원 번호를 가져온다.
SELECT FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE FIRST_NAME LIKE '%a%';
--이름의 두번째 글자가 A인 사원의 사원 이름, 사원 번호를 가져온다.
SELECT FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE FIRST_NAME LIKE '_a%';
--이름이 4글자인 사원의 사원 이름, 사원 번호를 가져온다.
SELECT FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE FIRST_NAME LIKE '____';

--사원중에 커미션을 받지 않는 사원의 사원번호, 이름, 커미션을 가져온다.
SELECT FIRST_NAME , LAST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e2 
WHERE COMMISSION_PCT IS NULL ;
--아닌
SELECT FIRST_NAME , LAST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e2 
WHERE COMMISSION_PCT IS NOT NULL ;
--회사 대표(직속상관이 없는 사람)의 이름과 사원번호를 가져온다.
SELECT FIRST_NAME , LAST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e2 
WHERE MANAGER_ID IS NULL;

--사원의 사원번호, 이름, 급여를 가져온다. 급여를 기준으로 오름차순 정렬을 한다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
ORDER BY SALARY ASC; -- asc 생략가능
--사원의 사원번호, 이름, 급여를 가져온다. 사원번호를 기준으로 내림차순 정렬을 한다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
ORDER BY EMPLOYEE_ID DESC ;
--사원의 사원번호, 이름을 가져온다, 사원의 이름을 기준으로 오름차순 정렬을 한다.
SELECT EMPLOYEE_ID , FIRST_NAME 
FROM EMPLOYEES e2 
ORDER BY FIRST_NAME ASC ;
--사원의 사원번호, 이름, 입사일을 가져온다. 입사일을 기준으로 내림차순 정렬을 한다.
SELECT EMPLOYEE_ID , FIRST_NAME , HIRE_DATE 
FROM EMPLOYEES e2 
ORDER BY HIRE_DATE DESC;
--직무가 SALESMAN인 사원의 사원이름, 사원번호, 급여를 가져온다. 급여를 기준으로 오름차순 정렬을 한다.
SELECT FIRST_NAME , EMPLOYEE_ID , SALARY 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG'
ORDER BY SALARY ;
--2005년에 입사한 사원들의 사원번호, 사원 이름, 입사일을 가져온다. 사원 번호를 기준으로 내림차순 정렬을 한다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , HIRE_DATE 
FROM EMPLOYEES e2 
WHERE HIRE_DATE BETWEEN '2005/01/01' AND '2005/12/31'
ORDER BY EMPLOYEE_ID DESC;
--사원의 이름, 급여, 커미션을 가져온다. 커미션을 기준으로 오름차순 정렬을 한다.
SELECT FIRST_NAME , LAST_NAME , SALARY , COMMISSION_PCT 
FROM EMPLOYEES e2 
ORDER BY COMMISSION_PCT ;
--사원의 이름, 급여, 커미션을 가져온다. 커미션을 기준으로 내임차순 정렬을 한다.
SELECT FIRST_NAME , LAST_NAME , SALARY , COMMISSION_PCT 
FROM EMPLOYEES e2 
ORDER BY COMMISSION_PCT DESC ;
-- 사원의 이름, 사원번호 , 급여를 가져온다. 급여를 기준으로 내림차순 정렬 , 이름을 기준으로 오름차순 정렬(똑같은 기준)
SELECT FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
ORDER BY SALARY DESC , FIRST_NAME ASC ;

-- 절대값 구하기
SELECT -10 , ABS(-10) FROM dual; 
--전직원의 급여를 5000 삭감하고 삭감한 급여액의 절대값을 구한다.
SELECT SALARY , SALARY - 5000, ABS(SALARY-5000) 
FROM EMPLOYEES e2; 
-- 소수점 이하 버림
SELECT 12.32432, FLOOR(12.3423) FROM DUAL ;
--급여가 1500 이상인 사원의 급여를 15% 삭감한다. 단 소수점 이하는 버린다.
SELECT SALARY , SALARY*0.85 , FLOOR(SALARY*0.85) 
FROM EMPLOYEES e2 
WHERE SALARY >= 1500;
--급여가 3천 이하인 사원들의 급여를 20%씩 인상한다. 단 10의 자리를 기준으로 반올림한다.
SELECT SALARY , SALARY * 1.2 , ROUND(SALARY * 1.2 , -2) --10에 자리에서 반올림 
FROM EMPLOYEES e2 
WHERE SALARY <=3000;
--버림, 자릿수를 정할 수 있다.
SELECT 1112.2345, trunc(1112.2345), TRUNC(1112.2345,2),TRUNC(1112.23455,-2) FROM dual;
--전 직원의 급여를 10자리 이하를 삭감한다.
SELECT SALARY , TRUNC(SALARY , -2)
FROM EMPLOYEES e ;
-- 나머지 구하기
SELECT mod(10,3), MOD (10,4)
FROM DUAL ;

-- 대문자 -> 소문자
SELECT 'AbcdEF',LOWER('AVcdEF') FROM dual;
-- 사원들의 이메일을 소문자로 가져온다.
SELECT EMAIL , LOWER(EMAIL) 
FROM EMPLOYEES e2 ;
-- 소문자 -> 대문자
SELECT 'ABcdEF', UPPER('ABcdEF') FROM dual; 
-- 사원들의 이메일을 가져온다. 대문자 -> 소문자 -> 대문자
SELECT  LAST_NAME  , LOWER(LAST_NAME), UPPER(LAST_NAME) 
FROM EMPLOYEES e2 ;
-- 첫 글자만 대문자로 나머지는 소문자로 initcap
SELECT 'aBCDEF', INITCAP('aBCDEF') FROM dual;
-- 사원이름을 첫글자만 대무자로 나머지는 소문자로 initcap
SELECT EMAIL , INITCAP(EMAIL)
FROM EMPLOYEES e2 ;
-- 문자열 연결 concat
SELECT CONCAT ('asdf',CONCAT('abc','efg')) 
FROM DUAL ;
-- 사원들의 이름과 직무를 다음과 같이 가져온다 ||도 
-- 사원의 이름은 000 이고 , 직무는 000입니다.
SELECT CONCAT(CONCAT(CONCAT(CONCAT('사원의 이름은', FIRST_NAME),' 이고,직무는'), JOB_ID ),'입니다.')
FROM EMPLOYEES e ;
SELECT '사원의 이름은'||FIRST_NAME ||' 이고, 직무는 '||JOB_ID ||'입니다.'
FROM EMPLOYEES e ;

-- 문자열의 길이 
SELECT LENGTH('abcd'), LENGTHB('abcd'), LENGTH('안녕하세요'), LENGTHB('안녕하세요') FROM dual;

-- 문자열 잘라내기
SELECT SUBSTR('abcd',3),SUBSTRB('abcd',3) ,
	   SUBSTR('안녕하세요',3),SUBSTRB('안녕하세요',3) 
FROM DUAL ;

SELECT SUBSTR('abcedfghi',3,4), SUBSTR('동해물과 백두산이',3,4) FROM DUAL ;

SELECT INSTR('asdfasdfasdf','sd'),INSTR('asdfasdfasdf','as',2) ,
		INSTR('asdfasdfasdf','as',3,2) 
FROM DUAL ;

SELECT INSTR('aaaaa','sd')
FROM DUAL ;

--사원의 이름 중에 a라는 글자가 두번째 이후에 나타나는 사원의 이름을 가져온다.\
SELECT FIRST_NAME 
FROM EMPLOYEES e2 
WHERE INSTR(FIRST_NAME, 'a') > 1;

-- 특정문자열로 채우기
SELECT '문자열', lpad('문자열',20),rpad('문자열',20)
		, lpad('문자열',20,'_'),rpad('문자열',20,'_')FROM dual;

-- 공백제거
SELECT '          문자열          ', LTRIM('          문자열          '),
		RTRIM('          문자열          '), TRIM('          문자열          ') 
FROM  DUAL ;

--문자열 변경
SELECT 'asdfasdf' , REPLACE ('sadfasdf','asd','dddddddd')
FROM DUAL ;

--현재 날짜 구하기
SELECT SYSDATE FROM dual;

--날짜 데이터 연산
SELECT SYSDATE , SYSDATE - 10000 , SYSDATE + 10000
FROM DUAL ;

-- 각 사원이 입자한 날짜로 부터 1000일 후가 되는 날짜 가져오기
SELECT HIRE_DATE, HIRE_DATE + 1000 
FROM EMPLOYEES e ;

-- 직무가 IT_PROG인 사원의 입사일 100일전 날짜 가져오기
SELECT HIRE_DATE , HIRE_DATE -100
FROM EMPLOYEES e2 
WHERE  JOB_ID = 'IT_PROG';

--전 사원의 근무 일을 가져온다
SELECT FLOOR( SYSDATE - HIRE_DATE ) 
FROM EMPLOYEES e ;

--반올림
SELECT SYSDATE , ROUND(SYSDATE, 'CC') AS "년도두자리" , ROUND(SYSDATE, 'YYYY') AS "월기준", 
		round(SYSDATE, 'DDD') AS "시기준", ROUND(SYSDATE, 'HH') AS "분기준" , 
		ROUND(SYSDATE, 'MM') AS "일기준" , ROUND(SYSDATE, 'DAY') AS "주기준",
		round(SYSDATE, 'MI') AS "초기준"
FROM DUAL ;

-- 각 사윈의 입사일을 월 기준으로 반올림한다.
SELECT HIRE_DATE ,ROUND(HIRE_DATE,'YYYY') 
FROM EMPLOYEES e ;

-- 사원들의 급여 총합을 구한다.
SELECT SUM(SALARY) 
FROM EMPLOYEES e ;

-- 사원들의 커미션을 가져온다.
SELECT SUM(COMMISSION_PCT) 
FROM EMPLOYEES e 

--급여가 3000 이상인 사원들의 급여 총합을 구한다.
SELECT SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE SALARY >= 3000;
--20번 부서에 근부하고 있는 사원들의 급여 총합을 구한다.
SELECT SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 30;
--직무가 SALESMAN인 사원들의 급여 총합을 구한다.
SELECT SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG';
--직무가 SALESMAN인 사원들의 이름과 급여총합을 가져온다.
SELECT FIRST_NAME , SUM(SALARY) -- 오류
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG';
--전 사원의 급여 평균을 구한다.
SELECT  TRUNC(AVG(SALARY)) 
FROM EMPLOYEES e2 ;
--커미션을 받는 사원들의 커미션 평균을 구한다.
SELECT TRUNC(AVG(COMMISSION_PCT)) 
FROM EMPLOYEES e ;
--전 사원의 커미션의 평균을 구한다.
SELECT AVG(NVL(COMMISSION_PCT,0))
FROM EMPLOYEES e3 ;
--커미션을 받는 사원들의 급여 평균을 구한다.
SELECT TRUNC(avg(COMMISSION_PCT + SALARY)) 
FROM EMPLOYEES e2 
WHERE COMMISSION_PCT IS NOT NULL;
--직무가 SALESMAN인 사원들의 이름과 급여총합을 가져온다.
SELECT FIRST_NAME , SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG';
--30번 부서에 근무하고 있는 사원들의 급여 평균을 구한다.
SELECT AVG(SALARY) 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 50;
--직무가 SALESMAN인 사원들의 급여 + 커미션 평균을 구한다.
SELECT  AVG(SALARY + NVL(COMMISSION_PCT,0))
FROM EMPLOYEES e3 
WHERE JOB_ID = 'IT_PROG' ;
--사원들의 총 수를 가져온다.
SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES e2 ;
--커미션을 받는 사원들의 총 수를 가져온다.
SELECT COUNT(*) 
FROM EMPLOYEES e2 ;
--사원들의 급여 최대, 최소값을 가져온다.
SELECT MAX(SALARY) , MIN(SALARY) 
FROM EMPLOYEES e 

--각 부서별 사원들의 급여 평균을 구한다.
SELECT DEPARTMENT_ID ,AVG(SALARY) 
FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID ;
--각 직무별 사원들의 급여 총합을 구한다.
SELECT JOB_ID ,SUM(SALARY) 
FROM EMPLOYEES e 
GROUP BY JOB_ID ;
--1500 이상 급여를 받는 사원들의 부서별 급여 평균을 구한다.
SELECT DEPARTMENT_ID ,AVG(SALARY) 
FROM EMPLOYEES e2 
WHERE SALARY >= 1500
GROUP BY DEPARTMENT_ID ;

--부서별 평균 급여가 2000이상은 부서의 급여 평균을 가져온다.
SELECT DEPARTMENT_ID ,AVG(SALARY) 
FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID 
HAVING AVG(SALARY) >= 10000; 
--부서별 최대 급여액이 3000이하인 부서의 급여 총합을 가져온다.
SELECT DEPARTMENT_ID , SUM(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) <=7000; 
--부서별 최소 급여액이 1000 이하인 부서에서 직무가 CLERK인 사원들의 급여 총합을 구한다.
SELECT  SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG'
GROUP BY DEPARTMENT_ID 
HAVING min(SALARY) <=5000;

--각 부서의 급여 최소가 900이상 최대가 10000이하인 부서의 사원들 중1500이상의 급여를 받는 사원들의 평균 급여액을 가져온다.
SELECT AVG(SALARY) 
FROM EMPLOYEES e2 
WHERE SALARY >= 1500 
GROUP BY DEPARTMENT_ID 
HAVING MIN(SALARY) >=4000 AND MAX(SALARY) <= 7000 ;
--사원테이블 과 부서테이블 을 조인한다
SELECT * FROM EMPLOYEES e2 ; -- 107
SELECT * FROM DEPARTMENTS d2 ; --27
SELECT * FROM EMPLOYEES e , DEPARTMENTS d2 ; --2889
SELECT * 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID ;
--사원의 사원번호, 이름, 근무부서 이름을 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , DEPARTMENT_NAME ,e2.DEPARTMENT_ID ,d2.DEPARTMENT_ID 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID ;
--사원의 사원번호, 이름, 근무지역을 가져온다.
SELECT e2.DEPARTMENT_ID , e2.FIRST_NAME , d2.LOCATION_ID 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID ;
--DALLAS에 근무하고 있는 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID , d2.LOCATION_ID 
FROM EMPLOYEES e , DEPARTMENTS d2 
WHERE e.DEPARTMENT_ID = d2.DEPARTMENT_ID AND d2.LOCATION_ID = 1700;
--SALES 부서에 근무하고 있는 사원들의 급여 평균을 가져온다.
SELECT AVG(SALARY) 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID AND d2.DEPARTMENT_NAME = 'IT';
--1982년에 입사한 사원들의 사원번호, 이름, 입사일, 근무부서이름을 가져온다.
SELECT e.DEPARTMENT_ID , e.FIRST_NAME , e.HIRE_DATE , d2.DEPARTMENT_NAME 
FROM EMPLOYEES e , DEPARTMENTS d2 
WHERE e.DEPARTMENT_ID = d2.DEPARTMENT_ID AND HIRE_DATE BETWEEN '2005/01/01' AND '2005/12/31';
--각 사원들의 사원번호, 이름, 급여, 급여등급을 가져온다.
sal
--SALES 부서에 근무하고 있는 사원의 사원번호, 이름, 급여등급을 가져온다.

--각 급여 등급별 급여의 총합과 평균, 사원의수, 최대급여, 최소급여를 가져온다.

--급여 등급이 4등급인 사원들의 사원번호, 이름, 급여, 근무부서이름, 근무지역을 가져온다./

--neena 사원의 사원번호, 이름, 같은 employee_id 이름을 가져온다. e2 : neena --21강
SELECT * FROM EMPLOYEES e2 ;
SELECT * FROM DEPARTMENTS d ;
SELECT e2.EMPLOYEE_ID , e2.FIRST_NAME , e3.FIRST_NAME 
FROM EMPLOYEES e2 , EMPLOYEES e3 
WHERE e2.MANAGER_ID = e3.EMPLOYEE_ID ;
--FORD 사원 밑에서 일하는 사원들의 사원번호, 이름, 직무를 가져온다.
-----------------------------------------------------
--Neena 사원이 근무하고 있는 부서의 이름을 가져온다.
SELECT * FROM EMPLOYEES e2;
SELECT * FROM DEPARTMENTS d ;
SELECT DEPARTMENT_NAME 
FROM DEPARTMENTS d 
WHERE DEPARTMENT_ID =(SELECT DEPARTMENT_ID 
					FROM EMPLOYEES e2 
					WHERE FIRST_NAME = 'Neena');
SELECT DEPARTMENT_NAME 
FROM DEPARTMENTS d2 , EMPLOYEES e2 
WHERE d2.DEPARTMENT_ID = e2.DEPARTMENT_ID AND e2.FIRST_NAME = 'Neena';
--SMITH와 같은 부서에 근무하고 있는 사원들의 사원번호, 이름, 급여액, 부서이름을 가져온다.
SELECT e.DEPARTMENT_ID , e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME 
FROM DEPARTMENTS d , EMPLOYEES e 
WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID AND e.DEPARTMENT_ID = (
										SELECT DEPARTMENT_ID 
										FROM EMPLOYEES e2 
										WHERE FIRST_NAME = 'Neena');
--MARTIN과 같은 직무를 가지고 있는 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , JOB_ID 
FROM EMPLOYEES e3 
WHERE JOB_ID = (SELECT JOB_ID 
				FROM EMPLOYEES e4 
				WHERE FIRST_NAME = 'Neena');

--ALLEN과 같은 직속상관을 가진 사원들의 사원번호, 이름, 직속상관이름을 가져온다.
 
--WARD와 같은 부서에 근무하고 있는 사원들의 사원번호, 이름, 부서번호를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = (
						SELECT DEPARTMENT_ID 
						FROM EMPLOYEES e2 
						WHERE FIRST_NAME = 'Neena');

--SALESMAN의 평균 급여보다 많이 받는 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPLOYEE_ID , FIRST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE SALARY >= (SELECT AVG(SALARY) 
				FROM EMPLOYEES e 
				WHERE JOB_ID = 'IT_PROG');
--DALLAS 지역에 근무하는 사원들의 평균 급여를 가져온다.
SELECT AVG(SALARY) 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID 
						FROM DEPARTMENTS d2 
						WHERE LOCATION_ID = 1800);

-- SALES 부서에 근무하는 사원들의 사원번호, 이름, 근무지역을 가져온다.
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , d2.LOCATION_ID 
FROM EMPLOYEES e , DEPARTMENTS d2 
WHERE e.DEPARTMENT_ID=d2.DEPARTMENT_ID and e.DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
															FROM DEPARTMENTS d3 
															WHERE DEPARTMENT_NAME='IT');

					
 --CHICAGO 지역에 근무하는 사원들 중 BLAKE이 직속상관인 사원들의 사원번호, 이름, 직무를 가져온다.




































