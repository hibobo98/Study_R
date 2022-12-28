# 데이터 탐색
## View() : 데이터프레임 형태로 데이터를 조회하고 정렬 및 조건 검색 
View(iris)

## subset() : 특정 조건에 만족하는 데이터를 추출하는 함수
## subset(x, 조건식, select)

## 별도의 $ 표시 없이 컬럼명(열이름)으로만 접근할 수 있는 함수 
## attach(데이터프레임)
## detach(데이터프레임)

# Longley 데이터프레임 구조 확인
str(longley)

longley

## [행, 열]
colnames(longley)
longley[longley$GNP>200 & longley$Population>=109 &longley$Year > 1960, ]

attach(longley)
sum(GNP + GNP.deflator + Unemployed + Population)

detach(longley)

# 정렬sort

# 그룹함수 or 집계함수 : aggregate()

# apply 함수들: lapply, sapply
## apply() : 행렬의 행 또는 열 방향으로 특정함수를 적용하는데 사용하는 함수 
## apply(행랼, 방향, 함수)
?apply

sum(1:10)

a = matrix(1:9, ncol=3)
a

b = matrix(1:9, ncol=3, byrow=T)
b

# a행렬의 행단위 합계
apply(a, 1, sum)

# a행렬의 열단위 평균
apply(a, 2, mean)

# iris 데이터 각 컬럼의 합을 계산하시오.
iris
apply(iris[,1:4], 2, sum) #행은 다 가지고오고 열은 1:4

# colSums()
colSums(iris[, 1:4])

# rowSums()


# colMeans()

# rowMeans()

# lapply(data, 함수): data - 벡터 또는 리스트
## 결과값도 list로 반환 
## [[]] <- 리스트

## 숫자 벡터(1,2,3)의 각 요소를 2배한 결과를 추출하고 싶다.
result = lapply(1:3, function(x){x*2})
result
result[[2]]

#리스트를 벡터로 변환하는 함수 
unlist(result)

x = list(a=1:3, b=4:6)
x

lapply(x, mean)

# 데이터 프레임도 적용가능 
str(iris)

lapply(iris[,1:4], mean)

colMeans(iris[,1:4])


# 데이터프레임을 처리한 결과를 리스트로 얻게되면, 그 리스트를 다시 데이터 프레임으로 변환하는 과정을 거쳐야한다. 
# step1, unlist()를 통해 리스트를 벡터로 변환한다. 
#### unlist()는 데이터가 소실될 수 있다. 
# step2, matrix()를 통해 벡터를 행렬로 변환한다.
# step3, as.data.frame()를 통해 행렬을 데이터프레임으로 변환
# names()를 사용해 리스트로부터 변수명을 얻어와서 생성된 데이터 프레임에 열이름으로 부여해야한다. 

lapply(iris[, 1:4], mean)
## step1.
unlist(lapply(iris[, 1:4], mean))

##step2.
matrix(unlist(lapply(iris[, 1:4], mean)), ncol=4, byrow=T)

## step3.
df = as.data.frame(matrix(unlist(lapply(iris[, 1:4], mean)), ncol=4, byrow=T))
df

## step4.
names(df) = names(iris[,1:4])


# do.call(호출할 함수, 파라미터)
## 리스트로 나온 결과를 다시 데이터프레임으로 변환하는 함수 ## unlist() 함수를 통해 데이터 손실될 수 있다. 
xx = data.frame(do.call(cbind,lapply(iris[, 1:4], mean)))
xx

# sapply(): lapply와 유사하지만 리스트대신 행렬, 벡터 등으로 결과 변환 
lapply(iris[, 1:4], mean)
sapply(iris[, 1:4], mean)


## 데이터프레임으로 변환 : 행렬 -> 데이터 프레임 
## t() : 전치행렬
as.data.frame(t(sapply(iris[,1:4], mean)))

str(iris)

sapply(iris, class)

## iris데이터 셋 중 각 값이 3보다 큰지를 판단 
y = sapply(iris[,1:4], function(x){x>3})
head(y)

class(y)


data()

install.packages("gapminder")
library(gapminder)
View(gapminder)

# 데이터의 구조 
str(gapminder)

# 분석을 효율적으로 수행하기 위해 데이터 프레임으로 변환
gapminder = as.data.frame(gapminder)
str(gapminder)

# 샘플과 속성 추출
## 각 나라의 기대 수명을 확인
## 데이터 프레임에서 열을 추출할 때 샘플은 행으로, 속성은 열로 표현 
gapminder[ ,c('country', 'lifeExp')]

## 각 나라의 기대수명을 추출하되, 분석년도도 함께 추출
gapminder[, c('country','lifeExp','year')]

## gapminder 샘플 추출 
gapminder[1:15, ]

## Croatia(크로아티아)에 대한 정보만 추출 
gapminder[ gapminder$country=='Croatia',]

## Croatia 의 데이터 중에 인구
gapminder[gapminder$country=='Croatia','pop']

## 크로아티아의 데이터 중 인구와 기대수명 
gapminder[gapminder$country == 'Croatia', c('pop', 'lifeExp')]

## 크로아티아의 1990년 이후의 기대수명과 인구추출
gapminder[gapminder$country == 'Croatia' & gapminder$year > 1990, c('pop', 'lifeExp')]

