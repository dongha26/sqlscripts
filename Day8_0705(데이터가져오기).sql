-- ������ ��������
-- 			�����Ǵ� csv ������ ������ ���̺�� ��ȯ�� �� �ִ� ���
-- 			CSV ������ ������ �׸��� , �����Ͽ� ������ �ؽ�Ʈ �����Դϴ�.(���� �Ǵ� �޸��忡�� ���� ����)
-- 			���ǻ��� : �ڵ����� �����Ǵ� ���̺� �÷��� ũ�Ⱑ �����ͺ��� ���� �ʰ� �Ǵ� ������ Ÿ������ �����ؾ���.

-- 	ANIMAL_INS  ���̺� ���� 80187�� �����Ǹ� SQL������ ����ӵ� ���̸� Ȯ���� �� �ֽ��ϴ�
-- 			������� ���������� ������ sql ����ð� �� �����մϴ�.
SELECT * FROM ANIMAL_INS ai 
ORDER BY ANIMAL_ID;

-- ������ ��������(export)
-- 		���� �����ͺ��̽��� ���̺� ������ ��(��)���� ���Ϸ� �������� �մϴ�
-- 		DDL ���̺�,������ ���� ��ɹ��� INSERT ��ɵ��� ���� .sql ���� ����ϴ�.
SELECT * FROM TBL_BUY tb ;
-- commit�� rollback �׽�Ʈ
-- ȸ���� ���ų��� ����
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID = 'twice';
DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='sana97';

INSERT INTO TBL_BUY tb values('wonder','IPAD011',1,test_seq1.nextval);
INSERT INTO tbl_buy(custom_id,pcode,quantity,BUYNO)
VALUES ('wonder','IPAD011',1,test_seq1.nextval);
INSERT INTO tbl_buy(custom_id,pcode,quantity,BUYNO)
VALUES ('twice','GALAXY22',1,test_seq1.nextval);
INSERT INTO tbl_buy(custom_id,pcode,quantity,BUYNO)
VALUES ('mina012','DOWON123a',1,test_seq1.nextval);