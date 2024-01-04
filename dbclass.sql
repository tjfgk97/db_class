use db_dbclass;

create table dept (
    deptno int,
    dname varchar(14),
    loc varchar(13)
);

create table emp (
    empno int,
    ename varchar(10),
    job varchar(9), -- 업무
    mgr int, -- 사수번호
    hiredate date, -- 입사년도
    sal int,
    comm int,
    deptno int
);

create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);


create table salgrade (
    grade int,
    losal int,
    hisal int
);

insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp; 
select * from bonus; -- 조회결과 없음
select * from salgrade;
select * from dept;

-- emp 테이블 전체 칼럼 조회
select * from emp;
-- emp 테이블의 empno, ename 컬럼만 조회
select empno, ename from emp;
-- emp 체이블의 job 컬럼만 조회
select job from emp;
-- 중복값은 한 번만 조회(distinct)
select distinct job from emp;
-- 사원 이름 조회(오름차순)
select * from emp order by ename asc;
-- 급여(sal) 기준 오름차순 정렬
select * from emp order by sal asc;
-- 급여(sal) 기준 내림차순 정렬
select * from emp order by sal desc;
-- 입사일(hiredate) 기준 오름차순 정렬
select * from emp order by hiredate asc;
-- 입사일(hiredate) 기준 내림차순 정렬
select * from emp order by hiredate desc;
-- 정렬 기준이 두가지라면 콤마로 구분
-- 입사일 기준 내림차순 정리하고 입사일이 같다면 이름 기준 오름차순 정렬
select * from emp order by hiredate desc, ename asc;

-- 조건 : 특정 데이터를 기준으로 조회하고자 할 때 
-- where
-- 직급(job)이 salesman인 사원 조회
select * from emp where job = 'salesman' ;
-- 직급(job)이 manager인 사원 조회
select * from emp where job = 'manager' ;
-- 부서번호 (deptno)가 10인 사원 조회
select * from emp where deptno = 10;
-- 이름(ename)이 james인 사원 조회
select * from emp where ename = 'james';
-- 사번(empno)이 7654인 사원 조회
select * from emp where empno = 7654;

-- 조건이 2가지 이상
-- 직급이 manager이고 부서번호가 20인 사원
select * from emp where job = 'manager' AND deptno = 20;
-- 직급이 salesman이거나 clerk인 사원
select * from emp where job = 'salesman' or job = 'clerk';
-- 급여(sal)가 3000 이상인 사원
select * from emp where sal >= 3000;
-- 급여가 1000 이상 3000 이하인 사원
select * from emp where sal >= 1000 AND sal <= 3000;
-- 급여가 1000 미만이거나 3000 초과인 사원
select * from emp where sal not between 1000 and 3000;
-- 급여가 3000 이하인 사원 조회 결과를 sal 기준으로 오름차순 정렬
select * from emp where sal <= 3000 order by sal asc;
-- 직급이 slaesman이 아닌 사원
select * from emp where job != 'salesman';
select * from emp where not job = 'salesman';
-- 입사일자(hiredate)가 81년 4월 1일 이후인 사원
select * from emp where hiredate > '1981-04-01';
select * from emp where hiredate > '1981-04-01' order by hiredate asc;
-- str_to_date() : 문자를 날짜형으로 변환하는 함수
select * from emp where hiredate > str_to_date('1981-04-01', '%Y-%m-%d');

-- like 연산자
select * from emp where ename like 'm%'; -- martin, miller
select * from emp where ename like '%m'; -- 결과 없음
select * from emp where ename like '%m%'; -- smith, martin, adams, james, miller
select * from emp where ename like '_m%';
select * from emp where ename like '__m%';
-- 김 씨 성의 이름이 세 글자인 사원 
select * from emp where ename like '김__';
-- 이 씨 성의 이름이 두 글자인 사원
select * from emp where ename like '이_';
-- 이름이 세 글자인 사원 중에서 이름 중간에 '가'가 있는 사원
select * from emp where ename like '_가_';

