# 한국인의 생활실태를 담은 데이터 셋
#1. 필요 패키지 설치 및 불러오기
## SPSS, SAS, STATA 전통적인 통계전용 프로그렘
## foreign 패키지


install.packages("http://cran.r-project.org/src/contrib/Archive/foreign/foreign_0.8-71.tar.gz", repos=NULL, type='source')
library('foreign')
library(dplyr)
library(ggplot2)
install.packages('readxl')
library(readxl)

#2. 데이터 불러오기 
# read_excel('Koweps_Codebook.xlsx')->a
raw <- read.spss('Koweps_hpc10_2015_beta1.sav',to.data.frame = T)
## 복사본 생성
df <- raw

str(df)

head(df)

## 차원 
dim(df)

## 수치형 데이터의 기초 통계량 확인
summary(df)

#4. 데이터 변형 - 변수이름 변경하기 
df <- rename(df, 
             gender=h10_g3, #성별
             birth = h10_g4,    # 태어난 년도
             marriage = h10_g10, # 혼인상태
             religion = h10_g11,  #종료
             code_job = h10_eco9,      # 직업코드
             income = p1002_8aq1,   # 급여코드
             code_region = h10_reg7)
str(df)

names(df)


#5. 탐색적 데이터 분석
## 변수를 검토하고 분석하기 좋은 형태로 전처리 
### 성별, 생일, 혼인여부, 종교, 직업, 급여, 지역
### 분석에 사용할 변수들의 전처리 
### 변수의 특성을 파악하고 이상치를 정제하고 필요에 따라 파생변수 생성
## 변수 간 관계분석
### 분석에 사용할 변수들 간에 관계가 있는지 관계를 파악
### 가설을 세우고 분석한 결과를 시각화 작업
welfare <- df[,c('gender','birth','marriage', 'religion','code_job',
                 'income','code_region')]
names(welfare)
head(welfare)

# 우리는 고민을 해야해.. 결측값 어떻게 할지..
## 제일많이쓰는거 최빈값

## 성별 전처리
table(welfare$gender)
#### 다행히 결측값없어서 결과가 나왔댜 
class(welfare$gender)

## 성별이 무응답(9)일 경우, 이상치보고 NA로 변경하는 작업
welfare$gender <- ifelse(welfare$gender==9, NA, welfare$gender)
table(is.na(welfare$gender))

## 성별데이터가 1일 경우 male, 2일 경우 female
welfare$gender <- ifelse(welfare$gender ==1, 'male', 'female')
table(welfare$gender)
welfare$gender <- as.factor(welfare$gender)
qplot(welfare$gender) #--->qplot : 빠르게 시각화 ###여기서 welfare$gender는 x값이고 y값은 자동 설정해줌.


#6. 가설
## 성별과 급여에 관련성이 있는지 
## 성별에 따라 급여가 차이가 있는지 
class(welfare$income)
summary(welfare$income)
### NA's = 결측값!!!!! so 많다 
qplot(welfare$income)+xlim(0,1000)

## 월급(income)을 전처리 할거임 
### 0이거나 9999일 경우 결측처리한다. 
welfare$income <- ifelse(welfare $income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))
qplot(welfare$income)

### 성별에 따른 급여에 평균을 요약 
x <- welfare %>% filter(!is.na(income))%>%
  group_by(gender) %>% 
  summarise(mean_income = mean(income))
  ## mean_income이라는 변수를 만들어서 거기에 mean(income)을 넣고 그것을 summarise

x
qplot(x=gender, y=mean_income, data=x)
ggplot(x, aes(x=gender, y=mean_income)) + geom_col()
#____ geom_bar 와 geom-col의 차이____#


# 나이에 따른 급여의 관계를 분석해보고 싶다. 
##  몇살때 급여를 가장 많이 받을까?
## 나이를 확인할 수 있는 것은 생일 
## 생일 : 1900  ~ 2014, 나이 = 2015 - 출생년도 + 1
class(welfare$birth)
summary(welfare$birth)
table(is.na(welfare$birth)) # 결측값 유무 확인 

## 나이 = 현재년도 - 출생년도 + 1
welfare$age <- 2015 - welfare$birth
summary(welfare$age)
qplot(welfare$age)

## 나이와 월급의 요약
data <- welfare %>% filter(!is.na(income)) %>% group_by(age) %>% summarise(mean_age = mean(income))
head(data,7)

haha <- welfare %>% filter(income!=NA)

ggplot(data, aes(x=age, y=mean_age)) + geom_line()

## 연령대별 급여의 차이 
## 청년층(you)<- 34, 중장년층(mid)<-65, 65 < 노년층(old)

## mutate() 기존 dataframe에 새로운 열 추가시키는 것. 
## 파생변수 생성 
welfare <- welfare %>% 
  mutate(ageGroup= ifelse(age <=34, 'you', ifelse(age <=65, 'mid', 'old')))

