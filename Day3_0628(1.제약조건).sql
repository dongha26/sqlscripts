-- ���� ���� ������ create table,alter table ���� �մϴ�

-- ���� ���� 1) not null : col2 �÷��� �ݵ�� ���� �����ؾ��մϴ�.
CREATE TABLE tbl#(
	col1 varchar2(10),
	col2 number(3) NOT null
);

INSERT INTO tbl#(col2) VALUES (98);
INSERT INTO tbl#(col1) VALUES ('korean'); -- ���� : NOT NULL �������� ����
INSERT INTO tbl# VALUES ('korean',78);
INSERT INTO tbl# VALUES ('korean',88);
-- Ȯ��
SELECT  * FROM tbl#;
-- ���ο� ���������� ���� col3
ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE;
DELETE TABLE 

--INSERT 
INSERT INTO "TBL#" (col1) VALUES ('english'); --����
INSERT INTO "TBL#" (col2) VALUES (77);
INSERT INTO "TBL#" (col3) VALUES ('english'); -- ����
INSERT INTO "TBL#" (col1,col2) VALUES ('english',88);
INSERT INTO "TBL#" (col2,col3) VALUES (88,'science'); 
INSERT INTO "TBL#" (col1,col3) VALUES ('science',88); -- ����
-- ���� : ���Ἲ ���� ����(C##IDEV,SYS_C008349)�� ����˴ϴ�
INSERT INTO "TBL#" (col1,col2,col3) VALUES ('english',89,'science');
INSERT INTO "TBL#" (col1,col2,col3) VALUES ('english',89,'math');
-- üũ���� : unique �÷����� null ���˴ϴ�.

-- �������� 3) �⺻Ű (primary key)�� not null �� unique ���������Դϴ�

CREATE TABLE tbl2# (
	tno number(3) PRIMARY KEY,
	tid number(3) UNIQUE 
);

INSERT INTO tbl2#(tno) VALUES (123);
SELECT * FROM TBL2#;
-- ���Ἲ ��������(pk �⺻Ű �÷��� ������ ���̸鼭 NOT NULL�Դϴ�.)�� ����˴ϴ�
INSERT INTO tbl2#(tno) VALUES (123); --unique
INSERT INTO tbl2#(tid) VALUES (123); --NOT NULL
ALTER  TABLE "TBL#" DROP COLLUM age
-- �������� 4) check : �÷����� ������ ���� -> age �÷����� 16~80
ALTER TABLE tbl2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT INTO tbl2# (tno,tid,age) VALUES (222,123,20);
INSERT INTO tbl2# (tno,tid,age) VALUES (222,124,90); -- ����

ALTER TABLE tbl2# ADD gender char(1) CHECK (gender IN ('M','F'));
INSERT INTO "TBL2#" (tno,gender) VALUES (224,'F');
INSERT INTO "TBL2#" (tno,gender) VALUES (225,'M');
INSERT INTO "TBL2#" (tno,gender) VALUES (226,'m'); -- ���� :CHECK �������� ����

-- ���� gender �÷��� �������� ������
ALTER TABLE "TBL2#" drop CONSTRAINT "TBL2_chk_gender";
ALTER TABLE "TBL2#" ADD CONSTRAINT TBL2_chk_gender2
CHECK (gender IN ('M','F','m','f'));

INSERT INTO "TBL2#" (tno,gender) VALUES (228,'m'); 
INSERT INTO "TBL2#" (tno,gender) VALUES (229,'f'); 