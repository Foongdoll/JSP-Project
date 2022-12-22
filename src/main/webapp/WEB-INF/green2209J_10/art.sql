show tables;

/* 회원 정보 관리 테이블 */

create table artMember (
	idx int not null auto_increment primary key, /* 회원 고유 번호*/
	mid varchar(20) not null unique,             /* 회원 아이디(중복 불가)*/
	pwd varchar(100) not null,                   /* 회원 비밀번호*/
	name varchar(20) not null,                   /* 회원 이름*/
	gender char(6) not null,                     /* 회원 성별*/
	email varchar(50) not null,                  /* 회원 이메일*/
	nickName varchar(20) not null unique,        /* 회원 별명(중복 불가)*/
	tel varchar(20),                             /* 회원 전화번호 */
	birthday datetime default now(),             /* 회원 생일(안넣으면 가입일로 저장)*/
	address varchar(50),                         /* 회원 주소(입찰시 작품 보낼 주소 정확한 입력 요구)*/
	hostIp varchar(50),                          /* 접속한 회원 아이피*/
	point int default 100,                       /* 회원 포인트(방문시 10포인트 증가 1000포인트부터 사용 1000포인트 == 1만원)*/
	startDate datetime default now(),            /* 회원 가입일*/
	lastDate datetime default now(),             /* 회원 최종 접속일*/
	aggrement int default 1,                     /* 회원 광고성수신 메세지 동의 여부*/
	level int default 1,                         /* 회원 등급 0.관리자 1.준회원 2.정회원 3.작가*/
	memDelete int default 1,                     /* 회원 탈퇴 신청 여부  0. 탈퇴신청 1. 활동중*/
	todayVisitCnt int default 0,                 /* 회원 하루 방문수*/
	cardNum varchar(100) default ''
);
insert into artmember values(default,'admin','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','관리자','남자','admin@naver.com','관리자','010-1234-1234',default,'관리자시 관리자동','192.168.50.247',default,default,default,default,default,default,default,default,default);

select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,
						(select count(*)	from artComment where gesifanIdx=g.idx) as comcnt 
						from artGesifan g  order by idx desc

						select * from artMember where nickName = '관리자' and tel = '010-1234-1234'
select * from artwork;

delete from artworkipchal where workidx = 1;


select reportCnt from artmember where nickName = '홍홍홍'


update artmember set reportcnt = 8 where idx = 8;
update artmember set reportcnt = 11 where idx = 8;
select * from artmember;

update artwork set currentPrice = startprice;

select * from artworkipchal

update artwork set worklastdate = '2022-12-21' where work = '동반자'
						
update artMember set pwd = '2102996566a@' where mid = 'shl5028'
			

						
SELECT * FROM artmember;

select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from artcomment where gesifanIdx = 20 order by idx desc

update writer set writerName = '홍홍홍' where writeridx = 10

update artmember set point = 1100 
update artmember set memdelete = 1 where idx = 5;
update artmember set level = 0 where idx = 5;
delete from artMember m,artcomment c where m.nickName = c.nickName;

select * from writer;
desc artComment;
desc artmember;
desc artwork;
desc artcomment;

delete from artmember m,artwork w where m.idx = '5' and m.nickName = w.nickName;

select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,
						(select count(*) from artComment where gesifanIdx = g.idx) as comcnt 
						from artGesifan g order by idx desc






select * from artmember;
select * from artwork;

select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,
						(select count(*)	from artcomment WHERE gesifanIdx=g.idx) 
						from artGesifan g where part='자유' order by idx desc

select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff,
						(select count(*) from artcomment WHERE gesifanIdx=g.idx) 
						from artGesifan g order by idx desc



desc artcomment
desc artworkipchal

delete from artworkipchal;;
select * from artworkipchal;

update artwork set currentPrice = startPrice;

select workFSname from artwork w,artmember m,writer ww 
					where w.workWriter = '강현성' and ww.writerInfor = '안녕하세요.'

select w.*,ww.* from artwork w,artmember m,writer ww 
					where w.workWriter = '강현성' and ww.writerInfor = '안녕하세요.'
desc writer;
desc artwork;

select * from artwork w,artmember m,writer ww where w.workWriter = '강현성' and ww.writerInfor = '안녕하세요.';

select * from writer;

update artmember set level = 0 where nickName = '관리자'

select * from artworkipchal

select i.cancelSw as cancelSw,w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
						from  artWork w,artWorkIpchal i,artMember m 
						where i.memberIdx = m.idx  and i.workIdx = w.idx and m.mid = 'admin' and i.cancelSw = '낙찰'
						order by i.idx desc