-- 함수
-- sum(), avg(), max(), min(), count()
-- 급여총합
select sum(sal) from emp;
select sum(sal) as '급여총합' from emp;
-- salesman 급여 총합
select sum(sal) as 'salesman 급여총합' from emp where job = 'salesman';
-- 평균 급여 조회
-- 평균값을 소수 둘째자리까지만 조회하려면
-- round() 함수
-- dual : 문장을 완성하기 위한 가상의 테이블
select round(12.3456, 2) from dual; -- 12.35
select round(12.3456, 1) from dual; -- 12.3
select round(12.3456, 0) from dual; -- 12
select round(12.567, 0) from dual; -- 13
select sysdate() from dual;

select round(avg(sal), 2) from emp;

-- 가장 많은 급여
select max(sal) from emp;
-- 가장 적은 급여
select min(sal) from emp;
-- 전체 사원 수
select count(*) from emp;
-- 부서번호가 20인 사원 수
select count(*) from emp where deptno = 20;

-- 그룹화(grouping, 특정 컬럼을 기준으로 동일한 데이터끼리 묶는 것)
-- 그룹화한 결과를 조회할 때는 그룹화한 컬럼으로 조회만 가능
-- job을 기준으로
-- 그룹화하지 않은 컬럼은 조회 불가능
select * from emp group by job;
select job from emp group by job;
-- 직급별 평균 급여
select job, avg(sal) from emp group by job;
-- 직급이 clerk인 사원들의 평균 급여
select job, avg(sal) from emp where job = 'clerk';
-- 부서(deptno)별 평균급여
select deptno, avg(sal) from emp group by deptno;
-- 직급별 사원수
select job, count(*) from emp group by job;
-- 직급별 평균급여, 사원수
select job, avg(sal), count(*) from emp group by job;
-- 위의 결과에서 직급기준 오름차순 정렬
select job, avg(sal), count(*) from emp group by job order by job asc;
-- 위의 결과에서 평균 급여 소수 첫째자리까지
select job, round(avg(sal),1), count(*) from emp group by job order by job asc;
-- 위의 결과에서 job은 '직급' 급여 평균값은 '평균 급여', 사원수는 '사원수'로 표현하여 조회
select job as '직급', round(avg(sal),1) as '평균 급여', count(*) as '사원수' from emp group by job order by job asc;

-- 두 개 이상 컬럼 그룹화
-- deptno를 기준으로 그룹화하고 그 결과 내에서 job 기준으로 그룹화
select deptno, job from emp group by deptno, job;
select deptno, job, count(*) from emp group by deptno, job;
select deptno, job, count(*), avg(sal) from emp group by deptno, job;

-- 그룹화한 결과에 조건을 적용
-- having
-- 위의 결과에서 평균 급여가 2000 이상인 결과만 조회
select deptno, job, count(*), avg(sal)
from emp 
group by deptno, job
having avg(sal) >= 2000
order by deptno asc;

-- 급여가 3000 이하인 사원만 가지고 부서별, 직급별 그룹화를 하고 평균 급여가 2000 이상인 결과 조회
select deptno, job, count(*), avg(sal)
from emp
where sal <= 3000
group by deptno, job
having avg(sal) >= 2000
order by deptno asc;

-- date 타입을 문자로 표현 : date_format()
select date_format(hiredate, '%Y') from emp;

/*
	연습문제
	1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
*/
-- 1번문제
select deptno as '직급', round(avg(sal), 1) as '평균 급여', max(sal) as '최고 급여', min(sal) as '최저 급여', count(*) as '사원수' from emp group by deptno;
-- 2번문제
select job, count(empno) from emp group by job having count(empno) >= 3;
-- 3번문제(조회결과와 group by절은 일치해야한다.)
select date_format(hiredate, '%Y') as '입사년도', count(*) as '사원수'
from emp 
group by date_format(hiredate, '%Y');

-- 3-1번문제
select date_format(hiredate, '%Y') as '입사년도', deptno as '부서번호', count(empno) as '사원수'
from emp 
group by date_format(hiredate, '%Y'), deptno
order by date_format(hiredate, '%Y') asc;

