drop table tbl_member cascade constraints;
drop table tbl_notice_type cascade constraints;
drop table tbl_notice cascade constraints;
drop table tbl_notice_file cascade constraints;
drop table tbl_notice_comment cascade constraints;

drop sequence seq_member;
drop sequence seq_notice;
drop sequence seq_notice_file;
drop sequence seq_notice_comment;

create table tbl_member (
   member_no    varchar2(10) primary key,
   member_id    varchar2(20) unique not null,
   member_pw    varchar2(30) not null,
   member_name  varchar2(30) not null,
   member_email varchar2(200) not null,
   member_phone char(13) not null,
   member_addr  varchar2(200) not null,
   member_level number not null, -- 3 : 준회원 (로그인 못하게)
   enroll_date  date not null
);

comment on table tbl_member is '회원정보';
comment on column tbl_member.member_no is '회원번호';
comment on column tbl_member.member_id is '회원아이디';
comment on column tbl_member.member_pw is '회원비밀번호';
comment on column tbl_member.member_name is '회원이름';
comment on column tbl_member.member_email is '이메일';
comment on column tbl_member.member_phone is '전화번호';
comment on column tbl_member.member_addr is '주소';
comment on column tbl_member.member_level is '1:관리자, 2: 정회원, 3: 준회원';
comment on column tbl_member.enroll_date is '가입일';

create sequence seq_member maxvalue 9999 cycle;

-- 비밀번호 암호화 이후에는 insert 문으로 만들 계정은 로그인 할 수 없음
-- insert into tbl_member values ( to_char( sysdate, 'YYMMDD') || lpad( seq_member.nextval, 4, '0'), 'admin999', 'admin999!', '관리자', 'admin@naver.com', '010-1234-1234', '서울 강남구', 1, sysdate );
-- insert into tbl_member values ( to_char( sysdate, 'YYMMDD') || lpad( sqq_member.nextval, 4, '0'), 'daniel999', 'daniel999@', '김찬희', 'blackeagle10@icloud.com', '010-8645-5542', '경기도 용인시', 2, sysdate );
insert into tbl_member values ( to_char( sysdate, 'YYMMDD') || lpad( seq_member.nextval, 4, '0'), 'user01', 'user1234!@#$', '유저1', 'user1@naver.com', '010-1234-1234', '서울 강남구', 3, sysdate );
insert into tbl_member values ( to_char( sysdate, 'YYMMDD') || lpad( seq_member.nextval, 4, '0'), 'user02', 'user2234!@#$', '유저2', 'user2@naver.com', '010-1234-1234', '서울 강남구', 3, sysdate );
insert into tbl_member values ( to_char( sysdate, 'YYMMDD') || lpad( seq_member.nextval, 4, '0'), 'user03', 'user3234!@#$', '유저3', 'user3@naver.com', '010-1234-1234', '서울 강남구', 3, sysdate );
insert into tbl_member values ( to_char( sysdate, 'YYMMDD') || lpad( seq_member.nextval, 4, '0'), 'user04', 'user4234!@#$', '유저4', 'user4@naver.com', '010-1234-1234', '서울 강남구', 2, sysdate );
insert into tbl_member values ( to_char( sysdate, 'YYMMDD') || lpad( seq_member.nextval, 4, '0'), 'user05', 'user5234!@#$', '유저5', 'user5@naver.com', '010-1234-1234', '서울 강남구', 3, sysdate );


create table tbl_notice_type (
   notice_cd    number primary key, -- 메뉴 코드
   notice_cd_nm varchar2(30) unique not null, -- 메뉴 이름
   use_yn       char(1) default 'N' check ( use_yn in ( 'Y', 'N' ) ) -- 메뉴 사용 여부
);

