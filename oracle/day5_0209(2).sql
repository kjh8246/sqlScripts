-- commit , rollback �׽�Ʈ
--	 �� ����auto commit ������ �����ؾ��մϴ�.
--	 �� ���1) ���� �����⿡ ���ؼ��� ���� (�����ͺ��̽� �޴� - Ʈ����� ��� - manual commit)
--	 �� ���2) ������ �޴� - ȯ�漳�� - ���� - ���� ������ auto commit�� ���� 
-- ���� ���� 1�� 
SELECT * FROM tbl#;		-- ���� ���� Ȯ��

DELETE FROM tbl# WHERE acol = 'momo';
SELECT * FROM tbl#;		-- Ȯ��

ROLLBACK ;		-- DELETE ����� ������ �ǵ�����(���)
SELECT * FROM tbl#;		-- Ȯ��

-- ���� ���� 2��
DELETE FROM tbl# WHERE acol = 'momo';
SELECT * FROM tbl#;		
COMMIT;
SELECT * FROM tbl#;		
ROLLBACK ;	-- ������ COMMIT �� �����Ƿ� delete�� ����� �� ����
SELECT * FROM tbl#;	

-- ���� ���� 3��
INSERT INTO "TBL#" (acol,AGE) values('nana',33);
SELECT * FROM tbl#;
ROLLBACK ;
SELECT * FROM tbl#;

-- ���� ���� 4��
INSERT INTO "TBL#" (acol,AGE) values('nana22',33);
INSERT INTO "TBL#" (acol,AGE) values('����',39);
COMMIT ;		-- ���� COMMIT �Ǵ� ROLLBACK �� �� ������ ����� COMMIT
UPDATE "TBL#" SET bcol='test' WHERE acol='nana22';
DELETE FROM "TBL#" t WHERE asol = 'main22';
ROLLBACK ;		-- ���� COMMIT �Ǵ� ROLLBACK �� �� ������ ����� ROLLBACK














