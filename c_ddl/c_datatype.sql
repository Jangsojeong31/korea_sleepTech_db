# SQL의 데이터 형식
# 정수형, 문자형, 실수형, 논리형, 날짜형

/*
1. 정수형
: 숫자 데이터를 저장하는 데 사용
- 데이터 타입에 따라 메모리 사용 공간이 다름

a) tinyint (1byte: 8bit)
: -128 ~ 127
ex) 나이, 성별코드, 성적 등

b) smallint (2byte: 16bit)
: -32,768 ~ 32,767
ex) 사원번호, 우편 번호 등

c) int (4byte: 32bit)
: 약 -21억 ~ 21억
일반적인 용도로 가장 많이 사용됨
ex) 주문 번호, 고객 ID 등

d) bigint (8byte: 64bit)
: 약 -900경 ~ 900경
ex) 금융권, 천문학에서 주로 사용 / 각 테이블의 식별값

*/

create database if not exists `example`;
use `example`;

create table `integer`(
	t_col tinyint,
    s_col smallint,
    i_col int,
    b_col bigint
);

# insert 키워드: 데이터 삽입
# insert into 테이블명 value (레코드 값을 컬럼 순으로 나열, 콤마로 구분)
insert into `integer` 
values (127, 32767, 20000000, 90000000000);

select * from `integer`;

-- insert into `integer` 
-- value (128, 32767, 20000000, 90000000000);
# Out of range value of column 't_col' at row 1

# cf) unsigned: 부호가 없는 정수
# : 각 숫자형 데이터 타입의 시작을 0부터 시작
# 범위는 그대로 인식(ex. tinyint: 0 ~ 255)
# 음수 값이 없는 데이터 설정 시 사용: 키, 나이, 가격 등
create table person (
	age tinyint unsigned,
    height smallint unsigned
);

insert into person 
value (128, 32768);

select * from person;

/*
2. 문자형
: 텍스트 데이터 저장
: char(개수), varchar(개수)

cf) char: charcter 문자열
	varchar: variable character field 가변 길이 문자열
    
    a) char(개수)
    : 고정 길이 문자형, 1 ~ 255 바이트
    : 길이가 항상 일정하기 때문에 검색 속도가 빠름
    : 선언된 길이 내에서 필요한 만큼만 데이터를 저장
    - 주소, 상품명, 국가 코드(KOR, CHI, USA) 등 
    
    ex) char(10)의 10자리 중에서 3자리만 사용하는 경우, 7자리가 비워진 상태로 메모리 낭비
    
    b) varchar(개수)
    : 가변 길이 문자형, 1 ~ 1638 바이트
    : 길이가 일정하지 않아 검색 속도가 느림
    : 선언된 길이 내에서 필요한 만큼만 데이터를 저장
    - 비워진 메모리는 사라져서 메모리 누수를 방지
    - 주소, 상품명 등
    
    ex) varchar(10)의 10자리 중 3자리만 사용하는 경우, 7자리는 사라짐
    
    
    cf) 문자수와 바이트
    영어: 1바이트에 1개의 알파벳 - char(3): KOR
    한글: utf-8 인코딩 기준 한 글자당 약 3바이트 사용
    
    varchar(255): 255 / 3 = 약 85 글자
    
    cf) 다량의 텍스트 데이터 형식
    
    a) text 형식: 1 ~ 약 65000 바이트
		longtext 형식: 1 ~ 43억 바이트
	
    b) blob (binary long object): 이미지, 동영상 등의 데이터
    - 1 ~ 약 65000 바이트
    longblob: 1 ~ 약 42억 바이트
    
    
    
*/
create table `character` (
	name varchar(100),	-- 제품명(가변길이)
    category char(10),
    description text,
    image blob
);

insert into `character`
values ('Laptop', '전자제품', '삼성 갤럭시 북4 노트북 프로', 'example.com');
    
/*
3. 실수형
: 소수점이 있는 숫자를 저장할 때 사용
- float, double, decimal

a) float
	: 총 7자리까지 표현 
    - 소수점 이하는 2자리까지 가능(정수 5자리)
    ex) 시력, 가격 등

b) double
	: 총 10자리까지 표현
    - 소수점 이하는 4자리까지 가능(정수 6자리)
    ex) 구체적인 값을 표현할 수 있음
    
c) decimal | numeric
	: 고정 소수점 타입, 정밀한 소수점 계산에 필요
    
*/

create table products (
	# 실수형 데이터는 함수 형태로 사용(호출)
    # : 데이터타입(전체 자리수, 소수점 이하 자리수)
	price float(7, 2),
    price2 double(10, 4),
    price3 decimal(15, 2)
);

insert into products 
values (12345.67, 123456.7890, 99999999.999999);
    
/*
4. 논리형
: boolean 값을 저장하기 위한 데이터 타입
: 논리적으로 참(true)과 거짓(false) 값을 나타냄

cf) 비워둘 경우 null(알 수 없음, 부재한 값)으로 인식

cf) MySQL에서는 Boolean 타입이 존재하기는 하지만, 실제(내부적)으로는 tinyint(1)로 처리
>> True는 1, False는 0으로 저장됨

cf) Boolean 값에 대소문자 구분 x
*/

create table employees (
	is_Senior Boolean
);

insert into employees 
values (true); -- 1로 변환되어 저장

select * from employees;

