-- 요식업 프랜차이즈 (참조관계 고려X)

-- 홍콩반점 서초점은 홍길동이 운영, 좌석은 100석
-- 홍콩반점 종로점은 김길동이 운영, 좌석은  80석
-- 한신포차 강남점은 홍길동이 운영, 좌석은 150석
-- 부천포차 부천점은 최길동이 운영, 좌석은 130석
----------------------------------------
-- 홍길동, 1990-03-01일생, 남자
-- 김길동, 1992-02-01일생, 여자
-- 홍길동, 1991-12-12일생, 여자
-- 최길동, 1989-09-01일생, 남자
----------------------------------------
-- 짜장면,  5000원, 홍콩반점 서초점(100석)
-- 불닭발, 12000원, 한신포차 강남점 (150석)
-- .. 매장당 메뉴 5개 정도 씩

-------------------------------------------------------
create table jun05_franchise(
	f_no number(3) primary key,
	f_name varchar2(10char) not null,
	f_location varchar2(10char) not null,
	f_ceo number(3) not null,
	f_seat number(3) not null
);
drop table jun05_franchise;
create sequence jun05_franchise_seq;
drop sequence jun05_franchise_seq;
-------------------------------------------------------
create table jun05_ceo(
	c_no number(3) primary key,
	c_name varchar2(10char) not null,
	c_birthday date not null,
	c_gender varchar2(2char) not null
);
drop table jun05_ceo;
create sequence jun05_ceo_seq;
drop sequence jun05_ceo_seq;
-------------------------------------------------------
create table jun05_menu(
	m_no number(2) primary key,
	m_name varchar2(10char) not null,
	m_price number(6) not null,
	m_f_no number(3) not null
);
drop table jun05_menu
create sequence jun05_menu_seq;
drop sequence jun05_menu_seq;
-------------------------------------------------------

insert into JUN05_FRANCHISE values(jun05_franchise_seq.nextval,'홍콩반점','서초점',1,100);
insert into JUN05_FRANCHISE values(jun05_franchise_seq.nextval,'홍콩반점','종로점',2,80);
insert into JUN05_FRANCHISE values(jun05_franchise_seq.nextval,'한신포차','강남점',3,150);
insert into JUN05_FRANCHISE values(jun05_franchise_seq.nextval,'부천포차','부천점',4,130);
select * from JUN05_FRANCHISE;

insert into JUN05_CEO values(jun05_ceo_seq.nextval,'홍길동', to_date('1990-03-01', 'YYYY-MM-DD'),'남자');
insert into JUN05_CEO values(jun05_ceo_seq.nextval,'김길동', to_date('1992-02-01', 'YYYY-MM-DD'),'여자');
insert into JUN05_CEO values(jun05_ceo_seq.nextval,'홍길동', to_date('1991-12-12', 'YYYY-MM-DD'),'여자');
insert into JUN05_CEO values(jun05_ceo_seq.nextval,'최길동', to_date('1989-09-01', 'YYYY-MM-DD'),'남자');
select * from JUN05_CEO;

insert into JUN05_MENU values(jun05_menu_seq.nextval,'짜장면', 5000, 1);
insert into JUN05_MENU values(jun05_menu_seq.nextval,'고추짜장', 6000, 1);
insert into JUN05_MENU values(jun05_menu_seq.nextval,'짬뽕', 6000, 1);
insert into JUN05_MENU values(jun05_menu_seq.nextval,'칭따오', 5500, 1);
insert into JUN05_MENU values(jun05_menu_seq.nextval,'탕수육', 15000, 1);

insert into JUN05_MENU values(jun05_menu_seq.nextval,'짜장면', 5000, 2)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'고추짜장', 6000, 2)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'짬뽕', 6000, 2)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'칭따오', 5500, 2)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'탕수육', 15000, 2)

insert into JUN05_MENU values(jun05_menu_seq.nextval,'불닭발', 12000, 3)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'닭똥집', 13000, 3)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'아귀튀김', 14000, 3)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'메밀전병', 15000, 3)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'오징어구이', 8000, 3)

insert into JUN05_MENU values(jun05_menu_seq.nextval,'치즈닭볶음탕', 22000, 4)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'계란찜', 5000, 4)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'제육볶음', 16000, 4)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'오징어구이', 13000, 4)
insert into JUN05_MENU values(jun05_menu_seq.nextval,'라면사리', 1000, 4)


