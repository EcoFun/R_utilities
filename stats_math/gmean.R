# function to compute geometric mean
gmean <- function(x){
    # x: vector of values
    # WARNING: values equal to zero or NA will be omitted from the computation
    exp((1/length(x[which(x>0)]))*sum(log(x[which(x>0)]), na.rm=T))
}
