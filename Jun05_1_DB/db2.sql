-- 좌석 수 제일 많은 식당을 운영하는 사람의 전체 정보 조회
-- 메뉴 전체의 이름, 가격
--		가격 오름차순 => 가격이 같다면 메뉴명을 가나다 역순 정렬

-- 전체 사장님들 이름, 생일 조회
-- 프랜차이즈 식당 몇 개?
-- 프랜차이즈 메뉴 전체의 평균가

select * 
from JUN05_CEO
where c_no =(
	select f_ceo 
	from JUN05_FRANCHISE
	where f_seat =(
		select max(f_seat) 
		from JUN05_FRANCHISE
	)
);


select m_name, m_price 
from JUN05_MENU
order by m_price, m_name desc;



select c_name, c_birthday from JUN05_CEO

select count(*) from JUN05_FRANCHISE;
-------------------------------------------------------------
-- 제일 비싼 메뉴 이름, 가격
select m_name, m_price 
from JUN05_MENU
where m_price in(
	select max(m_price) 
	from JUN05_MENU
);

-- 최연장자 사장님의 이름, 생일
select c_name, c_birthday 
from JUN05_CEO
where to_char(c_birthday,'YYYY') in(
	select min(to_char(c_birthday , 'YYYY')) 
	from JUN05_CEO
);


-- 좌석 수 제일 적은 식당의 이름, 지점명, 좌석 수
select f_name, f_location, f_seat
from JUN05_FRANCHISE
where f_seat in(
	select min(f_seat) 
	from JUN05_FRANCHISE
);
-----------------------------------------------------
-- 홍콩반점 서초점을 운영하는 사람의 이름, 생일
select c_name, c_birthday 
from jun05_ceo
where c_no in(
	select f_ceo 
	from JUN05_FRANCHISE
	where f_name in('홍콩반점') and f_location in ('서초점')
);

-- '짜장'이 들어간 음식은 어디가면 먹을 수 있는지(식당 이름, 지점명)
select f_name, f_location
from JUN05_FRANCHISE
where f_no in(
	select m_f_no 
	from jun05_menu
	where m_name like'%짜장%'
);

-- 최연소 사장님네 가게 메뉴 이름, 가격
select m_name,m_price
from jun05_menu
where m_f_no in (
	select f_no 
	from jun05_franchise
	where f_ceo in(
		select c_no
		from jun05_ceo
		where c_birthday in(
			select max(c_birthday)
			from jun05_ceo
		)
	)
);

-- 최길동이 운영하는 가게의 모든 메뉴 이름, 가격, 사장님 생일
select m_name, m_price, c_birthday
from jun05_menu, c_birthday
where m_f_no in (
	select c_no
	from jun05_ceo
	where c_name = '최길동'
);

select m_name, m_price, (
	select c_birthday
	from jun05_ceo
	where c_no = (
		select f_ceo
		from JUN05_FRANCHISE
		where f_no = m_f_no
	)
) c_birthday
from jun05_menu
where m_f_no in(
	select f_no
	from jun05_franchise
	where f_ceo in (
		select c_no
		from jun05_ceo 
		where c_name = '최길동'
	)
)
--테이블 여러개를 'JOIN' 시킨다
select * from JUN05_FRANCHISE, JUN05_CEO;	

select * from JUN05_FRANCHISE, JUN05_CEO where f_ceo = c_no;

-- 전체 식당 이름, 지점명, 사장님 이름, 사장님 생일
select f_name, f_location, c_name, c_birthday
from jun05_franchise, jun05_ceo
where f_ceo = c_no;

-- 전체 메뉴명, 가격, 식당 이름, 지점명
select m_name, m_price, f_name, f_location
from jun05_menu, jun05_franchise
where m_f_no = f_no;

-- 좌석 수가 50석 이상인 식당의 메뉴명, 가격, 식당이름, 지점명, 좌석 수
select m_name, m_price, f_name, f_location, f_seat
from jun05_menu, jun05_franchise
where m_f_no = f_no and f_seat>-5
	and f_seat in (
	select max(f_seat)_
	
-- 규모가 제일 큰 식당의 메뉴명, 가격, 식당이름, 지점명, 좌석 수

select m_name, f_location, f_name, f_seat
	select f_seat
	from JUN05_FRANCHISE
	where f_seat>=50





-- 최연장자 사장님네 전체 메뉴명, 가격, 식당이름, 지점명, 사장님 이름, 생일을
-- 메뉴명 가나다순 => 식당이름 가나다순
select m_name, m_price, f_name, f_location , c_name,c_birthday
from jun05_menu , jun05_franchise, jun05_ceo
where m_f_no = f_no and f_ceo = c_no and c_birthday in(
	select min(c_birthday)
	from jun05_ceo
) 
order by m_name, f_name;

-----------------------------------------------------------------
-- 메뉴 데이터 갯수를 나눠서 페이지로 보여주고싶음
-- 메뉴 테이블에 m_no가 있음(Primary Key)
-- Sequence로 처리했음
-- sequence는 insert에 실패해도 올라감
-- 메뉴 데이터 삭제도 가능
-- m_no가 정확히 1,2,3,... 가 아님
-- 그럼 어떤 방법이 있을까
-- Rownum(가상필드)

select rownum, m_no, m_name, m_price, m_f_no from jun05_menu order by m_name;

-- 메뉴 이름을 가나다 순으로 정렬해서 menu 테이블 rownum 1 ~ 3까지 전체정보를 조회

select rownum, m_no, m_name, m_price, m_f_no 
from jun05_menu 
where rownum>=1 and rownum<=3
order by m_name;

--select rownum, m_no m_name, m_price, m_f_no
--from JUN05_MENU
--order by m_name
--where rownum >=1 and rownum <=3

select rownum, m_no, m_name, m_price
from (
	select m_no, m_name, m_price
	from jun05_menu
	order by m_name
)
where rownum >= 1 and rownum<=3;

-- rownum 2~4 까지 메뉴테이블 정보를 메뉴명 가나다 순

select *
from(
	select rownum rn, m_no, m_name, m_price
	from (
		select m_no, m_name, m_price
		from jun05_menu
		order by m_name
	)
)
where rn>=2 and rn<=4;

-- ~길동 이름을 가진 사장님네
-- 메뉴명, 가격, 식당명, 지점명, 사장님 이름
-- 가격 내림차순 => 메뉴명 가나다순 정렬 후
-- 3 ~ 8번까지 조회
select *
from(
	select rownum rn, m_name, m_price, f_name, f_location, c_name
	from(
		select m_name, m_price, f_name, f_location, c_name
		from JUN05_MENU, JUN05_FRANCHISE, JUN05_CEO
		where c_name like '%길동'
		and c_no = f_no
		and c_no = m_f_no
		and f_no = m_f_no
		order by m_price, m_name
	)
)
where rn>=3 and rn<=8

-- 김씨 성을 가진 사장님네 메뉴명,가격,사장님 이름,사장님 성별
-- 가격 오름차순 => 2 ~ 3번만 조회