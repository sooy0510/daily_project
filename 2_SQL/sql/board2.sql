//테이블 생성
drop table board;
drop table users;

create table users(
	id 			VARCHAR2(12) constraint users_id_pk primary key,
	password 	VARCHAR2(20) constraint users_password_notnull not null,
	name 		VARCHAR2(12) constraint users_name_notnull not null,
	role 		VARCHAR2(5) default 'user'
);

create table board(
	seq 		number(5),
	title 		VARCHAR2(30) constraint board_title_pk primary key,
	content 	VARCHAR2(500) constraint board_content_notnull not null, 
	regdate 	date default sysdate,
	cnt 		number(5) default 0,
	id 			VARCHAR2(12) constraint board_id_fk references users
);

SELECT * FROM COLS WHERE TABLE_NAME = 'users';
SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = 'users';

//제약조건 추가
alter table board add constraint board_id_fk foreign key(id) reference users;
alter table board add foreign key(id) references users;

//컬럼 추가
alter table board add regdate date default sysdate not null;

//데이터(날짜) 변경
update board set regdate=TO_DATE(20190313122610,'yyyymmddhh24miss') 
	where id='sooy' and title='new title';
update board set regdate=TO_DATE(20190413122610,'yyyymmddhh24miss') 
	where id='yeomju';
update board set regdate=TO_DATE(20190213122610,'yyyymmddhh24miss') 
	where id='inseon';
	
//컬럼속성 변경
alter table board modify content varchar(1000);


//회원등록
insert into users(id,password,name) values('java01','12345','이수연1');
insert into users(id,password,name) values('java02','12345','이수연2');
insert into users(id,password,name) values('java03','12345','이수연3');
insert into users(id,password,name,role) values('admin','12345','관리자','admin');


//게시판 글등록
create sequence seq;
create sequence cnt;
insert into board(seq,title,content,regdate,cnt,id) 
	values ((select nvl(max(seq),0)+1 from board),
			'hungry','im hungry',default,default,'java01');
			


insert into board(seq,title,content,cnt,id) 
	values ((select nvl(max(seq),0)+1 from board),
			'공지사항','djdjdj',default,
			'admin');

insert into board(seq,title,content,id) 
	values ((select nvl(max(seq),0)+1 from board),
			'0515','dskjfksdj','java02');
			
insert into board(seq,title,content,id) 
	values ((select nvl(max(seq),0)+1 from board),
			'05156','안녕하세요','java02');
			
insert into board(seq,title,content,id) 
	values ((select nvl(max(seq),0)+1 from board),
			'new title','new content','java03');

//테이블의 모든 데이터 삭제
delete from board;

//회원정보 수정
update users set password='56789', role='a' where id='sooy';

//글수정
update board set content='명랑핫도그' 
	where id='inseon' and title='0515';

//게시판 글 삭제
delete from board 
	where id='inseon' and title='0515';
	
//데이터 검색(제목으로 검색)
select * from board
	where title='hungry';
	 
//전체 등록글 수
select count(*) from board;

//사용자별 등록글 수
select id, count(*) from board
	group by id
	order by 1;
	
//월별개시글수
select to_char(regdate,'mm'),count(*) from board
	group by to_char(regdate,'mm')
	order by 1;
	
//사용자별 게시글 검색
select * from board
	where id='sooy';
	
//제목으로 게시글 검색
select * from board
	where title='hungry';

//로그인
select * from users
	where id='java01' and password='12345';
	
//컬럼조회
SELECT * FROM COLS WHERE TABLE_NAME = 'users'
