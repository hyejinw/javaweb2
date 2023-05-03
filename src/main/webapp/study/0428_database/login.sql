

create table login (
	idx int not null auto_increment primary key,   /* 고유번호 */
	mid varchar(20) not null,        /* 아이디 */
	pwd varchar(20) not null,        /* 비밀번호 */
	name varchar(20) not null,       /* 성명 */
	point int default 100,           /* 포인트 */
	lastDate datetime default now(), /* 최종 방문일자 */
	todayCount int default 0,         /* 오늘 방문일자 누적 */
	failCount int default 0
);

desc login;

insert into login values (default, "admin", "1234", "관리자", default, default, default, default);

select * from login;

alter table login auto_increment = 2;

SHOW TABLE STATUS WHERE name = 'login';

drop table login;

update login set failCount=0 where mid="hkd1234";

ALTER TABLE login ADD failCount int default 0;

update login set failCount=(failCount+1) where mid="youngGod";

