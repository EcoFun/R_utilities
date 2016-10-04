author = "Ludovic Duvaux"
maintainer = "Ludovic Duvaux"
license = "GPL_v3"

# round ONE value to the upper order of magnitude 
# -0.0056 -> -0.001 ; 0.0056 -> 0.01 ; 2.3 -> 10 ; 829 -> 1000; 102 -> 1000, and so on
roundUp <- function(x){
    if (length(x)!=1) stop("x should be of length 1.")
    if (x >=0){
        res <- 10^ceiling(log10(x))
    } else {
        res <- -10^floor(log10(abs(x)))
    }
    if (res==-1) res <- 0
    return(res)
}

# round ONE value to the lower order of magnitude
# -0.0056 -> -0.01 ; 0.0056 -> 0.001 ; 2.3 -> 0 ; 829 -> 100; 102 -> 100, and so on)
roundDn <- function(x){
    if (length(x)!=1) stop("x should be of length 1.")
    if (x >=0){
        res <- 10^floor(log10(x))
    } else {
        res <- -10^ceiling(log10(abs(x)))
    }
    if (res==1) res <- 0
    return(res)
}

# round a value to the closest bound of 1 divided by X
# for instance if X=2, the bounds are 0, 0.5, 1 (there are two bins)
rd_frac <- function(N, X=2){
    # N: vector of values
    # X: define the number of bins per unit
        # if X=4, bounds are 0, 0.25, 0.5, 0.75, 1 and bins are in between
    round(N*X)/X
}

#~vec <- 1:3000/1000
#~vec_t <- rd_frac(vec, 2)
#~plot(vec_t ~ vec)

#~vec_t2 <- rd_frac(vec, 10)
#~plot(vec_t2 ~ vec)
