
-- �����Լ�(����Լ�, �׷��Լ�) : count,max,min,sum,avg,�ܿ� �л�,ǥ������,�߾Ӱ� ���� �Լ��� ����.

-- group by : Ư�� �÷����� �׷�ȭ�ϰ� �׿� ���ؼ� �����Լ��� �����մϴ�.
-- ���� ) �μ��� �������, ������ ������ , �μ��� ������ , ������ ������� ....

-- �׷��Լ� ����
SELECT COUNT(*), avg(salary) 
FROM EMPLOYEES e 
WHERE JOB_ID = 'IT_PROG';
-- ���� : �׷��Լ��� ����� �Ϲ��÷��� �Բ� ��ȸ ���մϴ�.
SELECT JOB_ID , COUNT(*), avg(salary) 
FROM EMPLOYEES e 
WHERE JOB_ID = 'IT_PROG';

-- group by�� �����Ͽ� �������� count, avg ���մϴ�.
SELECT JOB_ID , COUNT(*), AVG(salary)
FROM EMPLOYEES e 
GROUP BY JOB_ID ;

-- �μ��� count ,avg (�׷��Լ� ����� �Բ� ��ȸ�Ҽ� �ִ� �÷��� �׷�ȭ �÷��� �����մϴ�.)
SELECT DEPARTMENT_ID , COUNT(*) AS "�ο���", AVG(salary) AS "���";
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

-- departments ���̺�� ���� �μ��� ���踦 join
SELECT * FROM DEPARTMENTS d,
				(SELECT DEPARTMENT_ID , count(*) AS "�ο���", avg(salary) AS "���"
				FROM EMPLOYEES e 
				GROUP BY DEPARTMENT_ID ) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID;

-- ���ϴ� �÷��� ��ȸ
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , d2."�ο���", d2."���"
FROM DEPARTMENTS d,
				(SELECT DEPARTMENT_ID , count(*) AS "�ο���", avg(salary) AS "���"
				FROM EMPLOYEES e 
				GROUP BY DEPARTMENT_ID ) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID;

-- ��ȸ��� ��µǴ� ���� ������ �ο����� ��������
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , d2."�ο���", d2."���"
FROM DEPARTMENTS d,
				(SELECT DEPARTMENT_ID , count(*) AS "�ο���", avg(salary) AS "���"
				FROM EMPLOYEES e 
				GROUP BY DEPARTMENT_ID ) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER BY d2."�ο���" desc;		--�������� desc

--��ձ޿� ��������
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , d2."�ο���", d2."���"
FROM DEPARTMENTS d,
				(SELECT DEPARTMENT_ID , count(*) AS "�ο���", round(avg(salary),0) AS "���"
				FROM EMPLOYEES e 
				GROUP BY DEPARTMENT_ID ) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER BY d2."���" ;		

-- �ڸ��� ���� �Լ� : ���� trunc , �ø� ceil , �ݿø� round -> �Ҽ������� �ڸ��� ����

-- ���� group by ������� ��ձݾ��� 8000 �̻��� �μ��� ��ȸ�Ѵٸ�
SELECT DEPARTMENT_ID , count(*) AS "�ο���", round(avg(salary),0) AS "���"
FROM EMPLOYEES e 
--WHERE e."���" > 8000		-- ���� : �����Լ� ��������� where ��� X
GROUP BY DEPARTMENT_ID
HAVING avg(salary) > 8000 -- HAVING : �����Լ� ��������� ���ǽ��� ���� ��밡���մϴ�.
ORDER BY "���";

-- ���� : from -> where -> group by -> having -> order by

-- ALL Ű���� : job_id �� ST_CLERT �� ��� �������� �޿����� ���� �޴� ������ ��ȸ
-- 			  ���� ����� max ������ ū���� ã�� ��. -> ALL Ű����� �ٲ㺸�� 

SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK';
-- employees ���̺� ���� ������ ���� max ������ ū�͸� ����� �����մϴ�.
SELECT last_name , salary , job_id FROM EMPLOYEES e 
WHERE SALARY > all(SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK');

-- ���� salary �÷����� �����ϰ� ���ǿ� �´� �͸� �����մϴ�.
SELECT last_name , salary , job_id FROM EMPLOYEES e 
WHERE SALARY > all(SELECT SALARY FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK');

SELECT * FROM EMPLOYEES e ;






