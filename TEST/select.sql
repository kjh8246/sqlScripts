-- ��� ���� ��ȸ
SELECT * FROM jobs;

--��� ���� ����
SELECT *
FROM EMPLOYEES e; 

--����� �̸��� ������� ��������
SELECT FIRST_NAME , LAST_NAME , EMPLOYEE_ID 
FROM EMPLOYEES e2 ;
--����� �̸��� �����ȣ, ����, �޿� �����´�.
SELECT  FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID ,JOB_ID ,SALARY 
FROM EMPLOYEES e ;

--�μ� ��ȣ�� �μ��̸��� �����´�.
SELECT DEPARTMENT_ID ,DEPARTMENT_NAME 
FROM DEPARTMENTS d; 

--�� ������� �޿��װ� �޿��׿��� 1000�� ���� ��, 200�� �� ��, 2�� ���� ��, 2�� ���� ���� �����´�.
SELECT SALARY , SALARY +1000, SALARY -200, SALARY *2, SALARY /2
FROM EMPLOYEES e2 ;
--�� ����� �޿���, Ŀ�̼�, �޿� + Ŀ�̼� �׼��� �����´�.
SELECT SALARY , NVL(COMMISSION_PCT,0) , NVL(SALARY * COMMISSION_PCT,0) --nvl null���� ����
FROM EMPLOYEES e ;

--������� �̸��� ������ ���� ������� �����´�.000 ����� ��� ������ XXX �Դϴ�.
SELECT FIRST_NAME || LAST_NAME || JOB_ID 
FROM EMPLOYEES e ;
SELECT FIRST_NAME || LAST_NAME || '����� ��������� ' || JOB_ID || '�Դϴ�.'
FROM EMPLOYEES e ;

--������� �ٹ��ϰ� �ִ� �ٹ� �μ��� ��ȣ�� �����´�.
SELECT DISTINCT LOCATION_ID -- destinct : �ߺ�����
FROM DEPARTMENTS d ;

--�ٹ� �μ��� 101���� ������� �����ȣ, �̸�, �ٹ� �μ��� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE EMPLOYEE_ID = 101;
--�ٹ� �μ� ��ȣ�� 101���� �ƴ� ������� �����ȣ, �̸�, �ٹ� �μ� ��ȣ�� �����´�.
SELECT FIRST_NAME , LAST_NAME , EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE EMPLOYEE_ID != 101; 
--�޿��� 9000�̻��� ������� �����ȣ, �̸�, �޿��� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE SALARY >=9000;
--�̸��� steavn ����� �����ȣ, �̸�, ����, �޿��� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE LAST_NAME = 'King';
--������ IT_PROG�� ����� �����ȣ, �̸�, ������ �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG';
--������ IT_PROG�� �ƴ� ����� �����ȣ, �̸�, ������ �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE JOB_ID <> 'IT_PROG';
--2005�� 1�� 1�� ���Ŀ� �Ի��� ����� �����ȣ, �̸�, �Ի����� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , HIRE_DATE 
FROM EMPLOYEES e3 
WHERE HIRE_DATE >= '2005/01/01';

--102�� �μ����� �ٹ��ϰ� �ִ� ������ MANAGER�� ����� �����ȣ, �̸�, �ٹ��μ�, ������ �����´�.
SELECT  EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE MANAGER_ID = 102 AND JOB_ID = 'IT_PROG';
--�Ի�⵵�� 1981���� ����߿� �޿��� 1500 �̻��� ����� �����ȣ, �̸�, �޿�, �Ի����� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY , HIRE_DATE 
FROM EMPLOYEES e2 
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE <= '2020/01/01' AND SALARY >= 1500;

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY , HIRE_DATE 
FROM EMPLOYEES e2 
WHERE HIRE_DATE BETWEEN '2005/01/01'AND'2020/01/01'AND SALARY >= 1500; 

