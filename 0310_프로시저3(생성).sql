-- ���ν����� ������ �� create : ������ ����� , replace : ������ ��ü�ϱ�
CREATE OR REPLACE PROCEDURE dept_max_salary(     
	--�Ű������� �����ϴ� ��ġ : IN�� �Է� �Ű������μ� ������ �� ���޵Ǵ� ���� �����ϴ� �����Դϴ�.
	dept_name IN hr.departments.department_name%type 	
)
IS 
	dept_id NUMBER(8);    -- �ʿ��� ������ �����ϴ� ��ġ
	max_sal NUMBER(8);			-- ������Ÿ�� ũ�� ����.
	emp EMPLOYEES%ROWTYPE;
BEGIN 
	-- Sales �μ��� �μ�ID���ϱ�
	SELECT DEPARTMENT_ID 
	INTO dept_id 			-- ������ ����.
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME =dept_name;	-- �Է¸Ű����� �����ؼ� ����
	-- ������ �μ�ID�� �������̺��� �ְ� �����ݾ� ���ϱ�
	SELECT max(salary) 
	INTO  max_sal	-- ������ �����ϱ�
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;		--������ ���ǽĿ� Ȱ��
	DBMS_OUTPUT.PUT_LINE(dept_name || ' �ְ� �����ݾ� : ' || max_sal);
	-- �߰�: 'Sales'�μ��� �ְ����ݾ��� �޴� ������ �������ϱ� (�� ��ü�� ������ ����)
	SELECT * 
	INTO emp		-- rowtype ������ ��ȸ��� ��� �÷��� ����.
	FROM EMPLOYEES e 
	WHERE DEPARTMENT_ID =dept_id AND e.SALARY =max_sal;
	DBMS_OUTPUT.PUT_LINE(dept_name || ' �ְ��� ���� : ' || emp.last_name || ',' || emp.hire_date);
END;

begin
 dept_max_salary('IT');
END;

SELECT * FROM EMPLOYEES e2 ;

-- �Ϲ� join sql
select d.department_id id, d.department_name dept , max_sal from departments d,
        (select DEPARTMENT_ID id, max(salary) max_sal
        from employees 
        GROUP by DEPARTMENT_ID) max_sal# 
    where d.DEPARTMENT_ID = max_sal#.id AND d.DEPARTMENT_NAME ='Sales';
-- �μ��� �ְ� ����
select DEPARTMENT_ID, max(salary) max_sal
        from employees e
        GROUP by DEPARTMENT_ID 
        HAVING DEPARTMENT_ID = 80;
       
-- ���ν��� ����
CREATE OR REPLACE PROCEDURE dept_max_salary2(
	dept_name IN hr.departments.department_name%TYPE,
	-- ��� �Ű�����
	dept_id OUT hr.departments.DEPARTMENT_ID %TYPE, 
	max_sal OUT NUMBER 
)
IS 
	vdept_id NUMBER(8) ;
BEGIN 
	select d.department_id id
	INTO vdept_id		-- ��ȸ��� ������ ����
	from departments d
	WHERE d.DEPARTMENT_NAME ='IT';
	
	select DEPARTMENT_ID, max(salary) 
	INTO dept_id, max_sal		-- ��ȸ ����� ��� �Ű������� ����
        from employees e
        GROUP by DEPARTMENT_ID 
        HAVING DEPARTMENT_ID =vdept_id;
END;

-- ���ν��� ������ �� ��� �Ű������� �����ؾ��մϴ�.
DECLARE 
	dept_id hr.employees.DEPARTMENT_ID%TYPE; 
	max_sal NUMBER ;
begin
 dept_max_salary2('Sales',dept_id,max_sal);		-- ���ν��� �����Ŀ� ��¸Ű������� ���ؼ� ��ȸ���� ���޹޽��ϴ�
 DBMS_OUTPUT.PUT_LINE('�μ��ڵ�' || ':' || dept_id || ',�����ݾ� : ' || max_sal);
END;

-- ���ν����� ����Ŭ ��ü�� �����ϸ� ȣ���ؼ� �ٽ� �����Ҽ� �ֽ��ϴ�.
/*  �⺻����
CREATE OR REPLACE dept_max_salary(      -> ���ν��� �̸��� �ĺ���

)
IS 
BEGIN 
	
END;
*/