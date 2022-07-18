-- DDL : create alter drop TRUNCATE 
-- (����� user,table,sequence,view, truncate�� ���̺� ���)
-- DML : insert update delete 

DROP TABLE SCORES0; -- ���� : student0 ���̺� ���� �����ϸ�
					-- ���� �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�
DROP TABLE STUDENTS0;

-- UPDATE ���̺�� SET �÷��� = ��,�÷��� = ��,�÷��� = ��,.... WHERE �����÷� ���Խ�
-- delete from ���̺�� where �����÷� �����
-- �������� : update�� delete�� where ���� ����ϴ� ���� ������ ����.1
--				TRUNCATE�� ������ ���(rollback)�� �� ���� ������ DDL�� ���մϴ�
SELECT * FROM STUDENTS0 s ;
-- UPDATE ,DELETE , SELECT ���� WHERE�� �÷��� �⺻Ű �÷����� ���������̸�
-- ����Ǵ� ��ϱ��
-- �⺻Ű�� ������ ���̺��� ���� ����� ����(�ĺ�)����
UPDATE STUDENTS0  SET AGE = 17 WHERE STUNO = 2021001;

-- rollback,commit �׽�Ʈ (�����ͺ��̽� �޴����� Ʈ����� ��带 manual�� �����մϴ�)
-- ������� �����ϼ���.
UPDATE STUDENTS0  SET ADDRESS = '���ϱ�' ,age  = 16 WHERE STUNO = 2021001;
ROLLBACK;   -- ���� ������Ʈ ������ ���
SELECT * FROM STUDENTS0 s2 ;
UPDATE STUDENTS0  SET ADDRESS = '���ϱ�' ,age  = 16 WHERE STUNO = 2021001;
COMMIT;
SELECT * FROM STUDENTS0 s2 ;  -- �̹� commit�� ��ɾ�� ROLLBACK ����.
 
--------------------------------------------------�������
-- Ʈ����� ������� : ROLLBACK , COMMIT
DELETE FROM SCORES0 s ;
ROLLBACK;
DELETE FROM SCORES0 s  WHERE STUNO = 2019019; 
SELECT * FROM SCORES0 s ;
-- �� ������� Ʈ����� ��������̰� ���� â������ SELECT ����� 2019019�� �����ϴ�.
-- �ٸ� ������� �ٸ� Ŭ���̾�Ʈ�̹Ƿ� ���� ����(���� Ŀ���� ����)�� �������ϴ�.
ROLLBACK;
SELECT * FROM STUDENTS0 s2 ;
---------------------------������� �ι��� ����
TRUNCATE TABLE SCORES0 ; --��� �����͸� ����ϴ� . ROLLBACK ����
ROLLBACK;				 --ROLLBACK �Ұ�
-- ��� �����͸� ������� Ȯ���ϸ� �ٸ��͵�� ������ �ѹ���� �ʰ� Ȯ���ϰ� TRUNCATE 
--------------------------------------------------
/*
 * INSERT
 * DELETE
 * COMMIT;
 * UPDATE
 * 
 * 
 * 
 * 
 * 
 * 
