# R.utils is needed for the timeout so make sure this is installed.
source("workflow/scripts/utils/helpers.R")
# source("/path/in/dockerimage/filetosource.R")
## Loading local libraries
library(data.table)
library(stringr)
library(equSA)

split <- function(x) {
    y = str_sub(x,2,-2)
    a = str_split(y, '-')
    u = as.numeric(a[[1]][1])
    v = as.numeric(a[[1]][2])
    c(u,v)
}

fix_edges<-function(x, move='add') {
    a = split(x)
    c(edge=paste(min(a), max(a), sep='-'), orig=min(a), dest=max(a), move=move)
}

z <-function(logLambda, n, m, delta= 1, g = 1/n) {
    ## returns a normalized z
    gamma1<-function(x) lgamma((delta + x-1)/2) - lgamma((delta+x - 2)/2)
    ## L = lambda/(sqrt(n+1) * gamma1(m+2))
    L = (2/n) * (gamma1(n+m) - gamma1(m) - log(1+1/g) + logLambda)
    sL = sqrt(1-pmin(exp(L),1-1e-8))
    z = 0.5*log((1+ sL)/(1-sL))
    z * sqrt(n - m -1)
}

rho2 <-function(logLambda, n, m, delta= 1, g = 1/n) {
    ## returns a normalized z
    gamma1<-function(x) lgamma((delta + x-1)/2) - lgamma((delta+x - 2)/2)
    ## L = lambda/(sqrt(n+1) * gamma1(m+2))
    L = (2/n) * (gamma1(n+m) - gamma1(m) - log(1+1/g) + logLambda)
    1 - exp(L)
}

z_tild <-function(z) {
    q<-pnorm(-abs(z), log.p=TRUE)
    q<-q+log(2.0)
    s<-qnorm(q,log.p=TRUE)
    (-1) * s   
}





## local testing
## traj_filename = "graphs//adjvec_1_0.1_random.csv"
## data_filename = "graphs//seed_1_0.1_random.csv"
## all.files = dir('graphs/', full.names=TRUE)
## get_graph_filenames('0.1_random')
## data =get_graph_data('0.1_random')
## true_graph = data[[1]]
## dt = data[[2]]

## traj_filename = "results/adjvecs/adjmat=/bdgraph_graphsim/p=50/graph=random/class=None/size=None/prob=0.5/seed=2/parameters=/bdgraph_rgwish/b=3/threshold_conv=1e-07/seed=2/data=/iid/n=50/standardized=False/algorithm=/athomas_jtsampler/alg_params=/timeout=None/mcmc_seed=1/num_samples=100000/sampler=0/edge_penalty=0.0/size_maxclique=100/full_output=True/mcmc_params/mcmc_estimator=map/threshold=0.0/burnin_frac=0.5/seed=2/adjvecs_fulloutput_tobecompressed.csv"
## data_filename = "results/data/adjmat=/bdgraph_graphsim/p=50/graph=random/class=None/size=None/prob=0.5/seed=2/parameters=/bdgraph_rgwish/b=3/threshold_conv=1e-07/seed=2/data=/iid/n=50/standardized=False/seed=2.csv"

## traj_filename = "results/adjvecs/adjmat\=/bdgraph_graphsim/p\=50/graph\=random/class\=None/size\=None/prob\=0.1/seed\=1/parameters\=/bdgraph_rgwish/b\=3/threshold_conv\=1e-07/seed\=1/data\=/iid/n\=50/standardized\=False/algorithm\=/athomas_jtsampler/alg_params\=/timeout\=None/mcmc_seed\=1/num_samples\=2000000/sampler\=0/edge_penalty\=0.0/size_maxclique\=50/full_output\=True/seed\=1/adjvecs_fulloutput_tobecompressed.csv"

myalg <- function() {

    output_filename <- snakemake@output[["adjmat"]]
    traj_filename <- snakemake@input[["seqgraph"]]
    time_filename <- snakemake@output[["time"]]
    data_filename <- snakemake@input[["data"]]
    ntests_filename <- snakemake@output[["ntests"]]
    alpha = as.numeric(snakemake@wildcards[['alpha']])

    ## The algorithm should be in this function.
    start <- proc.time()[1]
    ## extract codes
    data <- read.csv(traj_filename, check.names = FALSE, header = TRUE)
    data = data.table(data)
    codes = data$code[1]
    codes = drop(sapply(str_split(str_sub(codes, 2,-2), '-'), as.numeric))
    data = data[-c(1:3), ]
    colnames(data)<-c('index', 'score', 'added', 'removed', 'code', 'delta', 'm')

    input_data = read.csv(file = data_filename, header=TRUE)
    n = nrow(input_data)
    p = ncol(input_data)
    
    ## data = data[code %in% c(0,9,5)][m>0]
    ## 9 failed disconnect, 5 failed connect, 0 success One-pair JT sampler
    ## 6 faild connection, 4 fails disconnection, 0 sucess, Guidici Green
    data = data[code %in% codes][m>0][m < n-1]

    ## re-order edge index, where x-y such that x < y.
    a = rbind(data[removed=='[]',as.list(fix_edges(added, 'add')), index],
              data[added=='[]', as.list(fix_edges(removed, 'remove')), index])
    data = merge(a, data, by ='index')
    
    
    ## inverting Marginal likelihood ratio
    data[, B := ifelse(move=='remove', delta,-delta)]

    ## compute the Z-test
    data[, z:=z(B, n, m)]
    data[, zt:=z_tild(z)]

    emp = data[ ,.(N_p = .N, prop = sum(1*(code=='0') * (move =='remove') +  1*(code!='0')*(move=='add'))/.N), by = c('edge')][order(edge)]

    data = merge(data, emp, by = 'edge')

    
    ## converting orig/dest to numeric
    data$orig = as.numeric(data$orig)
    data$dest = as.numeric(data$dest)

    
    data = unique(data[, .(orig, dest, edge, zt, z, prop, N_p)])


    data_treat=data[, .(
        orig=orig[1],
        dest=dest[1],
        zt= mean(zt),
        z = mean(z),
        .N,
        N_p = N_p[1],
        prop = prop[1]), by = edge]

    data_treat[, pzt := sqrt(N_p) * prop/sqrt(1e-4+prop*(1-prop))]
    data_treat
    #q = data_treat[, pcorselR(cbind(orig, dest, zt), ALPHA2=0.05, GRID=3, iteration=100)]
    q = as.numeric(snakemake@wildcards[['alpha']])
    
    data_treat[, est_edge := 1*(pnorm(zt)> 1-q)]

    adjmat <- matrix(0, nrow = p, ncol = p)
    ed = data_treat[est_edge==1][, cbind(orig+1, dest+1)]
    adjmat[ed] <- 1

    adjmat <- 1 * (adjmat | t(adjmat))
    diag(adjmat) <- 0

    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- colnames(input_data) # Get the labels from the data
    write.csv(adjmat, file = output_filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = time_filename)
    # Write the true number of c.i. tests here if possible.
    cat("None", file = ntests_filename, sep = "\n") 
}

add_timeout(myalg)
