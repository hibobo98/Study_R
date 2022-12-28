# 할당 : = 좌변에 우변의 값을 대입한다. 또는 할당한다.
a = 2
print(a)

# == : 논리연산자 
a == 2

a != 2

b = c(1,2,3,4,5)
print(b)

# seq(from=시작숫자, to=마지막숫자, by=증가치)
x = seq(1, 10, by = 3)
x

x2 = seq(10, 1)
x2

x3 = seq(10, 1, by = -2)
x3

# start:end
x4 = 1:10
x4

x5 = 10:1
x5

# rep(반복할 값, 반복횟수) times, each
y1 = rep(c(1,10), 2)  # times가 기본값이다.
y2 = rep(1, 10)
y1
y2

y3 = rep(c(1,10), each = 2)
y3

x <- c(1, 2.5, 3.2) # double
y <- c(1L, 2L, 3L)  # integer
z <- c('KTX', 'SRT', 'BUS') # string
w <- c(TRUE, FALSE, FALSE, TRUE) # logical

# indexing[]
x[3]
x[c(1,3)] # 1번, 3번 인덱스 값 모두 가져오고 싶을때

fruit <- c(5, 3, 2)
# names : 객체의 이름을 알아내거나 이름을 부여할 때 사용하는 함수
names(fruit) <- c('apple', 'orange', 'peach')
fruit

fruit[('apple', 'peach')]
# setNames : 객체에 이름을 부여할 때 사용하는 함수 
fruit <- setNames(c(5, 3, 2), c('apple', 'orange', 'peach'))
fruit

# str() : 데이터의 구조, 자료형, 크기 
# typeof() or mode(): 단순히 자료형을 알아내는 함수 
typeof(x)

# is.datatype : 형 확인 
is.double(x)

# as.datatype : 형변환 
mode(y)
typeof(y) # 더 자세히 나온다.
as.double(y)

is.numeric(y)
typeof(w)
mode(w)

w = as.numeric(w)  # 논리식을 숫자로 바꿈. # 바꾸고 담아줘야함. 

length(x)

# typeof() : 벡터를 구성하고 있는 요소의 타입을 알려주는 함수
# is.double() : 실수인지 논리값으로 알려주는 함수
# as.double() : 실수 벡터로 변환하는 함수
# is.numeric() : 숫자 벡터인지 물어보는 
# as.numeric() : 숫자 벡터로 변환하는 함수 
# length() : 벡터의 길이를 반환하는 함수


# 새로운 벡터를 생성할때 주로 사용하는 함수 c()
a = c(1, 2, 3)
b = c(5, 6)
x = c(a, 4, b)
x

# 벡터의 인덱스 범위를 벗어나는 위치에 값을 할당하면 빈자리는 결측치 처리 
a[7] = 2
a

# append() : 기존의 벡터에 새로운 값을 추가해 새로운 벡터를 생성
append(x, 99, after=3) # x의 세번째 요소 뒤에 99 삽입
append(x, -99, after=0)

x = seq(from=0, to=1, by=0.1)
x
y = seq(from=1, to=1, length=11)
y
z = 1:10
5:-5

x = 1:3; y = c(2,2,2)
y
x + y
x - y
x/y
x^y

z = rep(2,5)
x + z # 1 2 3 1 2 + 2 2 2 2 2

# 벡터와 스칼라 
y -3  # y의 각각의 요소와 다 빼기를 수행
y - rep(3, length(y))

x = 1:10; y = rep(5, 10)
z = x < 5
sum(z) # T = 1, F = 0

x == 5
x != 5

(x > 5) & (y < 2)  # and
(x > 5) | (y < 2)  # or

# R은 다양한 수학/ 통계 함수를 제공한다. 
# rnorm() : 정규 분포를 따르는 난수를 발생시키는 함수
x = rnorm(10)
x

max(x)
min(x)
sum(x)
prod(x) # 모든 요소의 곱
mean(x) # 평균균
median(x)
range(x) # 범위 - 최대값과 최소값의 차이 
quantile(x) # 사분위수 

quantile(x, probs=c(0.2, 0.7)) # 20%, 70% 값을 나타내라 
var(x) # 분산
sd(x) # 표준편차 
x
y
cov(x, y) # 공분산
cor(x, y) # 상관계수 # 0.3 보다 크면 강한 상관계수
sort(x) # 정렬 # 기본적으로 오름차순

rank(x) # 순위 구하기 

order(x)
x[order(x)]


cumsum(x) # 누적합
cumprod(x) # 누적곱
cummax(x) # 누적 최대값
cummin(x) # 누적 최소값

# 성분별 최대값
pmax(x, y, z)
pmin(x, y, z)

# 결측값 NA
x = c(1,2,3,NA,5)
sum(x) # 결측치 있으면 더할 수 없다. 
is.na(x) # 결측치 여부를 논리값으로 알려주는 함수

sum(x, na.rm = TRUE)

x = -10:10
x
x[3]
x[1:3]
x[c(1,3,5)]
x[-1] # 1번째 요소를 제외하고 추출하시오
x[-c(1, 3, 5)]
x[c(-2, -3, -5)]

y = x[x<0]
y
 # 보간법 : 결측값을 다른 값으로 대체하는 방법
x = c(1,2,3,NA, 5)
# 결측값을 제외하고 추출
x[!is.na(x)]

# 결측값을 4로 대체 
x[is.na(x)] = 4
x
