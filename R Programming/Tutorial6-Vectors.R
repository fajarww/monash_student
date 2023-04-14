

MyFirstVector <- c(3, 45, 56, 732)
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L, 12L, 243L, 0L)
V2
is.numeric(V2)
is.integer(V2)
is.double(V2)

v3 <- c("c", "b23", "hWeL")
v3
is.character(v3)
is.numeric(v3)

v4 <- c("c", "b23", "hWeL", 7)
v4
is.character(v4)
is.numeric(v4)


seq() #sequence - like colon ':'
rep() #replicate

seq(1,15)
1:15
seq(1:15)

seq(1,15,2)
z <- seq(1,15,4)
z

rep(3, 5)
d <- rep(3,50)
d
rep("a", 5)
x <- c(80,20)
rep(x,10)
