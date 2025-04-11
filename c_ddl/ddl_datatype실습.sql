# DDL: 데이터 정의 언어
# DB와 테이블의 구조를 생성, 수정, 삭제

# 1. create(생성)
# 2. alter(수정)
# 3. drop(삭제 - 구조체)
# 4. truncate(삭제 - 내부 데이터)

# +) use 데이터베이스명: DB를 지정 키워드
#	describe(desc) 테이블명: 테이블 구조 조회
#	show 데이터베이스명: DB 목록 조회
#	if exist / if not exists

# 데이터 타입
# - 정수형, 문자형, 실수형, 논리형, 열거형, 날짜형 등

# 예제 실습: 야구 팀 관리 데이터를 저장하는 DB
CREATE DATABASE `baseball_league`;

USE `baseball_league`;

# 테이블 생성
CREATE TABLE `teams` (
	team_id int,
    name varchar(100),
    city varchar(100),
    founded_year year -- 날짜형(DATE) 중 연도 데이터만 저장
);

# 세미콜론, 콤마 등 기호의 영향을 많이 받음
#	>> 각 컬럼, 데이터 사이에 반드시 ',' 지정
#	>> 제일 마지막 컬럼, 데이터 뒤에는 ',' 사용 X

CREATE TABLE if not exists `players` (
	player_id int,
    name varchar(100),
    position enum('타자', '투수', '내야수', '외야수')
);

# 각 테이블 구조 확인 
describe `teams`;
desc `players`;

# 테이블 구조 수정
# alter table 테이블명 [add | modify | drop] (column) 컬럼명 데이터타입;
# column 생략 가능
alter table `players` add column birth_date DATE;

drop table if exists `games`;
drop table if exists `players`;

drop database `baseball_league`;








