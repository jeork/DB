create table tb1 (name varchar2(10 char),age number(3))
create table tb2 (name varchar2(10 char),age number(3))

insert into tb1 values ('김비버',30);
insert into tb1 values ('박비버',35);
insert into tb1 values ('최비버',40);
insert into tb1 values ('오비버',40);

insert into tb2 values ('김비버',30);
insert into tb2 values ('정비버',50);
insert into tb2 values ('이비버',55);

       
select * from tb1, tb2;
select * from tb1 cross join tb2;

select * from tb1 inner join tb2 on tb1.name = tb2.name;
select * from tb1 A, tb2 B where A.name = B.name; --EQUI 조인 (동등 조인)
select * from tb1 join tb2 using(name);
--Equi조인 JOIN ~ USING(조인대상컬럼명)
select * from tb1, natural join tb2
--자연 조인, 조건절 없이 양쪽에 같은 이름을 가진 동일한 컬럼만을 조회

select * from tb1 left outer join tb2 on tb1.name = tb2.name;
select * from tb1, tb2 where tb1.name = tb2.name(+);

select * from tb1 right outer join tb2 on tb1.name = tb2.name;
select * from tb1, tb2 where tb1.name(+) = tb2.name;

select * from tb1 full outer join tb2 on tb1.name = tb2.name;

-- 한 웹사이트에 회원이 5명이 있고, 관리자가 2명이 있다.
-- 회원의 이름은 각각 회원 1 ~ 5, 관리자의 이름은 관리자 1, 2
-- 회원의 ID는 각각 member1 ~ 5, 관리자의 ID는 manager1, 2
-- 회원 1 ~ 3은 관리자 1이 관리 / 나머지 회원은 관리자 2가 관리

create table jun07_member(
	m_id varchar2 (10 char) primary key,
	m_name varchar2 (10 char) not null,
	m_manager varchar2 (10 char)
);

insert into jun07_member values('member1', '회원1', 'manager1');
insert into jun07_member values('member2', '회원2', 'manager1');
insert into jun07_member values('member3', '회원3', 'manager1');
insert into jun07_member values('member4', '회원4', 'manager2');
insert into jun07_member values('member5', '회원5', 'manager2');
insert into jun07_member values('manager1', '관리자1', null);
insert into jun07_member values('manager2', '관리자2', null);

select * from jun07_member;

--각 관리자가 어떤 회원을 관리하는지 알고 싶음
-- 관리자ID, 관리자 이름, 회원ID
--[기준테이블 join 대상테이블 on 조건]
-- 테이블 별칭 지정
-- 동일한 테이블을 두 번 사용하기 때문에 각각 별칭 A와 B로 구분
-- A 테이블은 관리자의 정보를 나타내고, B 테이블은 회원의 정보를 나타낸다고 가정

select A.m_id, A.m_name, B.m_id
from jun07_member A join jun07_member B
on A.m_id = B.m_manager;



