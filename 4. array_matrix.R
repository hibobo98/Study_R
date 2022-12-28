# array(): N차원 배열, matrix(): 2차원 배열
x = array(1:20, dim=c(4, 5))
x

y = matrix(1:20, 4, 5)
y

# 2행 4행의 모든 요소 추출
y [c(2,4), ]
y[1:2, ]

z = matrix(2, 4, 5)
z

z = matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol=3, byrow=T)
# byrow = 행단위로 채우다. 
z

# 배열[행, 열]
z[1, 2]
z

x = 1:4
y = 5:8

cbind(x, y) # 행 방향으로 결합
rbind(x,y) # 열 방향으로 결합 

a = matrix(0, 4, 5)
cbind(a, 1:4)

A = matrix(1:20, 4, 5)
B = matrix(1:20, 4, 5)
C = cbind(A, B)
C

# 행렬연산 : 벡터화연산 
A + B
A - B
A * B
A / B

matrix(1:20, 4, 5) + matrix(1:10, 2, 5) #행렬 안 맞으면 계산 불가 
A

t(A) # 전치행렬 - 대각선으로 뒤집는 것 
# 행렬곱 : %*% 

A 
nrow(A) # 행의 개수, ncol() - 열의 개수 
colnames(A) = c('alpha', 'beta', 'gamma', 'delta', 'omega')
rownames(A) = c('A', 'B', 'C', 'D')
A
