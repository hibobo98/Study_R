data.frame(c(1,2,3),c(4,5,6),c(7,8,9)) -> a
rownames(a) = c('행1','행2','행3')
a
new <- data.frame(a=1, b=2, c=3, d='a')
new

read.csv('titanic.csv')->titanic
View(titanic)
str(titanic)

# 필요한 컬럼만 뽑아서 새로운 데이터 프레임 생성
df <- titanic[,c('X','pclass','survived','sex','age', 'sibsp','parch','embarked')]
str(df)

table(is.na(df$embarked))

df$embarked <- ifelse(is.na(titanic$embarked),'Southampton', titanic$embarked)
df$embarked <- as.factor(df$embarked)


# factor 형변환
df$pclass <- as.factor(titanic$pclass)
summary(titanic)
df$survived<- as.factor(titanic$survived)
df$sex <- as.factor(titanic$sex)


#범주형 데이터의 건수
table(is.na(titanic$embarked))
titanic$embarked <- ifelse(is.na(titanic$embarked),'Southampton', titanic$embarked)
# 1등실 탑승 고객 추출
titanic[titanic$pclass=='1st',]


str(df)


# 나이 결측값 처리 
mean(df$age, na.rm=T)
df$age <- ifelse(is.na(df$age), 29.88113, df$age)

# pclass 별 생존 및 사망 비율을 시각화 
library(dplyr)
library(ggplot2)
qplot(survived, data=df, fill=pclass)
qplot(survived, data=df, fill=embarked)
qplot(age, data=df)
## 객실 등급별 생존율

boxplot(df$age)$stats





library(data.table)


#______________________________________________#
titanic_df <- as.data.table(titanic)
titanic_df[,1,with=F]
titanic_df[pclass =='1st']

titanic_df[,c('sex','pclass')]



setkeyv(titanic_df, c('sex','pclass'))
tables()

setkey(titanic_df, pclass)
tables()


# dplyr 
data %>% group_by(g) %>% summarise(mean(x))

# data.table
data[,mean(x), by='g']
key <- 'pclass'
setkeyv(titanic_df, key)
tables()


titanic_df['1st']
titanic_df[J('1st')]
titanic_df[J('1st'), mean(survived)]


# apply 함수 : 특정 행이나 열을 대상으로 함수를 적용
## apply, lapply, sapply, tapply
## 형식 apply(행렬, 방향, 함수) : 방향에서 1=행, 2=열
apply(a, 1, sum)

matrix(c(1,2,3,4),2,2)-> a

x<- lapply(1:3, function(x){x*2})
x
x[[1]] #첫번째 객체의 첫번째 값
x[1] # 첫번째 객체 
x[[2]]<- c(1,2,3,4,5)
x



x<-list(a=1:3, b='aaa', c=100)
x

x$a
