# 가설 검정
# 상관 분석
purifier_df <- read.table(file='purifier.csv', header=T, sep=',')
###file='clipboard'
## 구조확인 
str(purifier_df)

## 기술통계분석 : 수치데이터로 이루어진 컬럼의 통계값 확인 
summary(purifier_df)
attach(purifier_df)

# 상관계수 산출
## 정수기 총 대여수와 AS 소요시간의 관계를 분석 
names(purifier_df)
plot(purifier, as_time, xlab='총 정수기 대여 수', ylab='AS시간')
plot(old_purifier, as_time, xlab='노후 정수기 갯수',ylab='as')


# 회귀분석
## 인과관계까지 분석
## 어떤 현상을 발생시키는 원인(독립변수)들이 결과(종속변수)에 얼마나 영향을 미치는지 알아보는 통계분석 및 예측방법

# cars
## speed : 차속도(mi/h), dist:제동거리 (ft)
help(cars)
str(cars)

## 자동차의 속도와 제동거리 회귀분석 
## lm(formula, data)
## formula : 종속변수 ~ 독립변수 
## 속도 = 제동거리 - 타이어 면적 + 자동차 무게 
result <- lm(dist ~ speed, cars)
result
# dist = -17.579 + 3.932 * x
summary(result)

# 회귀 모델 방정식의 기울기와 절편 조회 
coef(result)

# 신뢰 구간별 기울기와 절편조회
confint(result)

# 잔차제곱합 
## 모델 평가시 작을수록 좋은 모델이다 
deviance(result)

# 예측
## 회귀분석을 통해 사용된 독립변수를 가지고 예측값
fitted(result)

# 실제 종속변수 값과의 차이(잔차)
residuals(result)

# 결과값을 이용한 시각화
windows()
plot(cars$speed, cars$dist, main='제동거리',xlab='speed', ylab='dist')
## 회귀선
abline(result, col='red')

## 도출된 회귀 모델의 평가를 위한 시각화 
windows()
par(mfrow=c(2,2))
plot(result)

# 예측 : 새로운 독립변수를 회귀모델 방정식에 대입해 종속변수를 예측 
## 속도가 70일때, 제동거리는 ? 257.6609

## predict(결과object, 예측할 독립변수를 담은 데이터 프레임, interval, level)
## predict(object, data, interval, level)
## 50,60,70,80,90,100 속도일때 제동거리를 예측해보자 
#### 점추정, 구간추정, level -> 신뢰구간 

lm_result <- lm(dist ~ speed, cars)
speed <-c(50,60,70,80,90,100)
input <- data.frame(speed)
input

### 예측 : 점추정
output <- predict(lm_result, input)

# 결합 : rbind, cbind 
cbind(input, output)

## 구간추정 예측
## 모델계수에 불확실성을 감안한 구간 추정, 신뢰구간 95%
predict_dist <- predict(lm_result, input, interval='confidence', level=0.95)
predict_dist
cbind(input, predict_dist)

## 모델계수의 불확실성과 결과값에 대한 오차를 감안한 구간 추정 예측/ 신뢰구간95% 
predict_dist <- predict(lm_result, input, interval='prediction', level=0.95)
cbind(input, predict_dist)


# AS 기사는 몇명이 적당할까?
## purifier : 전월 정수기 총 대여수 
## old_purifier : 전월 10년 이상 노후 정수기 총 대여 수 ## as_time : 당월 AS에 소요된 시간 
summary(purifier_df)

# 전월 정수기 총 대여수와 10년 이상 노후된 정수기의 대여수 
cor(purifier_df$purifier, purifier_df$old_purifier)

# 10년 미만 정수기 대여수 = 총 대여수 - 10년 이상 대여수 ## 파생변수 만들었음 
cor(purifier_df$new_purifier, purifier_df$old_purifier)

# 파생변수 생성 : 10년 미만 정수기 대여수 
purifier_df$new_purifier <- purifier_df$purifier-purifier_df$old_purifier

str(purifier_df)

# 회귀분석 
## 독립변수 : 전월 기준 10년 미만 정수기 대여수, 전월 기준 10년 이상 노후 정수기
## 종속변수 : 당월 기준 AS에 소요된 시간 
lm_result <- lm(as_time ~ new_purifier+old_purifier, purifier_df)
par(mfrow=c(2,2))
plot(lm_result)
summary(lm_result)


# 회귀 모델 방정식 : AS시간 = 193.7 + 0.0881*(10년 미만 대여수)+ 0.2398*(10년 이상)

# AS시간은 10년 미만 정수기는 1대당 0.881시간 소요 
# 10년 이상 정수기 1대당 0.2398 시간이 소요되는 것으로 보인다. 

## 예측 : 월말 최종 대여수가 300,000대 이고, 그 중 10년 이상 노후 정수기가 70,000로 집계되었다면, 
input_predict <- data.frame(new_purifier=230000, old_purifier=70000)

# 예측값 저장
predict_astime <- predict(lm_result, input_predict)
predict_astime

# AS 기사 1명이 한 달간 처리하는 AS시간 = 8시간 * 20일
predict_astime/160


## 233.7693 약 234명 AS 기사가 필요 

## 구간 추정/ 신뢰구간 95%
predict_astime <- predict(lm_result, input_predict, interval = 'confidence', level=0.95)

predict_astime

# 실습데이터셋 : women
## 미국 30대 여성들의 신장과 체중을 가지고 있는 데이터 셋 
## 상관분석과 회귀분석 
str(women)
## 귀무가설 : 미국 성인 여성의 몸무게는 정규분포를 따른다.  
## 대립가설 : 정규분포를 따르지 않는다. 
## shapiro.test() 정규분포인지 알아보는 것 
shapiro.test(women$weight)
qqnorm(women$weight)
qqline(women$weight)
