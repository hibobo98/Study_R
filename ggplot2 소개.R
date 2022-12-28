# 패키지 설치
install.packages("ggplot2")

# 패키지 로딩
 library(ggplot2)

# 그래프를 그릴 공간 설정 : ggplot()
# ggplot(data, aes())
## data : 그래프로 사용할 데이터 프레임
## aes() : 데이터 항목, 시각화할 요소(옵션)

mpg = ggplot2::mpg
str(mpg)

mpg=as.data.frame(mpg)
View(mpg)

# 그래프 배경? + 그 안에 뭘 그릴지 
## geom_point() : 산점도 
## geom_histogram() : 히스토그램
## geom_boxplot() : 상자수염그래프
## geom_bar() : 막대그래프
## geom_col() : 막대그래프, 막대 높이를 지정하는 값을 가질수있다.
## geom_line() : 선 그래프
ggplot(mpg, aes(x=displ, y=hwy))+geom_point()
classDf = data.frame(gender=c('남','여','남','여','남','여'),
                     blood=c('A','B','AB','O','A','A'),
                             freq=c(4,3,1,1,0,1))
classDf
ggplot(classDf, aes(x=blood, y=freq))+geom_col(aes(fill=gender))+geom_point(aes(shape=gender), size=3)+
  ggtitle('호랑이반 혈액형 비율',subtitle = '혈액형/ 성별')+
  labs(x='혈액형', y ='인원수', fill='성별') -> x

x + theme_dark()
dev.off()

# qplot(x축데이터, y축데이터, 옵션)
qplot(Sepal.Length, Petal.Width, data=iris)


# 시즌별 티켓판매량을 분석하려고 한다.
## 시즌('A','B','C','D','E')
## 판매()
abc = c(110, 300, 150, 280, 310)
barplot(abc, main='시즌별 반매량', xlab = 'Season', ylab='판매량',
  names.arg=c('A','B','C','D','E'))
  

# 스포츠 경기별 판매량 분석
baseball = c(110,300,150,280,310)
scoccer = c(180, 200, 210, 190, 170)
beach = c(210, 150, 260, 210, 70)

data = matrix(c(baseball, soccer, beach),5,3)
data

barplot(data, main='경기별 시즌의 판매량(누적표시형)',
        xlab='경기종목', ylab = '판매량',
        names.arg = c('BaseBall','SoccerBall','BeachBall'),
        col=rainbow(5),ylim=c(0,400), beside=T)
## beside를 쓰면 누적표시가 아니다!

legend(10, 350, c('A','B','C','D','E'), cex=0.8,
       fill=rainbow(5))

#----
barplot(t(data), main='경기별 시즌의 판매량(누적표시형)',
        xlab='Season', ylab = '판매량',
        names.arg = c('A','B','C','D','E'),
        col=rainbow(3),horiz=T)

legend(4, 1000, c('BaseBall','SoccerBall','BeachBall'), cex=0.8,
       fill=rainbow(5))

#-----
classDf = data.frame(gender=c('남','여','남','여','남'),
                     blood=c('A','B','O','B','O'),
                     freq=c(4,3,1,1,0))
classDf

class1 = data.frame(blood=c('A','B','O','AB','A'),
                    freq=c(4,3,1,1,0))
ggplot(class1, aes(x=blood, y=freq))+geom_col()

blood.Type = c('A','B','O','AB','O')
class(blood.Type)
str(blood.Type)

table(blood.Type)
blood.Type = as.data.frame(blood.Type)

ggplot(blood.Type, aes(x=blood.Type))+geom_bar()
