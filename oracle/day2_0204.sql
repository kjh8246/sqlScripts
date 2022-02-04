-- DML : select , insert , update , delete ���� �˾ƺ��� 

-- ������ ��ȸ : select �÷���1, �÷���2,.... from ���̺��
SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC
FROM IDEV.STUDENTS;

-- ���õǴ� �÷��� �ʿ��� �͵�� �մϴ�.	
-- (��ɾ� �Ѱ������� ctrl+enter , ������� �ѹ��� ������ �巡�� �Ͽ� ��ɼ����ϰ�alt+x)
SELECT stuno, stu_name FROM STUDENTS;

-- ��� �÷��� ������ ���� wildcard ���� * �� ��ü 
SELECT * FROM  STUDENTS ;

-- ������ ��ȸ�� ���Ǵ� ���� �߰��� where �ڿ� ���ǽ� �ۼ�
SELECT * FROM STUDENTS WHERE STUNO =1;
SELECT * FROM STUDENTS WHERE STU_NAME ='�ֳ���';
SELECT * FROM STUDENTS WHERE ENTER_DATE > '2020-06-01';  --DATEŸ���� ���ڿ� ''��ȣ ���

-- null �� �����͸� ��ȸ�ϴ� ���ǽ�
SELECT stuno ,stu_name ,enter_date , etc from STUDENTS WHERE etc IS NULL ;
SELECT stuno ,stu_name ,enter_date , etc from STUDENTS WHERE etc IS NOT NULL ;

-- ������ ��ȸ �Ҷ� �÷��� ��ſ� �Լ���(count,sum,avg,max,min)�� ���
SELECT count(*) from  STUDENTS ;
SELECT MAX(stuno) FROM  STUDENTS s ;		-- s�� ��Ī(alias)
SELECT MIN(stuno) FROM  STUDENTS s ;		-- s�� ��Ī(alias)

SELECT max(stu_name) from STUDENTS s ;		-- ���ڿ�Ÿ���� �÷��� ������ ���Ͽ� ����� ����
SELECT min(stu_name) from STUDENTS s ;		-- 

-- ������ ��ȸ ���ǽĿ� IN, �Ǵ� NOT IN : or ���ǽ� ��ſ� ����մϴ�.
SELECT * FROM STUDENTS s WHERE STUNO = 1 OR STUNO = 3 OR STUNO = 7 OR STUNO = 9;
SELECT * FROM STUDENTS s WHERE STUNO IN (1,3,7,9);		-- ������ �÷��� ���� ������ ���� OR���ǰ˻�



-- ������ �߰� (����) : insert into ���̺��(�÷���1,�÷���2,...) values(��1,��2,...)
INSERT INTO IDEV.STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC)
VALUES(0, '', '', '', '', '');

-- ������ ���� : update ���̺�� set �÷���1=��1, �÷���2=��2,....;
UPDATE IDEV.STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATE='', ETC='';

-- ������ ������ ���� : delete FROM ���̺�� where �÷���1=��1 and �÷���2=��2,...
--										where ������ �࿡ ���� ����
DELETE FROM IDEV.STUDENTS
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATE='' AND ETC='';
