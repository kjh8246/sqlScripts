-- 전국야영장 정보조회와 예약을 가졍하고 검색에 필요한 내용들 연습


-- 전체 테이터 갯수는?
SELECT count(*) FROM TBL_CAMPAREA tc ;


-- 강원도 데이터 갯수는?
SELECT count(*) FROM TBL_CAMPAREA tc 
WHERE ADDRESS LIKE '강원도%';

SELECT DISTINCT substr(address,1,instr(ADDRESS,' '))	--substr(문자열, 시작위치, 길이)
FROM TBL_CAMPAREA tc ;


SELECT COUNT(*) FROM TBL_CAMPAREA tc 
WHERE ADDRESS LIKE '제주특별자치도%';
 

-- 강원동의 자동차야영장 야영장 이름, 부대시설 조회하기
SELECT CAMP_NAME,ETC1 ,ETC2 
FROM TBL_CAMPAREA tc 
WHERE ADDRESS LIKE '강원도%' AND CAMP_TYPE LIKE '%자동차%';


-- 자동차 야영장 갯수가 50개 이상인 곳 야영장이름, 주소 조회하기
SELECT CAMP_NAME,ADDRESS FROM TBL_CAMPAREA tc 
WHERE CAR_CNT >=50;


-- 카라반 있는 야영장 이름,주소,카라반 갯수 조회하기
SELECT camp_name , address,cara_cnt
FROM TBL_CAMPAREA tc 
WHERE CARA_CNT > 0
ORDER BY ADDRESS ;





