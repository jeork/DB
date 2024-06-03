--옵션 : 필요하면 넣는것
--[] : 대괄호는 넣는거 아님
create table 테이블명(
	컬럼명 자료형 [옵션],
	컬럼명 자료형
	...
);

create table test(
 	t_name varchar(2)
);

create table test2(
 	t_name varchar2(5char)
);
--문자형의 값을 넣을 때는 작은 따옴표 사용
insert into test values('가나다');
insert into test2 values('가나다');

select * from test;
select * from test2;

drop table test cascade constraint purge;
drop table test2 cascade constraint purge;

-------------------------

create table testNum(
	t_num number(5),
	t_flo float(5)
);
insert into testNum values (12345, 12345);
select * from testNum;