select i.cancelSw as currentCancelSw
					from artWork w,artWorkIpchal i,artMember m
					where i.memberIdx = m.idx and w.idx = i.workidx and i.cancelSw = '낙찰' and m.mid = 'admin'
					order by i.ipchalPrice desc


select i.cancelSw as cancelSw,i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and i.cancelSw = '낙찰'
					order by i.ipchalPrice desc					
					

select i.cancelSw as currentCancelSw
					from artWork w,artWorkIpchal i,artMember m
					where i.memberIdx = m.idx and w.idx = i.workidx and m.mid = 'admin'
					group by w.work
					order by i.ipchalPrice desc 
					
					
					
desc artmember;

select w.*,datediff(now(), w.workLastDate) as day_diff,i.cancelSw from artWork w,artworkipchal i where i.workidx = w.idx


alter table artmember add column reportCnt int default 0
update artmember set reportCnt =11 where idx = 2;

select * from artwork;
delete from artmember
select * from artworkipchal;
delete from artworkipchal;
select * from artmember
alter table artMember drop column ipchalworkidx;
alter table artMember drop column favoriteWork;
desc artMember;
select * from artWork where workWriter = '강현성' limit 0,5
select i.cancelSw as cancelSw from artWork w,artWorkIpchal i where w.idx = i.workidx and i.workidx = '11'

select * from artWork where workWriter = '강현성'

desc artwork;

select w.*,datediff(now(), w.workLastDate) as day_diff,i.cancelSw from artWork w,artworkipchal i where i.workidx = w.idx

select i.cancelSw as cancelSw,m.name as ipchalName,i.ipchalprice as ipchalPrice from artWorkIpchal i,artMember m where workIdx = 1 and m.idx = i.memberIdx


select cancelSw as cancelSw from artWorkIpchal where workIdx = 9


select * from artWork where workWriter = '김덕배'


update artwork set currentPrice = 50 where idx = 1

select * from artwork;

select w.worklastdate,datediff(now(), w.workLastDate) from artwork w,artworkipchal i,artmember m
select w.worklastdate from artwork w where datediff(now(), w.workLastDate) > 0;



select w.worklastdate from artwork w,artworkipchal i,artmember m 
					where w.idx = i.workidx and i.memberidx = m.idx and i.workidx = '14' and datediff(now(), w.workLastDate) > 0





select w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
					from artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
					group by w.work 
					order by i.idx desc

select w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
					from artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
					group by w.work
					order by i.ipchalPrice desc
					
select w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
					from artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
					order by i.ipchalPrice desc

select i.cancelSw as cancelSw from artWork w,artWorkIpchal i where w.idx = i.workidx and i.workidx = 14

select * from artwork;

select w.work as workName,m.name as ipchalName,i.wDate as wDate,i.cancelSw as cancelSw,i.ipchalprice as ipchalprice,w.workLastDate as workLastDate
						from artWorkIpchal i,artMember m, artWork w 
						where i.memberIdx = m.idx and i.workIdx = w.idx 
						order by i.idx 
						limit 0 , 5
						
select w.work as workName,m.name as ipchalName,i.wDate as wDate,i.cancelSw as cancelSw,i.ipchalprice as ipchalprice,w.workLastDate as workLastDate
					from artWorkIpchal i,artMember m,artWork w 
					where i.memberIdx = m.idx and i.workIdx = w.idx 
					order by i.idx
					limit 0,5						
						
select w.work as workName,m.name as ipchalName,i.wDate as wDate,i.cancelSw as cancelSw,i.ipchalprice as ipchalprice,w.workLastDate as workLastDate
					from artWorkIpchal i,artMember m,artWork w 
					where i.memberIdx = m.idx and i.workIdx = w.idx 
					order by i.idx
					limit 0,5						
						
select w.work as workName,m.name as ipchalName,i.wDate as wDate,i.cancelSw as cancelSw,i.ipchalprice as ipchalprice,w.workLastDate as workLastDate
					from artWorkIpchal i,artMember m, artWork w 
					where i.memberIdx = m.idx and i.workIdx = w.idx
					order by i.ipchalprice desc limit 0 , 5

select w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
					from artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
					group  by w.work
					order by i.idx desc

select w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
					from artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
					group by w.work
					order by i.idx desc
		
select w.work as work,w.workwriter as workwriter,
					w.worksize as worksize,i.ipchalPrice as ipchalPrice,
					i.cancelSw as cancelSw from artWork w,artmember m,artworkipchal i
					where i.memberidx = m.idx and i.workidx = w.idx and i.cancelSw = '배송 완료' and m.mid = 
					group by w.work
					order by i.idx desc			
					
select count(*) as cnt from artworkipchal i,artmember m,artwork w 
					where i.memberidx = m.idx and i.workidx = w.idx and m.mid = 'shl5028' and i.cancelsw = '배송 완료' 
					group by w.work 
					order by i.idx desc

