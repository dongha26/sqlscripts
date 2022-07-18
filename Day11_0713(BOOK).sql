ALTER TABLE TBL_BUY DROP CONSTRAINT FK_CUSTOM_ID;
ALTER TABLE TBL_BUY add CONSTRAINT FK_CUSTOM_ID
FOREIGN KEY (custom_id) REFERENCES tbl_custom(custom_id) ON DELETE CASCADE;


create table tbl_book(
 bcode char(5) primary key,
 title varchar2(30) not null,
 writer varchar2(20),
 publisher varchar2(20),
 pdate date);


create table book_member(
  mem_idx number(5,0) primary key,
  name varchar2(20) not null,
  email varchar(20) not null unique,
  tel varchar(20) unique,
  password varchar(20));


create table tbl_bookrent(
  rent_no number(5,0) PRIMARY key,
  mem_idx number(5,0) not null,
  bcode char(5) not null,
  rent_date date not null,
  exp_date  date not null,
  return_date date,
  delay_days number(3,0),
  FOREIGN KEY (mem_idx) REFERENCES book_member(mem_idx),
  FOREIGN KEY (bcode) REFERENCES  tbl_book(bcode));

create sequence rent_seq start with 1;

create sequence mem_seq start with 10001;

insert into book_member (mem_idx,name,email,tel,password) values (mem_seq.nextval,'이하니','honey@naver.com','010-9889-0567','1122');
insert into book_member (mem_idx,name,email,tel,password) values (mem_seq.nextval,'이세종','jong@daum.net','010-2354-6773','2345');
insert into book_member (mem_idx,name,email,tel,password) values (mem_seq.nextval,'최행운','lucky@korea.com','010-5467-8792','9876');
insert into book_member (mem_idx,name,email,tel,password) values (mem_seq.nextval,'나길동','nadong@kkk.net','010-3456-8765','3456');
insert into book_member (mem_idx,name,email,tel,password) values (mem_seq.nextval,'강감찬','haha@korea.net','010-3987-9087','1234');

insert into tbl_book (bcode,title,writer,publisher,pdate) values ('A1101','코스모스','칼세이건','사이언스북스','2006-12-01');
insert into tbl_book (bcode,title,writer,publisher,pdate) values ('B1101','해커스토익','이해커','해커스랩','2018-07-10');
insert into tbl_book (bcode,title,writer,publisher,pdate) values ('C1101','푸른사자 와나니','이현','창비','2015-06-20');
insert into tbl_book (bcode,title,writer,publisher,pdate) values ('A1102','페스트','알베르트까뮈','민옴사','2011-03-01');

insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date,delay_days) values (rent_seq.nextval,10001,'B1101','2021-09-01','2021-09-15','2021-09-14',NULL);
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date,delay_days) values (rent_seq.nextval,10002,'C1101','2021-09-12','2021-09-26','2021-09-29',3);
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date,delay_days) values (rent_seq.nextval,10003,'B1101','2021-09-03','2021-09-17','2021-09-17',NULL);
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date,delay_days) values (rent_seq.nextval,10004,'C1101','2022-06-30','2021-07-14',NULL,NULL);
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date,delay_days) values (rent_seq.nextval,10001,'A1101','2022-07-04','2021-07-18',NULL,NULL);
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date,delay_days) values (rent_seq.nextval,10003,'A1102','2022-07-06','2022-07-20','2022-07-13',NULL);

--추가하기 : 기본적인 동작은 대여날짜는 오늘, 반납기한은 오늘 날까 +14
--ALTER TABLE "C##IDEV".TBL_BOOKRENT MODIFY RENT_DATE DEFAULT sysdate;
--ALTER TABLE "C##IDEV".TBL_BOOKRENT MODIFY RENT_DATE DEFAULT sysdate;
--INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE)
--values(bookrent_seq.nextval,10002,'A1102');

-- 컬럼 디폴트 값 없애고 싶을때
ALTER TABLE "C#IDEV".TBL_BOOKRENT MODIFY RENT_DATE DATE DEFAULT NULL;

drop table tbl_bookrent;
drop table BOOK_MEMBER ;
drop TABLE TBL_BOOK;