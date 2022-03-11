-- 데이터 타입 number 연습 테이블
-- number : 자바 byte,short,int,long,float,double 해당
--			number(정밀도,소수점자리수)
-- table_number 데이블 이름
CREATE TABLE table_number(
	col1 NUMBER,	-- 지릿수를 지정하지 않으면 최대 38자리입니다.
	col2 number(5),
	col3 number(7,2),
	col4 number(2,5)
);
--정상실행
INSERT INTO IDEV.TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12334.67, 0.00012);
-- COL2 컬럼의 자릿수가 6개 : 오류
INSERT INTO IDEV.TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 123456, 12334.67, 0.00012);
-- COL3 컬럼은 소수점 이아 자릿수를 2개 : 반올림
INSERT INTO IDEV.TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12334.678, 0.00012);
-- COL3 컬럼 전체 자릿수 7개 : 소숫점이하 항상 2개, 그리고 정수부 5자리 -> 오류
INSERT INTO IDEV.TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12334.67, 0.00012);
-- col4 컬럼은 number(2,5) : 전체 유효자릿수 : 5개
-- 		이 때 항상 ~~ 0아닌 유효자릿수 최대2개(0포함 가능) ,나머지 3개는 무조건 0
INSERT INTO IDEV.TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12334.67, 0.000126);
-- col4 컬럼은 number(2,5) : 나머지 3개는 유효자릿수 앞에 0 -> 이것이 아니면 오류
INSERT INTO IDEV.TABLE_NUMBER(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12334.67, 0.00012);

-- 0.00012300 일때 ,유효한 숫자 0.000123 123뒤에 00은 우효한 값이 아닙니다.