desc artwork;
					
select w.work as work,w.workwriter as workwriter,
					w.worksize as worksize,i.ipchalPrice as ipchalPrice,
					i.cancelSw as cancelSw from artWork w,artmember m,artworkipchal i 
					where i.memberidx = m.idx and i.workidx = w.idx and  m.mid = 'shl5028' and i.cancelSw = '배송 완료'
					order by i.idx desc limit 1
					
select w.work as work,w.workwriter as workwriter,
					w.worksize as worksize,i.ipchalPrice as ipchalPrice,
					i.cancelSw as cancelSw from artWork w,artmember m,artworkipchal i 
					where i.memberidx = m.idx and i.workidx = w.idx and  m.mid = 'shl5028' and i.cancelSw = '배송 완료'
					group by w.work 
					order by i.idx desc					
					
					
select w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name
					from artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
					group by w.work
					order by i.idx desc				
					
select count(*) as cnt from artworkipchal i,artmember m,artwork w 
					where i.memberidx = m.idx and i.workidx = w.idx and m.mid = 'shl5028' and i.cancelsw = '배송 완료' 
					
update artworkipchal i,artwork w,artmember m set cancelSw = '배송 완료' where m.idx = i.memberidx and i.workidx = w.idx and w.work = '과일의 수다' and w.idx = '12' and m.mid = 'shl5028'					
					
update artworkipchal i,artwork w set cancelSw = '직접 수령' where i.workidx = w.idx and w.work = '과일의 수다' and w.idx = '12'

select * from artworkipchal

select i.cancelSw as cancelSw from artWorkIpchal i,artMember m where m.idx = i.memberIdx and m.mid = 'shl5028' order by i.idx desc 

update artMember m,artWorkIpchal i,artWork w set m.cardNum = 1231234,i.cancelSw = '직접수령' where w.work = '과일의 수다' and m.mid = 'shl5028' and datediff(now(), w.workLastDate) > 0
select w.work,i.* from artworkipchal i,artmember m,artwork w where i.memberidx = m.idx and i.workidx = w.idx and datediff(now(), w.workLastDate) > 0 order by i.idx desc limit 1;
select * from artworkipchal;

update artMember m,artWorkIpchal i,artWork w set m.cardNum = 154112,i.cancelSw = '직접수령' where w.work = '과일의 수다' and m.mid = 'shl5028' and w.idx = i.workidx and m.idx = i.memberidx;

select w.work,i.cancelsw,m.cardnum from artMember m,artWorkIpchal i,artWork w where w.work='과일의 수다' and m.mid = 'shl5028' and w.idx = i.workidx and m.idx = i.memberidx;

select i.*,w.work from artworkipchal i,artwork w,artmember m where w.idx = i.workidx and m.idx = i.memberidx;

alter table artmember add column cardnum varchar(100) default ''
alter table artmember drop column favoritegesigle;

update artworkipchal set cancelSw = '대기';

select * from artworkipchal

alter table artMember add column todayVisitCnt int default 0
select count(*) as cnt from artWorkIpchal i,artMember m where i.memberidx = m.idx and m.mid = 'shl5028' order by i.idx desc
desc artMember;
alter table artMember drop column workJudge;

alter table artMember change todayVisitCnt cardNum varchar(100) default '';

insert into artMember values(default,'admin','','관리자','남자','admin1234@naver.com','관리자','010-1234-1234','1999-01-21','관리자','관리자',default,default,default,default,default,default,default,default,default,default)
delete from artMember 

desc artMember;
drop table artMember;
--drop table artMember;
select * from artMember;

--delete from artMember;

update artMember set level = 0 where nickName = '관리자';
update artMember set name = '풍돌이' where name = '김덕배';
update artMember set nickName = '풍돌멩이' where name = '풍돌이';

select * from artMember where nickName = '관리자' and email = 'admin1234@naver.com'


update artMember m,artWorkIpchal i,artWork w set m.cardNum = ?,i.cancelSw = '직접수령' where m.mid = ? and datediff(now(), w.workLastDate) > 0"



/* 작가 등록 */
create table writer (
	writeridx Int not null auto_increment primary key,
	writerName varchar(20) not null unique,
	writerGender char(6) default '남자',
	writerBirthday datetime default now(),
	writerHomeTown varchar(50) not null,
	writerInfor text not null,
	writerFname varchar(100),
	writerFsName varchar(100),
	writeropenSw char(5) default '공개'
);


