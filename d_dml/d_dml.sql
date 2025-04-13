# DML(Data Manipulation(조작) Language) - 데이터 조작(관리) 언어
# : 데이터를 삽입, 조회, 수정, 삭제 (CRUD)

create database if not exists `company`;
use `company`;

create table `example01` (
	name varchar(100),
    age int, 
    major varchar(100)
);

/*
	1. 데이터 삽입 (insert)
    : 테이블에 행 데이터(레코드)를 입력하는 키워드
    
    # 기본 형식 #
    insert into 테이블명(열1, 열2, ...)
    values (값1, 값2, ...)
    
    cf) 열 이름 나열을 생략할 경우 values 뒤의 값 순서는
    , 테이블 정의 시 지정한 열의 순서 & 개수와 동일
    ex) 생략 시 name, age, major 순
    
    cf) 전체 테이블의 컬럼의 순서 & 개수와 차이가 나는 경우, 반드시 열 이름 나열하기
    
*/

# 1) 컬럼명 지정 x
insert into `example01`
values 
	('최서윤', 23, '코리아');

-- insert into `example01`
-- values 
-- 	('최서윤', '코리아', 23);
# 컬럼의 순서가 틀림

# 2) 컬럼명 지정 O
insert into `example01` (major, name, age)
values
	('코리아', '장소정', 23);
    
# cf) 데이터 삽입 시 데이터 값 입력을 하지 않은 경우 
# - Null 허용: 자동 Null 값 지정
# - Not Null: 오류 발생

# cf) auto_increment
# : 열을 정의할 때 1부터 1씩 증가하는 값을 입력
# - insert에서는 해당 열이 없다고 가정
# - 해당 옵션이 지정된 컬럼은 반드시 PK로 지정! (== 하나의 테이블에 한번만 지정 가능)

create table `example02` (
	-- 컬럼명 데이터타입 primary key auto_imcrement
    id int auto_increment primary key,
    name varchar(100)
);

insert into `example02` (name)
values 
	('박미진'),
	('최낙원'),
	('권형준');

select * from `example02`;

insert into `example02`
values 
	(null, '임재혁');

select * from `example02`;

# cf) auto_increment 최대값 확인
# select max(auto_increment컬럼명) from '테이블명';
select max(id) from `example02`; 
# 활용 ex) 총 회원수를 알 수 있다.

# cf) 시작 값 변경
alter table `example02` auto_increment=100;

insert into example02
values
	(null, '오선우');
    
select * from `example02`;

# cf) 다른 테이블의 데이터를 한번에 삽입하는 구문
# insert into '삽입받을 테이블'
# select ~
# >> 조회한 데이터를 insert 로 삽입한다
create table `example03` (
	id int,
    name varchar(100)
);

insert into `example03`
select * from `example02`;

select * from `example03`;

/*
 2. 데이터 수정(update)
 : 테이블의 내용을 수정
 
 # 기본 형태 #
 update '테이블명'
 set 열1=값1, 열2=값2,...
 (where 조건);
 
 cf) where 조건이 없는 경우
	, 해당 열(컬럼)의 데이터는 해당 값로 모두 변경
 
*/

-- update `example02`
-- set name='이준우'; 
# where 조건이 없으면 safe mode로 인해 오류 발생: safe mode 해제 시 실행 가능
# safe mode 해제 코드)
set sql_safe_updates=0; -- (0: 해제 / 1: 설정)

update `example02`
set name='이승아'
where id=1;

select * from `example02`;

# cf) 여러 컬럼의 값을 

/*
	3. 데이터 삭제: delete
    
    # 기본 형태 #
    delete from '테이블명'
    where 조건;
    
*/
-- delete from `example02`
-- where name='이승아';
# safe mode에서는 오류 발생: key(PK)값을 사용해야만 삭제 가능

delete from `example02`
where id=1;

select * from `example02`;




    

    
    

    

