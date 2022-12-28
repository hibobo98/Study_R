cars : 자동차의 속도와 제동거리를 가지고 있는 데이터 셋 
plot(cars)
View(cars)

summary(lm(cars$speed ~ cars$dist))


## t 검정 -> 단일 표본 t검정 -> 표본이 1개인 경우. 모집단의 정보는 없어. 1개의 표본을 ㅡ가지고 차이가 있나없나를 알아볼라고해 . 
## 우리 건전지 수명이 1000시간이다.!! 다른 사람이 장난하냐? 500시간이던데? 그러면 건전지 회사는 1000시간이라는 걸 증명해야해. 
## 건전지 수명이 1000시간일때 
x<- c(980, 1008, 968, 1032, 1012, 1002, 996, 1017, 1009)
### 귀무가설 = 건전지 수명 1000시간
### 대립가설 = 건전지의 수명시간은 1000시간 아니다. 

## 정규분포를 따라야한다...? 데이터의 개수가 적을때는 정규분포인지 검정을 먼저해야해 --> 사피에르검정 shapiro-wilk 검정 , 30개 미만일때 해야해 . 
### 귀무가설 : 정규분포를 따른다. 
### 대립가설 : 정규분포를 따르지 않는다. 
shapiro.test(x)
### p-value = 0.8002 는 0.05보다 크다. 귀무가설 맞다. 정규분포따른다. 
?t.test
t.test(x, mu = 1000, alternative='two.sided')


## A학원은 성적향상에 도움이 될까?
jumsu <- read.csv('score.csv', header=T)w
jumsu
### 학원 다니기 전 성적
before <- jumsu$X34
after<-jumsu$X74
before


getwd()
setwd('C:/k-digital/source/r_source')


# Question. 어떤 학급의 수학 평ㄱ륜 성적은 55점이다. 0교시 수업을 시행하고 나서 학생들의 시험성적은 다음과 같다. 
score<- c(58, 81,  77,  80,  43,  65 , 76 , 63 , 54)
summary(score)


## boxplot
boxplot(before, after, names=c('수강전', '수강후'))
mean(before)
mean(after)

### 정규분포 여부 검정 
### 귀무가설 : 정규분포를 따른다. 
### 대립가설 : 정규분포를 따르지 않는다.
shapiro.test(before)
shapiro.test(after)

# t.test(x, y, paired=T, var.equal=TRUE, alternative = 'two.sided') 
##paired= TRUE or FALSE
## 대응표본 : 똑같은 집단에 표본을 2번 추출 -> TRUE ( 시험성적 before, after) 
## 독립표본 : 서로 독립된 두 집단으로부터 샘플을 추출, 표본 수 달라도 됨.  -> FALSE
## var.equal = TRUE or FALSE
### TRUE = 두 집단의 분산이 같다. 
### FALSE = 두 집단의 분산이 다르다. 
var.test(before, after)
t.test(before, after, paired=T, alternative='less')

t.test(before, after, paired=T, alternative='two.sided')




### var.equal = T or F
### T - 두집단의 분산이 같다 
### F - 두 집단의 분산이 다르다 
var.test(before, after)


### 귀무가설: 분산이 같다 
### 대립가설 : 분산이 다르다. 

# alternative : 양측검정과 단측검정을 설정 
### 양측검정: 단순히 두 집단이 다르다라는 것만 확인하는 것 (two.sided)
### 단측검정: 큰지 작은지까지 확인하는 것 (less, greater)


# 일원분산분석 (one-way ANOVA) == 분산분석 
## 3개 이상의 집단간의 차이를 검정하는 분석기법
## 단, t-검저오가 달리 anova검정은 집단간의 차이가 존재하는지에 대한 여부만을 확인 

### 귀무가설 : 3개의 집단의 평균이 같다.
### 대립가설 : 3개의 집단의 평균이 같지않다.
### 귀무가설이 기각될때 사후검정 : TukeyHSD방식 - 다중비교방식 

# 설치된 패키지 정보 확인
library(help=MASS)
library(MASS)
View(anorexia)
attach(anorexia)

## 거식증 환자의 몸무게 변화 평균값이 세가지 치료방법(Control/CBT/FT)에 상관없이 동일한지를 검정 
## aov(종속변수 ~ 독립변수, data)
## 분산분석시 독립변수를 factor형으로 변환해야한다. 

change <- Postwt - Prewt  # 종속변수
aov_result <- aov(change ~ Treat)
aov_result
summary(aov_result)

#col = rainbow(3)
boxplot(change~Treat, col=c('lavender','lightblue','lightgreen'))

## 사후검정 
TukeyHSD(aov_result)
plot(TukeyHSD(aov_result))
