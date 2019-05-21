select * from emp;

select
from
where
order by

select ename, hiredate from emp;

select ename, to_char(hiredate,'yy') from emp;

select ename, hiredate, to_date(hiredate,'yy') from emp;

select lower(ename), hiredate, substr(hiredate, 1,2) from emp;

select round(55.55,1) from dual;
select trunc(55.55,1) from dual;

select deptno, ename, sal, comm,
DECODE(deptno ,10, sal*1.1,20, sal*1.2,30, sal*1.3, sal) "sal*1.1",
DECODE(deptno ,10, '1.1',20, '1.2',30, '1.3', 0)
from emp
order by deptno;


select deptno, ename, sal, comm,
DECODE(deptno ,10, sal*1.1,20, sal*1.2, sal) "인센티브",
DECODE(deptno ,10, '1.1',20, '1.2',30, 0) "인센티브 지급률"
from emp
order by deptno;

select empno, ename, NVL2(to_char(mgr), 'O', 'X')
from emp;

select * from emp, dept;

select * from emp, dept
where emp.deptno = dept.deptno;

select empno, ename, emp.deptno, mgr from emp, dept
where emp.deptno = dept.deptno;

select ename, job, dname, loc
from emp, dept
where emp.deptno = dept.deptno;

select ename, job, dept.deptno,dname, loc
from emp, dept
where emp.deptno = dept.deptno;


select ename, job, e.deptno,dname, loc
from emp e, dept d
where e.deptno = d.deptno;

select ename, job, e.deptno,dname, loc
from emp e JOIN dept d
On e.deptno = d.deptno;

 select ename, job, e.deptno,dname, loc
from emp e INNER JOIN dept d
 On e.deptno = d.deptno;

select ename, job, dname, sal
from emp e JOIN dept d
 On e.deptno = d.deptno
 and sal >=2000;

 select ename, job, dname, sal
from emp e INNER JOIN dept d
 On e.deptno = d.deptno
 and sal >=2000;

select ename, job, dname, sal
from emp e , dept d
 where e.deptno = d.deptno
 and sal >=2000;

select ename, job, d.deptno,dname, loc
from emp e, dept d
where e.deptno(+) = d.deptno;

select ename, job, e.deptno,dname, loc
from emp e, dept d
where e.deptno = d.deptno(+);


 select ename, job, e.deptno,dname, loc
from emp e RIGHT OUTER JOIN dept d
 On e.deptno = d.deptno;

select * from salgrade;

select ename, job, sal, grade 등급
from emp e, salgrade s
where sal BETWEEN losal AND hisal;

select ename, job, sal, grade 등급
from emp e JOIN salgrade s
On sal BETWEEN losal AND hisal; /*non equal join*/

select e.empno, e.ename 사원이름 , e.mgr, a.empno, a.ename 상사이름
from emp e, emp a
where e.mgr = a.empno;

select e.empno, e.ename 사원이름 , e.mgr, a.empno, a.ename 상사이름
from emp e, emp a
where e.mgr = a.empno(+);

select e.empno, e.ename 사원이름 , e.mgr, a.empno, a.ename 상사이름
from emp e LEFT OUTER JOIN emp a
ON e.mgr = a.empno;

select e.empno, e.ename 사원이름 , NVL(to_char(e.mgr),'-'), NVL(to_char(a.empno),'-'), NVL(to_char(a.ename),'CEO') 상사이름
from emp e LEFT OUTER JOIN emp a
ON e.mgr = a.empno;


select e.ename 사원이름,e.hiredate,m.ename 상사이름, m.hiredate
from emp e left join emp m
on e.mgr=m.empno
where e.hiredate < m.hiredate;

select e.ename 사원이름,e.sal,m.ename 상사이름, m.sal
from emp e left join emp m
on e.mgr=m.empno
where e.sal > m.sal;

select e.ename 사원이름,e.sal,m.ename 상사이름, m.sal
from emp e, emp m
where e.mgr = m.empno and e.sal > m.sal;






집계함수

select ename, round(sal) from emp;
select avg(sal) from emp;
select count(sal), count(comm), count(*), count(mgr) from emp;

select count(job) from emp;
select count(distinct job) from emp;

select sum(sal),count(*),round(sum(sal)/count(*),2)평균, round(avg(sal),2) from emp;

select sum(sal),count(*), round(avg(sal),2)평균 
from emp
where deptno=30;

select deptno,sum(sal),count(*), round(avg(sal),2)평균 
from emp
group by deptno order by deptno;

select deptno,max(sal),min(sal),count(*), round(avg(sal),2)평균 
from emp
group by deptno order by deptno;

select deptno,max(sal),min(sal),count(*), round(avg(sal),2)평균 
from emp
group by deptno;

select e.deptno, d.dname, count(*), avg(sal) 평균
from emp e, dept d
where e.deptno = d.deptno and e.sal>2000
group by e.deptno,dname
order by 평균;

select * from emp where lower(ename) like '%'||'j'||'%';
select * from emp where lower(ename) like '%j%';

select e.deptno, d.dname, count(*), avg(sal) 평균
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno,dname
having avg(sal)>2000
order by 평균;


select ename,dname,sal,grade
from emp,dept,salgrade
where emp.deptno = dept.deptno and sal BETWEEN losal AND hisal;

p265 참조 세개 이상의 테이블 안시조인 결합
select ename,dname,sal,grade
from emp join dept
on emp.deptno = dept.deptno
join salgrade
on sal BETWEEN losal AND hisal;

select deptno, avg(sal)
from emp
having avg(sal)> 2000
group by deptno;



서브쿼리
select sal
from emp
where ename='FORD';

select * from emp where sal>3000;

select * 
from emp
where sal > (select sal from emp where ename='FORD');

select * 
from emp
where sal < (select round(avg(sal)) from emp);

select * 
from emp
where sal=(select min(sal) from emp);

select min(sal) from emp group by deptno;

select *
from emp
where sal in (select min(sal) from emp group by deptno);

select * 
from emp outer
where sal < (select avg(sal) from emp where deptno=outer.deptno);

select rownum,ename, job, sal
from emp;

select rownum,ename, job, sal
from emp
order by sal;

select rownum,ename, job, sal
from (select * from emp order by sal desc);  //sort뒤에 rownum

select rownum,ename,job,sal
from (select * from emp order by sal desc)
where rownum<4;

select rownum,ename,job,sal
from (select * from emp order by sal desc)
where rownum between 1 and 4;

select row#,ename,job,sal
from
(
	select rownum row#,ename,job,sal
	from (select * from emp order by sal desc)
)where row# between 4 and 7;


select row#, ename, job, sal
from(
	select rownum row#, ename, job, sal
	from(select * from emp where hiredate like '81%' order by sal desc)
)where row# <4;


select * 
from emp
where (deptno, sal) in (select deptno, max(sal) from emp group by deptno);