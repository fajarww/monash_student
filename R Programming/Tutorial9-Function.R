#?

?rnorm()
rnorm(5,5,2)
rnorm(10,mean=10,sd=5)
rnorm(10,sd=5,mean=10)
rnorm(10,sd=5)

?seq()
seq(from=10,to=20,by=3)
seq(from=10,to=20,length.out=100)
x <- c("a","v","c")
seq(from=10,to=20,along.with=x)

?rep()
rep(5:6,10)
rep(5:6,times=10)
rep(5:6,each=10)
rep(x,each=5)

?sqrt()
A <- seq(from=10,to=20,along.with=x)
A
B <- sqrt(A)
B