-- 조인(join)
-- 두 개 이상의 테이블을 하나의 테이블처럼 사용할 때 
select * from emp;
select * from dept;
select * from emp, dept;
-- 내부조인(inner join)
-- 조인하려는 두 테이블에 공통 컬럼이 존재해야 함. 
select * from emp, dept where emp.deptno = dept.deptno;
-- 테이블 이름을 줄여서 사용 
select * from emp e, dept d where e.deptno = d.deptno;
-- deptno 컬럼은 두 테이블에 모두 있기 때문에 ambiguous 에러
select empno, ename, job, deptno, dname, loc 
from emp e, dept d 
where e.deptno = d.deptno;
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc 
from emp e, dept d 
where e.deptno = d.deptno;
-- emp 테이블 전체 조회 
select e.* from emp e, dept d where e.deptno = d.deptno;
-- emp, dept를 조인하여 empno, ename, deptno, dname, loc 조회
-- (단, 급여가 2500 이상인 사원만 조회하고, 조회결과는 사원이름 기준으로 오름차순 정렬)
select e.empno, e.ename, e.deptno, d.dname, d.loc 
from emp e, dept d where e.deptno = d.deptno and e.sal >= 2500
order by e.ename asc;

-- 서브쿼리(sub query)
-- 하나의 쿼리문 안에서 다른 쿼리문을 수행하는 것
-- 최저 급여를 받는 사원의 이름
select * from emp;
-- 1.최저급여가 얼마인지 -> 800
select min(sal) from emp;
-- 2.800 급여를 받는 사원의 이름 -> smith
select ename from emp where sal = 800;
-- 위의 두 문장을 서브쿼리로
select ename 
from emp
where sal = (select min(sal) from emp);
-- 최고 급여를 받는 사원의 정보 조회
select *
from emp
where sal = (select max(sal) from emp);
-- allen 보다 높은 급여를 받는 사원 조회
select *
from emp
where sal > (select sal from emp where ename = 'allen');

/*
	연습문제 
    1. clark 보다 늦게 입사한 사원 조회 
    2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
*/

-- 1. clark 보다 늦게 입사한 사원 조회 
select * 
from emp
where hiredate > (select hiredate from emp where ename = 'clark');

-- 2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
select *
from emp
where deptno = 20 AND sal > (select avg(sal) from emp);

-- 3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
select e.*, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno AND e.deptno = 20 AND sal > (select avg(sal) from emp);

--  4. martin과 같은 부서 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
select * 
from emp
where deptno = (select deptno from emp where ename = 'martin') AND sal > (select avg(sal) from emp);

-- 제약조건
-- id, member_email, member_password 컬럼이 있는 테이블
drop table if exists member1;
create table member1 (
	id bigint,
    member_email varchar(20),
    member_password varchar(20)
);
insert into member1(id, member_email, member_password) values(1, 'aa@aa.com', '1234');
-- 모든 컬럼에 값을 다 넣을 때는 컬럼 이름 생략 가능
insert into member1 values(2, 'bb@bb.com', '1234');
-- 특정 컬럼만 값을 넣을 때는 
insert into member1 values(3, 'cc@cc.com');
insert into member1(id, member_email) values(3, 'cc@cc.com');
select * from member1;

-- not null
drop table if exists member2;
create table member2(
	id bigint not null,
    member_email varchar(20),
    member_password varchar(20)
);
select * from member2;
insert into member2(id, member_email, member_password) values(1, 'aa@aa.com', '1234');
-- id를 제외하고 나머지 값만 입력
insert into member2(member_email, member_password) values('bb@bb.com', '1234');
insert into member2(id, member_email, member_password) values(null, 'cc@cc.com', '1234');
insert into member2(id, member_email, member_password) values(4, null, '1234');

-- unique
drop table if exists member3;
create table member3 (
	id bigint not null unique,
    member_email varchar(20) not null,
    member_password varchar(20) not null
); 
select * from member3;
insert into member3(id, member_email, member_password) values(1, 'aa@aa.com', '1234');
insert into member3(id, member_email, member_password) values(1, 'bb@bb.com', '1234');
insert into member3(id, member_email, member_password) values(2, 'aa@aa.com', null);

-- 
drop table if exists member4;
create table member4 (
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(20) not null,
    created_at datetime
); 
select * from member4;
insert into member4(id, member_email, member_password, created_at) values(1, 'aa@aa.com', '1234', now());
insert into member4(id, member_email, member_password) values(2, 'bb@bb.com', '1234');

-- default
drop table if exists member5;
create table member5 (
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(20) not null,
    created_at datetime default now()
); 
select * from member5;
insert into member5(id, member_email, member_password, created_at) values(1, 'aa@aa.com', '1234', now());
-- default로 지정한 컬럼은 따로 값을 주지 않아도 값이 default로 지정한 값으로 저장됨
insert into member5(id, member_email, member_password) values(2, 'bb@bb.com', '1234');