--30�� �μ��� �ٹ��ϰ� �ִ� ��� �߿� �޿��� 2700 �̻��� ����� �����ȣ, �̸�, �μ���ȣ, �޿��� �����´�.
SELECT  EMPLOYEE_ID , FIRST_NAME , LAST_NAME , DEPARTMENT_ID , SALARY 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 30 AND SALARY >= 2700 ;
--���ӻ�� ��� ��ȣ�� 122���� ����߿� ������ CLERK�� ����� �����ȣ, �̸�, ���ӻ����ȣ, ������ �����´�.
SELECT  EMPLOYEE_ID , FIRST_NAME , LAST_NAME , DEPARTMENT_ID , JOB_ID 
FROM EMPLOYEES e2 
WHERE MANAGER_ID = 122 AND JOB_ID = 'ST_CLERK';
--�޿��� 2000���� ũ�ų� 1000���� ���� ����� �����ȣ, �̸�, �޿��� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE SALARY > 2000 OR SALARY <1000 ;

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE not(SALARY >= 1000 AND SALARY <= 2000);

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE not(SALARY BETWEEN 1000 AND 2000);
--�μ���ȣ�� 50�̰ų� 80 �� ����� �����ȣ, �̸�, �μ���ȣ�� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 50 OR DEPARTMENT_ID = 80;
--������ CLERK, SALESMAN, ANALYST�� ����� �����ȣ, �̸�, ������ �����´�.
SELECT DEPARTMENT_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'ST_CLERK' OR JOB_ID = 'IT_PROG' OR JOB_ID = 'ST_MAN';
SELECT DEPARTMENT_ID , FIRST_NAME , LAST_NAME , JOB_ID 
FROM EMPLOYEES e2 
WHERE JOB_ID IN('ST_CLERK','IT_PROG','ST_MAN');
--��� ��ȣ�� 100, 101, 102�� �ƴ� ������� �����ȣ, �̸��� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME 
FROM EMPLOYEES e 
WHERE NOT (EMPLOYEE_ID IN(100,101,102));

--�̸��� A�� �����ϴ� ����� �̸��� ��� ��ȣ�� �����´�.
SELECT FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE FIRST_NAME LIKE 'A%';
--�̸��� g�� ������ ����� �̸��� ��� ��ȣ�� �����´�.
SELECT FIRST_NAME , LAST_NAME , EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE LAST_NAME LIKE '%g';
--�̸��� a�� ���ԵǾ� �ִ� ����� �̸��� ��� ��ȣ�� �����´�.
SELECT FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE FIRST_NAME LIKE '%a%';
--�̸��� �ι�° ���ڰ� A�� ����� ��� �̸�, ��� ��ȣ�� �����´�.
SELECT FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE FIRST_NAME LIKE '_a%';
--�̸��� 4������ ����� ��� �̸�, ��� ��ȣ�� �����´�.
SELECT FIRST_NAME ,LAST_NAME ,EMPLOYEE_ID 
FROM EMPLOYEES e2 
WHERE FIRST_NAME LIKE '____';

--����߿� Ŀ�̼��� ���� �ʴ� ����� �����ȣ, �̸�, Ŀ�̼��� �����´�.
SELECT FIRST_NAME , LAST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e2 
WHERE COMMISSION_PCT IS NULL ;
--�ƴ�
SELECT FIRST_NAME , LAST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e2 
WHERE COMMISSION_PCT IS NOT NULL ;
--ȸ�� ��ǥ(���ӻ���� ���� ���)�� �̸��� �����ȣ�� �����´�.
SELECT FIRST_NAME , LAST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e2 
WHERE MANAGER_ID IS NULL;

--����� �����ȣ, �̸�, �޿��� �����´�. �޿��� �������� �������� ������ �Ѵ�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
ORDER BY SALARY ASC; -- asc ��������
--����� �����ȣ, �̸�, �޿��� �����´�. �����ȣ�� �������� �������� ������ �Ѵ�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
ORDER BY EMPLOYEE_ID DESC ;
--����� �����ȣ, �̸��� �����´�, ����� �̸��� �������� �������� ������ �Ѵ�.
SELECT EMPLOYEE_ID , FIRST_NAME 
FROM EMPLOYEES e2 
ORDER BY FIRST_NAME ASC ;
--����� �����ȣ, �̸�, �Ի����� �����´�. �Ի����� �������� �������� ������ �Ѵ�.
SELECT EMPLOYEE_ID , FIRST_NAME , HIRE_DATE 
FROM EMPLOYEES e2 
ORDER BY HIRE_DATE DESC;
--������ SALESMAN�� ����� ����̸�, �����ȣ, �޿��� �����´�. �޿��� �������� �������� ������ �Ѵ�.
SELECT FIRST_NAME , EMPLOYEE_ID , SALARY 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG'
ORDER BY SALARY ;
--2005�⿡ �Ի��� ������� �����ȣ, ��� �̸�, �Ի����� �����´�. ��� ��ȣ�� �������� �������� ������ �Ѵ�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , HIRE_DATE 
FROM EMPLOYEES e2 
WHERE HIRE_DATE BETWEEN '2005/01/01' AND '2005/12/31'
ORDER BY EMPLOYEE_ID DESC;
--����� �̸�, �޿�, Ŀ�̼��� �����´�. Ŀ�̼��� �������� �������� ������ �Ѵ�.
SELECT FIRST_NAME , LAST_NAME , SALARY , COMMISSION_PCT 
FROM EMPLOYEES e2 
ORDER BY COMMISSION_PCT ;
--����� �̸�, �޿�, Ŀ�̼��� �����´�. Ŀ�̼��� �������� �������� ������ �Ѵ�.
SELECT FIRST_NAME , LAST_NAME , SALARY , COMMISSION_PCT 
FROM EMPLOYEES e2 
ORDER BY COMMISSION_PCT DESC ;
-- ����� �̸�, �����ȣ , �޿��� �����´�. �޿��� �������� �������� ���� , �̸��� �������� �������� ����(�Ȱ��� ����)
SELECT FIRST_NAME , LAST_NAME , SALARY 
FROM EMPLOYEES e2 
ORDER BY SALARY DESC , FIRST_NAME ASC ;

