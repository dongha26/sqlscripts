-- hr스키마를 이용하여 조인과 group by 를 포함해서 select 로 검색하는 문제를 10개 만들기
-- GROUP by 결과로도 조인을 할 수 있습니다.예시 부서인원이 가장 많은 부서는 어디인가요
--김동하
-- 주석으로 검색하는 내용쓰고
-- SELECT 쿼리 작성하세요
-- 부서인원이 가장 많은 부서는 어디인가요
--select DEPARTMENT_ID , count(*)
--from EMPLOYEES e 
--group by DEPARTMENT_ID
--having count(DEPARTMENT_ID) =
--(select max(count(*))
--from EMPLOYEES e2 
--group by DEPARTMENT_ID);	

select max(d.department_name), count(e.employee_id)
from employees e 
inner join departments d on e.department_id = d.department_id
group by e.department_id
order by 2 desc;
	
--Purchasing에 일하는 사원중 salary가5000d이상인 사원의 
--부서이름 직원id 성 이름 급여를 찾아라
SELECT DEPARTMENT_ID,EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID =30 
GROUP BY DEPARTMENT_ID,EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY
HAVING SALARY>=5000;

--입사 날짜 2002 12 10 이후 입사한 사원의 직원아이디 성이름 입사날짜 조회
SELECT  EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME ,HIRE_DATE   
	FROM EMPLOYEES e  
	WHERE HIRE_DATE >'2002-12-10'
	GROUP BY EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME ,HIRE_DATE
	ORDER BY HIRE_DATE;

-- 커미션이 0.1보다 높은 직원의 매니저 id
SELECT MANAGER_ID, COMMISSION_PCT  FROM EMPLOYEES e
WHERE COMMISSION_PCT >0.1
GROUP BY MANAGER_ID, COMMISSION_PCT


-- 부서별 최고급여, 최저급여, 평균급여 검색
SELECT DEPARTMENT_ID ,MAX(salary),MIN(salary),AVG(salary) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID;

-- 직업별로 최소급여를 받는 사원의 정보를 부서이름 성 이름 급여

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE (JOB_ID, SALARY) IN(SELECT JOB_ID, MIN(SALARY)
                            FROM EMPLOYEES
                            GROUP BY JOB_ID )
ORDER BY SALARY ;

-- 동일한 직업을 가지는 사원들의 총 수
SELECT job_id,COUNT(employee_id)
FROM employees
GROUP BY job_id
ORDER BY 2 DESC;

--국가 별 직원 수
SELECT   COUNTRY_NAME,L.CITY, COUNT(*)
  FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
                   LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
                   LEFT JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID 
 GROUP BY COUNTRY_NAME, CITY
 ORDER BY 3 DESC; 
-- 최소 급여 5000이상 직업의 이름
SELECT JOB_TITLE,MIN(MIN_SALARY)  
FROM JOBS j 
GROUP BY JOB_TITLE 
HAVING MIN(MIN_SALARY) >5000;


SELECT d.DEPARTMENT_NAME ,e.DEPARTMENT_ID,LAST_NAME ,SALARY 
           FROM EMPLOYEES e ,DEPARTMENTS d 
           WHERE (e.DEPARTMENT_ID ,salary) IN  (SELECT DEPARTMENT_ID , MIN(salary)
          FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) AND e.DEPARTMENT_ID =d.DEPARTMENT_ID
         ORDER BY SALARY DESC;
         
SELECT FIRST_NAME ,LAST_NAME ,SALARY  FROM EMPLOYEES e 
         
-- 그룹함수 조회할 때 group by 를 써서 그룹바이에 쓴 컬럼을 SELECT 로 조회할 수 있습니다
-- 그룹바이 컬럼외에는 다른 컬럼 select 할 수 없습니다
         
-- 1 사용할 함수
SELECT DEPARTMENT_ID ,AVG(SALARY) FROM EMPLOYEES e  GROUP BY DEPARTMENT_ID;

-- 2 조인하기
SELECT * FROM DEPARTMENTS d JOIN
(SELECT DEPARTMENT_ID ,AVG(SALARY) cavg FROM EMPLOYEES e  GROUP BY DEPARTMENT_ID)tavg
ON d.DEPARTMENT_ID = tavg.department_id;

-- 3 컬럼저장하기
SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME, round(tavg.cavg,1) FROM DEPARTMENTS d JOIN
(SELECT DEPARTMENT_ID ,AVG(SALARY)cavg FROM EMPLOYEES e  GROUP BY DEPARTMENT_ID)tavg
ON d.DEPARTMENT_ID = tavg.department_id
ORDER BY tavg.cavg DESC;

-- 4 정렬한 결과로 특정 위치 지정하기
SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME, round(tavg.cavg,1) FROM DEPARTMENTS d 
JOIN
(SELECT DEPARTMENT_ID ,AVG(SALARY) cavg FROM EMPLOYEES e  
GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id
ORDER BY tavg.cavg DESC FETCH FIRST 1 ROWS ONLY;


-- rownum은 가상의 컬럼으로 조회된 결과에 순차적으로 오라클에 부여하는 값입니다.-> join이 한번 더 필요합니다
SELECT d.DEPARTMENT_NAME ,rownum,tcnt.* FROM DEPARTMENTS d , 
(SELECT DEPARTMENT_ID ,COUNT(*) cnt FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum = 1 AND tcnt.department_id = d.DEPARTMENT_ID;

SELECT rownum,tcnt.* FROM 
(SELECT DEPARTMENT_ID ,COUNT(*) cnt FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum < 5;

SELECT * FROM
(SELECT rownum rn,tcnt.* FROM  
(SELECT DEPARTMENT_ID ,COUNT(*) cnt FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt)
WHERE rn BETWEEN 5 AND 9;

