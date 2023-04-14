x <- c("a","b","c","d","e")
x
x[c(1,5)]
x[1]

Games
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008","2014")]

Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])

Games[1,5]
is.matrix(Games[1,5])
is.vector(Games[1,5])

Games[1,,drop=FALSE]
is.matrix(Games[1,,drop=FALSE])
is.vector(Games[1,,drop=FALSE])

Games[1,5,drop=FALSE]
is.matrix(Games[1,,drop=FALSE])
is.vector(Games[1,,drop=FALSE])
