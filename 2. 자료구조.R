# R의 자료 구조 
## vector(), matrix(), Array(), data.frame(), list()
## 1. 벡터(vector)
## scalar(스칼라) : 크기만 가지고 있는 물리량, 1개 원소 
## vector(벡터) : 크기와 방향, 1개 이상의 원소를 담는 자료형
## 벡터를 생성 : c(), start:stop (콜론) #얘는 stop-1 안 해줌 !, seq()
## 벡터의 인덱스는 1부터 시작한다. 
## 하나의 벡터에는 하나의 자료형만 담을 수 있다. 
## 벡터연산에 주로 사용되는 내장함수 

# 벡터 생성
x <- c(1,2,3,4)
x

# x의 정보 확인, 자료구조를 확인
str(x)


x<- 10
x

1:7
6:1

y <- c(1, "hi", 2)
y
str(y)

#vector(length=n) 요소가 n개인 빈 벡터를 생성
vector(length=5)

c(1:5)
c(1,2,3,c(4:6))

y = c()
y = c(y, c(1:3))
y

# seq : 순열
# seq (from = 처음값, to= 마지막값, by = 증가값)
x = seq(from=1, to=5, by=1)
x

y = seq(1, 10, by =2)
y

z = seq(0, 1, by=0.1)
z

w = seq(0, 1, length.out=13)
w

# rep(벡터, times = 반복횟수) # 123 123
x = rep(c(1:3), times=2)
x

# rep(벡터, each = 개별요소반복) # 11 22 33
y = rep(c(1:3), each=2)
y

# 벡터 내 특정 요소 선택 : 벡터명[인덱스]
x = 1:10
x
x[1]
x[3]
# 두번째 요소를 제외하고 출력
x[-2] 

# x의 세번째 요소에 30으로 변경하고 싶어요
x[3] <- 30
# x의 요소 중에 2~4만 추출하고 싶어요
x[2:4]

# append(원본 벡터, 추가할 벡터, 추가할 위치) : 추가위치 뒤에 
x <- c('A', 'B', 'C')
y <- c('D', 'E')
z <- append(x,y)

z <- append(x, y,2)  # 2번째 요소 뒤에 벡터 y 추가
z

# 벡터의 연산 : 같은 위치의 요소끼리 연산을 수행한다. 
x <- c(1:4)
y <- c(5:8)
z = x+y

z = x-y
z

z = x * y
z

x <- c(1,2,3,4)
y <- c(5,6)
z <- x+y
z


x <- c(1:4)
y <- c(5:9)
x+y


x = c(1:4)
z = x * 2
z


x = 1:10
x > 5

# all : 모두
# any : 어느거 하나라도

all(x>5) # 모두 5보다 크면 TRUE, 아니면 FALSE
any(x>5)



# head(), tail() #R은 6개, python은 5개 정도 추출 
x = 1:20
head(x,3) # 추출하고 싶은 갯수를 정해줬다.
tail(x,11)

# 집합 : 합집합(union), 교집합(intersect), 차집합(setdiff)
# 비교(setequal)
x = c(1,2,3)
y = c(3,4,5)
z = c(3,1,2)

union(x,y)
intersect(x,y)
setdiff(x,y) #x에서 공통된 부분을 뺀다
setequal(x,y)


y = c(y, c(1:3))
y

# 베이스 R이 제공하는 기본 데이터 목록을 확인하는 명령
data()

help(iris)

head(iris)
tail(iris)

# 기초 통계량
summary(iris)

# 데이터 정보
str(iris)

view(iris)

View(ChickWeight)

help("ChickWeight")

val <- c(1,2,3,4,5,6,7,8,9)
val
summary(val)


# 정규 분포
xy = rnorm(30)
xy

# 원소의 개수
length(val)
mean(val)
var(val)
sd(val)
range(val)

# sin(), cos(), tan()
# abs()
# round()

# 데이터 유형 : mode()
xx = c(0.2, -1.2, 2, -0.5)
xx
mode(xx)
# 최대
yy = 1:10
max(yy)
# 중간값
median(yy)
# 개수
length(yy)
sum(yy)

# NULL, NA, NaN
sqrt(5) # 제곱근 구하기. 

x = c(1,3, NA, 4, 30, 7, NA)
x

mean(x)

mean(x, na.rm = T)  

z <- c(1,2, NA)
z

grade = c('하하', '중하', '중', '중상', '상상')
oo = factor(grade, levels=c('하하', '중하', '중', '중상', '상상'), ordered=T)
oo



x = array(1:27, dim = c(3,3,3)) #면, 행, 열
x
