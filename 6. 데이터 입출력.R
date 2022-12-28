# 파일 입출력
## R에서 사용중인 데이터의 저장 및 불러오기 
no = c(1,2,3,4)
name = c('Apple', 'Banana', 'Berry', 'Peach')
price = c(500, 200, 300, 50)
qty = c(5, 2, 4, 7)

fruit = data.frame(No=no, Name=name, Price=price, QTY=qty)
fruit

# 현재 선언된 변수 목록 확인
ls()

# test.dat 파일에 저장
save(no, name, fruit, file = "C:/k-digital/source/data/test.dat")


# 현재 작업중인 변수 삭제 
rm(no, name, fruit)
ls()
name
no
fruit

# 저장된 데이터를 로딩
load("C:/k-digital/source/data/test.dat")
ls()
fruit

# 텍스트파일 저장 및 불러오기
## 데이터를 배열 형태로 읽어들인다.
## 공백문자, 탭, 줄바꿈 등을 기준으로 단어 단위로 배열 저장
## what = " ", 다양한 자료형이 섞여있을 경우 
data = scan("C:/k-digital/source/data/test.txt", what="")
data

data[4]
str(data)

## 배열이 아닌 데이터 프레임 형식으로 읽어오기
row = read.table("C:/k-digital/source/data/test.txt", header = T, sep = '\t')
row 
str(row)


# R 내장데이터 확인
data()