-- primary key
drop table if exists member6;
create table member6 (
	id bigint primary key,
    member_email varchar(20) not null unique,
    member_password varchar(20) not null,
    created_at datetime default now()
);
select * from member6;
insert into member6(id, member_email, member_password) values(1, 'aa@aa.com', '1234');
insert into member6(id, member_email, member_password) values(2, 'bb@bb.com', '1234');

drop table if exists member7;
create table member7 (
	id bigint,
    member_email varchar(20) not null unique,
    member_password varchar(20) not null,
    created_at datetime default now(),
    constraint pk_member7 primary key(id)
);

-- 자동 번호 적용하기(auto_increment는 pk 컬럼에만 지정 가능)
drop table if exists member8;
create table member8 (
	id bigint auto_increment,
    member_email varchar(20) not null unique,
    member_password varchar(20) not null,
    created_at datetime default now(),
    -- id bigint auto_increment, -- 일반 컬럼에는 지정 불가
    constraint pk_member8 primary key(id)
);
select * from member8;
-- auto_increment를 지정하면 값을 따로 주지 않아도 됨
insert into member8(member_email, member_password) values('aa@aa.com', '1234');
insert into member8(member_email, member_password) values('bb@bb.com', '1234');

-- 참조관계
drop table if exists parent1;
create table parent1 (
	id bigint primary key,
	p1 varchar(10),
	p2 varchar(20)
);

drop table if exists child1;
create table child1(
	id bigint primary key,
    c1 varchar(10),
    c2 varchar(20),
    p_id bigint, -- 참조할 컬럼
    -- 외래키 지정(p_id 컬럼을 parent1 테이블의 id 컬럼을 참조하도록 함)
    constraint fk_child1 foreign key(p_id) references parent1(id)
);

insert into parent1(id, p1, p2) values(1, 'aa', 'aa');
insert into parent1(id, p1, p2) values(2, 'bb', 'bb');
insert into parent1(id, p1, p2) values(4, 'dd', 'dd');

select * from parent1;
select * from child1;

insert into child1(id, c1, c2, p_id) values(1, 'aaa', 'aaa', 1);
-- 부모 id 컬럼에 없는 값을 p_id에 저장
-- ↓↓ 부모 테이블에 없는 값을 저장하려 했기 때문에 실행되지 않는다.↓↓
insert into child1(id, c1, c2, p_id) values(2, 'bbb', 'bbb', 3);
-- ↓↓ 부모 테이블에 값(3) 추가↓↓
insert into parent1(id, p1, p2) values(3, 'cc', 'cc');
-- ↓↓ 제대로 실행되는 것을 확인할 수 있다. ↓↓
insert into child1(id, c1, c2, p_id) values(3, 'ccc', 'ccc', 3);

-- 부모 테이블의 데이터 삭제
-- id = 2인 데이터 한 줄을 삭제
-- 자식 테이블에 id = 2인 데이터를 참조하는 부분이 있기 때문에 삭제 불가
delete from parent1 where id = 2;
-- 자식 테이블에 id = 4인 데이터를 참조하는 부분이 없기 때문에 삭제 가능
delete from parent1 where id = 4;
-- 자식 테이블의 부모 id = 2를 참조하는 데이터 삭제
delete from child1 where id = 2;

drop table if exists parent2;
create table parent2 (
	id bigint primary key,
	p1 varchar(10),
	p2 varchar(20)
);

drop table if exists child2;
create table child2(
	id bigint primary key,
    c1 varchar(10),
    c2 varchar(20),
    p_id bigint, -- 참조할 컬럼
    -- 외래키 지정(p_id 컬럼을 parent1 테이블의 id 컬럼을 참조하도록 함)
    constraint fk_child2 foreign key(p_id) references parent2(id) on delete cascade
);

insert into parent2(id, p1, p2) values(1, 'aa', 'aa');
insert into parent2(id, p1, p2) values(2, 'bb', 'bb');
insert into parent2(id, p1, p2) values(3, 'cc', 'cc');
insert into parent2(id, p1, p2) values(4, 'dd', 'dd');
select * from parent2;

