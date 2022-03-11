
create table member_tbl_02(
    custno number(6) not null,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2),
    primary key(custno)
);

create table money_tbl_02(
    custno number(6) not null,
    salenol number(8) not null,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
    primary key(custno,salenol)
);

-- insert ����
INSERT INTO IDEV.MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES(member_seq.nextval,'', '', '', '', '', '');

--CREATE SEQUENCE member_seq INCREMENT BY 1
--START WITH 100001;
DROP SEQUENCE member_seq IP EXISTS;
CREATE SEQUENCE member_seq MINVALUE 100001;

SELECT  * FROM  MEMBER_TBL_02 mt ;
SELECT  * FROM MONEY_TBL_02 mt ;

SELECT custno, sum(price) AS asum FROM mouney_tbl_02 mt
GROUP BY CUSTNO 
ORDER BY ASUM DESC ;

-- step 3) ������ ������������ joindate
SELECT * FROM MEMBER_TBL_02 mt ,
		(SELECT custno, sum(price) AS asum FROM mouney_tbl_02 mt
		GROUP BY CUSTNO 
		ORDER BY ASUM DESC ) sale
WHERE mt.CUSTNO = sale.custno
		
-- step 4)�䱸���׿� ���� �ʿ��� �÷��� ��ȸ�ϱ�

SELECT mt.CUSTNO , CUSTNAME , GRADE , ASUM FROM MEMBER_TBL_02 mt 
		(SELECT custno, sum(price) AS asum FROM mouney_tbl_02 mt
		GROUP BY CUSTNO 
		ORDER BY ASUM DESC ) sale
WHERE mt.CUSTNO = sale.custno;

-- step 5) ������ �䱸���׿� ���� �÷���� �����ϱ�
SELECT mt.CUSTNO , CUSTNAME , decode(GRADE,'A','VIP','B','�Ϲ�','C','����)' AS agrade,
		ASUM AS "�����հ�" FROM MEMBER_TBL_02 mt 
		(SELECT custno, sum(price) AS asum FROM mouney_tbl_02 mt
		GROUP BY CUSTNO 
		ORDER BY ASUM DESC ) sale
WHERE mt.CUSTNO = sale.custno;

--���� ���� : ������ ���� ȸ���� ��ȸ���� �ʴ´�. "�� "������ ���� ȸ���� 0���� ����Ѵ�."
--			1) null���� 0���� ����ϴ� �Լ� : nvl	2)�ܺ��������� �����մϴ�.
--			3) �����հ谡 ���� ���� ȸ����ȣ ������ ����մϴ�.

SELECT mt.CUSTNO , CUSTNAME , decode(GRADE,'A','VIP','B','�Ϲ�','C','����)' AS agrade,
		nvl(ASUM,0) AS "�����հ�" FROM MEMBER_TBL_02 mt 
		(SELECT custno, sum(price) AS asum FROM mouney_tbl_02 mt
		GROUP BY CUSTNO 
		ORDER BY ASUM DESC ) sale
WHERE mt.CUSTNO = sale.custno(+);	--2)
ORDER BY asum DESC,custno;			--3) asum �� ���� ���� custno ������ �մϴ�.

-- ���� 5)�� select ���� ����� �������̺� view �� �����մϴ�
CREATE VIEW v_by_custno
AS 
SELECT mt.CUSTNO , CUSTNAME , decode(GRADE,'A','VIP','B','�Ϲ�','C','����)' AS agrade,
		ASUM AS "�����հ�" FROM MEMBER_TBL_02 mt 
		(SELECT custno, sum(price) AS asum FROM mouney_tbl_02 mt
		GROUP BY CUSTNO 
		ORDER BY ASUM DESC ) sale
WHERE mt.CUSTNO = sale.custno;








		
		
		






