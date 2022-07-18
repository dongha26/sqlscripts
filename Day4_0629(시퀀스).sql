-- ����Ŭ�� �������� �̿��Ͽ� �ڵ����� �Ǵ� ���� ����� �̸� ���̺��� �÷� ������ INSERT �Ѵ�
-- (mysql�� �ٸ� ���)
CREATE SEQUENCE test_seq1; 	-- ������ �̸��� �ĺ���

-- dual�� ����, �Լ� ������� Ȯ���� �� ����ϴ� �ӽ� ���̺��Դϴ�.
SELECT 2+3 FROM dual;

-- �������� ���������� �����ض�.
SELECT test_seq1.nextval FROM dual;
-- ��ó�� nextval�� �����ؾ� currval(������ ���簪) ���� ����.
SELECT test_seq1.currval FROM dual;

CREATE TABLE tbl_seq (
	tno number(7),
	name nvarchar2(10)
);

INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'���');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'����');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'����');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'����');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'��ȿ');
SELECT  * FROM tbl_seq;

CREATE SEQUENCE test_seq4
	INCREMENT BY 1		--���� ����
	START WITH 20160001;	--���۰�  --MAXVALUE �� �ִ밪
								 --minvalue �� �ִ밪 ���� �� ��ȯ�ϴ� �ּҰ�
SELECT test_seq2.nextval FROM dual;
SELECT test_seq2.currval FROM dual;

SELECT * FROM MEMBER_TBL mt ;
insert into member_tbl(custno,custname,phone,address,joindate,grade,city) values (test_seq.nextval,'���ູ','010-1111-2222','���� ���빮�� �ְ�1��','2015-12-02','A','01');