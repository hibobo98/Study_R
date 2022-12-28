# dplyr
## filter() : 행추출, subset()와 유사 
## select() : 열추출
## arrange() : 정렬, desc() 내림차순
## mutate() : 새로운 열을 생성할 때 
## summarize() : 통계치 산출
## group_by()
## left_join() : 데이터 합치기(열)
## bind_join() : 데이터 합치기(행)
## %>% , chain() : pipe 연산자 

## 데이터 불러오기
exam <- read.csv('C:/k-digital/source/r_source/csv_exam.csv')
exam
str(exam)
## 1반 학생들의 정보를 추출 # 쉼표 찍는거 잊지말긔~
exam[exam$class==1,] 
exam %>% filter(class ==1)

## 2반 학생 정보 추출
exam %>% filter(class == 2)
  
## 1반이 아닌 학생 정보 추출
exam %>% filter(class != 1)

## 수학 점수가 50점을 초과하는 데이터만 추출
exam %>% filter(math > 50)

## 1반 이면서 수학점수 50이상
exam %>% filter(class ==1 & math >=50)

## 수학점수가 90이상 이거나 영어 점수가 90점 이상인 데이터 
exam %>% filter(math >= 90 | english >= 90)

## 1반, 3반, 5반에 학생정보 추출
exam %>% filter(class ==1 | class ==3 |class == 5)
exam %>% filter(class %in% c(1,3,5))

## class1, class2 파생변수 생성
class1 <- exam %>% filter(class ==1)
class2 <- exam %>% filter(class ==2)

## 1반 수학점수의 평균
mean(class1$math)
mean(class2$math)

# mpg 데이터 셋을 이용
## Q1, 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 한다.
## displ(배기량)이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 highway가 평균적으로 더 높은지 분석하시오.

mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
mpg %>% filter(displ >= 5) -> displ5
mean(displ5$hwy)
mpg %>% filter(displ <=4) -> =displ4
mean(displ4$hwy)

## Q2. 자동차의 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다.
##'audi와 toyota'중 어느 제조회사의 자동차가 도시 연비가 평균적으로 높은지 분석하시오. 
mpg %>% filter(manufacturer == 'audi') -> audi
mean(audi$cty)
mpg %>% filter(manufacturer == 'toyota') -> toyota
mean(toyota$cty)

## Q3. 'chevrolet', 'ford','honda' 자동차의 고속도로 연비  평균을 알아보시오. 이 회사들의 데이터를 추출한 후 highway 전체 평균을 산출하시오. 

mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda')) -> all5
mean(all5$hwy)
# mpg %>% filter(manufacturer == 'ford') -> ford
# mean(ford$hwy)
# mpg %>% filter(manufacturer == 'honda') -> honda
# mean(honda$hwy)


# select() : 조건에 만족하는 변수(컬럼, 속성)
exam %>% select(english)

## 반, 수학, 영어만 추출
exam %>% select(class, math, english)

## 수학을 제외
exam %>% select(-math)

## 수학 영어 제외
exam %>% select(-math, -english)

## filter와 select / class가 1인 데이터에 english추출
exam %>% filter(class==1) %>% select(english)

## 학번(id) 와 수학 앞에서 6개 추출
exam %>% select(id, math) %>% head()
## 학번(id) 와 수학 앞에서 10개 추출
exam %>% select(id, math) %>% head(10)

## Q1. mpg 데이터 셋에서 자동차 종류와 도시 연비만 추출
mpg %>% select(manufacturer, cty)


##Q2. 자동차 종류에 따른 도시 연비가 어떤지 분석하려고 한다. 
## 이때 자동차 종류가 'suv'인 자동차와 'compact'인 자동차 중 어느 자동차의 도시 연비가 높은지 분석하시오~
mpg %>% filter(class %in% c('suv','compact')) -> aaa
aaa %>% ggplot() + geom_bar(aes(cty,fill=class))

mpg %>% filter(class == 'suv') -> bbb
mean(bbb$cty)
mpg %>% filter(class == 'compact') -> ccc
mean(ccc$cty)

table(mpg$cty)
plot(table(mpg$cty), table(mpg$class))

# arrange() : 정렬 
## 수학점수 오름차순 
exam %>% arrange(math)

## math 기준으로 내림차순
exam %>% arrange(desc(math))

## class와 math 오름차순 
exam %>% arrange(class, math)


## Q, 'audi'에서 생산한 자동차 중에서 어떤 자동차의 모델이 고속도로 연비가 가장 높을 까 ?? 1~5까지만 추출 
mpg %>% filter(manufacturer == 'audi') %>% arrange(desc(hwy)) %>%head(5)