# 크로아티아의 인구와 기대수명의 평균을 추출하시오. 
apply(gapminder[gapminder$country == 'Croatia', c('pop','lifeExp')], 2, mean)

# 대한민국 인구의 최대값과 해당 연도를 추출하시오.
x = max(gapminder[gapminder$country == 'Korea, Rep.', 'pop'])
----filter 는 행단위 추출 가능, select = 열단위
y = gapminder %>% filter(country == 'Korea, Rep.') %>% select(pop) %>% max()

gapminder[gapminder$pop == x, c('pop', 'year')]
------
gapminder %>% filter(country == 'Korea, Rep.') %>% filter(pop == y)




# 2007년도 아시아 대륙의 인구 총합을 추출하시오. 
y = sum(gapminder[gapminder$continent == 'Asia' & gapminder$year == 2007, 'pop'])
y
#-------------
gapminder %>% filter(year == 2007 & continent == 'Asia') %>% select(pop) %>% sum()

# dplyr 라이브러리를 이용한 데이터 가공
install.packages("dplyr") 
library(dplyr)

## 열단위 # dplyr안하면 select사용안됨
select(gapminder, country, year, lifeExp)

## 행단위 
filter(gapminder, country == 'Croatia')

## 행/열 단위 연산, summarize()
summarize(gapminder, avg_pop_bobo = mean(pop))

# 대륙별 인구의 평균 추출, group_by()
summarize(group_by(gapminder, continent), pop_avg = mean(pop))

# 대륙과 나라별 인구의 평균을 추출
summarize(group_by(gapminder, continent, country), pop_avg2 = mean(pop))


gapminder %>% group_by(continent, country) %>% summarize(pop_avg = mean(pop))


# 크로아티아의 기대수명의 평균 
gapminder %>% filter(country =='Croatia') %>% select(country, year, lifeExp) %>% summarize(life_mean = mean(lifeExp))
##-----또다른 방법
temp1 = filter(gapminder, country == 'Croatia')
temp2 = select(temp1,lifeExp)
temp3 = apply(temp2, 2, mean)
temp3


# 대한민국, 중국, 일본, 세 나라의 1인당 국내 총 생산과 기대 수명을 추출하시오. !! 
gapminder %>% filter(country == 'Korea, Rep.' | country == 'China' | country == 'Japan') %>% select(country, gdpPercap, lifeExp) 
  
gapminder
# 아프리카 대륙의 총 인구가 유럽의 총 인구보다 많았던 해를 추출하시오. 
s1 = gapminder %>% filter(continent == 'Africa') %>% group_by(year) %>%
  summarize(s = sum(pop))

gapminder %>% filter(continent == 'Europe') %>% group_by(year) %>% summarize(s = sum(pop)) -> s2

s1$s > s2$s

s1[s1$s > s2$s, 'year']

# 패키지 설치 : install.packages("패키지명")
# 패키지 로딩 : library(패키지명)
# 패키지 제거 : remove.packages("패키지명")

# 데이터 정제 : 결측값과 이상치값 처리 
## 결측값 : 통계에서 누락된 값
## 보간법 : 결측값을 다른 값으로 대체하거나 삭제하는 방법 
### is.na()
### na.omit() : NA가 포함된 행을 지운다..
### 함수의 속성값 : na.rm = T, 계산시 NA를 제외 

str(airquality)
head(is.na(airquality))


# 범주형 데이터의 건수를 확인하는 함수 
table(is.na(airquality))

table(is.na(airquality$Ozone)) # true인게 결측값

# Temp의 평균
mean(airquality$Temp)

# Ozone
mean(airquality$Ozone)

# Ozen에서 결측값이 없는 값만 추출 
air_norm = airquality[!is.na(airquality$Ozone),]
View(air_norm)

# 결측값을 뺀 데이터셋을 이용하여 Ozen의 평균 
mean(air_norm$Ozone)

# na.omit()
air_norm2 = na.omit(airquality)
mean(air_norm2$Ozone)

# 함수 속성 na.rm
mean(airquality$Ozone, na.rm = T)


# 이상치값 : 일반적인 범위에서 벗어난 값
p = data.frame(name = c('aaa','bbb','ccc','ddd','eee'),
               age = c(22, 20, 31, 38, 29),
               gender = factor(c('M','F','M','K','F')),
               blood= factor(c('A','O','B','AB','C')))
p

# 성별의 이상값을 제거한 후 새로운 데이터 프레임 생성 
p1 = p[p$gender == 'M' | p$gender == 'F',]
p1

# 성별과 혈액형에 이상값을 제거한 후 새로운 데이터프레임을 생성
# [행조건, 열조건], 행조건 - 샘플추출
# [(조건식1)&(조건식2), ]
p2 = p[(p$gender == 'M' | p$gender == 'F')&
         (p$blood=='A' | p$blood=='B'| p$blood =='O' | p$blood =='AB'),]
p2


p3 = data.frame(name = c('aaa','bbb','ccc','ddd','eee'),
               age = c(22, 20, 31, 38, 29),
               gender = c(1, 2, 1, 3, 2),
               blood= c('A','O','B','AB','C'))
p3


# p3 데이터 값에 이상치를 찾아 NA로 대체하는 작업을 수행하시오. 
p3$gender = ifelse((p3$gender <1 | p3$gender >2),NA, p3$gender)
p3
boxplot(airquality[, c(1:4)])
boxplot(airquality[,1])$stats
