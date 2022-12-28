install.packages('cowsay')
library(cowsay)

say('메롱', by='random')


# vector : 1차원 가변길이 배열 
vector(length=5) # 값을 가지고 있지 않은 벡터를 5개 만들어라. 
a <- c(1,2,3,4,5)
x <- 10  # 하나의 값도 벡터에 담긴다.라는걸 알아둬야해. 

## indexing(인덱싱)과 slicing(슬라이싱)
### 벡터명[index]
a[3]
a[c(2,3,4)] # 여러개는 c를 이용해서 묶어야한다.
a[2:4]

### Fancy Index(팬시 인덱스)
### 주어진 조건에 만족하는 값(요소)만 추출하는 기능
### 비교(관계) 연산자 : ==, !=, >, >=, <, <=
### 논리 연산자 : &(and), |(or), !(not)
x <- 1:10
x

x > 5
x[x>5]

seq(1,10,2)
seq(0,1, length.out=11)

rep(1:3, times=2)
rep(1:3, 5)

rep(1:3, each=2)
rep(1:4, rep(2,4))


y <- seq(10)

a <- c(1,2,3)
b <- c(4,2,8)

xx <- c('a', 'b', 'c', 'd', 'e')
xx

# 문자열 결합 but,, 공백으로 연결된다...
paste(xx[1], xx[2])

## 짝수번째 위치에 해당하는 요소 추출
yy <- 11:20
yy[c(2,4,6,8,10)]
yy[yy %%2 ==0]
# matrix : 크기도 같고 자료형도 같아야함 . : 2차원 배열
## 행(row, 관측값, 샘플)
## 열(column, 속성, 변수, feature)
## table(표)
## matrix(data, nrow, ncol, byrow, dimnames=NULL)
m <- matrix(1:9, nrow=3)
m

## 행렬명[행인덱스, 열인덱스]
m[2,]  # 결과는 벡터로 나온다. -> 2차원배열은 벡터들로 이루어진것.
m[,3]
m[2, , drop=F] # 2차원 배열을 그대로 지켜서 출력해라. 

m1 <- matrix(1:9, nrow=3, byrow=T,
             dimnames=list(c('행1','행2','행3'),
                          c('열1','열2','열3')))
m1

## m2 행렬의 요소의 값이 4이상인 것만 추출하시오
## 행 - 추출하는 샘플, 열 - 속성 
m2 <- matrix(1:9, nrow=3, byrow=T, 
             dimnames = list(c('행1','행2','행3'),
                             c('열1','열2','열3')))
m2
M <- m2[m2>=4] # 결과가 벡터로 나온다. 
m2[m2[,2]>4,]
m2[2:3, ]
m2[c(2,3), ]

matrix(M, byrow=T, ncol=3)
as.matrix(M)

# array
## array값, dim=c(행의 개수, 열의 개수, 면의 개수), dimnames=NULL) : 크기도 같고 자료형도 같아야함 .
## dimnaes는 반드시 list타입으로 지정해야한다.
array(1:27, dim=c(3,3,3))
array(1:27, dim=c(3,3,3),
      dimnames = list(c('행1','행2','행3'),
                      c('열1','열2','열3'),
                      c('페이지1','페이지2','페이지3'))) -> a

# 배열명[행인덱스, 열인덱스, 페이지인덱스]
a[3,3,1]
a[,,2]
a[,,c(1,3)]

# a배열의 모든페이지의 1행들만 추출
a[1,,]

## 행렬의 연산  1X3 , 3X3 곱
x <- 1:3
y <- matrix(1:9, nrow=3)
y
x * y

## 행렬곱 %*%
x %*% y
y %*% x

rowMeans(y)
### rowSums()
### colMeans()
### colSums()
m2 <- matrix(1:12, nrow=4)
m2

## 행렬구조를 리스트 형태로 반환
attributes(m2)
dim(m2)
nrow(m2)

## 결합 : rbind, cbind
m3 <- matrix(1:4, nrow=2)
m3

rbind(m3, c(3,5)) -> m4
m4

cbind(m3, c(1,1)) -> m5



# list 
x <- list('kookmin', 'hong',1000, T)
x
 
y<- list(bank='kookmin',
         name ='hong',
         money=1000,
         use=T)
y
y$bank
names(y)

names(y) <- c('aaa', 'bbb','ccc','ddd')
y

xx<- list('kookmin','hong',1:5)
xx

xx[1]
xx[[3]][1:3]

x <- list(1:3, 2:5, c('a','b','c'))
x

## x의 첫번째 리스트 객체 추출
x[[1]]
## x의 첫번재 리스트 값 중 3번째 요소
x[[1]][3]
## x의 두번재 리스트의 값중 2~4번째 요소 
x[[2]][2:4]
## x의 두번째 리스트의 첫번째값리스트값에 4번째 요소 
x[[2]][[1]][3]

