-- 가격이 3000원인 과자의 모든 정보 조회

-- 모든 과자 이름, 가격 조회
-- 모든 과자이름(가격),가격,조회	(ex : 콘칩(2000원))

select * from jun03_snack;

select s_name,s_price from JUN03_SNACK;ㄴ

select s_name||'('||s_price||'원)' "이름(가격)"from JUN03_SNACK;

--2000원 이하의 과자 중 최소가격은 얼마인지
select MIN(s_price) from JUN03_SNACK where s_price<2000;
-- 모든 과자의 평균가
select round(avg(s_price),1) from JUN03_SNACK ;
-- 과자의 이름과 가격의 30% 할인된 금액
select s_name,s_price*0.7 from JUN03_SNACK
-- 3500인 과자의 갯수는 몇개?

select s_name,s_price from JUN03_SNACK where s_price= 3500
-- 3000원이하인 과자의 이름, 회사이름
select s_name,s_maker,s_price from JUN03_SNACK where s_price<= 3000
-- 모든 과자이름, 가격, 유통기한 조회
select s_name,s_price,s_exp from JUN03_SNACK;
-- 모든 과자 이름 ,가격, 부가세 조회(가격의 10%)
select s_name,s_price,s_price*0.1 from JUN03_SNACK;
-- 모든 과자 이름 ,가격, 판매가 조회(20% 할인)
select s_name,s_price,s_price*0.8 from JUN03_SNACK;
-- 3000원보다 큰 금액의 과자들의 평균가 조회
select avg(s_price) from JUN03_SNACK where s_price >= 3000
-- 최고가, 최저가, 총 과자 종류 몇가지인지 조회
select min(s_price),max(s_price),count(s_name) from JUN03_SNACK;
-- 3000원 이상인 과자의 전체 정보 조회
select * from JUN03_SNACK where s_price >=3000; 
-- 3000원 미만인 과자의 이름, 가격, 판매가 조회(20%할인)
select s_name,s_price,s_price * 0.8 from JUN03_SNACK where s_price <3000;
-- 허니버터칩의 가격 조회
select s_price from JUN03_SNACK where s_name ="허니버터칩"; 
-- 크라운 회사의 과자 가격의 총합 조회
select s_price from JUN03_SNACK where s_maker ="크라운"; 

-- 6월 안으로 먹어야 하는 과자 이름, 가격,유통기한 조회
select s_name,s_price,s_exp from JUN03_SNACK
	 where s_exp < to_date ('2024-07-01 00:00:00:', 'YYYY-MM-DD- HH24:MI:SS');