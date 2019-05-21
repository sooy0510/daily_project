select * from tab;

drop table book;
create table book(
	bookno number(5),
	title varchar2(12),
	author varchar2(12),
	pubdate date
);

drop table book;

select * from book;

insert into book values(1,'java','kim',sysdate);
insert into book values(1,'java','kim',sysdate);
insert into book values(2, null,null,'19/05/15');

insert into book (bookno,title,author,pubdate) values(3,'sql','lee',null);
			
insert into book (bookno,title,author)
values(4,'db','java01');


commit;
rollback;

delete from book
delete from book where title is null;
delete from book where author='kim';

alter table book add(price number(7));

insert into book values(5,default,default,default,default);

insert into book values(2, null,null,'19/05/15');

update book set price=0;
update book set price=10,title='jsp' where bookno=3;

alter table book modify(price number(7,2));
alter table book drop column price;

rename book to book2;
rename book2 to book;

delete from book;

truncate table book;

drop table book;

select * from emp;
select * from dept;

create table emp2
	as select * from emp;
	
create table emp3
	as select * from emp where deptno=10;
	
create table dept2
 	as select * from dept;
 	
insert into dept values(50, 'EDU', 'SEOUL');
insert into dept2 values(50, 'EDU', 'SEOUL');

insert into dept values(10, 'EDU', 'SEOUL');
insert into dept2 values(10, 'EDU', 'SEOUL');


drop table book;
create table book(
	bookno number(5) constraint scoot_book_pk primary key,
	title varchar2(12) constraint book_title_unique unique,
	author varchar2(12) constraint book_author_notnull not null,
	price number(5) constraint book_price_check check(price>0),
	pubdate date default sysdate
);


insert into book(bookno,title,author,price) values (1,'sql','lee',5000);
insert into book(bookno,title,author,price,pubdate) 
			values (2,'oracle','lee',7000,sysdate);
			
insert into book(bookno,title,author,price,pubdate) 
values (3,'oook','kim',7000,default);

insert into book(bookno,author,price) 
values (4,'kim',9000);



select * from book;
select CONSTRAINT_name from user_cons_columns;
select CONSTRAINT_name 
from user_cons_columns
where table_name='BOOK';

purge recyclebin; 

drop table book cascade constraint; //제약조건때문에 다른 테이블에서 이 테이블을 참조할 때 강제삭제

drop table book;
create table book(
	bookno number(5),
	title varchar2(12) unique,  //unique속성은 
	author varchar2(12),
	price number(5) check(price>0),
	pubdate date default sysdate
);

alter table book add constraint book_bookno_pk primary key(bookno);

create table dept2 as select * from dept;

alter table dept2 add constraint dept2_deptno_pk primary key(deptno);
alter table emp2 add constraint emp2_empno_pk primary key(empno);
alter table emp2 add constraint emp2_mgr_fk foreign key(mgr) reference dept2;
alter table emp2 add foreign key(deptno) references dept2;

alter table book drop constraint book_bookno_pk; //제약조건 삭제

select ename,dname,sal,grade
from emp join dept
on emp.deptno = dept.deptno
join salgrade
on sal BETWEEN losal AND hisal;

select *
from emp join dept
on emp.deptno = dept.deptno
join salgrade
on sal BETWEEN losal AND hisal;

create or replace view emp_detail
as 
select ename,dname,sal,grade
from emp join dept
on emp.deptno = dept.deptno
join salgrade
on sal BETWEEN losal AND hisal;

select * from emp_detail;

drop view emp_detail;

insert into emp3
	select * from emp where deptno = 30;
	

update emp set sal = sal * 1.1
	where deptno=10;
	
//시퀀스
create sequence bookno;
drop sequence bookno;

insert into book(bookno,title,price) values((select nvl(max(bookno),0)+1 from book),'sql',7000);
select nvl(max(bookno), 0)+1 from book;

select bookno.currval from dual;

select * from book where title='bbbb';
set autotrace on;

create index book_title on book(title);
drop index book_title;

create table book(
	bookno number(5),
	title varchar2(12),
	author varchar2(12),
	price number(5) check(price>0),
	pubdate date default sysdate
);

alter table book add constraint book_bookno_pk primary key(bookno);