insert into child2(id, c1, c2, p_id) values(1, 'aaa', 'aaa', 1);
insert into child2(id, c1, c2, p_id) values(2, 'bbb', 'bbb', 2);
insert into child2(id, c1, c2, p_id) values(3, 'ccc', 'ccc', 3);
insert into child2(id, c1, c2, p_id) values(4, 'ccc', 'ccc', 4);
select * from child2;

delete from parent2 where id = 3;

drop table if exists parent3;
create table parent3 (
	id bigint primary key,
	p1 varchar(10),
	p2 varchar(20)
);

drop table if exists child3;
create table child3(
	id bigint primary key,
    c1 varchar(10),
    c2 varchar(20),
    p_id bigint, -- 참조할 컬럼
    -- 외래키 지정(p_id 컬럼을 parent1 테이블의 id 컬럼을 참조하도록 함)
    constraint fk_child3 foreign key(p_id) references parent3(id) on delete set null
);

insert into parent3(id, p1, p2) values(1, 'aa', 'aa');
insert into parent3(id, p1, p2) values(2, 'bb', 'bb');
insert into parent3(id, p1, p2) values(3, 'cc', 'cc');
insert into parent3(id, p1, p2) values(4, 'dd', 'dd');
select * from parent3;


insert into child3(id, c1, c2, p_id) values(1, 'aaa', 'aaa', 1);
insert into child3(id, c1, c2, p_id) values(2, 'bbb', 'bbb', 2);
insert into child3(id, c1, c2, p_id) values(3, 'ccc', 'ccc', 3);
insert into child3(id, c1, c2, p_id) values(4, 'ccc', 'ccc', 4);
select * from child3;

-- 수정 쿼리
update child3 set c1 = '수정내용' where id = 2;
update child3 set c1 = '수정내용', c2 = 'ㅎㅎㅎ' where id = 3;

-- 예제문제
create table book(
	id bigint auto_increment,
    b_bookname varchar(20),
    b_publisher varchar(15),
	b_price int,
    constraint pk_book_id primary key(id)
);

insert into book(b_bookname, b_publisher, b_price) values('축구 역사', '좋은출판사', 7000);
insert into book(b_bookname, b_publisher, b_price) values('축구 리포트', '나무출판사', 13000);
insert into book(b_bookname, b_publisher, b_price) values('축구를 알려주마', '대한출판사', 22000);
insert into book(b_bookname, b_publisher, b_price) values('배구의 바이블', '대한출판사', 35000);
insert into book(b_bookname, b_publisher, b_price) values('피겨 교과서', '좋은출판사', 8000);
insert into book(b_bookname, b_publisher, b_price) values('피칭의 단계별 기술', '좋은출판사', 6000);
insert into book(b_bookname, b_publisher, b_price) values('야구의 추억 이야기', '나이스미디어', 20000);
insert into book(b_bookname, b_publisher, b_price) values('야구 읽어주는 남자', '나이스미디어', 13000);
insert into book(b_bookname, b_publisher, b_price) values('올림픽 스토리', '이야기당', 7500);
insert into book(b_bookname, b_publisher, b_price) values('olympic history', 'strawberry', 13000);

create table customer(
	id bigint auto_increment,
    c_name varchar(5),
    c_address varchar(10),
    c_phone varchar(15),
    constraint pk_customer_id primary key(id)
);

insert into customer(c_name, c_address, c_phone) values('손흥민', '영국 런던', '000-5000-0001');
insert into customer(c_name, c_address, c_phone) values('김연아', '대한민국 서울', '000-6000-0001');
insert into customer(c_name, c_address, c_phone) values('김연경', '대한민국 서울', '000-7000-0001');
insert into customer(c_name, c_address, c_phone) values('류현진', '캐나다 토론토', '000-8000-0001');
insert into customer(c_name, c_address, c_phone) values('이강인', '프랑스 파리', null);

create table orders(
	id bigint auto_increment primary key,
	customer_id bigint,
    book_id bigint,
    o_saleprice int,
    o_orderdate date,
    constraint fk_customer_id foreign key(customer_id) references customer(id),
    constraint fk_book_id foreign key(book_id) references book(id)
);

insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(1, 1, 6000, '2023-07-01');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(1, 3, 21000, '2023-07-03');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(2, 5, 8000, '2023-07-03');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(3, 6, 6000, '2023-07-04');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(4, 7, 20000, '2023-07-05');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(1, 2, 12000, '2023-07-07');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(4, 8, 13000, '2023-07-07');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(3, 10, 12000, '2023-07-08');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(2, 10, 7000, '2023-07-09');
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values(3, 8, 13000, '2023-07-10');

select * from book;
select * from customer;
select * from orders;

-- 1. 모든 도서의 가격과 도서명 조회 
select b_price, b_bookname from book;
-- 2. 모든 출판사 이름 조회 
select b_publisher from book;
-- 2.1 중복값을 제외한 출판사 이름 조회 
select distinct b_publisher from book;
-- 3. BOOK테이블의 모든 내용 조회 
select * from book;
-- 4. 20000원 미만의 도서만 조회 
select * from book where b_price < 20000;
-- 5. 10000원 이상 20000원 이하인 도서만 조회
select * from book where b_price >= 10000 AND b_price <= 20000;
select * from book where b_price between 10000 and 20000; -- (이상/이하만 사용 가능(초과/미만은 사용 불가능))
-- 6. 출판사가 좋은출판사 또는 대한출판사인 도서 조회 
select * from book where b_publisher = '좋은출판사' OR b_publisher = '대한출판사';
select * from book where b_publisher in('좋은출판사', '대한출판사');
-- 7. 도서명에 축구가 포함된 모든 도서를 조회
select * from book where b_bookname like '%축구%';
-- 8. 도서명의 두번째 글자가 구인 도서 조회
select * from book where b_bookname like '_구%';
-- 9. 축구 관련 도서 중 가격이 20000원 이상인 도서 조회
select * from book where b_bookname like '%축구%' AND b_price >= 20000;
-- 10. 책 이름순으로 전체 도서 조회
select * from book order by b_bookname asc;
select * from book order by b_bookname desc;
-- 11. 도서를 가격이 낮은 것 부터 조회하고 같은 가격일 경우 도서명을 가나다 순으로 조회
select * from book order by b_price asc, b_bookname asc;

-- 12. 주문 도서의 총 판매액 조회 
select sum(o_saleprice) from orders;
-- 13. 1번 고객이 주문한 도서 총 판매액 조회 
select sum(o_saleprice) from orders where customer_id = 1;
-- 14. ORDERS 테이블로부터 평균판매가, 최고판매가, 최저판매가 조회 
select avg(o_saleprice), max(o_saleprice), min(o_saleprice) from orders;
-- 15. 고객별로 주문한 도서의 총 수량과 총 판매액 조회 (GROUP BY 활용)
select customer_id, count(*), sum(o_saleprice) from orders group by customer_id;
-- 16. 가격이 8,000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량 조회 (GROUP BY 활용)
--    (단, 8,000원 이상 도서 두 권 이상 구매한 고객만) 
select customer_id, count(*) 
from orders
where o_saleprice >= 8000 
group by customer_id 
having count(*) >= 2;
-- 17. 김연아고객(고객번호 : 2) 총 구매액
select sum(o_saleprice) from orders where customer_id = 2;
-- 서브쿼리 사용
select sum(o_saleprice) 
from orders 
where customer_id = (select id from customer where c_name = '김연아');

-- 18. 김연아고객(고객번호 : 2)이 구매한 도서의 수
select count(*) from orders where customer_id = 2;
-- 서브쿼리 사용
select count(*) 
from orders 
where customer_id = (select id from customer where c_name = '김연아');

-- 19. 서점에 있는 도서의 총 권수
select count(*) from book;
-- 20. 출판사의 총 수 
select count(b_publisher) from book;
-- 중복 제거
select count(distinct b_publisher) from book;

-- 21. 7월 4일 ~ 7일 사이에 주문한 도서의 주문번호 조회 
select * from orders where o_orderdate between '2023-07-04' AND '2023-07-07';
select * from orders where o_orderdate between str_to_date('2023-07-04', '%Y-%m-%d') AND str_to_date('2023-07-07', '%Y-%m-%d');
-- 22. 7월 4일 ~ 7일 사이에 주문하지 않은 도서의 주문번호 조회
select * from orders where o_orderdate not between '2023-07-04' AND '2023-07-07';
select * from orders where o_orderdate not between str_to_date('2023-07-04', '%Y-%m-%d') AND str_to_date('2023-07-07', '%Y-%m-%d');