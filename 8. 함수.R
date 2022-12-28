# 함수(Function) : 내장함수와 사용자 정의 함수 
## 함수명(매개변수 or 인수){ }
scores = c(90, 76, 82, 66, 58)

check= function(score){
  if(score >= 88){
    print("합격")
  }else{
    print("불합격")
  }
}

for(i in scores){
  check(i)
}

check(77)