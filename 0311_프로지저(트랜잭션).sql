-- 프로시저의 begin ~end; 사이의 SQL 명령들이 여러개인 경우가 대부분 . 그 여러개의 명령어가 하나의 업무를 처리합니다.
--			트랜잭션 : 하나의 업무를 처리하는 SQL 명령들 -> 모두 정상실행되어야 합니다. 그렇지 않으면(하나라도 오류가 생기면)
--					이미 실행된 SQL명령은 취소가 되어야 합니다.(rollback)


SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM tbl_buy#;
-- 오늘의 주제 : 프로시저로 트랜잭션 처리
-- tbl_buy# 테이블에 지불금액 money 컬럼을 추가하고 상품가격x수량 계산해서 저장.
ALTER TABLE "TBL_BUY#" ADD money number(8);

-- '결제금액' 구하기라는 트랜잭션이라 하고 예시로 하나씩 실행해보세요.

-- 처리순서1 : wonder 고객이 CHR-J59를 2개 구입합니다.
INSERT INTO "TBL_BUY#"(BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
values(tbl_BUY_SEQ.nextval,'wonder','CHR-J59',2,sysdate);
-- 처리순서2 : dual 임시테이블 이용해서 현재 seq값 구하기
SELECT tbl_buy_seq.currval FROM dual;	--nexval 실행후에만확인가능
-- 처리순서3 : 구매한 상품의 가격 구하기
SELECT price FROM "TBL_PRODUCT#" tp WHERE pcode='CHR-J59';
-- 처리순서4 : 처리순서1에서 추가된 행에 money컬럼 계산하고 저장.
UPDATE "TBL_BUY#" SET MONEY = 98700*QUANTITY WHERE BUY_SEQ =21;


-- 위의 트랜잭션을 프로시저로 생성합니다(정의)
CREATE OR REPLACE PROCEDURE proc_set_money(   --(acustom_id varchar2,apcode varchar2,acnt NUMBER,)
	acustom_id IN varchar2,
	apcode IN varchar2,
	acnt IN NUMBER
) 
--매개변수
IS 
	vseq NUMBER ;	--변수선언
	vprice NUMBER;
BEGIN 
	INSERT INTO tbl_test VALUES (3,acustom_id);		--트랜잭션의 하라로 가정을 하고 임시테이블에 데이터를 추가
	INSERT INTO "TBL_BUY#" (BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
	VALUES (tbl_buy_seq.nextval, acustom_id,apcode,acnt,sysdate);	-- 매개변수값으로 추가
	SELECT tbl_buy_seq.currval INTO vseq -- currval 현재시퀀스가 몇번인지 알려줌
		FROM dual;
	SELECT price INTO vprice --변수선언
		FROM "TBL_PRODUCT#" tp WHERE PCODE = apcode;
	UPDATE "TBL_BUY#" SET money = VPRICE * QUANTITY  
		WHERE BUY_SEQ = VSEQ ;
	dbms_output.put_line('실행 성공');
	COMMIT;
	EXCEPTION 				-- EXCEPTION 추가하여 처리 -> 메시지 출력, rollback
		WHEN OTHERS THEN 
		dbms_output.put_line('실행 실패');
		ROLLBACK;			-- 오류가 발새한 sql 앞의 insert,update,delete를 취소.
END;
--정상적으로 실행하면 commit 오류나면 rollback
--프로시저 실행
BEGIN
	proc_set_money('twice','CJ-BABQ1',2);
END;

SELECT * FROM "TBL_BUY#" tb ;
SELECT * FROM TBL_TEST tt ;

CREATE TABLE tbl_test(		-- 트랜잭션을 태스트할 테이블입니다. 오류가 났을때 rollback 확인을 위한 것.
	buy_seq number(8),
	custom_id varchar2(20)
);