update writer set writerName = '강현성' where writerIdx = 8;
update writer set writerBirthday = '1987-01-21' where writerIdx = 8;
update writer set writerInfor = '안녕하세요.' where writerIdx = 8;
update writer set writerHomeTown = '서울' where writerIdx = 8;
select * from writer;
desc writer;
drop table writer;
delete from writer;




/* 그림 경매 등록 테이블 */
create table artWork(																
	idx int not null auto_increment primary key,    							  /* 그림 고유번호*/
	work varchar(20) not null,                       							 /* 그림 이름*/
	workFname varchar(20) not null,                							  /* 그림 실제 저장될 이름*/
	workFSname varchar(20) not null,                						  /* 그림 실제 저장될 이름*/
	workWriter varchar(20) not null,                							  /* 그림 작가명 본명 or 닉네임 자유 공개 비공개*/
	writerBirthYear varchar(10),                     							 /* 그림 작가 생년*/
	workSize varchar(50) not null default '0 X 0 CM', 							/* 그림 크기(0 x 0 cm 형식)*/
	workComment varchar(50),                          						 /* 그림에 대한 작가의 짧은 소개*/
	chuJungPrice varchar(100) not null default '0원',              /* 그림 추정가(작가 본인입력 또는 임으로 지정)*/
	startPrice varchar(100) not null default '0원',             	   /* 그림 시작가(작가 본인입력)*/
	currentPrice varchar(100) not null default '0원',   		        /* 그림 현재가(마지막 입찰자가 부른 가격)*/
	ipchalCnt int not null default 0,                 					/* 그림 입찰횟수(몇명이 그림입찰을 시도했는지) */
	workStartDate datetime default now(),            						 /* 그림 경매 시작 날짜(작가 본인입력, 기본은 등록한 순간 시작하는걸로)*/
	workLastDate datetime default now(),             						 /* 그림 경매 마지막 날짜(작가 본인입력, 디테일한 시간도 정할수있게 만들기)*/
	boomnackchalPrice varchar(100) default '0'
);
alter table artwork drop column favoriteMember;
desc artwork;
\c return;
select * from artWork;



select w.work from artWork w, artworkipchal i,artMember m where i.memberIdx = m.idx and w.idx = i.workidx and datediff(now(), w.workLastDate) > 0;

select m.name as ipchalName,i.ipchalprice as ipchalPrice from artWorkIpchal i,artMember m,artWork w where m.idx = i.memberIdx and m.mid = 'admin1' and w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 

alter table artWork change boomnackchalPrice boomnackchalPrice varchar(100) default '0';

select w.work,w.workWriter,w.workSize,i.ipchalPrice,m.nickName,m.name
		from artWork w,artWorkIpchal i,artMember m 
		where i.memberIdx = m.idx  and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'admin1'
		order by i.idx desc limit 1;
		
		select m.name as ipchalName,i.ipchalprice as ipchalPrice from artWorkIpchal i,artMember m where m.idx = i.memberIdx and m.mid = 'admin1' and datediff(now(), w.workLastDate) > 0;
		
select w.ipchalMember as ipchalMember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 
					order by i.ipchalPrice desc limit 1


update artWork set currentPrice = startPrice;

update artWork w,artWorkIpchal i set ipchalCnt = ipchalCnt + 1 where i.workIdx = w.idx;

update artWork set ipchalCnt = ipchalCnt + 1 where workIdx = (select w.idx from artWork w,artWorkIpchal i where w.idx = i.workIdx);

select boomnackchalPrice from artWork
update artWork set boomnackchalPrice = '57077001' where idx = 12;   

alter table artWork add column boomnackchalPrice varchar(100) default '0원';
alter table artWork change workFSname workFSname varchar(100) not null;

select idx,startPrice,boomnackchalPrice from artWork;
select currentPrice,startPrice from artWork;
update artWork set currentPrice = startPrice;

update artWork set currentPrice = startPrice;

desc artWork;
select * from artMember where mid = 'shl5028';
update artWork set currentPrice = 0;

show tables;

/* 낙찰 취소 심사 관리 테이블 */
create table artWorkJudge(
	idx int not null auto_increment primary key,
	workIdx int not null,
	memberIdx int not null,
	judgeContent text not null,
	judgeSw char(5) default '접수'
);


select w.idx as wIdx,m.idx as mIdx from artWork w,artMember m,artWorkIpchal i 
					where i.workIdx = w.idx and i.memberIdx = m.idx and w.work = '과일의 수다' and m.mid = 'admin1'
					order by i.idx desc

delete from artworkjudge
select * from artWorkJud ge

select w.idx,m.idx from artWork w,artMember m,artWorkIpchal i 
					where i.workIdx = m.idx and i.memberIdx = m.idx and w.work = '과일의 수다' and m.mid = 'shl5028'
					order by i.idx desc

delete from artworkjudge
					
