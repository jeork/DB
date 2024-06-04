--'해' 가 들어가는 회사에서 만든 과자의 이름을 조회
--'이' 가 들어가는 과자들의 평균가를 조회
-- 크라운 과자거나, 몽쉘 ~ 인거 이름, 제조사, 가격 조회
-- 과자의 이름이 '새콤달콤'을 포함하거나 '몽쉘'을 포함하는 과자이름,
-- 제조사, 가격

select * from JUN03_SNACK;
select s_name from JUN03_SNACK where s_maker like '%해%'
select avg(s_price) from JUN03_SNACK where s_name like '%칩%'

select s_name, s_maker, s_price 
from JUN03_SNACK 
where s_maker like '%크라운%'
or s_name like '몽쉘%';

select s_name, s_maker, s_price 
from JUN03_SNACK 
where s_name like '%새콤달콤%' 
or s_name like '%몽쉘%';

--과자의 이름이 '새콤달콤'으로 시작하거나 '이'로 끝나느 과자의 이름, 제조사, 가격

select s_name, s_maker, s_price from JUN03_SNACK
where regexp_like(s_name, '^새콤달콤|이$');


select 1 id, '수학' subject, 90 score from dual
	union
select 1 id, '수학' subject, 90 score from dual
	union
select 1 id, '수학' subject, 90 score from dual


select 1 id, '수학' subject, 90 score from dual
	union all
select 1 id, '수학' subject, 90 score from dual
	union all
select 1 id, '수학' subject, 90 score from dual	
-----------------------------------------------
select 1 id, '수학' subject, 90 score from dual
	union
select 2 id, '영어' subject, 80 score from dual
	intersect
select 1 id, '수학' subject, 90 score from dual
------------------------------------------------
select 1 id, '수학' subject, 90 score from dual
	minus
select 2 id, '영어' subject, 80 score from dual
	minus
select 1 id, '수학' subject, 90 score from dual;

-- 과자 데이터 중에서 회사가 크라운이고 가격이 1000원 이하이거나 3000원이상인
-- 과자의 전체 정보를 조회

select * from jun03_snack
	where s_maker = '크라운' and (s_price <=1000 or s_price >= 3000)
	
-- 과자들의 최고가, 최소가, 평균가 출력
select s_maker, MAX(s_price),MIN(s_price),AVG(s_price) 
	from jun03_snack
	group by s_maker;

-- 회사이름, 회사별 과자 총 가격 합계와 모든 과자들의 가격 합계
select s_maker, SUM(s_price) 
	from jun03_snack 
	group by rollup(s_maker);
	
--s_maker 가 null 이면 '전체' 그게 아니면 s_maker	
select NVL(s_maker,'전체') , SUM(s_price) 
	from jun03_snack 
	group by rollup(s_maker);

--decode	
select DECODE(s_maker,null,'전체',s_maker) , SUM(s_price) 
	from jun03_snack 
	group by rollup(s_maker);
	
--회사별 과자 평균 가격이 2000원 이상인 회사의 이름과 평균 가격을 조회
select s_maker, avg(s_price) 
	from jun03_snack 
	group by s_maker
	having avg(s_price) >= 2000
	
--order by
-- 롯데 또는 해태 회사의 과자 평균 가격이 1800원 이상일 때
-- 각 회사의 평균 가격 내림차순 정렬

select s_maker, avg(s_price)
	from jun03_snack
	where s_maker in ('롯데', '해태')
	group by s_maker
	having avg(s_price) >= 1800
	order by avg(s_price) DESC

	