-- ���밪 ���ϱ�
SELECT -10 , ABS(-10) FROM dual; 
--�������� �޿��� 5000 �谨�ϰ� �谨�� �޿����� ���밪�� ���Ѵ�.
SELECT SALARY , SALARY - 5000, ABS(SALARY-5000) 
FROM EMPLOYEES e2; 
-- �Ҽ��� ���� ����
SELECT 12.32432, FLOOR(12.3423) FROM DUAL ;
--�޿��� 1500 �̻��� ����� �޿��� 15% �谨�Ѵ�. �� �Ҽ��� ���ϴ� ������.
SELECT SALARY , SALARY*0.85 , FLOOR(SALARY*0.85) 
FROM EMPLOYEES e2 
WHERE SALARY >= 1500;
--�޿��� 3õ ������ ������� �޿��� 20%�� �λ��Ѵ�. �� 10�� �ڸ��� �������� �ݿø��Ѵ�.
SELECT SALARY , SALARY * 1.2 , ROUND(SALARY * 1.2 , -2) --10�� �ڸ����� �ݿø� 
FROM EMPLOYEES e2 
WHERE SALARY <=3000;
--����, �ڸ����� ���� �� �ִ�.
SELECT 1112.2345, trunc(1112.2345), TRUNC(1112.2345,2),TRUNC(1112.23455,-2) FROM dual;
--�� ������ �޿��� 10�ڸ� ���ϸ� �谨�Ѵ�.
SELECT SALARY , TRUNC(SALARY , -2)
FROM EMPLOYEES e ;
-- ������ ���ϱ�
SELECT mod(10,3), MOD (10,4)
FROM DUAL ;

-- �빮�� -> �ҹ���
SELECT 'AbcdEF',LOWER('AVcdEF') FROM dual;
-- ������� �̸����� �ҹ��ڷ� �����´�.
SELECT EMAIL , LOWER(EMAIL) 
FROM EMPLOYEES e2 ;
-- �ҹ��� -> �빮��
SELECT 'ABcdEF', UPPER('ABcdEF') FROM dual; 
-- ������� �̸����� �����´�. �빮�� -> �ҹ��� -> �빮��
SELECT  LAST_NAME  , LOWER(LAST_NAME), UPPER(LAST_NAME) 
FROM EMPLOYEES e2 ;
-- ù ���ڸ� �빮�ڷ� �������� �ҹ��ڷ� initcap
SELECT 'aBCDEF', INITCAP('aBCDEF') FROM dual;
-- ����̸��� ù���ڸ� �빫�ڷ� �������� �ҹ��ڷ� initcap
SELECT EMAIL , INITCAP(EMAIL)
FROM EMPLOYEES e2 ;
-- ���ڿ� ���� concat
SELECT CONCAT ('asdf',CONCAT('abc','efg')) 
FROM DUAL ;
-- ������� �̸��� ������ ������ ���� �����´� ||�� 
-- ����� �̸��� 000 �̰� , ������ 000�Դϴ�.
SELECT CONCAT(CONCAT(CONCAT(CONCAT('����� �̸���', FIRST_NAME),' �̰�,������'), JOB_ID ),'�Դϴ�.')
FROM EMPLOYEES e ;
SELECT '����� �̸���'||FIRST_NAME ||' �̰�, ������ '||JOB_ID ||'�Դϴ�.'
FROM EMPLOYEES e ;

