# DB, 테이블, 컬럼 명명 규칙
/* 
1. 대소문자 구분 x
: 일관성 있는 작성 권장
- 소문자 작성 후 Edit 편집 기능으로 대문자 변환

2. 길이 제한
: 최대 64자 사용 가능

3. 문자 제한
: 문자, 숫자, _만 사용 가능 (공백, 기타 특수기호 사용 x)

4. 숫자로 시작 x

5. MySQL 예약어는 사용 x 권장
: 부득이하게 사용하는 경우 백틱으로 묶어서 사용 가능

*/

# SQL 내 명명 시 '반드시' 의미 있는 이름 사용 권장
# : 데이터를 정확하게 설명하고 식별할 수 있도록 명명

# cf) 테이블 명명 규칙
# : 복수형 명사 사용 권장
# ex) students(학생들), lectures(강의들), products(상품들), members(회원들)
# cf) lower_snake_case 사용 권장
# ex) student_id, lecture_code, prduct_price 

# SQL의 백틱과 따옴표 사용 
# 1) 백틱 (``)
# : 키워드 충돌 방지 - 예약어로 설정되어 있는 단어를 명명하기 위한 목적
# : 이름에 공백이나 특수 문자가 포함된 경우 식별을 위한 목적

# 2) 따옴표('', "")
# : 문자열 데이터를 저장하는 데 사용
# : DB, 테이블, 컬럼명으로는 사용하지 않는 것을 권장

