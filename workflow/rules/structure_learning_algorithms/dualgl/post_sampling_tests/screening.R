library(data.table)
library(stringr)
## library(igraph)
## library(ggplot2)
source('utils.R')
## library(BDgraph)
library(equSA)
# devtools::install_github("lihualei71/adaptMT")
# library("adaptMT")
## library("splines")

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


# R.utils is needed for the timeout so make sure this is installed.
source("workflow/scripts/utils/helpers.R")
# source("/path/in/dockerimage/filetosource.R")

## Loading data
all.files = dir('../graphs/', full.names=TRUE)
get_graph_filenames('0.1_random')
data =get_graph_data('0.1_random')
true_graph = data[[1]]
dt = data[[2]]

myalg <- function() {
    # The algorithm should be in this function.
    
    ## data <- read.csv(snakemake@input[["data"]], check.names = FALSE)
    start <- proc.time()[1]
    ##

    ## extract codes
    codes = dt$code[1]
    codes = drop(sapply(str_split(str_sub(codes, 2,-2), '-'), as.numeric))
    dt = dt[-c(1:3),]
    colnames(dt)<-c('index', 'score', 'added', 'removed', 'code', 'delta', 'm')
    n = nrow(data[[3]])
    p = ncol(data[[3]])

    #dt = dt[code %in% c(0,9,5)][m>0]
    ## 9 failed disconnect, 5 failed connect, 0 success One-pair JT sampler
    ## 6 faild connection, 4 fails disconnection, 0 sucess, Guidici Green
    dt = dt[code %in% codes][m>0]

    ## re-order edge index, where x-y such that x < y.
    a = rbind(dt[removed=='[]',as.list(fix_edges(added, 'add')), index],
              dt[added=='[]', as.list(fix_edges(removed, 'remove')), index])
    dt = merge(a, dt, by ='index')

    ## inverting Marginal likelihood ratio
    dt[, B := ifelse(move=='remove', delta,-delta)]

    ## compute the Z-test
    dt[, z:=z(B, n, m)]
    dt[, zt:=z_tild(z)]
    dt[order(zt)]
    dt = merge(dt, dt[, .(empirical_p = sum(code=='0')/.N, .N), by = edge], by = c('edge'))

    
    ## converting orig/dest to numeric
    dt$orig = as.numeric(dt$orig)
    dt$dest = as.numeric(dt$dest)

    
    dt = unique(dt[, .(orig, dest, edge, zt, z, empirical_p, N)])

    dt_treat=dt[, .(orig=orig[1], dest=dest[1],zt= mean(zt),z = mean(z), .N), by = edge]
    q = dt_treat[, pcorselR(cbind(orig, dest, zt), ALPHA2=0.05, GRID=2, iteration=100)]
    dt_treat[, est_edge := 1*(zt>=q)]

    
    dt_treat

    adjmat <- matrix(0, nrow = p, ncol = p)
    ed = dt_treat[est_edge==1][, cbind(orig+1, dest+1)]
    adjmat[ed] <- 1

    adjmat <- 1 * (adjmat | t(adjmat))
    diag(adjmat) <- 0
        
    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- names(data) # Get the labels from the data
    write.csv(adjmat, file = snakemake@output[["adjmat"]], row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
    # Write the true number of c.i. tests here if possible.
    cat("None", file = snakemake@output[["ntests"]], sep = "\n") 
}

add_timeout(myalg)


## Loading data
all.files = dir('../graphs/', full.names=TRUE)
get_graph_filenames('0.1_random')
data =get_graph_data('0.1_random')
true_graph = data[[1]]
dt = data[[2]]

## extract codes
codes = dt$code[1]
codes = drop(sapply(str_split(str_sub(codes, 2,-2), '-'), as.numeric))
dt = dt[-c(1:3),]
colnames(dt)<-c('index', 'score', 'added', 'removed', 'code', 'delta', 'm')
n = dim(data[[3]])[1]
p = dim(data[[3]])[2]

#dt = dt[code %in% c(0,9,5)][m>0]
## 9 failed disconnect, 5 failed connect, 0 success One-pair JT sampler
## 6 faild connection, 4 fails disconnection, 0 sucess, Guidici Green
dt = dt[code %in% codes][m>0]


## re-order edge index, where x-y such that x < y.
a = rbind(dt[removed=='[]',as.list(fix_edges(added, 'add')), index],
          dt[added=='[]', as.list(fix_edges(removed, 'remove')), index])
dt = merge(a, dt, by ='index')

## inverting Marginal likelihood ratio
dt[, B := ifelse(move=='remove', delta,-delta)]

## compute the Z-test
dt[, z:=z(B, n, m)]
dt[, zt:=z_tild(z)]
dt[order(zt)]
dt = merge(dt, dt[, .(empirical_p = sum(code=='0')/.N, .N), by = edge], by = c('edge'))

## converting orig/dest to numeric
dt$orig = as.numeric(dt$orig)
dt$dest = as.numeric(dt$dest)



dt = unique(dt[, .(orig, dest, edge, zt, z, empirical_p, N)])


dt_treat=dt[, .(orig=orig[1], dest=dest[1],zt= mean(zt),z = mean(z), .N), by = edge]
dt_treat

q = dt_treat[, pcorselR(cbind(orig, dest, zt), ALPHA2=0.05, GRID=2, iteration=100)]

dt_treat[, est_edge := 1*(zt>=q)]
dt_treat



## g <- graph_from_adjacency_matrix(
##     adjmatrix= 1*(true_graph>0),
##     mode = "undirected",
##     add.colnames=FALSE,
##     add.rownames=FALSE
## )

## ed = cbind(as_edgelist(g)-1, 1L)
## ed = data.table(ed)
## colnames(ed)<-c('orig', 'dest', 'true_edge')
## ed$orig = as.numeric(ed$orig)
## ed$dest = as.numeric(ed$dest)


## dt_treat = merge(dt_treat, data.table(ed), all.x=TRUE, by = c('orig','dest'))
## dt_treat[is.na(true_edge)]$true_edge <-0L

## dt_treat[, hist(zt,breaks=100)]
## dt_treat[true_edge==1, hist(zt, add=TRUE, col='blue', breaks=50)]


## dt_treat[, hist(z,breaks=100)]
## dt_treat[true_edge==1, hist(z, add=TRUE, col='blue', breaks=50)]


## dt_treat[, p_value:= 1 - pnorm(zt)]

## formulas <- paste0("~ns(N, df = ", 2:6, ")")
## formulas <- paste0(formulas, ' + I(edge)')
## library("mgcv")

## res_glm <- adapt_gam(x =data.frame(N=dt_treat$N, edge=dt_treat$edge),
##                      pvals = dt_treat$p_value,
##                      mu_formulas = formulas,
##                      pi_formulas=formulas,
##                      s0 = rep(0.9, nrow(dt_treat)))

## ## formulas
## ## ## pvals = dt$p_value
## ## ## x = data.frame(dt$N, dt$edge)

## ## par(mfrow = c(2, 3))
## ## for (alpha in seq(0.3, 0.05, -0.05)){
## ##   nrejs <- res_glm$nrejs[floor(alpha * 100)]
## ##   title <- paste0("alpha = ", alpha, ", nrejs = ", nrejs)
## ##   plot_1d_lfdr(res_glm, x, pvals, alpha, title, disp_ymax = 0.25, xlab = "order")
## ## }


## return_alpha_rejs<-function(alpha, model) {
##     i = which(model$alphas==alpha)
##     model$rejs[[i]]
## }


## edge(g)

## sum(dt_treat$p_value < res_glm$qvals)
## names(res_glm)

## sapply(res_glm$alphas, function(i) length(return_alpha_rejs(i, res_glm)))

## plot(1:910, dt_treat$p_value[res_glm$order])


## index = return_alpha_rejs(0.01, res_glm)
## length(index)
## index
## dt_treat[, rejs:= 1*(p_value < res_glm$qvals)]
## dt_treat[index, rejs:=1]

## dt_treat[rejs==1]

## dt_treat[, rejs:= 1*(zt<=q)]


## dt_treat[, hist(zt, breaks=50)]
## dt_treat[true_edge==1, hist(zt, col='blue', add=TRUE, breaks=50)]
## dt_treat[rejs==1, hist(zt, col='red', add=TRUE, breaks=50)]



## plot_2d_thresh(res_glm, x, dt_treat$p_value, 0.01, "P-value Thresholds (alpha = 0.3)")
## plot_2d_lfdr(res_glm, x, dt_treat$p_value, 0.01, "P-value Thresholds (alpha = 0.3)")
## plot_2d_lfdr(res, x, pvals, 0.3, "Local FDR Estimates (alpha = 0.3, p = 0.01)", 0.01)

##  dt_treat$p_value

## plot_2d_thresh
