-- 1. 음료 테이블과 카페 테이블을 만들기
-- 음료테이블 : 음료 이름 / 가격 / 판매하는 카페의 이름
-- 카페테이블 : 카페 이름 / 지역 / 좌석 수
-- [조건] 참조관계 고려 X, 각 테이블에서 음료 이름, 카페 이름은 고유한 값을 갖는다

-- 2. 조건에 맞는 테이블을 생성 + 데이터 넣기
-- A 카페는 서울에 위치하고, 좌석 100석,
-- (아메리카노, 2000원), (라떼, 3000원), (녹차, 2500원)을 판매
-- B 카페는 제주에 위치하고, 좌석 80석,
-- (홍차, 2500원), (스무디, 3000원), (에스프레소, 4000원)을 판매


create table beverage(
	b_name varchar2(10 char) primary key,
	b_price number(5) not null,
	b_cafename varchar2 (10 char) not null
);

create table cafe(
	c_name varchar2(10 char) primary key,
	c_address varchar2(10 char) not null,
	c_seat number(3) not null
);

insert into cafe values('A', '서울',100);
insert into cafe values('B', '제주',80);

insert into beverage values('아메리카노', 2000,'A');
insert into beverage values('라떼', 3000,'A');
insert into beverage values('녹차', 2500,'A');
--
insert into beverage values('홍차', 2500,'B');
insert into beverage values('스무디', 3000,'B');
insert into beverage values('에스프레소', 4000,'B');


select * from cafe
select * from beverage

-- 3. 쿼리문 작성
-- 전체 음료 기준 평균가보다 비싼 음료는 몇 종류?
select b_name 
	from beverage	
	where b_price>(
		select avg(b_price)
		from beverage
	);

-- 제일 싼 음료를 파는 카페의 이름은?
select c_name 
	from cafe
	where c_name in(
		select b_cafename
		from beverage
		where b_price =(
			select min(b_price)
			from beverage
		)
	);
-- 서울에 있는 카페에서 만드는 음료의 평균가?
select avg(b_price)
	from beverage
	where b_cafename in(
		select c_name
		from cafe
		where c_address in '서울'
	);
	
-- 좌석이 90석 이상인 카페에서 파는 음료의 이름?
select b_name
	from beverage
	where b_cafename in(
		select c_name
		from cafe
		where c_seat >= 90
	);
-- 전체 음료 기준 평균가 이하인 음료의 이름?
select b_name
	from beverage
	where b_price <=(
		select avg(b_price)
		from beverage
	);
-- 가장 비싼 음료를 파는 카페는 어디에 있는지?
select c_address
	from cafe
	where c_name in(
		select b_cafename
		from beverage
		where b_price in(
			select max(b_price)
			from beverage
		)
	);

	