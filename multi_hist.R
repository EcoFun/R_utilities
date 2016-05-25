#R Plot Scipt CAP population statistic Polymorphorama

# set functions
roundUp <- function(x) 10^ceiling(log10(x))

plot.stats <- function(stats, colos, xlab, main='', xlim=NULL, pas=NULL, verbose=F){
	# stat:  a vector or a list of length 2 of statistics to be plotted
	# colos: 
	# xlab:
	
	# 1) test the nature of input
	test <- !is.list(stats) & length(stats) > 1
	if (test){	# I have only one stat to plot
		all <- stats
		print("stats is a vector of length > 1")
	} else if (is.list(stats) & length(stats) == 2) {	# I have 2 stats to plot
		all <- c(stats[[1]], stats[[2]])
		print("stats is a list of length 2")
	} else {	# error 
		stop("Object stats should be a vector or a list of length 2")
	}
	
	# 2) set initial global histogramm all values
	if (!is.null(pas)){
		mx <- max(all)
		brk <- seq(0, roundUp(mx), pas)
		h <- hist(all, breaks=brk, plot=F)
	} else {
		if (verbose) print("pas is NULL")
		h <- hist(all, plot=F)
		brk <- h$breaks
	}
	if (verbose) print(brk)
	
	# 3) set plot limits
	if (is.null(xlim)) {
		xlim <- range (all)
		xlim <- c(floor(xlim[1]), ceiling(xlim[2]))
		if (verbose) print(sprintf("range of histogram is '%s - %s'", xlim[1], xlim[2]))
	}
	ylim <- c(0, max(h$counts))
	
	# plot histograms
	if (test) {
		hist(stats, col=colos[1],  xlab=xlab, main=main, xlim=xlim, ylim=ylim, breaks=brk)
	} else {
		hist(stats[[1]], col=colos[1],  xlab=xlab, main=main, xlim=xlim, ylim=ylim, breaks=brk)
		hist(stats[[2]], col=colos[2],  xlab='', ylab='', main='', xlim=xlim, ylim=ylim, breaks=brk, add=T)
	}
}

# example of function plot.stats
plot.stats(stats=list(summarystatsCAM$SynSites, summarystatsCAM$RepSites), colos=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)), xlab='Wild population site')
