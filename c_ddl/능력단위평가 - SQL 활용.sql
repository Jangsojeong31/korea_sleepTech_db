# baseball_league라는 이름의 데이터베이스를 생성하시오.
create database baseball_league;
# 생성한 데이터베이스를 사용하도록 설정하시오.
use baseball_league;

# teams 테이블 생성
create table teams (
	team_id int,
    name char(100),
    city char(100),
    founded_year DATE
);

# players 테이블 생성
create table players (
	player_id int,
    name char(100),
    position enum('타자', '투수', '내야수','외야수')
);

# players 테이블에 birth_date(생년월일) 컬럼을 DATE 타입으로 추가하시오.
alter table players add birth_date DATE;

# 두 테이블의 구조를 조회하는 SQL을 각각 작성하시오.
desc teams;
desc players;

#  players와 games 테이블이 존재할 경우 삭제하는 SQL을 작성하시오.
drop table if exists players;
drop table if exists games;

#  마지막으로 baseball_league 데이터베이스를 삭제하는 SQL을 작성하시오.
drop database baseball_league;


