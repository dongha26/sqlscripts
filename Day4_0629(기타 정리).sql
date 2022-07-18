-- DDL : create alter drop TRUNCATE 
-- (대상은 user,table,sequence,view, truncate는 테이블만 사용)
-- DML : insert update delete 

DROP TABLE SCORES0; -- 오류 : student0 테이블 먼저 삭제하면
					-- 원인 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
DROP TABLE STUDENTS0;

-- UPDATE 테이블명 SET 컬럼명 = 값,컬럼명 = 값,컬럼명 = 값,.... WHERE 조건컬럼 관게식
-- delete from 테이블명 where 조건컬럼 관계식
-- 주의할점 : update와 delete는 where 없이 사용하는 것은 위험함 동작.1
--				TRUNCATE는 실행을 취소(rollback)할 수 없기 때문에 DDL에 속합니다
SELECT * FROM STUDENTS0 s ;
-- UPDATE ,DELETE , SELECT 에서 WHERE의 컬럼이 기본키 컬럼으로 동등조건이면
-- 실행되는 몇개일까요
-- 기본키의 목적은 테이블의 여러 행들을 구분(식별)목적
UPDATE STUDENTS0  SET AGE = 17 WHERE STUNO = 2021001;

-- rollback,commit 테스트 (데이터베이스 메뉴에서 트랜잭션 모드를 manual로 변경합니다)
-- 순서대로 실행하세요.
UPDATE STUDENTS0  SET ADDRESS = '성북구' ,age  = 16 WHERE STUNO = 2021001;
ROLLBACK;   -- 위의 업데이트 실행을 취소
SELECT * FROM STUDENTS0 s2 ;
UPDATE STUDENTS0  SET ADDRESS = '성북구' ,age  = 16 WHERE STUNO = 2021001;
COMMIT;
SELECT * FROM STUDENTS0 s2 ;  -- 이미 commit된 명령어는 ROLLBACK 못함.
 
--------------------------------------------------여기까지
-- 트랜잭션 관리명령 : ROLLBACK , COMMIT
DELETE FROM SCORES0 s ;
ROLLBACK;
DELETE FROM SCORES0 s  WHERE STUNO = 2019019; 
SELECT * FROM SCORES0 s ;
-- 이 편집기는 트랜잭션 수동모드이고 같은 창에서는 SELECT 결과가 2019019가 없습니다.
-- 다른 편집기는 다른 클라이언트이므로 이전 상태(최종 커밋한 상태)로 보여집니다.
ROLLBACK;
SELECT * FROM STUDENTS0 s2 ;
---------------------------여기까지 두번쨰 예시
TRUNCATE TABLE SCORES0 ; --모든 데이터를 지웁니다 . ROLLBACK 여부
ROLLBACK;				 --ROLLBACK 불가
-- 모든 데이터를 지울것이 확실하면 다른것들과 섞여서 롤백되지 않게 확실하게 TRUNCATE 
--------------------------------------------------
/*
 * INSERT
 * DELETE
 * COMMIT;
 * UPDATE
 * 
 * 
 * 
 * 
 * 
 * 