insert into artWorkJudge values(default,1,1,'asda',default)

select w.idx as wIdx,m.idx as mIdx from artWork w,artMember m,artWorkIpchal i 
					where i.workIdx = w.idx and i.memberIdx = m.idx and w.work = '과일의 수다' and m.mid = 'admin1'
					order by i.idx desc

					
select i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 
					order by i.ipchalPrice desc limit 1					
					
select i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 
					order by i.ipchalPrice desc limit 1
	
/* 현재 입찰된 내역 관리 테이블 */

create table artWorkIpchal (
	idx int auto_increment primary key,
	workIdx int not null,
	memberIdx int not null,
	ipchalprice int not null default 0,
	cancelSw char(10) default '경매 진행중',
	wDate datetime default now(), /* default DATE_FORMAT(now(),%Y-%m-%d-%H)  */
	ipchalmember varchar(20) not null,
	foreign key(workIdx) references artWork(idx),
	foreign key(memberIdx) references artMember(idx)
);
update artmember set level = 0 where idx = 2;
delete from artWorkIpchal;

update artwork set currentPrice = startPrice;

select * from artworkipchal;
select * from artmember;

select * from artwork;

select i.cancelSw as currentCancelSw
					from artWork w,artWorkIpchal i,artMember m
					where i.memberIdx = m.idx and w.idx = i.workidx and m.mid = 'admin'
					order by i.ipchalPrice desc



update artworkipchal i,artwork w,artmember m set i.cancelSw = '배송 완료' 
					where m.idx = i.memberidx and i.workidx = w.idx 
					 and i.cancelSw != '경매 진행중' 

update artworkipchal i,artwork w,artmember m set cancelSw = '경매 진행중' 
				where m.idx = i.memberidx and i.workidx = w.idx 
				and m.mid = 'admin'


update artwork set worksize = '180 x 130' where idx = 2


select count(*) as cnt from artworkipchal i,artmember m,artwork w 
					where i.memberidx = m.idx and i.workidx = w.idx and m.mid = 'admin' and i.cancelsw != '경매 진행중' 
					group by w.work 
					order by i.idx desc

select i.cancelSw as cancelSw,w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
					from  artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and m.mid = 'admin' and i.cancelSw != '경매 진행중'
					group by w.work
					order by i.idx desc
					
update artworkipchal set cancelSw = '경매 진행중' where idx = 36

select * from artworkipchal;

select * from artWorkipchal  order by ipchalPrice desc


update artMember m,artWorkIpchal i,artWork w set m.cardNum = ?,i.cancelSw = '직접수령' 
						where w.work = ? and m.mid = ? and w.idx = i.workidx and m.idx = i.memberidx and i.cancelSw != '경매 진행중'
						order by i.ipchalPrice desc













select i.cancelSw as cancelSw,w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
					from  artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and m.mid = 'admin' and i.cancelSw = '낙찰'
					order by i.idx desc


select i.cancelSw as currentCancelSw
					from artWork w,artWorkIpchal i,artMember m
					where i.memberIdx = m.idx and w.idx = i.workidx and m.mid = 'admin'
					order by i.ipchalPrice desc

select i.cancelSw as cancelSw,i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and i.cancelSw = '낙찰'
					group by w.work
					order by i.ipchalPrice desc


select i.cancelSw as cancelSw,i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
						from artWork w,artWorkIpchal i 
						where w.idx = i.workIdx and i.cancelSw = '낙찰'
					group by w.work
						order by i.ipchalPrice desc
						
select i.cancelSw,w.work,count(*) as cnt from artworkipchal i,artmember m,artwork w 
					where i.memberidx = m.idx and i.workidx = w.idx
					and m.mid = 'admin' and i.cancelSw = '낙찰' and i.cancelSw = '택배수령' and i.cancelSw = '직접수령' 
					group by w.work 
					order by i.idx desc

select * from artworkIpchal;

					
select count(*) as cnt from artworkipchal i,artmember m,artwork w 
					where i.memberidx = m.idx  and m.mid = 'admin' and i.workidx = w.idx and i.cancelsw = '낙찰' 
					or i.cancelsw = '직접수령' or i.cancelsw = '택배수령' 
					group by w.work 
					order by i.idx desc limit 1		
					
					
					
					
					
					
select i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx 
					order by i.ipchalPrice desc
					
select i.cancelSw as cancelSw,i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx 
					group by w.work
					order by i.ipchalPrice desc
					
					
select i.cancelSw as cancelSw,i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and i.cancelSw = '낙찰'
					group by w.work
					order by i.ipchalPrice desc					
					
