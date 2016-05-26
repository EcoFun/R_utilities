author = "Ludovic Duvaux"
maintainer = "Ludovic Duvaux"
license = "GPL_v3"

roundUp <- function(x){
    if (x >=0){
        res <- 10^ceiling(log10(x))
    } else {
        res <- -10^floor(log10(abs(x)))
    }
    if (res==-1) res <- 0
    return(res)
}

roundDn <- function(x){
    if (x >=0){
        res <- 10^floor(log10(x))
    } else {
        res <- -10^ceiling(log10(abs(x)))
    }
    if (res==1) res <- 0
    return(res)
}
