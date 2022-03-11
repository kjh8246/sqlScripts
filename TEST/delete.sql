DROP TABLE EMP01 ;

CREATE TABLE emp01
AS 
SELECT * FROM EMPLOYEES e ;

SELECT * FROM EMP01 e ;

-- ������� �μ���ȣ�� 40������ �����Ѵ�.
UPDATE EMP01 
SET DEPARTMENT_ID = 40;

SELECT * FROM EMP01 e ;

-- ������� �Ի����� ���÷� ����
UPDATE EMP01 
SET HIRE_DATE = SYSDATE ;

SELECT * FROM EMP01 e ;

-- ������� ������ �����ڷ� ����
UPDATE EMP01 
SET JOB_ID = 'developer';

SELECT * FROM EMP01 e ;


DROP TABLE EMP01 ;

CREATE TABLE EMP01 
AS 
SELECT * FROM EMPLOYEES e ;

SELECT * FROM EMP01 e ;

-- ������� �μ���ȣ�� 40, �Ի����� ����, ������ �����ڷ� �����Ѵ�.
UPDATE EMP01 
SET DEPARTMENT_ID = 40, HIRE_DATE = SYSDATE , JOB_ID = 'developer';

SELECT * FROM EMP01 e ;

DROP TABLE EMP01 ;

CREATE TABLE emp01
as
SELECT * FROM EMPLOYEES e ;

-- 10�� �μ��� �ٹ��ϰ� �ִ� ������� 40�� �μ��� �����Ѵ�.
UPDATE EMP01 
SET DEPARTMENT_ID = 40
WHERE DEPARTMENT_ID = 50;

SELECT * FROM EMP01 e ;

-- IT_PROG ���� �Ի����� ���� , Ŀ�̼��� 2000���� �����Ѵ�.
UPDATE EMP01  
SET HIRE_DATE = SYSDATE , COMMISSION_PCT = 0.9
WHERE JOB_ID = 'IT_PROG';

SELECT * FROM EMP01 e ;

-- ��ü ����� ��� �޿����� ���� ������� �޿��� 50% �λ��Ѵ�.
UPDATE EMP01 
SET SALARY = SALARY * 1.5
WHERE SALARY < (SELECT AVG(SALARY) 
				FROM EMP01 e2 );

SELECT * FROM EMP01 e ;

-- IT_PROG ������� ������ developer �� �����Ѵ�.
UPDATE EMP01 
SET JOB_ID = 'developer'
WHERE JOB_ID = 'IT_PROG';

SELECT * FROM EMP01 e ;

-- 30�� �μ��� �ٹ��ϰ� �մ� ������� �޿��� ��ü ��� �޿��� �����Ѵ�.
UPDATE EMP01 
SET SALARY = (SELECT TRUNC(AVG(SALARY)) 
			  FROM EMP01 e )
WHERE DEPARTMENT_ID = 40 ;

SELECT * FROM EMP01 e ;
-----------------------------------------------------------
DROP TABLE EMP01 ;

CREATE TABLE EMP01 
AS 
SELECT * FROM EMPLOYEES e ;

SELECT * FROM EMP01 e ;

--������ clerk �� ������� ������ �޿����� 20�� �μ��� �ٹ��ϰ� �ִ� ��� ��
--�޿� �ְ���� �޴� ����� ������ �޿������� �����Ѵ�.
UPDATE EMP01 
SET JOB_ID = (SELECT JOB_ID  
				FROM EMP01 e2 
				WHERE SALARY = (SELECT MAX(SALARY) 
				FROM EMP01 e2)),
	SALARY = (SELECT SALARY 
				FROM EMP01 e2 
				WHERE SALARY = (SELECT MAX(SALARY) 
				FROM EMP01 e2))
WHERE JOB_ID = 'IT_PROG';

UPDATE EMP01 
SET (JOB_ID,SALARY) = (SELECT JOB_ID , SALARY 
						FROM EMP01 e2 
						WHERE SALARY = (SELECT MAX(SALARY) 
						FROM EMP01 e2))
WHERE JOB_ID = 'IT_PROG';


SELECT * FROM EMP01 e ;

---------------------------------------------
DROP TABLE EMP01 ;

CREATE TABLE EMP01 
AS 
SELECT * FROM EMPLOYEES e ;

SELECT * FROM EMP01 e ;

DELETE FROM EMP01 e ;

SELECT * FROM EMP01 e ;

DELETE FROM EMP01 e 
WHERE EMPLOYEE_ID = 100;

SELECT * FROM EMP01 e ;

-- ����� �޿��� ��� �޿� ������ ����� ������ �����Ѵ�.
DELETE FROM EMP01 e 
WHERE SALARY <= (SELECT AVG(SALARY) 
				FROM EMP01 e);

SELECT * FROM EMP01 e ;
			
SELECT AVG(SALARY) 
FROM EMP01 e ;

--Ŀ�̼��� ���� �ʴ� ������� ������ �����Ѵ�.
DELETE FROM EMP01 e2 
WHERE COMMISSION_PCT is NULL;

SELECT * FROM EMP01 e ;

























































