# 히스토그램 : hist()
?hist
## 데이터 생성
set.seed(1)
data= rnorm(100,170,5)
?rnorm
View(data)
hist(data,col='lightgreen', las=2)

# 시각화 결과를 별도의 창으로 표시 
windows()

# 수치 데이터 요약 보고서(기술통계분석)
summary(data)

x<- hist(data, breaks=seq(150,190,by=2),
         col='red',
         main='차트제목',
         xlab='x축이다',
         ylab='y축이다',
         axes=F)
x

# y축 최대값
max(x$counts)

# 축 설정
## x축 눈금 설정
x_axis_tick <- seq(150,190,by=2)
axis(side=1, at=x_axis_tick)
## side = 1은 눈금을 아래로 오게하겠다.는 뜻.
##x_axis_tick을 눈금으로 사용하겠다는 뜻

## y축 눈금 설정 
y_axis_tick <- seq(0, max(x$counts), by=2)
axis(side=2, at=y_axis_tick)
## side=2 왼쪽으로 오게하겠다는 뜻

# 범례 
?legend
legend('topright','height',fill='red')

# 질적 자료(범주형 데이터)를 요약하는 시각화
## Bar Chart : barplot()
# Beer Preference
beer <- c(3,4,1,1,3,4,3,3,1,3,2,2,1,1,2,3,2,
          3,1,1,1,1,4,3,1)

# (1) Domestic can (2) Domestic bottle (3)Microbrew (4) Import
windows()

# 범주형 데이터의 건수(도수분포표)
table(beer)

barplot(table(beer))


# 상대도수 
barplot(table(beer)/length(beer), 
        col=c('lightblue','pink','mistyrose','lavender'),
        names.arg=c('가가가가가가가가sl\n','나\n','다\n','라\n'),
        ylab='Relative frequency',
        main='Beer Preference Survey')


# Pie 차트 : pie()
beer.counts <- table(beer)
pie(beer.counts)


names(beer.counts)

names(beer.counts) <- c('가','나','다','라')
pie(beer.counts)


# 패키지 설치 
install.packages("plotrix")

# 패키지 로딩
library(plotrix)

# 3차원 pie chart
pie3D(beer.counts, 
      labels=names(beer.counts),
      labelcex= 1.0,
      explode=0.1,
      radius=1.5,
      col=c('lightblue','pink','mistyrose','lavender'),
      main='beer 선호 조사')

# 양적 자료를 요약할 때 사용하는 시각화 
## stem() 나무줄기 시각화 
data <- c(2,4,5,1,2,3,4,5,6,2,0,0,0,0,5,3,12,3,31,44)
stem(data)


## 히스토그램
x <- rnorm(1000)
hist(rnorm(1000),xlab='data')

## 히스토그램의 밀도 함수 표현 
x <- rnorm(1000)
hist(x, probability = T, xlab='data', col='lavender', border='white')
# 밀도 함수를 표현하는 곡선
z <- seq(from=-3, to=3, by=0.01)
lines(z, dnorm(z), col=2)


# 산점도 ( 산포도 ) : scatter plot : plot
plot(cars$speed, cars$dist, col='blue', pch='+',
     ylab='제동거리',xlab='속도',
     ylim=c(-20,140))

# with(): attach와 같은것, 근데 시각화에서는 with쓴다. cars$ 같은거 안쓰도록.
with(cars, plot(speed, dist, col='green',ylab='dist',xlab='speed',
                ylim=c(-20,140)))