-- 경매 진행 중인 작품만 vos 에 담아 오고 싶어서 sql 문 짜는중 밥먹고 오면 이거 부터 할것 
select count(*) as cnt from artWork w,artWorkIpchal i where i.cancelSw = '경매 진행중';

delete from artworkipchal;

select datediff(now(), w.workLastDate) as day_diff from artwork w,artworkipchal i,artmember m 
					where w.idx = i.workidx and i.memberidx = m.idx and i.workidx = '15'

select datediff(now(), w.workLastDate) as day_diff from artwork w,artworkipchal i where w.idx = 14;

select i.cancelSw as cancelSw,i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and i.cancelSw = '낙찰'
					group by w.work
					order by i.ipchalPrice desc

select i.cancelSw as cancelSw,i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
						from artWork w,artWorkIpchal i 
						where w.idx = i.workIdx and i.cancelSw != '경매 진행중'
						group by w.work
						order by i.ipchalPrice desc
						
	select i.cancelSw as currentCancelSw"
					+ "	from artWork w,artWorkIpchal i,artMember m"
					+ "	where i.memberIdx = m.idx and w.idx = i.workidx and m.mid = ?"
					+ "	order by i.ipchalPrice desc					
						
update artWorkipchal i,artmember m,artwork w set cancelSw = '낙찰' 
					where  i.memberidx = m.idx and i.workidx = w.idx
	
select * from artWorkipchal;					
					
select i.cancelSw as currentCancelSw
					from artWork w,artWorkIpchal i,artMember m
					where i.memberIdx = m.idx and w.idx = i.workidx and m.mid = 'admin'
					order by i.ipchalPrice desc						

select i.cancelSw as currentCancelSw
from artWork w,artWorkIpchal i,artMember m
where i.memberIdx = m.idx and w.idx = i.workidx and m.mid = 'admin'
order by i.ipchalPrice desc
						
select w.worklastdate from artwork w,artWorkIpchal i where datediff(now(), w.workLastDate) > 0 and i.workidx = w.idx;

update artMember m,artWorkIpchal i,artWork w set m.cardNum = 4912436345,i.cancelSw = '직접수령'
						where w.work = '빵야' and m.mid = 'shl5028' and w.idx = i.workidx and m.idx = i.memberidx

update artMember m,artWorkIpchal i,artWork w set m.cardNum = 1234123,i.cancelSw = '직접수령' 
						where w.work = '분홍 주전자' and m.mid = 'shl5028' and w.idx = i.workidx and m.idx = i.memberidx

select i.cancelSw as cancelSw from artWorkIpchal i,artMember m,artwork w 
		where w.idx = i.workidx and m.idx = i.memberIdx and m.mid = 'shl5028' and datediff(now(), w.workLastDate) > 0  
		group by i.workidx
		order by i.idx desc
update artworkipchal set ipchalmember = '풍돌멩이' where idx = 11
		
		
select i.ipchalmember as ipchalmember,w.work as work,i.ipchalPrice as ipchalPrice 
						from artWork w,artWorkIpchal i 
						where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 
						order by i.ipchalPrice desc limit 1		
		
select i.cancelSw as currentCancelSw
						from artWork w,artWorkIpchal i,artMember m
						where i.memberIdx = m.idx and w.idx = i.workidx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
						order by i.ipchalPrice desc 
		
		
select w.work as work,w.workwriter as workwriter,
						w.worksize as worksize,i.ipchalPrice as ipchalPrice,
						i.cancelSw as cancelSw from artWork w,artmember m,artworkipchal i
						where i.memberidx = m.idx and i.workidx = w.idx and  m.mid = 'shl5028' and i.cancelSw = '낙찰'
						order by i.idx desc limit 1

select count(*) as cnt from artworkipchal i,artmember m,artwork w 
					where i.memberidx = m.idx and i.workidx = w.idx and m.mid = 'shl5028'and i.cancelsw = '낙찰' 
					group by w.work 
					order by i.idx desc

update artworkipchal i,artwork w,artmember m set cancelsw = '낙찰' 
		where datediff(now(), w.workLastDate) > 0 and m.idx = i.memberidx and w.idx = i.workidx  ;

desc artworkipchal
update artworkipchal set cancelSw = '경매 진행중'
delate from artwor

alter table artworkipchal change cancelSw cancelSw char(10) default '경매 진행중';

alter table artworkipchal add column ipchalmember varchar(20) not null

select w.ipchalMember as ipchalMember,w.work as work,i.ipchalPrice as ipchalPrice 
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 
					order by i.ipchalPrice desc limit 1

select cancelSw as cancelSw from artWorkIpchal where workIdx = 1 and cancelSw = '낙찰'

select * from artWorkIpchal;

delete from artWorkIpchal;

update artWorkIpchal set cancelSw = '경매 진행중'