-- ���ڿ��� ���� 
SELECT LENGTH('abcd'), LENGTHB('abcd'), LENGTH('�ȳ��ϼ���'), LENGTHB('�ȳ��ϼ���') FROM dual;

-- ���ڿ� �߶󳻱�
SELECT SUBSTR('abcd',3),SUBSTRB('abcd',3) ,
	   SUBSTR('�ȳ��ϼ���',3),SUBSTRB('�ȳ��ϼ���',3) 
FROM DUAL ;

SELECT SUBSTR('abcedfghi',3,4), SUBSTR('���ع��� ��λ���',3,4) FROM DUAL ;

SELECT INSTR('asdfasdfasdf','sd'),INSTR('asdfasdfasdf','as',2) ,
		INSTR('asdfasdfasdf','as',3,2) 
FROM DUAL ;

SELECT INSTR('aaaaa','sd')
FROM DUAL ;

--����� �̸� �߿� a��� ���ڰ� �ι�° ���Ŀ� ��Ÿ���� ����� �̸��� �����´�.\
SELECT FIRST_NAME 
FROM EMPLOYEES e2 
WHERE INSTR(FIRST_NAME, 'a') > 1;

-- Ư�����ڿ��� ä���
SELECT '���ڿ�', lpad('���ڿ�',20),rpad('���ڿ�',20)
		, lpad('���ڿ�',20,'_'),rpad('���ڿ�',20,'_')FROM dual;

-- ��������
SELECT '          ���ڿ�          ', LTRIM('          ���ڿ�          '),
		RTRIM('          ���ڿ�          '), TRIM('          ���ڿ�          ') 
FROM  DUAL ;

--���ڿ� ����
SELECT 'asdfasdf' , REPLACE ('sadfasdf','asd','dddddddd')
FROM DUAL ;

--���� ��¥ ���ϱ�
SELECT SYSDATE FROM dual;

--��¥ ������ ����
SELECT SYSDATE , SYSDATE - 10000 , SYSDATE + 10000
FROM DUAL ;

-- �� ����� ������ ��¥�� ���� 1000�� �İ� �Ǵ� ��¥ ��������
SELECT HIRE_DATE, HIRE_DATE + 1000 
FROM EMPLOYEES e ;

-- ������ IT_PROG�� ����� �Ի��� 100���� ��¥ ��������
SELECT HIRE_DATE , HIRE_DATE -100
FROM EMPLOYEES e2 
WHERE  JOB_ID = 'IT_PROG';

--�� ����� �ٹ� ���� �����´�
SELECT FLOOR( SYSDATE - HIRE_DATE ) 
FROM EMPLOYEES e ;

--�ݿø�
SELECT SYSDATE , ROUND(SYSDATE, 'CC') AS "�⵵���ڸ�" , ROUND(SYSDATE, 'YYYY') AS "������", 
		round(SYSDATE, 'DDD') AS "�ñ���", ROUND(SYSDATE, 'HH') AS "�б���" , 
		ROUND(SYSDATE, 'MM') AS "�ϱ���" , ROUND(SYSDATE, 'DAY') AS "�ֱ���",
		round(SYSDATE, 'MI') AS "�ʱ���"
FROM DUAL ;

-- �� ������ �Ի����� �� �������� �ݿø��Ѵ�.
SELECT HIRE_DATE ,ROUND(HIRE_DATE,'YYYY') 
FROM EMPLOYEES e ;

-- ������� �޿� ������ ���Ѵ�.
SELECT SUM(SALARY) 
FROM EMPLOYEES e ;

-- ������� Ŀ�̼��� �����´�.
SELECT SUM(COMMISSION_PCT) 
FROM EMPLOYEES e 

