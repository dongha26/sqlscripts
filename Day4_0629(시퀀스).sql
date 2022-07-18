-- 오라클은 시퀀스를 이용하여 자동증가 되는 값을 만들고 이를 테이블의 컬럼 값으로 INSERT 한다
-- (mysql은 다른 방법)
CREATE SEQUENCE test_seq1; 	-- 시퀀스 이름은 식별자

-- dual은 연산, 함수 결과등을 확인할 때 사용하는 임시 테이블입니다.
SELECT 2+3 FROM dual;

-- 시퀀스의 다음값으로 증가해라.
SELECT test_seq1.nextval FROM dual;
-- 맨처음 nextval을 실행해야 currval(시퀀스 현재값) 실행 가능.
SELECT test_seq1.currval FROM dual;

CREATE TABLE tbl_seq (
	tno number(7),
	name nvarchar2(10)
);

INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'모모');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'쯔의');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'나연');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'다현');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'지효');
SELECT  * FROM tbl_seq;

CREATE SEQUENCE test_seq4
	INCREMENT BY 1		--증감 설정
	START WITH 20160001;	--시작값  --MAXVALUE 는 최대값
								 --minvalue 는 최대값 도달 후 순환하는 최소값
SELECT test_seq2.nextval FROM dual;
SELECT test_seq2.currval FROM dual;

SELECT * FROM MEMBER_TBL mt ;
insert into member_tbl(custno,custname,phone,address,joindate,grade,city) values (test_seq.nextval,'김행복','010-1111-2222','서울 동대문구 휘경1동','2015-12-02','A','01');