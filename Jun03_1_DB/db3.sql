--웹사이트에서 게시판에 대한 테이블과
-- 이를 [참조]하는 댓글 테이블을 만드려고 함
-- 게시판 테이블에는 [작성자/게시판 글 내용/ 작성시간]에 대한 부분이 있었으면 
-- 댓글 테이블에는 [작성자/댓글 내용/ 작성시간]에 대한 부분이 있었으면 

--1. 테이블의 구조를 파악해서 게시판 테이블 만들기
--2. 테이블의 구조를 파악해서 댓글 테이블 만들기
-- [조건 : 참조 되는 테이블의 내용이 삭제되면 관련있는 댓글내용도 삭제]
--3. 게시판 테이블에 값 2개 넣고 / 각 게시글마다 댓글 2개씩 넣기
-- [조건 : 날짜 관련한 값은 현재 날짜/시간으로 통일]
--4. 게시글 1번을 지웠을 때 관련댓글들도 지워지는지 확인

create table board(
	b_no number(4) primary key,
	b_writer varchar2(10char) not null,
	b_post varchar2(100char) not null,
	b_time date not null
);

create table comment(
	c_no number(4) primary key,
	c_b_no number(4) not null,
	c_writer varchar2(10char) not null,
	c_post varchar2(100char) not null,
	c_time date not null
	constraint fk_comment foreign key(c_b_no)
		references board(b_no)
		on delete cascade
);
create sequence board_seq;

insert into board values (board_seq.nextval, 'ojr', 'hi',sysdate);
insert into board values (board_seq.nextval, 'oj', '안녕하세여',sysdate);

insert into comment values(comment.nextval, 'oo','안녕',sysdate)

select * from board

delete from board where b_no=1;

drop table board cascade constraint purge;
drop sequence board_seq;
