-- �����߿��� ������ȸ�� ������ �����ϰ� �˻��� �ʿ��� ����� ����


-- ��ü ������ ������?
SELECT count(*) FROM TBL_CAMPAREA tc ;


-- ������ ������ ������?
SELECT count(*) FROM TBL_CAMPAREA tc 
WHERE ADDRESS LIKE '������%';

SELECT DISTINCT substr(address,1,instr(ADDRESS,' '))	--substr(���ڿ�, ������ġ, ����)
FROM TBL_CAMPAREA tc ;


SELECT COUNT(*) FROM TBL_CAMPAREA tc 
WHERE ADDRESS LIKE '����Ư����ġ��%';
 

-- �������� �ڵ����߿��� �߿��� �̸�, �δ�ü� ��ȸ�ϱ�
SELECT CAMP_NAME,ETC1 ,ETC2 
FROM TBL_CAMPAREA tc 
WHERE ADDRESS LIKE '������%' AND CAMP_TYPE LIKE '%�ڵ���%';


-- �ڵ��� �߿��� ������ 50�� �̻��� �� �߿����̸�, �ּ� ��ȸ�ϱ�
SELECT CAMP_NAME,ADDRESS FROM TBL_CAMPAREA tc 
WHERE CAR_CNT >=50;


-- ī��� �ִ� �߿��� �̸�,�ּ�,ī��� ���� ��ȸ�ϱ�
SELECT camp_name , address,cara_cnt
FROM TBL_CAMPAREA tc 
WHERE CARA_CNT > 0
ORDER BY ADDRESS ;