table(welfare$ageGroup)
qplot(welfare$ageGroup)

## 연령대별 급여의 요약 
data <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(ageGroup) %>%
  summarise(mean_income = mean(income))
data
ggplot(data, aes(x=ageGroup, y=mean_income)) + geom_col() + scale_x_discrete(limits=c('old','you','mid'))
### scale_X_discrete 사용자 정의 정렬, 내가 담은 순서대로 나옴. 


## 연령대와 성별에 따른 급여의 차이를 요약
data <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(ageGroup, gender) %>%
  summarise(mean_income = mean(income))
data

ggplot(data, aes(x=ageGroup, y=mean_income, fill=gender)) + 
  geom_col(position='dodge') + 
  scale_x_discrete(limits=c('old','you','mid'))
## dodge는 막대기 분리의 의미 

## 시간의 흐름에 따라 급여가 달라지는 것->line
##남자와 여자의 색을 다르게!
## 성별과 나이에 따른 급여 요약 
welfare %>% filter(!is.na(income)) %>%
  group_by(age, gender) %>%
  summarise(mean_age = mean(income)) -> data
data

ggplot(data, aes(x=age, y= mean_age, color=gender)) + geom_line() + scale_color_manual(values=c('green','brown'))

## 직업별 급여의 차이날까?
## 어떤 직업군이 급여를 많이 받을까?
### code_job

class(welfare$code_job)
table(welfare$code_job)

list_job <- read_excel('Koweps_Codebook.xlsx',sheet=2, col_names=T )
head(list_job)

welfare <- left_join(welfare, list_job, id='code_job')
head(welfare)

### 직업별 급여에 차이를 분석하자 
job_data <- welfare %>% filter(!is.na(job)& !is.na(income)) %>% 
  group_by(job)%>%
  summarise(mean_income = mean(income))
## n() - 건수를 구할 수 있음 

head(job_data)

## 급여가 많은 직업군 10개를 산정 추출
top10 <- job_data %>% 
  arrange(desc(mean_income)) %>%
  head(10)

top10
ggplot(top10, aes(x=reorder(job, mean_income), 
                  y=mean_income)) + geom_col()+ coord_flip()

### coord_flip()은 그래프를 옆으로 돌려줌 
### reorder -> 큰 값이 먼저나오는디

bottom10 <- job_data %>%
  arrange(mean_income) %>%
  head(10)
ggplot(bottom10, aes(x=reorder(job, -mean_income), 
                  y=mean_income)) + geom_col()+ coord_flip() + ylim(0, 850)



## 성별에 따라 선호하는 직업
job_cnt <- welfare %>%
  filter(!is.na(job)&gender== 'male')%>%
  group_by(job) %>%
  summarise(cnt = n()) %>%
  arrange(desc(cnt)) %>%
  head(10)
job_cnt

job_female <-welfare %>% 
  filter(!is.na(job)&gender=='female') %>% 
  group_by(job) %>% 
  summarise(f =n()) %>% 
  arrange(desc(f)) %>% 
  head(10)
job_female


ggplot(job_female, aes(x=f, y=reorder(job,f))) + geom_col()


### mean_income앞에 - 붙이니까 작은 값이 먼저나옴


## 종교 유무에 따른 이혼율
## 종교가 있는 사람이 이혼을 덜 할까?
### 종교, 혼인상태 
table(welfare$religion)

welfare$religion <- ifelse(welfare$religion==1, 'yes','no')
welfare$religion <- as.factor(welfare$religion)
qplot(welfare$religion)

# 파생변수 : 이혼유무
welfare$md <- ifelse(welfare$marriage ==1, 'marriage',ifelse(welfare$marriage==3,'divorce',NA))

table(welfare$md) #--> 여기에는 결측값이 안뜨나?!
table(is.na(welfare$md))
qplot(welfare$md)

xx <- welfare %>%
  filter(!is.na(md)) %>%
  group_by(religion, md) %>%
  summarise(n=n()) %>%
  mutate(tot = sum(n),
         pct = round(n/tot * 100, 1))
xx

##### 위에 저거를 더 쉽게 하는 방법
# count() : 집단별 빈도를 구하는 함수 
# count 함수를 구현하면 mutate함수에서 하나로 통합해서 처리가 가능
yy <- welfare %>%
  filter(!is.na(md)) %>%
  count(religion, md)%>%
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100,1))
  
yy  

## 이혼추출
divorce <- yy %>%
  filter(md == 'divorce') %>%
  select(religion, pct)
divorce

ggplot(divorce, aes(x=religion, y=pct)) + geom_col()


#0# 시계열데이터는 막대보다는 선그래프쓰는게 좋다
## 성별과 급여의 차이가 연령대별로 얼마나 다를까?
## 어떤 직업이 급여를 가장 많이 받을까?
## 성별에 따른 직업 선호도 
## 노년층이 가장 많은 지역은 어디일까?