insert into tbl_notice_type ( notice_cd, notice_cd_nm) values ( 1, '공지사항' );
insert into tbl_notice_type ( notice_cd, notice_cd_nm) values ( 2, '자유게시판' );
insert into tbl_notice_type ( notice_cd, notice_cd_nm) values ( 3, '질문게시판' );
insert into tbl_notice_type ( notice_cd, notice_cd_nm) values ( 4, 'FAQ' );
insert into tbl_notice_type ( notice_cd, notice_cd_nm) values ( 5, '1:1 문의' );

update tbl_notice_type set use_yn = 'Y';

create table tbl_notice (
   notice_no      varchar2(10) primary key,
   notice_cd      number references tbl_notice_type ( notice_cd ) not null, -- 게스글 종류 코드
   notice_title   varchar2(200) not null,
   notice_content varchar2(4000) not null,
   notice_writer  varchar2(10) references tbl_member ( member_id ) not null,
   notice_date    date not null,
   read_count     number default 0
);

create sequence seq_notice maxvalue 9999 cycle;

create table tbl_notice_file (
   file_no   varchar2(10) primary key,
   notice_no varchar2(10) references tbl_notice ( notice_no ) on delete cascade,
   file_name varchar2(300), -- 사용자가 업로드한 파일 명칭
   file_path varchar2(300) -- 서버에 중복된 파일명이 존재할때 각 파일을 구분하기 위한 관리용 파일명
);

create sequence seq_notice_file maxvalue 9999 cycle;

create table tbl_notice_comment (
   comment_no      varchar2(10) primary key,
   comment_writer  varchar2(20) references tbl_member ( member_id ) on delete cascade,
   comment_content varchar2(1000) not null,
   comment_date    date default sysdate not null,
   comment_ref     varchar2(10) references tbl_notice ( notice_no ) on delete cascade
);

create sequence seq_notice_comment maxvalue 9999 cycle;

insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '1', '공지사항 1', '공지사항내용1', 'user01', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '1', '공지사항 2', '공지사항내용2', 'user02', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '1', '공지사항 3', '공지사항내용3', 'user03', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '1', '공지사항 4', '공지사항내용4', 'user04', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '1', '공지사항 5', '공지사항내용5', 'user05', sysdate, default );

insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '2', '자유게시판 1', '자유게시판내용1', 'user01', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '2', '자유게시판 2', '자유게시판내용2', 'user02', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '2', '자유게시판 3', '자유게시판내용3', 'user03', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '2', '자유게시판 4', '자유게시판내용4', 'user04', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '2', '자유게시판 5', '자유게시판내용5', 'user05', sysdate, default );

insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '3', '질문게시판 1', '질문게시판내용1', 'user01', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '3', '질문게시판 2', '질문게시판내용2', 'user02', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '3', '질문게시판 3', '질문게시판내용3', 'user03', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '3', '질문게시판 4', '질문게시판내용4', 'user04', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '3', '질문게시판 5', '질문게시판내용5', 'user05', sysdate, default );

insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '4', 'FAQ1', 'FAQ 내용 1', 'user01', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '4', 'FAQ3', 'FAQ 내용 3', 'user02', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '4', 'FAQ3', 'FAQ 내용 3', 'user03', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '4', 'FAQ4', 'FAQ 내용 4', 'user04', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '4', 'FAQ5', 'FAQ 내용 5', 'user05', sysdate, default );

insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '5', '1:1문의1', '1:1 문의내용 1', 'user01', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '5', '1:1문의2', '1:1 문의내용 2', 'user02', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '5', '1:1문의3', '1:1 문의내용 3', 'user03', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '5', '1:1문의4', '1:1 문의내용 4', 'user04', sysdate, default );
insert into tbl_notice values ( to_char( sysdate, 'YYMMDD') || lpad( seq_notice.nextval, 4, '0'), '5', '1:1문의5', '1:1 문의내용 5', 'user05', sysdate, default );

-- 비밀번호 함호화 하면 60글자를 고정적으로 반환하기 때문에 자료형 크기를 늘려줌
alter table tbl_member modify member_pw char(60);
alter table tbl_notice modify notice_writer varchar2(30);

commit;

update tbl_member set member_level = 1 where member_id = 'admin999';
