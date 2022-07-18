-- ���̺� ����� create table, ������ ���� �׽�Ʈ

CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	join_date DATE    -- ��¥ ��-��-��, �ð� ��:��:��.�и���
);

-- DML INSERT ���� (������ ��row �߰�)
-- ��� �÷��� �����͸� �����ϴ� ����(�÷��� ����) , ��¥�� date �ڵ���ȯ
INSERT INTO tbl_member VALUES (1,'����','momo@naver.com','2022-03-02');

INSERT INTO tbl_member(mno,name) --������ ����� �÷��� ���� 
VALUES (2,'�̳���');
--------------------------------------------------------------------------------
-- 2.DML SELECT ���� (������ �� row ��ȸ)
-- select ��ȸ�� �÷� ��� from ���̺��̸� [where ���ǽ�]; ����÷��� *�� ��ü 
SELECT name FROM TBL_MEMBER;
SELECT name,JOIN_DATE FROM TBL_MEMBER;
SELECT  * FROM TBL_MEMBER;
SELECT  * FROM TBL_MEMBER WHERE name = '�ִ���'; -- ���ǽ��� �÷� �̸����� ��ȸ�� �������
SELECT  * FROM TBL_MEMBER WHERE mno >2;
SELECT  * FROM TBL_MEMBER WHERE JOIN_DATE > '2022-03-03';
SELECT  name,EMAIL  FROM TBL_MEMBER WHERE JOIN_DATE > '2022-03-03';
--null �� ��ȸ
SELECT * FROM TBL_MEMBER tm  WHERE email IS NULL;
SELECT * FROM TBL_MEMBER tm  WHERE email IS NOT NULL;
-- ���ڿ��� �κа˻�
SELECT  * FROM TBL_MEMBER WHERE name like '%����';  --%�� don't care 
SELECT  * FROM TBL_MEMBER WHERE name like '����%';  --��ȸ�����?
SELECT  * FROM TBL_MEMBER WHERE name like '%����%';  --��ȸ�����?
-- or ���� : mno���� 1 �Ǵ� 2 �Ǵ� 4
SELECT * FROM TBL_MEMBER tm WHERE  MNO  = 1 OR mno = 2 OR mno =4;
--			����Ŭ�� or ��ü ������ : in (���� �÷��� ���� ���ǽ��϶�)
SELECT * FROM  TBL_MEMBER tm  WHERE mno IN (1,2,4);
SELECT * FROM  TBL_MEMBER tm  WHERE mno NOT  IN (1,2,4);
SELECT * FROM  TBL_MEMBER tm  WHERE NAME  IN ('����','�ִ���');



INSERT INTO tbl_member 
VALUES (3,'�ִ���','dahy@naver.com','2022-03-04 16:47'); --���� : ��¥ �������� �ڵ���ȯ�� ����


--����Ŭ�� to_date �Լ��� ���ڿ��� ��¥ �������� ��ȯ.(�ι�° ���ڴ� ����)
INSERT INTO tbl_member 
VALUES (3,'�ִ���','dahy@naver.com',to_date('2022-03-04 16:47','YYYY-MM-DD HH24:MI'));


-- to_char �Լ� : ��¥���Ŀ��� ���ڿ��� �����ϴ� �Լ� �ι�° ���ڴ� ���� -> �⵵ �Ǵ� �Ϻ� ���� ���Ⱑ��
SELECT to_char(JOIN_date,'YYYY') FROM TBL_MEMBER;


--���� �ý����� ��¥�� �ð� : sysdate �Լ�
INSERT INTO TBL_MEMBER VALUES (4,'����','aaa@gmail.com',sysdate);

SELECT  * FROM TBL_MEMBER ; 



-- ó�� ���� ���̺� ���� �� mno �÷��� ���е� 5�� ��� ����
--			��� �����Ҷ���.mno �÷��� ���� ����� �մϴ�.
ALTER TABLE "C##IDEV".TBL_MEMBER MODIFY MNO NUMBER(5,0);