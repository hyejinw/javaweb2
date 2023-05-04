show tables;

create table member (
	idx int not null auto_increment,      /* 회원 고유번호 */
	mid varchar(20) not null,             /* 회원 아이디(중복 불허) */
	pwd varchar(100) not null,            /* 회원 비밀번호(SHA 256 암호화 처리) */
	nickName varchar(20) not null, 	      /* 회원 별명 (중복 불허, 수정가능) */
	name varchar(20) not null,            /* 회원 성명 */
	gender varchar(5) default '여자',  /* 회원 성별 */
	birthday datetime default now(),      /* 회원 생일 */
	tel varchar(15),                      /*전화번호(010-1234-5678)*/
	address varchar(100),                 /* 주소(다음 API 우편번호 활용) */
	email varchar(50) not null,           /* 이메일 (아이디나 비밀번호 분실 시 사용)-형식체크 필수!! */
	homePage varchar(50),                 /* 홈페이지 주소 */
	job varchar(20),                      /* 직업 */
	hobby varchar(100),                   /* 취미(복수 선택 가능, 구분자(/) */                    
	photo varchar(100) default 'noimage.jpg',  /* 회원 사진 */
	content text,                              /* 자기 소개 */
	userInfor char(6) default '공개',            /* 회원 정보 공개여부 */
	userDel char(2) default 'NO',               /* 회원 탈퇴신청여부(NO:현재 활동 중, OK: 탈퇴 신청 중) */
	point int default 100,                      /* 회원 누적포인트(가입포인트 100점 증정, 1회 방문시포인트 증가, 1회 최대 50점) */
	level int default 1,                         /* 0:관리자, 1준회원, 2:정회원, 3:우수회원, 4: 운영자 */
	visitCnt int default 0,                     /* 총 방문 횟수 */
	startDate datetime default now(),           /* 최초 가입일 */
	lastDate datetime default now(),            /* 마지막 접속일 */
	todayCnt int default 0,                      /* 오늘 방문 횟수 */
	
	primary key(idx, mid)                       
);

desc member;