--�޿��� 3000 �̻��� ������� �޿� ������ ���Ѵ�.
SELECT SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE SALARY >= 3000;
--20�� �μ��� �ٺ��ϰ� �ִ� ������� �޿� ������ ���Ѵ�.
SELECT SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 30;
--������ SALESMAN�� ������� �޿� ������ ���Ѵ�.
SELECT SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG';
--������ SALESMAN�� ������� �̸��� �޿������� �����´�.
SELECT FIRST_NAME , SUM(SALARY) -- ����
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG';
--�� ����� �޿� ����� ���Ѵ�.
SELECT  TRUNC(AVG(SALARY)) 
FROM EMPLOYEES e2 ;
--Ŀ�̼��� �޴� ������� Ŀ�̼� ����� ���Ѵ�.
SELECT TRUNC(AVG(COMMISSION_PCT)) 
FROM EMPLOYEES e ;
--�� ����� Ŀ�̼��� ����� ���Ѵ�.
SELECT AVG(NVL(COMMISSION_PCT,0))
FROM EMPLOYEES e3 ;
--Ŀ�̼��� �޴� ������� �޿� ����� ���Ѵ�.
SELECT TRUNC(avg(COMMISSION_PCT + SALARY)) 
FROM EMPLOYEES e2 
WHERE COMMISSION_PCT IS NOT NULL;
--������ SALESMAN�� ������� �̸��� �޿������� �����´�.
SELECT FIRST_NAME , SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG';
--30�� �μ��� �ٹ��ϰ� �ִ� ������� �޿� ����� ���Ѵ�.
SELECT AVG(SALARY) 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 50;
--������ SALESMAN�� ������� �޿� + Ŀ�̼� ����� ���Ѵ�.
SELECT  AVG(SALARY + NVL(COMMISSION_PCT,0))
FROM EMPLOYEES e3 
WHERE JOB_ID = 'IT_PROG' ;
--������� �� ���� �����´�.
SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES e2 ;
--Ŀ�̼��� �޴� ������� �� ���� �����´�.
SELECT COUNT(*) 
FROM EMPLOYEES e2 ;
--������� �޿� �ִ�, �ּҰ��� �����´�.
SELECT MAX(SALARY) , MIN(SALARY) 
FROM EMPLOYEES e 

--�� �μ��� ������� �޿� ����� ���Ѵ�.
SELECT DEPARTMENT_ID ,AVG(SALARY) 
FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID ;
--�� ������ ������� �޿� ������ ���Ѵ�.
SELECT JOB_ID ,SUM(SALARY) 
FROM EMPLOYEES e 
GROUP BY JOB_ID ;
--1500 �̻� �޿��� �޴� ������� �μ��� �޿� ����� ���Ѵ�.
SELECT DEPARTMENT_ID ,AVG(SALARY) 
FROM EMPLOYEES e2 
WHERE SALARY >= 1500
GROUP BY DEPARTMENT_ID ;

--�μ��� ��� �޿��� 2000�̻��� �μ��� �޿� ����� �����´�.
SELECT DEPARTMENT_ID ,AVG(SALARY) 
FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID 
HAVING AVG(SALARY) >= 10000; 
--�μ��� �ִ� �޿����� 3000������ �μ��� �޿� ������ �����´�.
SELECT DEPARTMENT_ID , SUM(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) <=7000; 
--�μ��� �ּ� �޿����� 1000 ������ �μ����� ������ CLERK�� ������� �޿� ������ ���Ѵ�.
SELECT  SUM(SALARY) 
FROM EMPLOYEES e2 
WHERE JOB_ID = 'IT_PROG'
GROUP BY DEPARTMENT_ID 
HAVING min(SALARY) <=5000;

--�� �μ��� �޿� �ּҰ� 900�̻� �ִ밡 10000������ �μ��� ����� ��1500�̻��� �޿��� �޴� ������� ��� �޿����� �����´�.
SELECT AVG(SALARY) 
FROM EMPLOYEES e2 
WHERE SALARY >= 1500 
GROUP BY DEPARTMENT_ID 
HAVING MIN(SALARY) >=4000 AND MAX(SALARY) <= 7000 ;
--������̺� �� �μ����̺� �� �����Ѵ�
SELECT * FROM EMPLOYEES e2 ; -- 107
SELECT * FROM DEPARTMENTS d2 ; --27
SELECT * FROM EMPLOYEES e , DEPARTMENTS d2 ; --2889
SELECT * 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID ;
--����� �����ȣ, �̸�, �ٹ��μ� �̸��� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , DEPARTMENT_NAME ,e2.DEPARTMENT_ID ,d2.DEPARTMENT_ID 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID ;
--����� �����ȣ, �̸�, �ٹ������� �����´�.
SELECT e2.DEPARTMENT_ID , e2.FIRST_NAME , d2.LOCATION_ID 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID ;
--DALLAS�� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.JOB_ID , d2.LOCATION_ID 
FROM EMPLOYEES e , DEPARTMENTS d2 
WHERE e.DEPARTMENT_ID = d2.DEPARTMENT_ID AND d2.LOCATION_ID = 1700;
--SALES �μ��� �ٹ��ϰ� �ִ� ������� �޿� ����� �����´�.
SELECT AVG(SALARY) 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID AND d2.DEPARTMENT_NAME = 'IT';
--1982�⿡ �Ի��� ������� �����ȣ, �̸�, �Ի���, �ٹ��μ��̸��� �����´�.
SELECT e.DEPARTMENT_ID , e.FIRST_NAME , e.HIRE_DATE , d2.DEPARTMENT_NAME 
FROM EMPLOYEES e , DEPARTMENTS d2 
WHERE e.DEPARTMENT_ID = d2.DEPARTMENT_ID AND HIRE_DATE BETWEEN '2005/01/01' AND '2005/12/31';
--�� ������� �����ȣ, �̸�, �޿�, �޿������ �����´�.
sal
--SALES �μ��� �ٹ��ϰ� �ִ� ����� �����ȣ, �̸�, �޿������ �����´�.

