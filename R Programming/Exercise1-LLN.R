N <- 100000
counter <- 0

for(i in rnorm(N)){
  if(i>=-1 & i<=1){
    counter <- counter + 1
  }
}

mean <- counter/N
mean