select w.work as work,w.currentPrice as currentPrice,
				datediff(now(),w.workLastDate) as day_diff, 
				timestampdiff(hour, w.workLastDate, now()) as hour_diff
				from artWork w,artWorkIpchal i,artMember m 
				where w.idx = i.workIdx and m.mid = 'shl5028' and datediff(now(), w.workLastDate) = 1
				group by w.work order by i.idx desc
				
select i.cancelSw as currentCancelSw
					from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
					order by i.ipchalPrice desc limit 1				
				
select i.cancelSw,m.mid from artWorkIpchal i,artMember m where i.memberIdx = m.idx group by m.mid;
select i.cancelSw,m.mid
			from artWork w,artWorkIpchal i,artMember m 
			where i.memberIdx = m.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'hkd1234'
			order by i.ipchalPrice desc limit 1
				
select m.name from artWorkIpchal i,artWork w,artMember m where i.memberIdx = m.idx and i.workIdx = w.idx and datediff(now(), w.workLastDate) = 1;

select m.name,w.currentPrice,i.memberIdx from artWorkIpchal i,artWork w,artMember m 
					where i.memberIdx = m.idx and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0
					group by i.workIdx order by i.idx desc

					-- 마감일 지난사람중 마지막 입찰한 사람 
select w.ipchalMember,w.work,i.ipchalPrice from artWork w,artWorkIpchal i 
	where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 
	group by i.workIdx 
	order by i.idx desc;
					
select w.ipchalMember as ipchalMember,i.workIdx as workIdx,w.work as work,i.ipchalPrice as ipchalPrice from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 
					group by i.workIdx 
					order by i.idx 

					
					-- 지금 이거로 하고있으므ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
select w.ipchalMember as ipchalMember,i.workIdx as workIdx,w.work as work,i.ipchalPrice as ipchalPrice from artWork w,artWorkIpchal i 
					where w.idx = i.workIdx and datediff(now(), w.workLastDate) > 0 
					order by i.ipchalPrice desc limit 1;					
					
					
select * from artWork;
select * from artWorkIpchal;


select w.work as work,w.currentPrice as currentPrice,datediff(now(), w.workLastDate) as day_diff, timestampdiff(hour, w.workLastDate, now()) as hour_diff
	from artWork w,artWorkIpchal i,artMember m where w.idx = i.workIdx and m.mid = 'shl5028' and datediff(now(), w.workLastDate) > 0
	group by w.work order by i.idx desc

-- 그림의 마감일과 오늘의 차이가 0 일떄 해당 그림의 가장 마지막 입찰자가 낙찰자가 된다.
select datediff(now(), w.workLastDate) as day_diff, timestampdiff(hour, w.workLastDate, now()) as hour_diff
	from artWork w;
	
-- 이 사람이 입찰한 그림 탐색 
select w.work,i.ipchalprice from artWork w,artWorkIpchal i where w.idx = i.workIdx group by i.workIdx order by i.idx desc;	

select w.work,w.currentPrice,datediff(now(), w.workLastDate) as day_diff, timestampdiff(hour, w.workLastDate, now()) as hour_diff
	from artWork w,artWorkIpchal i,artMember m where w.idx = i.workIdx and m.mid = 'shl5028' and datediff(now(), w.workLastDate) = 1   
	group by w.work order by i.idx desc

	
	
select w.work,w.workLastDate,(select name from artMember m,artWorkIpchal i,artWork w where m.idx = i.idx limit 1) as ipchalja,
	datediff(now(), w.workLastDate) as day_diff, timestampdiff(hour, w.workLastDate, now()) as hour_diff
	from artWork w,artWorkIpchal i

	
select * from artWorkIpchal;
	
	
select * from artWorkIpchal where workIdx = 1 order by idx desc limit 1;

select m.name as ipchalName,i.ipchalprice as ipchalPrice from artWorkIpchal i,artMember m where m.idx = i.memberIdx limit 0,2;
select w.work as workName,m.name as ipchalName,i.wDate as wDate,i.cancelSw as cancelSw from artWorkIpchal i,artMember m, artWork w where i.memberIdx = m.idx and i.workIdx = w.idx order by i.idx desc;


select m.name as ipchalName,i.ipchalprice as ipchalPrice from artWorkIpchal i,artMember m where workIdx = 1 and m.idx = i.memberIdx limit 0,2

select w.work as workName,m.name as ipchalName,i.wDate as wDate,i.cancelSw as cancelSw
	from artWorkIpchal i,artMember m, artWork w 
	where i.memberIdx = m.idx and i.workIdx = w.idx 
	order by i.idx desc
	limit 0,2


drop table artWorkIpchal;
desc artWorkIpchal;

