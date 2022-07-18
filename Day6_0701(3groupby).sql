-- 주제 : 로우를 그룹화하고 그룹함수를 사용 합니다. 사용하는 순서는 아래처럼 합니다
-- select문
-- [where] 그룹화하기 전에 사용할 조건식
-- GROUP BY 그룹화에 사용할 컬럼명
-- [HAVING] 그룹화 결과에 대한 조건식
-- [ORDER BY] 그룹화 결과 정렬 컬럼명과 방식

SELECT PCODE ,count(*)  FROM TBL_BUY tb  GROUP BY PCODE ;
SELECT PCODE ,count(*),SUM(QUANTITY)  
	FROM TBL_BUY tb  
	GROUP BY PCODE 
	ORDER BY 2;			-- 조회된 컬럼의 위치

	
SELECT PCODE ,count(*) cnt,SUM(QUANTITY) total  
	FROM TBL_BUY tb  
	GROUP BY PCODE 
	ORDER BY cnt;

-- 그룹화 후에 수량합계가 3이상인것만 조회
SELECT PCODE ,count(*) cnt,SUM(QUANTITY) total  
	FROM TBL_BUY tb  
	GROUP BY PCODE 
--	HAVING total >=3     HAVING 에는 컬럼 별칭 사용못함 테이블 컬럼명은 사용할 수 있음.
	HAVING sum(QUANTITY) >=3
	ORDER BY cnt;

-- 구매날짜 2022-04-01 이후인 것만 그룹화하여 출력
SELECT PCODE ,count(*) cnt,SUM(QUANTITY) total  
	FROM TBL_BUY tb  
	WHERE BUY_DATE >'2022-04-01'
	GROUP BY PCODE 
	ORDER BY cnt;


-- Day2 참고
-- 통계함수 : count,avg,max,min,sum . 통계함수는 그룹함수라고도 합니다.
-- 			해당 함수 결과값을 구하기 위해 특정 컬럼 사용하여 여러 데이터를 그룹화한 후 실행

SELECT  COUNT(*) FROM EMPLOYEES e ;  		-- 테이블 전체 데이터 갯수 107
SELECT  MAX(salary) FROM EMPLOYEES e ; 		-- salary 컬럼의 최대값   24000
SELECT  MIN(salary) FROM EMPLOYEES e ; 		-- salary 컬럼의 최소값	 2100
SELECT  AVG(salary) FROM EMPLOYEES e ; 		-- salary 컬름의 평균값	 6461.83..
SELECT  SUM(salary) FROM EMPLOYEES e ;		-- 합계 					 691416

SELECT  COUNT(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT  MAX(salary) FROM EMPLOYEES e  WHERE JOB_ID  = 'IT_PROG'; 		
SELECT  MIN(salary) FROM EMPLOYEES e WHERE JOB_ID  = 'IT_PROG'; 		
SELECT  AVG(salary) FROM EMPLOYEES e WHERE JOB_ID  = 'IT_PROG'; 		
SELECT  SUM(salary) FROM EMPLOYEES e WHERE JOB_ID  = 'IT_PROG';	

-- 통계함수 결과는 다른 컬럼값과 같이 조회할 수 없습니다(그룹함수이기때문)
SELECT  JOB_ID ,COUNT(*) FROM EMPLOYEES e 
WHERE JOB_ID = 'IT_PROG'; --오류:단일 그룹의 그룹함수가 아닙니다.