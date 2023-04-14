a <- c(1,2,3,4,5)
b <- rep(3,5)
c <- seq(1,10,2)
a
b
c
d <- a + b
e <- a - c
f <- a < b
g <- b > c
d
e
f
g
x <- rep(10,10)
x
y <- a + x
y
w <- rep(9,9)
w
z <- x-w
z


vec1 <- rnorm(5)
vec1

print(vec1[1])
print(vec1[2])
print(vec1[3])
print(vec1[4])
print(vec1[5])

#R-specific programming loop (simpler)
for(i in vec1){
  print(i)
}

#conventional programming loop
for(j in 1:5){
  print(vec1[j])
}



# --------- 2nd part for Today

N <- 100000000
a <- rnorm(N)
b <- rnorm(N)

#Vectorized Approach (faster in R)
c <- a*b

#Devectorized Approach
d <- rep(NA,N)
for(i in 1:N){
  d[i] <- a[i]*b[i]
}







