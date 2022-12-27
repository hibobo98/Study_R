# 산술연산 - 계산기처럼 활용 
# 연산자 : +, -, *, /, %/%, %%, **(^)
# 비교(관계) 연산자 : TRUE(T) or FALSE(F) -예약어 
# <, <=, >, =>, ==, !=, !(not)
# 논리 연산자 : !, |(비트연산), ||, &(비트연산), &&
# isTRUE, as
# R 자료형 : 숫자형(int, num, cplx)
# 문자형 : chr, "" or ''
# 범주형 : factor
# 특수상수(값) : NULL, NA(missing value) - 결측값 
# EDA - 탐색적인 테이터 분석 
## Inf, -Inf
# NaN : Not a Number-> 0/0, inf/-inf # 연산이 불가능한 값이라는 의미 
# R의 자료형을 확인하는 함수 
## class(x), is.integer(x)-> x가 정수입니까?, is.numeric(x)-> x가 실수+ 정수, is.double(x) -> 실수 
###is.integer(1L) -> T
###is.numeric(1L) -> T
# is.complex(x)-> 복소수? , is.character(x), is.na(x)-> 결측값입니까?
# R 데이터형을 변환 함수 
## as.factor(x), as.integer(x), as.numeric(x)
## as.character(x) 문자형으로 바꿔라, as.matrix(x), as.array(x)

# 수치형 (연속형(실수), 이산형(정수))
# 비수치형 ( 명목형, 서열형 )

# 하나이상의 값을 묶을때는 c 
# blood.type= factor(c('A', 'B', 'O', 'AB'))

x <- 1
# 숫자형 - 정수형, 실수형, 복소수 
# x에 단순히 1을 넣을 경우 x는 숫자형 
x
is.integer(x)

x <- 1L
is.integer(x)

x = as.integer(1) # 1의 자료형을 정수로 정함!
is.integer(x) #True라고 나옴 . 

# 현재 있는 변수 알려줌 
ls()

# 변수 제거 
rm(x)
x


T + T
# 벡터 - 같은 형태의 데이터만 담을 수있다. 1차원 배열 
## 인덱스가 1부터 시작함.  가변길이 배열 


## 어디든지 c 가 붙는다!!!!!!!!!! 하나 이상의 값을 담을 때 !!!!
score <- c(68,78, 88, 90, 10, 50)
mean(score)


