-- SELECT 기본형식
-- SELECT 컬럼1,컬럼2,... from 테이블명 where 검색조건식 
-- 					order by 기준컬럼 (기본은 오름:asc,내림 : desc)
SELECT * FROM TBL_BUY tb ;		--INSERT 실행한 순서로 출력
SELECT * FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_CUSTOM tc ORDER BY CUSTOM_ID ;
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID ='mina012';
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID ='mina012'
						ORDER BY buy_date DESC;
-- 조회할 컬럼 지정할 때 distinct 키워드 : 중복값은 1번만 결과 출력. 
SELECT custom_id FROM TBL_BUY tb ;	-- 구매고객 ID조회
SELECT DISTINCT custom_id FROM TBL_BUY tb ;