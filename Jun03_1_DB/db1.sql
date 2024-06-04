create table jun03_snack(
	s_no number(4) primary key,
	s_name varchar2(10 char) not null,
	s_maker varchar2(10 char) not null,
	s_price number(4) not null,
	s_exp date not null
);

insert into jun03_snack(s_no, s_name, s_maker, s_price)
	values(1, '초코파이', '오리온', 5000);
	
insert into jun03_snack(s_name, s_price, s_no, s_maker)
	values('새콤달콤', 500, 2, '롯데');
	
--컬럼에 값 안넣기 - 에러!, NOT NULL 때문에
insert into jun03_snack(s_name,s_no)
	values('마이쮸',3);
	
--(컬럼명, 컬럼명, ...) 안넣고 테이블 생성당시의 컬럼명 순서대로
--넣는 방법도 있음
insert into jun03_snack values(4,'엄마손파이','롯데','4000');

drop table jun03_snack cascade constraint purge;

insert into jun03_snack values(1,'오예스','롯데','4500');
insert into jun03_snack values(2,'초코송이','롯데','2500');
insert into jun03_snack values(3,'새콤달콤','롯데','500');
insert into jun03_snack values(4,'초코칩쿠키','롯데','2500');
insert into jun03_snack values(5,'칙촉','롯데','3500');

select * from jun03_snack;

--sequence (table 과는 무관) 생성
--간단한 시퀀스
--테이블 명 뒤에 _seq를 붙여주는 문화가 있음
create sequence jun03_snack_seq;
--구체적인 시퀀스
create sequence 시퀀스명
	increment by 1	-- 증가값(1씩 증가)
	start with 1	-- 시작값
	minvalue 1		-- 최소값
	maxvalue 999	-- 최대값
	nocycle / cycle	-- 최대값에 도달하면 시작값부터 다시 반복할지 말지
	nocache / cache	-- 시퀀스를 미리 만들어놓고 메모리에서 가져다 쓸지말지
	noorder / order;-- 요청 순서대로 값을 생성할지 말지

-- sequence 삭제
drop sequence jun03_snack_seq;

-- sequnce 사용 : 시퀀스명.nextval
jun03_snack_seq.nextval
	
insert into jun03_snack values(jun03_snack_seq.nextval,'오예스','롯데','4500','5월 10일');
insert into jun03_snack values(jun03_snack_seq.nextval,'초코송이','롯데','2500','6월10일');
insert into jun03_snack values(jun03_snack_seq.nextval,'새콤달콤','롯데','500','9월 30일');
insert into jun03_snack values(jun03_snack_seq.nextval,'초코칩쿠키','롯데','2500','3월 1일');
insert into jun03_snack values(jun03_snack_seq.nextval,'칙촉','롯데','3500','1월3일');
	
--테이블 다시 만들 때 속성 추가
--(유통기한 date)
select sysdate from dual;
insert into jun03_snack values(jun03_snack_seq. nextval,
'새콤달콤 딸기맛', '크라운', 500,sysdate);

--특정 시간/날짜
--	내장함수 - to_date('값, '패턴')
--	패턴(대문자)YYYY,MM,DD,AM/PM,HH(12시간),HH24(24추천),MI(분),SS(초)

insert into jun03_snack values(jun03_snack_seq.nextval,
'새콤달콤 포도맛','크라운',500,to_date('2024-06-07 14', 'YYYY-MM-DD HH24'));
insert into jun03_snack values(jun03_snack_seq.nextval,
'콘칩','크라운',2500,to_date('2024-06-21 18', 'YYYY-MM-DD HH24'));
insert into jun03_snack values(jun03_snack_seq.nextval,
'쿠크다스','크라운',3500,to_date('2024-07-07 14', 'YYYY-MM-DD HH24'));
insert into jun03_snack values(jun03_snack_seq.nextval,
'허니버터칩','해태',2500,to_date('2024-09-07 10', 'YYYY-MM-DD HH24'));
insert into jun03_snack values(jun03_snack_seq.nextval,
'홈런볼','해태',3000,to_date('2024-10-07 14', 'YYYY-MM-DD HH24'));
insert into jun03_snack values(jun03_snack_seq.nextval,
'칸초','롯데',1500,to_date('2024-11-07 12', 'YYYY-MM-DD HH24'));
insert into jun03_snack values(jun03_snack_seq.nextval,
'빈츠','롯데',4000,to_date('2024-06-06 14', 'YYYY-MM-DD HH24'));
insert into jun03_snack values(jun03_snack_seq.nextval,
'칸차','롯데',1500,to_date('2024-06-07 14', 'YYYY-MM-DD HH24'));
insert into jun03_snack values(jun03_snack_seq.nextval,
'몽쉘','롯데',4500,to_date('2024-06-07 14', 'YYYY-MM-DD HH24'));

select * from jun03_snack

select [distinct] [컬럼명], [컬럼명 as 별칭 || 컬럼명 별칭], [연산자], [통계함수]
	from [테이블명]
	where [조건식]
	group by [그룹대상]
	having [함수 포함 조건]
	order by[정렬대상 asc/desc(오름차순 / 내림차순)]
--의 형태
--과자테이블 전체 조회
select * from jun03_snack;
-- '*': 테이블 내의 모든 컬럼을 가져온다

select s_maker from jun03_snack;
select distinct s_maker from jun03_snack;

select s_price / 100 from jun03_snack;
select s_price / 100 as s_price from jun03_snack;
select s_price / 100 s_price from jun03_snack;

-- 13
select 1 + '3' from dual
-- 4가 나옴
select 1 || 'a' from dual;