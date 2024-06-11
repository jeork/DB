-- 어떤 특정한 식당에 대한 테이블
-- 식당 지점(체인점 지역), 식당 주인(이름), 좌석 수
-- 데이터 2~3개 정도 넣기
----------------------------------------------
-- 예약 테이블
-- 예약자 이름, 예약시간, 예약자 전화번호, 예약 지점
-- 데이터 2~3개 정도 넣기
----------------------------------------------

create table jun10_restaurant(
    r_no number(3) primary key,
	r_location varchar2(10 char) not null,
	r_owner varchar2(10 char) not null,
	r_seat number(4) not null
)
create sequence jun10_restaurant_seq;


create table jun10_reservation(
	v_no number(3) primary key,
	v_name varchar2(3 char) not null,
	v_time date not null,
	v_phone varchar2(11 char) not null,
	v_location varchar2(10 char) not null
)
create sequence jun10_reservation_seq;


insert into jun10_restaurant values (jun10_restaurant_seq.nextval,'강남','홍길동',80)
insert into jun10_restaurant values (jun10_restaurant_seq.nextval,'홍대','김길동',150)
insert into jun10_restaurant values (jun10_restaurant_seq.nextval,'명동','오길동',100)

insert into jun10_reservation values(jun10_reservation_seq.nextval,'김민수',to_date('2024-06-11 17:00','YYYY-MM-DD HH24:MI') , '01012345678', '강남')
insert into jun10_reservation values(jun10_reservation_seq.nextval,'이민수',to_date('2024-06-15 20:00','YYYY-MM-DD HH24:MI') , '01087654321', '홍대')
insert into jun10_reservation values(jun10_reservation_seq.nextval,'박민수',to_date('2024-06-20 18:00','YYYY-MM-DD HH24:MI') , '01012348765', '명동')


select * from jun10_reservation
select * from jun10_restaurant

select * from jun10_reservation order by v_no
select * from jun10_restaurant order by r_location
