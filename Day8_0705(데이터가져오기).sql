-- 데이터 가져오기
-- 			제공되는 csv 형식의 파일을 테이블로 변환할 수 있는 기능
-- 			CSV 파일은 데이터 항목을 , 구분하여 저장한 텍스트 파일입니다.(엑셀 또는 메모장에서 열기 가능)
-- 			주의사항 : 자동으로 생성되는 테이블 컬럼의 크기가 데이터보다 작지 않게 또는 적정한 타입으로 설정해야함.

-- 	ANIMAL_INS  테이블 행이 80187개 정도되면 SQL쿼리의 실행속도 차이를 확인할 수 있습니다
-- 			예를들면 서브쿼리와 조인의 sql 실행시간 비교 가능합니다.
SELECT * FROM ANIMAL_INS ai 
ORDER BY ANIMAL_ID;

-- 데이터 내보내기(export)
-- 		현재 데이터베이스의 테이블 구조와 행(값)들을 파일로 내보내기 합니다
-- 		DDL 테이블,시퀀스 생성 명령문과 INSERT 명령들을 만들어서 .sql 파일 만듭니다.
SELECT * FROM TBL_BUY tb ;
-- commit과 rollback 테스트
-- 회원의 구매내역 삭제
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID = 'twice';
DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='sana97';

INSERT INTO TBL_BUY tb values('wonder','IPAD011',1,test_seq1.nextval);
INSERT INTO tbl_buy(custom_id,pcode,quantity,BUYNO)
VALUES ('wonder','IPAD011',1,test_seq1.nextval);
INSERT INTO tbl_buy(custom_id,pcode,quantity,BUYNO)
VALUES ('twice','GALAXY22',1,test_seq1.nextval);
INSERT INTO tbl_buy(custom_id,pcode,quantity,BUYNO)
VALUES ('mina012','DOWON123a',1,test_seq1.nextval);