-- 쓸만한 내장함수

select ABS(-5) from dual;
select ROUND(123.456 , -1) from dual;
select POWER (2,8) from dual;
select TRUNC (123.456,1) from dual;
select MOD(15,2) from dual;
select SQRT(5) from dual;

select CONCAT('안녕','하세요') from dual;
select SUBSTR('하세요',1,2) from dual;
select INSTR('안녕하세요,하세요하세요','하세요',1,3) from dual;
select LPAD('하세요',8,'안녕') from dual;
select RPAD('하세요',3,'안녕') from dual;
select LTRIM('하세요','하') from dual;
select RTRIM('하세요','요') from dual;
select LENGTHB('오') from dual;

select to_date ('2024-06-01 오전 06:00', 'YYYY-MM-DD-PM HH:MI') from dual
select to_char (sysdate, 'YYYY-MM-DD' ) from dual
-- 특정 날짜값을 받아오고싶다면 sysdate 자리에 to_date함수를 넣어서 활용
select add_month(sysdate, -3) from dual
select last_day (sysdate) from dual

--오늘 날짜 기준 연도 조회(테이블 헤더에 연도 / 컬럼에 2024년 나오게)
--오늘 날짜 기준 월 조회(테이블 헤더에 연도 / 컬럼에 06월 나오게)
--오늘 날짜 기준 일 조회(테이블 헤더에 연도 / 컬럼에 03일 나오게)
--오늘 날짜 기준 시/분 조회(테이블 헤더에 '시', '분' / 
--컬럼에 각각 '?시', '?분' 나오게)
--지금이 오전인지 오후인지 조회
--문자열 2024-06-06 오전 07:23을 문자형 데이터 2024.06.06으로 조회
--오늘 날짜 기준 3달 전 마지막 날은 몇월인지 조회

select sysdate from dual
select to_char(sysdate, 'YYYY') || '년' 연도 from dual
select to_char(sysdate, 'MM') || '월' 월 from dual
select to_char(sysdate, 'DD') || '일' 일 from dual
select to_char(sysdate, 'HH24') || '시' 시 from dual
select to_char(sysdate, 'MI') || '분' 분 from dual
select to_char(sysdate, 'PM') "오전/오후" from dual

select to_char(to_date('2024-06-06 오전 07:23', 'YYYY-MM-DD PM HH:MI'),
'YYYY.MM.DD')from dual;, 
select last_day(add_months(sysdate, -3)),'MMDDDD') from dual;

select nvl(null,'B') from dual;
select nvl('A' ,'B') from dual;

select nvl(null,'A','B') from dual;





