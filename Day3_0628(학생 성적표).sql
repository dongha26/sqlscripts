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

INSERT INTO ST VALUES (2021001,'김모모',16,'서초구');
INSERT INTO ST VALUES (2019019,'강다현',18,'강남구');
SELECT * FROM st;

INSERT INTO scoreALL VALUES (2021001,'국어',89,'이나연','2022_1');
INSERT INTO scoreAll VALUES (2021001,'영어',78,'김길동','2022_1');
INSERT INTO scoreAll VALUES (2021001,'과학',67,'박세리','2021_2');
INSERT INTO scoreAll VALUES (2019019,'국어',92,'이나연','2019_2');
INSERT INTO scoreAll VALUES (2019019,'영어',85,'박지성','2019_2');
INSERT INTO scoreAll VALUES (2019019,'과학',88,'박세리','2020_1');
--INSERT INTO scoreAll VALUES (2019020,'국어',88,'이나연','2020_1');
SELECT * FROM scoreAll;
