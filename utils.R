autoFactor <- function(array,groups=4)
{
  min <- min(array)
  max <- max(array)
  sep <- max-min
  step <- sep/groups
  result <- c()
  foreach(i=1:length(array)) %:% foreach(j=1:groups) %do%{
      minV <- min+step*(j-1)
      maxV <- min+step*j
      if (array[i] >= minV && array[i]<=maxV )
        {result<-c(result,j)}
    }
 
  return (as.factor(result))
}

whichC<-function(array,param1,param2,val1,val2){
intersect(which(array$param1==val1),which(array$param2==val2))
}