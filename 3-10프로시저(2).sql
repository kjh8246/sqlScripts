--

-- hr 스키마의 테이블을 이용해서 프로시저 연습합니다.

SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;

-- Sales 부서의 최고 연봉 금액은?

SELECT MAX(SALARY) 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID 
AND d2.DEPARTMENT_NAME = 'Sales';

-- 위의 join으로 조회한 것을 프로시저 활용해서 구하기
DECLARE 
	--dept_id departments.department_id%TYPE ;
	dept_id NUMBER;
	MAX_SAL NUMBER;			-- 데이터타입 크기 생략.
	emp EMPLOYEES%ROWTYPE;
--이건 emp변수의 타입이 select * from 테이블처럼 모든 컬럼을 가져올때 참조하는 변수에요
BEGIN
	-- Sales 부서의 부서ID구하기
	SELECT DEPARTMENT_ID 
	INTO dept_id		-- 변수에 저장.
	FROM DEPARTMENTS d2 WHERE DEPARTMENT_NAME = 'Sales';
	-- 구해진 부서ID로 직원테이블에서 최고 연봉금액 구하기
	SELECT max(SALARY)
	INTO max_sal 	-- 변수에 저장하기
	FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = dept_id;	--변수를 조건식에 활용
	DBMS_OUTPUT.PUT_LINE('최고 연봉금액(Sales부서) : ' || max_sal);
	-- 추가 : 'Sales'부서의 최고연봉금액을 받는 직원의 정보구하기(행 전체를 변수에 저장)
	SELECT * 
	INTO EMP 		-- rowtype 변수에 조회결과 모든 컬럼을 저장.
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID = dept_id AND e.SALARY = MAX_SAL ;
	DBMS_OUTPUT.PUT_LINE('Sales 최고연봉 직원 : ' || emp.last_name || ',' || emp.hire_date);

END ;

SELECT * FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID = 80 AND e.SALARY = 14000 ;

SELECT DEPARTMENT_ID 
FROM DEPARTMENTS d2 WHERE DEPARTMENT_NAME = 'Sales';

SELECT max(SALARY)
FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = 80;


