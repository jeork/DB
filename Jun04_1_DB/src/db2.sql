select s_name, s_price
	from JUN03_SNACK
	where s_price<
	    (
		select avg(s_price)
		from JUN03_SNACK
);
--평균가 보다 가격이 낮은 과자의 이름과 가격 정보를 조회한것
-- 부분으로 나눠서 구성해보면 조금 더 가독성이 좋아지고
-- 메인쿼리의 where절에서 서브쿼리의 결과가 비교할 때에는 비교연산자를 사용
	
select * from JUN03_SNACK

-- 과자들 중 최고가?
select max(s_price) from JUN03_SNACK;

-- 제일 비싼 과자 이름, 제조사, 가격
select s_name,s_maker,s_price
	from jun03_snack
	where s_price =
		(
		select max(s_price)
		from JUN03_SNACK
		);
		
-- 제일 싼과자는 어디에서 만드나요?	    
select s_maker
	from JUN03_SNACK
	where s_price =
		(
		select min(s_price)
		from JUN03_SNACK
		);
		
-- 평균가보다 비싼 과자는 몇 종류?
select s_name
	from JUN03_SNACK
	where s_price >
		(
		select avg(s_price)
		from JUN03_SNACK
		);
		
-- 유통기한이 가장 오래 남은 과자의 전체정보
select *
	from JUN03_SNACK
	where s_exp =	(
		select max(s_exp)
		from JUN03_SNACK
		);
		
-- 과자 회사 테이블을 만들건데, [회사 이름, 주소, 직원 수]값을 가지게
-- 과자 테이블에 맞춰서 데이터 넣기!
	
create table jun04_maker(
	m_name varchar2(10 char) primary key,
	m_address varchar2 (10 char) not null,
	m_employee number(3) not null
);		
drop table jun04_snack cascade constraint purge;

create sequence jun04_snack_seq;
drop sequence jun04_snack_seq;

		
insert into jun04_maker values('크라운', '부천', 70);
insert into jun04_maker values('해태', '광주', 150);
insert into jun04_maker values('롯데', '부산', 50);

select * from jun04_maker;

--직원 수 제일 적은 회사에서 만드는 과자 이름, 가격
select s_name,s_price from JUN03_SNACK
	where s_maker=(
		select m_name 
		from JUN04_MAKER
		where m_employee = (
			select min(m_employee)
			from JUN04_MAKER
		)
	
	);


-- 제일 비싼 과자를 만든 회사는 어디에 있는지
select m_address from jun04_maker
	where m_name =(
		select s_maker
		from jun03_snack
		where s_price=(
			select max(s_price)
			from JUN03_SNACK
		)
	);

-- 광주에 있는 회사에서 만드는 과자의 평균가
select avg(s_price) 
	from JUN03_SNACK
	where s_maker in (
		select m_name
		from jun04_maker
		where m_address in (
			select m_address
			from jun04_maker
			where m_address = '광주'
		)
	);
	
-- 평균가 이상의 과자를 만드는 회사의 이름, 위치
select m_name, m_address 
from jun04_maker
	where m_name in(
		select s_maker
		from JUN03_SNACK
		where s_price >=(
			select avg(s_price)
			from jun03_snack
		)
	);

	
	
	
	
	
	