--�� �޿� ��޺� �޿��� ���հ� ���, ����Ǽ�, �ִ�޿�, �ּұ޿��� �����´�.

--�޿� ����� 4����� ������� �����ȣ, �̸�, �޿�, �ٹ��μ��̸�, �ٹ������� �����´�./

--neena ����� �����ȣ, �̸�, ���� employee_id �̸��� �����´�. e2 : neena --21��
SELECT * FROM EMPLOYEES e2 ;
SELECT * FROM DEPARTMENTS d ;
SELECT e2.EMPLOYEE_ID , e2.FIRST_NAME , e3.FIRST_NAME 
FROM EMPLOYEES e2 , EMPLOYEES e3 
WHERE e2.MANAGER_ID = e3.EMPLOYEE_ID ;
--FORD ��� �ؿ��� ���ϴ� ������� �����ȣ, �̸�, ������ �����´�.
-----------------------------------------------------
--Neena ����� �ٹ��ϰ� �ִ� �μ��� �̸��� �����´�.
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
--SMITH�� ���� �μ��� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, �޿���, �μ��̸��� �����´�.
SELECT e.DEPARTMENT_ID , e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME 
FROM DEPARTMENTS d , EMPLOYEES e 
WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID AND e.DEPARTMENT_ID = (
										SELECT DEPARTMENT_ID 
										FROM EMPLOYEES e2 
										WHERE FIRST_NAME = 'Neena');
--MARTIN�� ���� ������ ������ �ִ� ������� �����ȣ, �̸�, ������ �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , JOB_ID 
FROM EMPLOYEES e3 
WHERE JOB_ID = (SELECT JOB_ID 
				FROM EMPLOYEES e4 
				WHERE FIRST_NAME = 'Neena');

--ALLEN�� ���� ���ӻ���� ���� ������� �����ȣ, �̸�, ���ӻ���̸��� �����´�.
 
--WARD�� ���� �μ��� �ٹ��ϰ� �ִ� ������� �����ȣ, �̸�, �μ���ȣ�� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = (
						SELECT DEPARTMENT_ID 
						FROM EMPLOYEES e2 
						WHERE FIRST_NAME = 'Neena');

--SALESMAN�� ��� �޿����� ���� �޴� ������� �����ȣ, �̸�, �޿��� �����´�.
SELECT EMPLOYEE_ID , FIRST_NAME , SALARY 
FROM EMPLOYEES e2 
WHERE SALARY >= (SELECT AVG(SALARY) 
				FROM EMPLOYEES e 
				WHERE JOB_ID = 'IT_PROG');
--DALLAS ������ �ٹ��ϴ� ������� ��� �޿��� �����´�.
SELECT AVG(SALARY) 
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID 
						FROM DEPARTMENTS d2 
						WHERE LOCATION_ID = 1800);

-- SALES �μ��� �ٹ��ϴ� ������� �����ȣ, �̸�, �ٹ������� �����´�.
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , d2.LOCATION_ID 
FROM EMPLOYEES e , DEPARTMENTS d2 
WHERE e.DEPARTMENT_ID=d2.DEPARTMENT_ID and e.DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
															FROM DEPARTMENTS d3 
															WHERE DEPARTMENT_NAME='IT');

					
 --CHICAGO ������ �ٹ��ϴ� ����� �� BLAKE�� ���ӻ���� ������� �����ȣ, �̸�, ������ �����´�.




































