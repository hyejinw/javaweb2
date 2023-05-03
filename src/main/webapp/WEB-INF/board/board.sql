show tables;

create table board (
	idx int not null auto_increment,
	mid varchar(20) not null,
	nickName varchar(20) not null,
	title varchar(100) not null,  /* 게시글 제목 */
	email varchar(50),
	homePage varchar(50),
 	content text not null,        /* 게시글 내용 */
	readNum int default 0,        /* 조회수 */
 	hostIp varchar(40) not null,
	openSw char(2) default 'OK',  /* 게시글 공개 여부 */
	wDate datetime default now(), /* 글 올린 날짜와 시간 */
	good int default 0,           /* 좋아요 클릭 횟수 누적 */
	primary key(idx)   /*primary key는 여러 개 올 수 있다만 항상 그럴 필요는 없다.*/
	
);

desc board;

insert into board values (default,'admin','관리맨','게시판 서비스 시작합니다.','secret@secret.com','somewhere.lulook@naver.com','이곳은 게시판입니다.',default,'192.168.50.83',default,default,default);

select* from board;

drop table board;