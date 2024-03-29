-- 제약 조건 설정은 create table,alter table 에서 합니다

-- 제약 조건 1) not null : col2 컬럼은 반드시 값을 저장해야합니다.
CREATE TABLE tbl#(
	col1 varchar2(10),
	col2 number(3) NOT null
);

INSERT INTO tbl#(col2) VALUES (98);
INSERT INTO tbl#(col1) VALUES ('korean'); -- 오류 : NOT NULL 제약조건 위반
INSERT INTO tbl# VALUES ('korean',78);
INSERT INTO tbl# VALUES ('korean',88);
-- 확인
SELECT  * FROM tbl#;
-- 새로운 제약조건을 갖는 col3
ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE;
DELETE TABLE 

--INSERT 
INSERT INTO "TBL#" (col1) VALUES ('english'); --오류
INSERT INTO "TBL#" (col2) VALUES (77);
INSERT INTO "TBL#" (col3) VALUES ('english'); -- 오류
INSERT INTO "TBL#" (col1,col2) VALUES ('english',88);
INSERT INTO "TBL#" (col2,col3) VALUES (88,'science'); 
INSERT INTO "TBL#" (col1,col3) VALUES ('science',88); -- 오류
-- 오류 : 무결성 제약 조건(C##IDEV,SYS_C008349)에 위배됩니다
INSERT INTO "TBL#" (col1,col2,col3) VALUES ('english',89,'science');
INSERT INTO "TBL#" (col1,col2,col3) VALUES ('english',89,'math');
-- 체크사항 : unique 컬럼에는 null 허용됩니다.

-- 제약조건 3) 기본키 (primary key)는 not null 과 unique 제약조건입니다

CREATE TABLE tbl2# (
	tno number(3) PRIMARY KEY,
	tid number(3) UNIQUE 
);

INSERT INTO tbl2#(tno) VALUES (123);
SELECT * FROM TBL2#;
-- 무결성 제약조건(pk 기본키 컬럼은 유일한 값이면서 NOT NULL입니다.)에 위배됩니다
INSERT INTO tbl2#(tno) VALUES (123); --unique
INSERT INTO tbl2#(tid) VALUES (123); --NOT NULL
ALTER  TABLE "TBL#" DROP COLLUM age
-- 제약조건 4) check : 컬럼값의 범위를 설정 -> age 컬럼값은 16~80
ALTER TABLE tbl2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT INTO tbl2# (tno,tid,age) VALUES (222,123,20);
INSERT INTO tbl2# (tno,tid,age) VALUES (222,124,90); -- 오류

ALTER TABLE tbl2# ADD gender char(1) CHECK (gender IN ('M','F'));
INSERT INTO "TBL2#" (tno,gender) VALUES (224,'F');
INSERT INTO "TBL2#" (tno,gender) VALUES (225,'M');
INSERT INTO "TBL2#" (tno,gender) VALUES (226,'m'); -- 오류 :CHECK 제약조건 위반

-- 성별 gender 컬럼의 제약조건 변경은
ALTER TABLE "TBL2#" drop CONSTRAINT "TBL2_chk_gender";
ALTER TABLE "TBL2#" ADD CONSTRAINT TBL2_chk_gender2
CHECK (gender IN ('M','F','m','f'));

INSERT INTO "TBL2#" (tno,gender) VALUES (228,'m'); 
INSERT INTO "TBL2#" (tno,gender) VALUES (229,'f'); 