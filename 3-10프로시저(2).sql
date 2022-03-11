--

-- hr ��Ű���� ���̺��� �̿��ؼ� ���ν��� �����մϴ�.

SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;

-- Sales �μ��� �ְ� ���� �ݾ���?

SELECT MAX(SALARY) 
FROM EMPLOYEES e2 , DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID 
AND d2.DEPARTMENT_NAME = 'Sales';

-- ���� join���� ��ȸ�� ���� ���ν��� Ȱ���ؼ� ���ϱ�
DECLARE 
	--dept_id departments.department_id%TYPE ;
	dept_id NUMBER;
	MAX_SAL NUMBER;			-- ������Ÿ�� ũ�� ����.
	emp EMPLOYEES%ROWTYPE;
--�̰� emp������ Ÿ���� select * from ���̺�ó�� ��� �÷��� �����ö� �����ϴ� ��������
BEGIN
	-- Sales �μ��� �μ�ID���ϱ�
	SELECT DEPARTMENT_ID 
	INTO dept_id		-- ������ ����.
	FROM DEPARTMENTS d2 WHERE DEPARTMENT_NAME = 'Sales';
	-- ������ �μ�ID�� �������̺��� �ְ� �����ݾ� ���ϱ�
	SELECT max(SALARY)
	INTO max_sal 	-- ������ �����ϱ�
	FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = dept_id;	--������ ���ǽĿ� Ȱ��
	DBMS_OUTPUT.PUT_LINE('�ְ� �����ݾ�(Sales�μ�) : ' || max_sal);
	-- �߰� : 'Sales'�μ��� �ְ����ݾ��� �޴� ������ �������ϱ�(�� ��ü�� ������ ����)
	SELECT * 
	INTO EMP 		-- rowtype ������ ��ȸ��� ��� �÷��� ����.
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID = dept_id AND e.SALARY = MAX_SAL ;
	DBMS_OUTPUT.PUT_LINE('Sales �ְ��� ���� : ' || emp.last_name || ',' || emp.hire_date);

END ;

SELECT * FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID = 80 AND e.SALARY = 14000 ;

SELECT DEPARTMENT_ID 
FROM DEPARTMENTS d2 WHERE DEPARTMENT_NAME = 'Sales';

SELECT max(SALARY)
FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = 80;


