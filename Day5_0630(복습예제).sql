CREATE TABLE tbl_custom (
custom_id varchar2(20) PRIMARY key, -- �⺻Ű�� �����ϼ���.
name nvarchar2(20) not null,
email varchar2(20),
age number(3),
reg_date date DEFAULT sysdate -- �⺻�� �����Դϴ�.
);
SELECT * FROM TBL_CUSTOM;
--date ���Ŀ� �����Ǵ� ���� �����ϱ� -> insert �� �� to_date�Լ� ��������
ALTER session set NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
-- ��ǰ ���̺� : ī�װ� ���� A1:������ǰ, B1:��ǰ
CREATE TABLE tbl_product(
pcode varchar2(20) PRIMARY key, -- �⺻Ű�� �����ϼ���.
category char(2) not null,
pname nvarchar2(20) not null,
price number(9) not null
);
-- ���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�?
CREATE TABLE tbl_buy(
custom_id varchar2(20) not null,
pcode varchar2(20) not null,
quantity number(5) not null, --����
buy_date date DEFAULT sysdate

);
SELECT * FROM tbl_custom ;
INSERT INTO tbl_custom(custom_id,name,email,age,reg_date)
VALUES('mina012','��̳�','kimm@gmail.com',20,'2022-03-10 14:23:25');
INSERT INTO tbl_custom(custom_id,name,email,age,reg_date)
VALUES ('hongGD','ȫ�浿','gil@korea.com',32,'2021-10-21 00:00:00');
INSERT INTO tbl_custom(custom_id,name,email,age,reg_date)
VALUES ('twice','�ڸ��','momo@daum.net',29,'2021-12-25 00:00:00');
INSERT INTO tbl_custom (custom_id,name,email,age)
VALUES ('wonder','�̳���','lee@naver.com',40);
INSERT INTO tbl_custom (custom_id,name,email,age,reg_date)
VALUES ('hong1','��ȫ','hong12@naver.com',26,'2022-12-28 00:00:15');

INSERT INTO TBL_PRODUCT (pcode,CATEGORY,PNAME,PRICE)
VALUES ('IPAD011','A1','�����е�10',880000);
INSERT INTO TBL_PRODUCT (pcode,CATEGORY,PNAME,PRICE)
VALUES ('DOWON123a','B1','������ġ������Ʈ',54000);
INSERT INTO TBL_PRODUCT (pcode,CATEGORY,PNAME,PRICE)
VALUES ('dk_143','A2','��ǵ���ũ',234500);

INSERT INTO tbl_buy(custom_id,pcode,quantity,buy_date)
VALUES ('mina012','IPAD011',1,'2022-02-06 00:00:00');
INSERT INTO tbl_buy(custom_id,pcode,quantity,buy_date)
VALUES ('hongGD','IPAD011',2,'2022-06-29 20:37:47');
INSERT INTO tbl_buy(custom_id,pcode,quantity,buy_date)
VALUES ('wonder','DOWON123a',3,'2022-02-06 00:00:00');
INSERT INTO tbl_buy(custom_id,pcode,quantity)
VALUES ('mina012','dk_143',1);
INSERT INTO tbl_buy(custom_id,pcode,quantity,buy_date)
VALUES ('twice','DOWON123a',2,'2022-02-09 08:49:55');

ALTER TABLE tbl_buy ADD buyno number(8);
UPDATE TBL_BUY SET buyno = 1001 WHERE CUSTOM_ID = 'mina012' AND PCODE='IPAD011'; 
UPDATE TBL_BUY SET buyno = 1002 WHERE CUSTOM_ID = 'hongGD' AND PCODE='IPAD011'; 
UPDATE TBL_BUY SET buyno = 1003 WHERE CUSTOM_ID = 'wonder' AND PCODE='DOWON123a'; 
UPDATE TBL_BUY SET buyno = 1004 WHERE CUSTOM_ID = 'mina012' AND PCODE='dk_143'; 
UPDATE TBL_BUY SET buyno = 1005 WHERE CUSTOM_ID = 'twice' AND PCODE='DOWON123a'; 
SELECT * FROM TBL_BUY tb ;
ALTER TABLE tbl_buy ADD PRIMARY KEY(buyno);
COMMIT;
ALTER TABLE tbl_buy ADD CONSTRAINT FK_custom_id
FOREIGN KEY (custom_id) REFERENCES tbl_custom(custom_id);
ALTER TABLE tbl_buy ADD CONSTRAINT pcode
FOREIGN KEY (pcode) REFERENCES tbl_product(pcode);

CREATE  SEQUENCE tblbuy_seq
	INCREMENT BY 1		
	START WITH 1006;
SELECT tblbuy_seq.nextval FROM dual;
SELECT tblbuy_seq.currval FROM dual;
INSERT INTO TBL_BUY VALUES ('wonder','IPAD011',1,'2022-05-15',tblbuy_seq.nextval);
SELECT * FROM tbl_custom WHERE age>30; 
SELECT EMAIL  FROM tbl_custom WHERE CUSTOM_ID ='twice'; 
SELECT PNAME  FROM tbl_product WHERE CATEGORY  ='A2'; 
SELECT  MAX(price) FROM tbl_product price;
SELECT SUM(quantity) FROM TBL_BUY quantity WHERE PCODE ='IPAD011';
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID  = 'mina012';
SELECT * FROM tbl_product WHERE PCODE like '%0%';
SELECT * FROM tbl_product WHERE UPPER(PCODE) like '%ON%';
SELECT * FROM tbl_product WHERE LOWER(PCODE) like '%on%';

