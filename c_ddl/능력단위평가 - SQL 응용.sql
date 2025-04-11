# 1. 데이터베이스 example을 사용하세요.
use example;

# 2. product_info 테이블 생성
create table product_info (
	product_id int,
    product_name varchar(100),
    category char(10),
    price DECIMAL(10, 2),
    in_stock boolean,
    release_date DATE,
    color enum('red', 'green', 'blue')
);

# 3. 예시 데이터 
insert into product_info
values (1, 'Galaxy Watch', 'Device', 299.99, true, '2024.06.01', 'green');
    