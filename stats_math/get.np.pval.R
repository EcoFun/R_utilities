get.np.pval <- function(obs, exp.dist, two_sided=F, greater=T){
# function to compute a p-value from an experimental distribution (to be provided)
# obs: observed value of the statistics
# exp.dist: experimental distribution of the statistics
# two_sided: boolean
# greater: if two_sided=F, H1 is obs is greater than expected.

    if ( greater | !two_sided ) {
        prop <- 1-length(subset(exp.dist, obs >= exp.dist)
    } else {
        prop <- 1-length(subset(exp.dist, obs <= exp.dist)
    }

    pval <- prop)/length(exp.dist)

    if (two_sided) {
        pval2 <- abs(1-pval)
        pval <- ifelse(pval<=pval2, pval, pval2)*2}
    
    return(pval)
}