x<- list(no=1:3, list(1:3, 2:5, 1:10), ban=2:5, name=c('a','b','k'))
x
# data.frame : 크기같아야함
## 같은 열 내에서는 타입이 같아야하고
## 열 끼리는 타입이 달라도 된다.
## 데이터 프레임은 여러개의 벡터의 집합
name <- c('홍길동', '유관순', '장보고')
age <- c(22, 19, 25)
gender <- factor(c('M','F','M'))
blood <- factor(c('A','O','B'))

df <- data.frame(name, age, blood) # name, age, blood는 컬럼명~
df


## 데이터 프레임 요소에 접근
### 속성값을 출력하는 $이용
### 배열 요소의 접근 방법인 [행인덱스, 열인덱스]
### [조건식]

# 홍길동에 홍길동 정보만 추출 
df[df$name =='홍길동',]

# 장보고의 이름과 나이만 추출
df[df$name == '장보고',c('name','age')]


## ggplot2 패키지 로딩
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
mpg

## 간단한 그래프를 빠르게 그리기 위해 ggplot 패키지에서 제공하는 qplot
## gplot : 상자수염, 히스토그램, 선그래프, 막대그래프, 파이차트, 산점도 
## gplot(data, x, y, geom) # geom = 그래프의 종류 
str(mpg)
summary(mpg)

# 1갤런에 몇 마일을 가는지?
## hwy : 자동차가 고속도로에서 1갤런당 몇 마일을 가는지를 가지고 있음 ## 
qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)

row <- rename(row, hi)
# m = matrix(c(1,2,3,4), ncol=2, byrow=T) # 1이 합쳐져서 위에 한칸만!
# m
# layout(mat=m)
qplot(data=mpg, x=drv, y=hwy, geom = 'line')

qplot(data=mpg, x=drv, y=hwy, geom = 'boxplot')
qplot(data=mpg, x=drv, y=hwy, geom = 'boxplot', color = drv)


## 복사본 생성
row <- mpg

str(row)
## cty = city, hwy = highway
## dplyr - 데이터 처리하고 가공하는 library - rename이라는 함수 보유 


# new = old
row <- rename(row, city=cty, highway= hwy)
str(row)
names(row)

# 파생 변수 : 기존의 변수를 변형해서 만드는 변수 
# 통합 연비 = (도시 연비 + 고속도로 연비)/2 -> total
row$total <-(row$city + row$highway)/2
names(row)
str(row)
head(row)

## 기준치정하기
summary(row$total)
hist(row$total)

## 통합연비의 값이 20을 넘기면 '합격', 그렇지 않으면 '불합격'
row$test <- ifelse(row$total >= 20, 'pass', 'fail')
head(row)

table(row$test)

qplot(row$test)
barplot(table(row$test))


## 연비에 따른 자동차의 등급을 부여하는 작업
## grade : A, B, C, D
## 30이상 - A, 20이상=B. 그외 C등급
# row$grade <- if(row$total >= 30){
#   print('A')
# }else if(row$total >=20){
#   print('B')
# }else{
#   print('C')
# }

row$grade <- ifelse(row$total >= 30, 'A',
                    ifelse(row$total>=20, 'B','C'))

## 등급에 따른 빈도표 그리기 
table(row$grade)
qplot(row$grade)

# ggplot2::midwest
## 미국 동부중부 437개 지역의 인구통계정보를 가지고 있는 데이터셋
aaa <- as.data.frame(ggplot2::midwest)
aaa$total <- NULL
## Q1. poptotal(전체 인구) 변수를 total로, popasian(아시아인구) 변수를 asian으로 변경하시오.
aaa <- rename(aaa, total5=poptotal, asian= popasian)
str(aaa)

## Q2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율'파생변수를 만들고, 히스토그램을 통해 도시들이 어떻게 분포되어있는지 분석하시오 
aaa$asiaNtotal <- (aaa$asian/aaa$total)*100
table(aaa$asiaNtotal)
qplot(aaa$state, aaa$asiaNtotal, geom='boxplot')

## Q3. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 'large', 그 외에는 'small'을 부여하는 파생변수를 생성하시오
aaa$avg <- mean(aaa$asiaNtotal)
aaa$test <- ifelse(aaa$asiaNtotal > aaa$avg, 'large', 'small')
## Q4. 'large'와 'small'에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대그래프를 만들어 분석하시오. 
table(aaa$test)
qplot(aaa$test, fill = aaa$state) # state별로 볼 수 있다. 
aaa %>% ggplot() + geom_bar(aes(test,fill=state), position='dodge')

qplot(aaa$county, aaa$asiaNtotal)
