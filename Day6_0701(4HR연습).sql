-- hr��Ű���� �̿��Ͽ� ���ΰ� group by �� �����ؼ� select �� �˻��ϴ� ������ 10�� �����
-- GROUP by ����ε� ������ �� �� �ֽ��ϴ�.���� �μ��ο��� ���� ���� �μ��� ����ΰ���
--�赿��
-- �ּ����� �˻��ϴ� ���뾲��
-- SELECT ���� �ۼ��ϼ���
-- �μ��ο��� ���� ���� �μ��� ����ΰ���
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
	
--Purchasing�� ���ϴ� ����� salary��5000d�̻��� ����� 
--�μ��̸� ����id �� �̸� �޿��� ã�ƶ�
SELECT DEPARTMENT_ID,EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID =30 
GROUP BY DEPARTMENT_ID,EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY
HAVING SALARY>=5000;

--�Ի� ��¥ 2002 12 10 ���� �Ի��� ����� �������̵� ���̸� �Ի糯¥ ��ȸ
SELECT  EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME ,HIRE_DATE   
	FROM EMPLOYEES e  
	WHERE HIRE_DATE >'2002-12-10'
	GROUP BY EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME ,HIRE_DATE
	ORDER BY HIRE_DATE;

-- Ŀ�̼��� 0.1���� ���� ������ �Ŵ��� id
SELECT MANAGER_ID, COMMISSION_PCT  FROM EMPLOYEES e
WHERE COMMISSION_PCT >0.1
GROUP BY MANAGER_ID, COMMISSION_PCT


-- �μ��� �ְ�޿�, �����޿�, ��ձ޿� �˻�
SELECT DEPARTMENT_ID ,MAX(salary),MIN(salary),AVG(salary) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID;

-- �������� �ּұ޿��� �޴� ����� ������ �μ��̸� �� �̸� �޿�

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE (JOB_ID, SALARY) IN(SELECT JOB_ID, MIN(SALARY)
                            FROM EMPLOYEES
                            GROUP BY JOB_ID )
ORDER BY SALARY ;

-- ������ ������ ������ ������� �� ��
SELECT job_id,COUNT(employee_id)
FROM employees
GROUP BY job_id
ORDER BY 2 DESC;

--���� �� ���� ��
SELECT   COUNTRY_NAME,L.CITY, COUNT(*)
  FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
                   LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
                   LEFT JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID 
 GROUP BY COUNTRY_NAME, CITY
 ORDER BY 3 DESC; 
-- �ּ� �޿� 5000�̻� ������ �̸�
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
         
-- �׷��Լ� ��ȸ�� �� group by �� �Ἥ �׷���̿� �� �÷��� SELECT �� ��ȸ�� �� �ֽ��ϴ�
-- �׷���� �÷��ܿ��� �ٸ� �÷� select �� �� �����ϴ�
         
-- 1 ����� �Լ�
SELECT DEPARTMENT_ID ,AVG(SALARY) FROM EMPLOYEES e  GROUP BY DEPARTMENT_ID;

-- 2 �����ϱ�
SELECT * FROM DEPARTMENTS d JOIN
(SELECT DEPARTMENT_ID ,AVG(SALARY) cavg FROM EMPLOYEES e  GROUP BY DEPARTMENT_ID)tavg
ON d.DEPARTMENT_ID = tavg.department_id;

-- 3 �÷������ϱ�
SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME, round(tavg.cavg,1) FROM DEPARTMENTS d JOIN
(SELECT DEPARTMENT_ID ,AVG(SALARY)cavg FROM EMPLOYEES e  GROUP BY DEPARTMENT_ID)tavg
ON d.DEPARTMENT_ID = tavg.department_id
ORDER BY tavg.cavg DESC;

-- 4 ������ ����� Ư�� ��ġ �����ϱ�
SELECT d.DEPARTMENT_ID ,d.DEPARTMENT_NAME, round(tavg.cavg,1) FROM DEPARTMENTS d 
JOIN
(SELECT DEPARTMENT_ID ,AVG(SALARY) cavg FROM EMPLOYEES e  
GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id
ORDER BY tavg.cavg DESC FETCH FIRST 1 ROWS ONLY;


-- rownum�� ������ �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ���Դϴ�.-> join�� �ѹ� �� �ʿ��մϴ�
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

