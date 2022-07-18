-- 데이터타입 number 연습 테이블
-- number : 자바에서 정수,실수 타입에 해당.
-- 			number(정밀도,소수점이하 자릿수)

--이미 있는 테이블 제거 : 꼭 필요할 때만 주의해서 실행하기
DROP TABLE TBL_NUMBER ;

-- 샘플 테이블 만들기
CREATE TABLE tbl_number(
	col1 NUMBER,		-- 정밀도 지정안하면 최대 38자리
	col2 NUMBER (5),	-- 정수 최대 5자리
	col3 NUMBER (7,2),	-- 전체 최대 7자리,소수점이하 2자리
	col4 NUMBER (2,5)	-- 소수점이라 5자리,유호숫자 최대 2자리
); 
-- 유효 숫자 : 12300 또는 00123 첫번째 00은 유효값 두번째 00은 불필요
-- 정상실행값 테스트1
INSERT INTO tbl_number VALUES (1234567,12345,12345.67,0.00012);

--오류테스트 1 : col2값 오류
INSERT INTO TBL_NUMBER 
VALUES (123456789,123456,12345.67,0.00012);

--정상테스트 1 : col3값 소수 이하 자리수초과
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345.6789,0.00012);

--오류 테스트 2 : col3 전체 자리수(정밀도)
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,123456.6789,0.00012);

--정상테스트 3 : col3값 소수 이하 값이 없을 때
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345,0.00012);

--오류 : col3 필드 정수부분 자리수초과
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,123456,0.00012);

-- col4 NUMBER (2,5)	-- 소수점이라 5자리,유호숫자 최대 2자리
-- 정상 테스트4
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12356,0.00002);


--1)
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12346,0.0002);
--2_
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12346,0.000126);
--3)
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345,0.0012); -- 0.00120 앞에 00은 유효한 0, 맨 마지막 0은 불필요
--4)
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345,0);

-- 조회
SELECT * FROM TBL_NUMBER ;

-- 위의 4가지 예시 결론 : number(2,5)에서 정밀도 < 소수점이하 자리수
--  			2-5 =3 소수점 이하 유효숫자 0이 3개 이상이어야합니다


