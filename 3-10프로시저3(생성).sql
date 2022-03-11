-- 프로시저의 begin ~end; 사이의 SQL 명령들이 여러개인 경우가 대부분 . 그 여러개의 명령어가 하나의 업무를 처리합니다.
--			트랜잭션 : 하나의 업무를 처리하는 SQL 명령들 -> 모두 정상실행되어야 합니다. 그렇지 않으면(하나라도 오류가 생기면)
--					이미 실행된 SQL명령은 취소가 되어야 합니다.(rollback)

-- 프로시저를 생성할 때 create : 없으면 만들기 , replace : 있으면 대체하기
CREATE OR REPLACE PROCEDURE dept_max_salary(		
	--매개변수를 선언하는 위치 : IN은 입력 매개변수로서 실행할 때 절달되는 값을 저장흐는 변수 입니다.
	dept_name IN departments.DEPARTMENT_NAME%TYPE 	
)
IS 
-- declare 생략
	-- 필요한 변수 선언하는 위치
	dept_id NUMBER(8);
	MAX_SAL NUMBER(8);			--데이터타입 크기 생략
	emp EMPLOYEES%ROWTYPE;
BEGIN 
	-- Sales 부서의 부서ID구하기
	SELECT DEPARTMENT_ID 
	INTO dept_id		-- 변수에 저장.
	FROM DEPARTMENTS d2 WHERE DEPARTMENT_NAME = dept_name;	-- 입력매개변수 대입해서 실행
	-- 구해진 부서ID로 직원테이블에서 최고 연봉금액 구하기
	SELECT max(SALARY)
	INTO max_sal 	-- 변수에 저장하기
	FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = dept_id;	--변수를 조건식에 활용
	DBMS_OUTPUT.PUT_LINE(dept_name || ' 최고 연봉금액 : ' || max_sal);
	-- 추가 : 'Sales'부서의 최고연봉금액을 받는 직원의 정보구하기(행 전체를 변수에 저장)
	SELECT * 
	INTO EMP 		-- rowtype 변수에 조회결과 모든 컬럼을 저장.
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID = dept_id AND e.SALARY = MAX_SAL ;
	DBMS_OUTPUT.PUT_LINE(dept_name || ' 최고연봉 직원 : ' || emp.last_name || ',' || emp.hire_date);
	
END;

EXECUTE dept_max_salary('Sales');


-- 프로시저를 오라클 객체로 생성하면 호출해서 다시 실행할수 있습니다.
/*
CREATE OR REPLACE dept_max_salary(		->프로시저 이름은 식별자

)
IS 
BEGIN 
	
	
END;
*/


