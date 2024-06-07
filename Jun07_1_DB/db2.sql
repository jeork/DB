-- 배추, 3000g, 10000원, 홈플러스, 종로점, 1000평, 주차장 500석
-- 무, 500g, 5000원, 홈플러스, 강남점, 500평, 주차장 300석
-- 배추, 2000g, 5000원, 이마트, 서초점, 800평, 주차장 800석

create table jun07_market(
	m_no number(3) primary key,
	m_name varchar2(10 char)not null,
	m_location varchar2 (10 char)not null,
	m_land number(4) not null,
	m_parking number(4) not null
);
create sequence jun07_market_seq;
	
create table jun07_product(
	p_no number(3) primary key,
	p_name varchar2(10char) not null,
	p_weight number(4) not null,
	p_price number(5) not null,
	p_m_no number(2),
	constraint fk_jun07_product foreign key (p_m_no)
	references jun07_market(m_no)
	on delete cascade
);
create sequence jun07_product_seq;
insert into jun07_product values (jun07_product_seq.nextval, '배추', 3000, 10000, 1);
insert into jun07_product values (jun07_product_seq.nextval, '무', 500, 5000, 2);
insert into jun07_product values (jun07_product_seq.nextval, '배추', 2000, 05000, 3);
select * from jun07_product;

insert into jun07_market values(jun07_market_seq.nextval, '홈플러스','종로',1000,500);
insert into jun07_market values(jun07_market_seq.nextval, '홈플러스','강남',5000,300);
insert into jun07_market values(jun07_market_seq.nextval, '이마트','서초',800,800);
select * from jun07_market;

--무를 공짜로
--모든 배추를 김장용특대배추로 이름 수정
--모든 마트의 주차장 30% 줄이기
--홈플러스 종로점의 상품 가격10% 할인
--제일 비싼 상품 10%할인
update jun07_market 
set p_price = 0
where p_name = '무';

update jun07_product
set p_name = '김장용특대배추')
where p_name = '배추';

update jun07_market
set m_parking = m_parking* 0.7;
select * from jun07_market

update jun07_product
set p_price = p_price + 0.9
where p_m_no=(
select * from jun07_market 
where m_name = '홈플러스' and m_location = '종로'
)

update jun07_product
set p_price = p_price*0.9
where p_price = (
	select max(p_price)
	from jun07_product
);
-- 무 삭제
delete from jun07_product
where p_name = '무'
-- 가장 좁은 매장의 상품 다 삭제
delete from jun07_product
where p_m_no(
	select m_no
	from jun07_market
	where m_land = (
		select min(m_land)
		from jun07_market
	)
)

select * from jun07_product

select * from jun07_market

update jun07_product
set p_price = p_price * 0.8
where p_m_no in(
	select m_no
	from jun07_market
	where m_name like '%마트%'
)
--

