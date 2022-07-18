/*
 *1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���

2. lastname�� 'Jones' �� ������ ��� �÷�

3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ

4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ

5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ
    
 */
SELECT  FIRST_NAME,LAST_NAME,EMAIL  FROM  EMPLOYEES e WHERE HIRE_DATE < '2006-01-01';
SELECT  * FROM EMPLOYEES e  WHERE LAST_NAME = 'Jones';
-- ��ҹ��� �˻�� ���ǽĿ� �����ؾ��մϴ�.
-- �÷����� ��ҹ��� ��ȯ �� ���ǰ� �� -> ��ҹ��� �����ϰ� �˻��ϴ� ���
SELECT  * FROM EMPLOYEES e  WHERE LAST_NAME UPPER(LAST_NAME) = 'JONES';
SELECT  * FROM EMPLOYEES e  WHERE LAST_NAME LOWER(LAST_NAME) = 'jones';

SELECT  FIRST_NAME,LAST_NAME,JOB_ID  FROM EMPLOYEES e  WHERE SALARY > '5000';
SELECT  FIRST_NAME,LAST_NAME ,SALARY  FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';
-- 5 : ������Ÿ���� ����ȯ
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME  FROM EMPLOYEES e  WHERE DEPARTMENT_ID IN (50,60,80,90);
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME  FROM EMPLOYEES e  WHERE DEPARTMENT_ID =60;
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME  FROM EMPLOYEES e  WHERE DEPARTMENT_ID -'60'; -- �÷� ���Ŀ� ���� number�� ��ȯ

-- ����Լ� : count,avg,max,min . ����Լ��� �׷��Լ���� �մϴ�.
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

-- ������ ��� : create table, insert into , select~where~ �⺻����

-- ���� : ��Ī(alias) . �÷� �Ǵ� ���̺� �̸��� �� �� ª�� �ٿ��� ���� �̸�.
SELECT * FROM EMPLOYEES e ; -- EMPLIYEES ���̺��� ��Ī e
SELECT * FROM DEPARTMENTS d ; -- DEPARTMENTS ���̺��� ��Ī d
-- �������� ���� ��Ī�� �ʿ�����ϴ� . �׷��� ������ �����ϰ� ���ϴ�.