alter artWorkIpchal add column wDate datetime default now();


update artWorkIpchal i,artWork w set i.ipchalprice = w.startPrice;

select startPrice from artWork;

select m.name as ipchalName,i.ipchalprice as ipchalPrice from artWorkIpchal i,artMember m where workIdx = 1 and m.idx = i.memberIdx


select m.name,w.work from artMember m, artWork w where m.idx = w.idx;

select m.name,i.ipchalprice from artWorkIpchal i,artMember m where workIdx = 1 and m.idx = i.memberIdx;


/* 게시판 관리 테이블 */
create table artGesifan (
	idx int not null auto_increment primary key,
	nickName varchar(20) not null,
	title varchar(100) not null,
	content text not null,
	wDate datetime default now(),
	hostIp varchar(50) not null,
	part varchar(10) not null,
	fName varchar(500),
	fSName varchar(500),
	readNum int default 0,
	good int default 0,
	gesifanPwd int not null,
	hashtag varchar(100),
	secretSw varchar(5) default 'off'
);
select * from artGesifan


/* 게시판 신고 테이블 */
create table artGesifanReport(
	idx int not null auto_increment primary key,
	gesifanidx int not null,
	reporter varchar(20) not null, 
	content text not null,
	rDate datetime default now(),
	currentSw char(10) default '접수',
	foreign key(gesifanidx) references artGesifan(idx)
);

update artGesifanReport set currentSw = '접수' where idx = '1'

select * from artGesifanReport

select r.*,g.title as title from artGesifanReport r,artGesifan g where g.idx = r.gesifanidx order by idx desc
drop table artGesifanReport
desc artGesifanreport

insert into artGesifan values(default,'관리자','수정 삭제 버튼 나오는지 테스트','안녕하세요',default,'192.168.50.247','자유','1.jpg',default,default,'1234','#해쉬처음써봄',default);
insert into	artGesifan values(default,'admin','자유게신입니다요?.','잘 나오나요?',default,'192.168.50.247','자유','1.jpg',default,default,'1234','#밥먹고싶어',default);
insert into gesifan2 values(default,'admin','관리잡니다.','잘게영',default,'192.168.50.247','자유','1.jpg',default,default,'1234','#오늘뭐먹지?','on');
insert into gesifan2 values(default,'admin','안녕히....','후우훟웋',default,'192.168.50.247','자유','1.jpg',default,default,'1234','',default);



select count(*) as cnt from gesifan2;
select *,datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from gesifan2 limit ?,?;
select * from artGesifan

update artGesifan set fName = '9.jpg' , fSName = '91.jpg' where title = '1234';

drop table artGesifan;
desc artGesifan;

delete from gesifan2 where readNum = 0;

show tables;





/* 댓글 관리 테이블 */
create table artComment(
	idx int not null auto_increment primary key,
	gesifanIdx int not null, /* 댓글을 단 게시글의 idx */
	nickName varchar(20) not null,/* 댓글 단 사람의 닉네임 */
	wDate datetime default now(),
	hostIp varchar(50) not null,
	comment text not null,
	foreign key(gesifanIdx) references artGesifan(idx)
);
select * from artComment;
delete from artComment where comment = ' ';
desc artComment
drop table artComment

select g.title,g.idx,c.gesifanIdx from artGesifan g,artComment c where g.idx = c.gesifanIdx;

update artComment set comment = '수정 테스트' where idx = 10;

select count(*) as cnt from artworkipchal i,artmember m,artwork w 
					where i.memberidx = m.idx and i.workidx = w.idx and m.mid = 'shl5028' and i.cancelsw = '낙찰' 
					group by w.work 
					order by i.idx desc

					
select w.idx as wIdx,w.work as work,w.workWriter as workWriter,w.workSize as workSize,i.ipchalPrice as ipchalPrice,m.nickName as nickName,m.name as name 
					from artWork w,artWorkIpchal i,artMember m 
					where i.memberIdx = m.idx  and i.workIdx = w.idx and datediff(now(), w.workLastDate) > 0 and m.mid = 'shl5028'
					order by i.ipchalPrice desc					

/* 방명록 테이블 */
create table guest (
	idx int not null auto_increment,
	nickName varchar(20) not null,
	content text not null,
	wDate datetime default now(),
	hostIp varchar(50),
	good int default 0,
	primary key(idx)
)

select * from guest where nickName like '관리자' order by idx desc;

select *,datediff(now(), wDate) as day_diff,timestampdiff(hour, wDate, now()) as hour_diff from guest  where nickName like ? order by idx desc limit ?,?

insert into guest values (default,'관리자','방명록을 시작합니다',default,'192.168.50.247',default)

select * from guest;

drop table guest;
desc guest;
