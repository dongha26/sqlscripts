-- ���� : �ο츦 �׷�ȭ�ϰ� �׷��Լ��� ��� �մϴ�. ����ϴ� ������ �Ʒ�ó�� �մϴ�
-- select��
-- [where] �׷�ȭ�ϱ� ���� ����� ���ǽ�
-- GROUP BY �׷�ȭ�� ����� �÷���
-- [HAVING] �׷�ȭ ����� ���� ���ǽ�
-- [ORDER BY] �׷�ȭ ��� ���� �÷���� ���

SELECT PCODE ,count(*)  FROM TBL_BUY tb  GROUP BY PCODE ;
SELECT PCODE ,count(*),SUM(QUANTITY)  
	FROM TBL_BUY tb  
	GROUP BY PCODE 
	ORDER BY 2;			-- ��ȸ�� �÷��� ��ġ

	
SELECT PCODE ,count(*) cnt,SUM(QUANTITY) total  
	FROM TBL_BUY tb  
	GROUP BY PCODE 
	ORDER BY cnt;

-- �׷�ȭ �Ŀ� �����հ谡 3�̻��ΰ͸� ��ȸ
SELECT PCODE ,count(*) cnt,SUM(QUANTITY) total  
	FROM TBL_BUY tb  
	GROUP BY PCODE 
--	HAVING total >=3     HAVING ���� �÷� ��Ī ������ ���̺� �÷����� ����� �� ����.
	HAVING sum(QUANTITY) >=3
	ORDER BY cnt;

-- ���ų�¥ 2022-04-01 ������ �͸� �׷�ȭ�Ͽ� ���
SELECT PCODE ,count(*) cnt,SUM(QUANTITY) total  
	FROM TBL_BUY tb  
	WHERE BUY_DATE >'2022-04-01'
	GROUP BY PCODE 
	ORDER BY cnt;


-- Day2 ����
-- ����Լ� : count,avg,max,min,sum . ����Լ��� �׷��Լ���� �մϴ�.
-- 			�ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ�� �� ����

SELECT  COUNT(*) FROM EMPLOYEES e ;  		-- ���̺� ��ü ������ ���� 107
SELECT  MAX(salary) FROM EMPLOYEES e ; 		-- salary �÷��� �ִ밪   24000
SELECT  MIN(salary) FROM EMPLOYEES e ; 		-- salary �÷��� �ּҰ�	 2100
SELECT  AVG(salary) FROM EMPLOYEES e ; 		-- salary �ø��� ��հ�	 6461.83..
SELECT  SUM(salary) FROM EMPLOYEES e ;		-- �հ� 					 691416

SELECT  COUNT(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT  MAX(salary) FROM EMPLOYEES e  WHERE JOB_ID  = 'IT_PROG'; 		
SELECT  MIN(salary) FROM EMPLOYEES e WHERE JOB_ID  = 'IT_PROG'; 		
SELECT  AVG(salary) FROM EMPLOYEES e WHERE JOB_ID  = 'IT_PROG'; 		
SELECT  SUM(salary) FROM EMPLOYEES e WHERE JOB_ID  = 'IT_PROG';	

-- ����Լ� ����� �ٸ� �÷����� ���� ��ȸ�� �� �����ϴ�(�׷��Լ��̱⶧��)
SELECT  JOB_ID ,COUNT(*) FROM EMPLOYEES e 
WHERE JOB_ID = 'IT_PROG'; --����:���� �׷��� �׷��Լ��� �ƴմϴ�.