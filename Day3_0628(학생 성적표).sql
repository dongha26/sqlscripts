CREATE TABLE st (
	sno char(7) PRIMARY key,
	name nvarchar2(10) NOT null,
	age number(3),
	adress nvarchar2(50)
);

CREATE TABLE scoreAll(
	sno char(7),
	subject nvarchar2(20),
	score number(3) NOT null,
	teacher nvarchar2(20) NOT null,
	season char(6) NOT NULL
--	PRIMARY KEY (sno,subject),
--	FOREIGN KEY (sno) REFERENCES st(sno)
);
--ALTER  table ~ add constraint
ALTER TABLE scoreAll ADD CONSTRAINT st PRIMARY KEY (sno,subject);
ALTER TABLE scoreAll ADD CONSTRAINT scoreAll FOREIGN key(sno) REFERENCES st(sno);

INSERT INTO ST VALUES (2021001,'����',16,'���ʱ�');
INSERT INTO ST VALUES (2019019,'������',18,'������');
SELECT * FROM st;

INSERT INTO scoreALL VALUES (2021001,'����',89,'�̳���','2022_1');
INSERT INTO scoreAll VALUES (2021001,'����',78,'��浿','2022_1');
INSERT INTO scoreAll VALUES (2021001,'����',67,'�ڼ���','2021_2');
INSERT INTO scoreAll VALUES (2019019,'����',92,'�̳���','2019_2');
INSERT INTO scoreAll VALUES (2019019,'����',85,'������','2019_2');
INSERT INTO scoreAll VALUES (2019019,'����',88,'�ڼ���','2020_1');
--INSERT INTO scoreAll VALUES (2019020,'����',88,'�̳���','2020_1');
SELECT * FROM scoreAll;
