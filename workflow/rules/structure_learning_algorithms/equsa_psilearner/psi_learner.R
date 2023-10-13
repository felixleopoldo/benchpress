# R.utils is needed for the timeout so make sure this is installed.
source("workflow/scripts/utils/helpers.R")
library(equSA)

equSAR_localR<-function(iData, iMaxNei, ALPHA1=0.05, ALPHA2=0.05, GRID=2, iteration=100) {
    # Wrote this to avoid the sigfault issue when running the C code in equSA1
    p <- dim(iData)[2]
    A <- matrix(0, ncol=p, nrow=p)
    U <- psical(iData,iMaxNei, ALPHA1,GRID,iteration)
    ## U should be cbind(row, col, psi score)
    ## when the q-value is too large or too small
    ## the C code returns a segfault memory issue
    ## the R code returns a matix of zeroes, therefore, here we check it
    ## and returns an empty mattix
    if(U[1,1]==0 & U[1,2]==0)           
        return(list(score = U, Adj = A, sigfault=TRUE))
    
    z<-U[,3]
    q<-pnorm(-abs(z), log.p=TRUE)
    q<-q+log(2.0)
    s<-qnorm(q,log.p=TRUE)
    s<-(-1)*s
    UU<-cbind(U[,1:2],s)
    ## subsampling for psi scores ###
    N <- length(U[,1])
    ratio<-ceiling(N/100000)
    UU<-UU[order(UU[,3]), 1:3]
    m<-floor(N/ratio)
    m0<-N-m*ratio
    s<-sample.int(ratio,m,replace=TRUE)
    for(i in 1:length(s)) s[i]<-s[i]+(i-1)*ratio
    if(m0>0) {
        s0<-sample.int(m0,1)+length(s)*ratio
        s<-c(s,s0)
    }
    Us<-UU[s,]
    y <- round(Us,6)

    ##  multiple hypothesis tests ###
    q = pcorselR(y, ALPHA2, GRID, iteration)
    s = y[,3]> q
    ij = y[s, c(1,2)]
    A[ij] <-1
    A = A + t(A)
    list(score = U, Adj = A, sigfault=FALSE)
}

myalg <- function() {
    output_filename <- snakemake@output[["adjmat"]]
    time_filename <- snakemake@output[["time"]]
    data_filename <- snakemake@input[["data"]]
    ntests_filename <- snakemake@output[["ntests"]]
    alpha1 <- as.numeric(snakemake@wildcards[["alpha1"]])
    alpha2 <- as.numeric(snakemake@wildcards[["alpha2"]])
    grid <- as.integer(snakemake@wildcards[["grid"]])
    iterations <- as.integer(snakemake@wildcards[["iterations"]])

    ## The algorithm should be in this function.
    start <- proc.time()[1]
    ## extract codes
    input_data <- read.csv(data_filename, header = TRUE, check.names = FALSE)
    n <- nrow(input_data)
    p <- ncol(input_data)
    neighborhood <- floor(n / log(n)) + 1
    if (!is.null(snakemake@wildcards[["neig"]])) {
          neighborhood <- as.integer(snakemake@wildcards[["neig"]])
      }
    
    res <- equSAR_localR(
        iData = input_data,
        iMaxNei = neighborhood,
        ALPHA1 = alpha1,
        ALPHA2 = alpha2,
        GRID = grid,
        iteration = iterations
    )
    
    adjmat <- res$Adj

    totaltime <- proc.time()[1] - start
    if(res$sigfault) {
        file.create(file = output_filename)
        totaltime = "None"
    }else {
        colnames(adjmat) <- names(input_data) # Get the labels from the data
        write.csv(adjmat, file = output_filename, row.names = FALSE, quote = FALSE)
    }
    write(totaltime, file = time_filename)
    # Write the true number of c.i. tests here if possible.
    cat("None", file = ntests_filename, sep = "\n")
}

add_timeout(myalg)


