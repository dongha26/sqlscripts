-- ���ڿ� Ÿ��
-- CHAR(����) : �������� , ������ ����Ʈ 
-- VARCHAR(����) : ����Ŭ���� ���������� ������� �ʴ� �����ڷ���.
-- VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE tbl_string (
	acol char(10), 		-- 10����Ʈ ��������
	bcol varchar2(10),	-- 10 ����Ʈ ��������
	ccol nchar(10), 	-- 10 ���� ��������
	dcol nvarchar2(10)  -- 10�� ���� ��������
);

--char Ÿ��
INSERT INTO tbl_string(acol) VALUES('abcefghij');
INSERT INTO tbl_string(acol) VALUES('abcef'); -- ���� ���� ����4�� �߰�
INSERT INTO tbl_string(acol) VALUES('abcefghijklm'); --���� �����ʰ�

-- INSERT 
SELECT  * FROM TBL_STRING ;
-- �ѱ�Ȯ��
INSERT INTO TBL_STRING (acol) VALUES ('������'); -- ���� 1�� �߰�
INSERT INTO TBL_STRING (acol) VALUES ('�����ٶ�'); --����:���� ���� ���� �ʹ� ŭ(����:12,�ִ밪:10)
INSERT INTO TBL_STRING (acol) VALUES ('����');	-- ���� 4���߰�

--varchar2 Ÿ�� : bcol�� �������� 10����Ʈ
INSERT INTO tbl_string(bcol) VALUES('abcefghij');
INSERT INTO tbl_string(bcol) VALUES('abcef'); -- bcol�� ��������Ÿ��.�����߰�����
INSERT INTO tbl_string(bcol) VALUES('abcefghijklm'); --���� �����ʰ�
-- INSERT 
SELECT  * FROM TBL_STRING ;
-- �ѱ�Ȯ��
INSERT INTO TBL_STRING (bcol) VALUES ('������'); --���� �߰� ����
INSERT INTO TBL_STRING (bcol) VALUES ('�����ٶ�'); --����:���� ���� ���� �ʹ� ŭ(����:12,�ִ밪:10)
INSERT INTO TBL_STRING (bcol) VALUES ('����');	--���� �߰� ����


--char�� varvhar2�� ����Ʈ ����. nchar�� nvarchar2�� ���ڰ�������(�ٱ��� ���ڰ� ���� ���ԵǴ� �÷��� ����)
-- nchar Ÿ��
INSERT INTO TBL_STRING (ccol) VALUES ('������'); --���� 7���߰� 
INSERT INTO TBL_STRING (ccol) VALUES ('�����ٶ�');	--���� 6���߰� 
INSERT INTO TBL_STRING (ccol) VALUES ('����');	--���� 8���߰�
INSERT INTO TBL_STRING (ccol) VALUES ('�����ٶ󸶹ٻ������ī');	--���� 8���߰�
SELECT  * FROM TBL_STRING ;
-- nvarchar2 Ÿ��
INSERT INTO TBL_STRING (dcol) VALUES ('������'); --
INSERT INTO TBL_STRING (dcol) VALUES ('�����ٶ�'); --
INSERT INTO TBL_STRING (dcol) VALUES ('����');	-
INSERT INTO TBL_STRING (ccol) VALUES ('�����ٶ󸶹ٻ������ī');





