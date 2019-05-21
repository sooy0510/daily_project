select * from departments;

select e.employee_id 사번, e.first_name 이름, d.department_name 부서명, m.first_name "매니저 이름"
from employees e, employees m, departments d
where e.department_id = d.department_id
and e.manager_id = m.employee_id;

select e.last_name, e.salary
from employees e
where e.salary >
(select m.salary from employees m 
where e.manager_id = m.employee_id);

select first_name, last_name, salary
from employees inner join jobs
on employees.job_id = jobs.job_id
and job_title = 'Sales Representative'
where salary between 9000 and 10000;

select e.employee_id, e.last_name, e.hire_date
from employees e
where e.hire_date < 
(select m.hire_date from employees m
where e.manager_id = m.employee_id);


select distinct j.job_title, d.department_name
from employees e join jobs j
on e.job_id = j.job_id
join departments d
on e.department_id = d.department_id
order by 1;

select to_char(hire_date,'mm') 월, count(*)
from employees
group by to_char(hire_date,'mm')
order by 1;

select e.first_name 직원이름, e.hire_date 입사일, m.employee_id 관리자사번, m.first_name 관리자이름
from employees e left outer join employees m
on e.manager_id = m.employee_id
where to_char(e.hire_date,'yy') = '08';


select e.employee_id, e.first_name, e.last_name, nvl(d.department_name, '<NOT ASSIGNED>')
from employees e, departments d
where e.department_id = d.department_id
and to_char(hire_date,'yyyy') = '2004';


select e.first_name 직원이름, e.hire_date 입사일, m.employee_id 관리자사번, m.first_name 관리자이름
from employees e left outer join employees m
on e.manager_id = m.employee_id
where to_char(e.hire_date,'yyyy') = '2005';

select e.first_name, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and d.department_name = 'Sales';
