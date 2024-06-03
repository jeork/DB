-- 주석!

-- 한 줄 이지만, 가독성 때문에 줄을 바꿔 놓은 상태
-- 여러 줄을 실행하고 싶다면 : 그 줄들을 다 드래그해서 
-- =>alt + x
create table person(
	p_name varchar2(10 char),
	p_age number(3),
	p_gender varchar2(2 char)
);
--한 줄 실행 : 커서를 그 줄에 놓고 alt + s
insert into person values('홍길동',10,'남');
insert into person values('홍길동',10,'남');
insert into person values('김길동',20,'여');
insert into person values('최길동',30,'남');

select * from person;
select distinct * from person;
-- 테이블 지우기
drop table person cascade constraint purge;
--ex) 컬럼명 중복 오류!
create table test(
	t_number(3);
	t_o varchar2(10 char)
);

