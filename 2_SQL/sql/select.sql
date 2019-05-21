select * from DEPT;
select * from departments;
select empno,ename,job,hiredate,deptno from emp;

select ename as 사원명,job as 업무,sal as 급여,comm as 수당 from emp;

select ename as 사원명,job as "업 무",sal as 급여,comm as 수당 from emp;

select distinct job from emp;

select ename,sal*12 "연봉" from emp;
select ename,sal,comm,sal+comm from emp;

select ename,sal,sal+nvl(comm,0) from emp;

select ename,nvl(mgr,'없음') from emp;
select ename,nvl(to_char(mgr),'없음')as 상사 from emp;
select ename,nvl(mgr,0) from emp;

select ename,mgr,'sql' from emp;
select ename,sal,comm,sal+nvl(comm,0) as 지급액,'원' from emp;
select ename,sal,comm,sal+nvl(comm,0)||'원' as 지급액 from emp;

select ename,job,hiredate,deptno from emp;
select ename||job||hiredate,deptno from emp;

select sysdate from emp;
select sysdate from dept;
select sysdate from dual;
select sysdate,3+7+8 from dual;

select * from emp;
select * from emp where sal>3000;
select * from emp where job='MANAGER';
select * from emp where upper(job)=UPPER('manager');
select * from emp where upper(job)!=UPPER('manager');
select * from emp where hiredate>'81/05/01';

select * from emp where sal>2000 and sal<=3000;
select * from emp where deptno=10 or deptno=20;
select * from emp where deptno in(10,20);

select * from emp where deptno !=10 and deptno!=20;
select * from emp where deptno not in(10,20);
select * from emp where deptno <> all(10,20);

select * from dept;
select * from dept where deptno=20 and loc='DALLAS';
select * from dept where deptno=30 and loc='CHICAGO';
select * from dept where (deptno=20 and loc='DALLAS') or (deptno=30 and loc='CHICAGO');
select * from dept where (deptno,loc) in ((20,'DALLAS'),(30,'CHICAGO'));

select * from emp where ename='KING';
select * from emp where job='S%';
select * from emp where job like 'S%';
select * from emp where upper(ename) like '%'||upper('m')||'%';

select * from emp where hiredate like '82%';
select * from emp where hiredate between '82/01/01' and '82/12/31';

select * from emp where comm is null;
select * from emp where comm is not null;

select * from emp;
select * from emp order by deptno;
select * from emp order by deptno desc;
select * from emp order by 1;
select * from emp order by 5,deptno;

select ename,sal,comm,sal+nvl(comm,0) as total from emp;
select ename,sal,comm,sal+nvl(comm,0) as total from emp where sal+nvl(comm,0)>3000;

select ename,sal,comm,sal+nvl(comm,0) as total 
from emp 
where sal+nvl(comm,0)>1000
order by total;

select sysdate from dual;
select sysdate, to_char(sysdate,'MM') from dual;
select sysdate, to_char(sysdate,'YYYY') from dual;

select to_char(hiredate, 'MM') from emp;
select to_char(hiredate, 'DAY') from emp;

INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

insert into emp values(9999,'java01','CLERK',7782,sysdate,900,null,10);

insert into emp values(9999,'java01','CLERK',7782,'19/05/13',900,null,10);

insert into emp values(9999,'java01','CLERK',7782,to_date('05/13/19','mm/dd/yy'),900,null,10); //실패

rollback;

CREATE TABLE Goods(goods_id CHAR(4) NOT NULL, goods_name VARCHAR(100) NOT NULL, PRIMARY KEY (goods_id));
