--��������

--1 . jobs ���̺� ����
--1) min_salary �÷��� 10000�̻��� Job_title ��ȸ
SELECT JOB_TITLE  FROM JOBS j  WHERE min_salary >= 10000;

--2) job_title �÷��� programmer �� ���� ��� �÷� ��ȸ
SELECT * FROM JOBS j  WHERE job_title = 'Programmer' ;
SELECT * FROM JOBS j  WHERE job_title = 'programmer' ;
--��ҹ��� ������� ���� �˻��Ѵٸ� ���ڿ� ���� ����Ŭ �Լ� : upper(), lower()
SELECT * FROM JOBS j  WHERE UPPER(JOB_TITLE) = 'PROGRAMMER' ;
SELECT * FROM JOBS j  WHERE LOWER(JOB_TITLE)  = 'programmer' ;

--3) max_salary �÷��� �ִ밪 ��ȸ
SELECT MAX(MAX_SALARY) FROM JOBS j ; 



--2. locations ���̺� ����

--1) city �÷��� London �� postal_code �÷� ��ȸ 
SELECT postal_code FROM locations l WHERE CITY = 'London';
SELECT postal_code FROM locations l WHERE CITY = 'Seattle';

--2) LOCATION_ID �÷��� 1700 ,2700,2500 �� �ƴϰ� city �÷��� Tokyo �� ���� ��� �÷� ��ȸ
SELECT * FROM locations l WHERE LOCATION_ID NOT IN (1700,2700,2500) AND CITY = 'Tokyo';

--3. employees ���̺�
--����Լ�(���� �Լ�) �� ���� �����մϴ�.
SELECT count(*) FROM EMPLOYEES e;	-- �� ���� : 107
SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';	-- ���� job_id ������ : 5

SELECT AVG(SALARY)  FROM EMPLOYEES e;	-- ���� ��� �޿� : 6461.83
SELECT AVG(SALARY)  FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';	-- ���� job_id  ��ձ޿� : 5760

SELECT MAX(SALARY)  FROM EMPLOYEES e;	-- ���� �� �ְ� �޿� : 24,000
SELECT MAX(SALARY)  FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';	-- ���� job_id �ְ�޿� : 9000

SELECT MIN(SALARY)  FROM EMPLOYEES e;	-- ���� �� �ּ� �޿� : 2,100 
SELECT MIN(SALARY)  FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';	-- ���� job_id �ּұ޿� : 4200

-- ����Լ��� �׷��Լ��Դϴ�. �ش��Լ� ������� ���ϱ����� ���� �����͵��� �׷�ȭ�ϰ� �����մϴ�.
-- �޷��Լ� ����� �ٸ� �÷��� ���� ��ȸ�Ҽ� �����ϴ�. �Ʒ� sql�� ���� �Դϴ�.
SELECT JOB_ID ,MAX(SALARY)  FROM EMPLOYEES e;

SELECT * FROM EMPLOYEES e2 WHERE SALARY =(
-- ���� max,min ���� sql ����� �ϳ��� ���⿡ �־����. �� �ǹ̸� �ľ��� ���ô�.
--	SELECT MAX(SALARY)  FROM EMPLOYEES e
--	SELECT MAX(SALARY)  FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'
--	SELECT MIN(SALARY)  FROM EMPLOYEES e
	SELECT MIN(SALARY)  FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'
); --SELECT �ȿ����� �� �ٸ� SELECT �� ���������Դϴ�.�������� ������� 1�� �̹Ƿ� = �����Ŀ� ����� �� �ֽ��ϴ�.

-- IT_PROG �߿��� �ּұ޿��� �޴� ����� first_name, last_name �÷� ��ȸ�ϱ�
SELECT first_name, last_name,SALARY  FROM EMPLOYEES e 
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG')
	AND JOB_ID ='IT_PROG';

SELECT SALARY  FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';


-->>�߰� : min_salary �� ��հ����� ���� ���� job_id,job_title �÷� ��ȸ -> group ���� �Ŀ� �ٽ� �غ��ô�.
-- 			�Ʒ� ����� ���� -> �׷��Լ��� �ݵ�� SELECT ������ ����ؾ� �մϴ� ***
SELECT job_id ,job_title ,MIN_SALARY  FROM JOBS j 
WHERE MIN_SALARY < AVG(MIN_SALARY)

-- ��հ�
SELECT  AVG(MIN_SALARY) FROM JOBS j
-- ��հ��� ���ǽĿ� �̿��ϱ� (��������)
SELECT job_id ,job_title ,MIN_SALARY  FROM JOBS j 
WHERE MIN_SALARY <(SELECT  AVG(MIN_SALARY) FROM JOBS j ); 




