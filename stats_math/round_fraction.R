author = "Ludovic Duvaux"
maintainer = "Ludovic Duvaux"
license = "GPL_v3"


# round a value to the closest bound of 1 divided by X
# for instance if X=2, the bounds are 0, 0.5, 1
rd_frac <- function(N, X=2){
    # N: vector of values
    # X: define the number of bins in one unit (e.g if X=2, bins are '0 -> 0.5' and '0.5 -> 1')
    round(N*X)/X
}

#~vec <- 1:3000/1000
#~vec_t <- rd_frac(vec, 2)
#~plot(vec_t ~ vec)

#~vec_t2 <- rd_frac(vec, 10)
#~plot(vec_t2 ~ vec)
