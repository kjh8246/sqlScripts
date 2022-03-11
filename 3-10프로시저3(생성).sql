-- ���ν����� begin ~end; ������ SQL ��ɵ��� �������� ��찡 ��κ� . �� �������� ��ɾ �ϳ��� ������ ó���մϴ�.
--			Ʈ����� : �ϳ��� ������ ó���ϴ� SQL ��ɵ� -> ��� �������Ǿ�� �մϴ�. �׷��� ������(�ϳ��� ������ �����)
--					�̹� ����� SQL����� ��Ұ� �Ǿ�� �մϴ�.(rollback)

-- ���ν����� ������ �� create : ������ ����� , replace : ������ ��ü�ϱ�
CREATE OR REPLACE PROCEDURE dept_max_salary(		
	--�Ű������� �����ϴ� ��ġ : IN�� �Է� �Ű������μ� ������ �� ���޵Ǵ� ���� ������� ���� �Դϴ�.
	dept_name IN departments.DEPARTMENT_NAME%TYPE 	
)
IS 
-- declare ����
	-- �ʿ��� ���� �����ϴ� ��ġ
	dept_id NUMBER(8);
	MAX_SAL NUMBER(8);			--������Ÿ�� ũ�� ����
	emp EMPLOYEES%ROWTYPE;
BEGIN 
	-- Sales �μ��� �μ�ID���ϱ�
	SELECT DEPARTMENT_ID 
	INTO dept_id		-- ������ ����.
	FROM DEPARTMENTS d2 WHERE DEPARTMENT_NAME = dept_name;	-- �Է¸Ű����� �����ؼ� ����
	-- ������ �μ�ID�� �������̺��� �ְ� �����ݾ� ���ϱ�
	SELECT max(SALARY)
	INTO max_sal 	-- ������ �����ϱ�
	FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = dept_id;	--������ ���ǽĿ� Ȱ��
	DBMS_OUTPUT.PUT_LINE(dept_name || ' �ְ� �����ݾ� : ' || max_sal);
	-- �߰� : 'Sales'�μ��� �ְ����ݾ��� �޴� ������ �������ϱ�(�� ��ü�� ������ ����)
	SELECT * 
	INTO EMP 		-- rowtype ������ ��ȸ��� ��� �÷��� ����.
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID = dept_id AND e.SALARY = MAX_SAL ;
	DBMS_OUTPUT.PUT_LINE(dept_name || ' �ְ��� ���� : ' || emp.last_name || ',' || emp.hire_date);
	
END;

EXECUTE dept_max_salary('Sales');


-- ���ν����� ����Ŭ ��ü�� �����ϸ� ȣ���ؼ� �ٽ� �����Ҽ� �ֽ��ϴ�.
/*
CREATE OR REPLACE dept_max_salary(		->���ν��� �̸��� �ĺ���

)
IS 
BEGIN 
	
	
END;
*/


