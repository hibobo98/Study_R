df1 <- data.frame(c(1,2,3),c(3,4,5),c(6,7,8),a)
df1


a<-matrix(1:9,3,3)
a

df2 <- as.data.frame(df3)
df2


v1<-c('a','b','c')
v2<-c(1,2,3)
df3<-data.frame(v1,v2)
table(df3)

str(cars)
df4 <- as.data.frame(cars)      
df4
str(iris)

list(v1,v2)->c
as.data.frame(c)


df5<-data.frame(dosage=numeric(5),lab=character('n'))
df5

?array
array(1:3, c(2,4))
matrix(data, nrow, ncol, byrow=F, dimnames=list(c('행1','행2'),c('열1','열2')))
array(data, nrow, ncol, dim=c(행,열,면))



v<- c('data','Bingdata','HELLODATA','who','love')
grep('data',v,ignore.case = T)

name <-c('data','Bingdata','HELLODATA','who','love','lovesong')
age<-c(20,30,44,12,33,88)
grade <-c('A','D','C','F','F',NA)
data.frame(name,age,grade)->df1
df1[grep('data',df1$name,ignore.case = T),]

subset(df1,select=age, age>40)


colnames(df1)[1]<-c('who')
df1
df_NA<-na.omit(df1)
df_NA
# 텍스트 파일 읽고 저장하기 
## 반드시 메모장에서 enter를 쳐서 커서를 다음줄로 넘기고 저장
## scan('파일명', what='자료형') : 텍스트파일을 배열형태로 읽어온다.
## what='' -다양한 자료형을 포함하고 있는 경우 
## read.table('파일명',header=T/F, sep='') -> 데이터 프레임 형태로 읽어온다. 

## csv : 엑셀형태의 파일
### read.csv()


#tapply(데이터, 색인, 함수) : 그룹별 처리를 위한 함수 
##색인 : 데이터가 어느 그룹에 속하는지 표현하는 것으로 factor형 데이터 타입이다.
array(1:4,c(3,3))


# doBy 패키지
install.packages("doBy")
library(doBy)
# - 특정 값에 따라 데이터를 처리하는 함수를 가지고 있는 패키지
# - summaryBy()
# - summary() : 수치 데이터에 기초 통계량 추출, 통계분석에 모형의 요약 보고서 추출 
# 
# -orderBy()
# order() : 정렬한 후 그 결과값의 인덱스 반환
# sort() : 정렬한 후 결과값x을 반환
# 
# 
# -splitBy()
# split()
#
# -sampleBy()
# sample() ; 표본추출
