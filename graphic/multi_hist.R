#R Plot Scipt CAP population statistic Polymorphorama

author = "Ludovic Duvaux"
maintainer = "Ludovic Duvaux"
license = "GPL_v3"

# dependendent on 'math_functions.R' for functions:
    # roundDn
    # roundUp
    # -> source("round_functions.R")

multi.hist <- function(stats, colos, xlab, main='', xlim=NULL, pas=NULL, verbose=F){
	# stat:  a vector or a list of length 2 of numeric to be plotted
	# colos: a vector of 1 or to colors. 
	# xlab: x axis title
    # main, xlim, ylim: same an usual R plot
    # pas: width of the histogram bins
	
	# 1) test the nature of input
	test <- !is.list(stats) & length(stats) > 1
	if (test){	# I have only one stat to plot
		all <- stats
		print("stats is a vector of length > 1")
	} else if (is.list(stats) & length(stats) == 2) {	# I have 2 stats to plot
		all <- c(stats[[1]], stats[[2]])
		print("stats is a list of length 2")
        
        if (length(colos)!=2){
            stop("object 'stats' is a list, so colos should be of length2")}

	} else {	# error 
		stop("Object stats should be a vector or a list of length 2")}
	
	# 2) set initial global histogramm all values
	if (!is.null(pas)){
		mx <- max(all)
        mn <- min(all)
		brk <- seq(roundDn(mn), roundUp(mx), pas)
		h <- hist(all, breaks=brk, plot=F)
	} else {
		if (verbose) print("pas is NULL")
		h <- hist(all, plot=F)
		brk <- h$breaks}

	if (verbose) print(brk)
	
	# 3) set plot limits
	if (is.null(xlim)) {
		xlim <- range (all)
		xlim <- c(floor(xlim[1]), ceiling(xlim[2]))
		if (verbose) print(sprintf("range of histogram is '%s - %s'", xlim[1], xlim[2]))}

	ylim <- c(0, max(h$counts))
	
	# plot histograms
	if (test) {
		hist(stats, col=colos[1],  xlab=xlab, main=main, xlim=xlim, ylim=ylim, breaks=brk)
	} else {
		hist(stats[[1]], col=colos[1],  xlab=xlab, main=main, xlim=xlim, ylim=ylim, breaks=brk)
		hist(stats[[2]], col=colos[2],  xlab='', ylab='', main='', xlim=xlim,
            ylim=ylim, breaks=brk, add=T)}
}

#~multi.hist(stats=list(summarystatsCAM$SynSites, summarystatsCAM$RepSites), colos=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)), xlab='Wild population site')
