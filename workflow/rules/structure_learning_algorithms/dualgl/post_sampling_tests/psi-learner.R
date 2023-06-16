library(equSA)

data(SR0)
U <- psical(SR0, ALPHA1=0.05,iteration=50)



library(equSA)
library(igraph)
library(data.table)
library(data.table)
library(stringr)
library(igraph)
library(ggplot2)
source('utils.R')
library(BDgraph)



all.files = dir('../graphs/', full.names=TRUE)


z<-function(lambda, n, m, delta= 1) {
    gamma1<-function(x) gamma((delta + x-1)/2)/gamma((delta+x - 2)/2)
    #L = lambda/(sqrt(n+1) * gamma1(m+2))
    L = gamma1(n+m)* lambda/((n+1) * gamma1(m))
    L[L>1] = 0.99999
    sign =  -1 + 2*(1*runif(length(lambda))< 0.5)
    sL = sign*sqrt(1-L^(2/n))
    z = 0.5*log((1+ sL)/(1-sL))
    z
}

pvalue<-function(z, n, m) {
    s = sqrt(n - m -3)
    p = abs(z) * s
    2*(1-pnorm(p))
}


## Loading data
get_graph_filenames('auto')
data =get_graph_data('auto')
true_graph = data[[1]]
data = data[[3]]


g = graph_from_adjacency_matrix(as.matrix(true_graph),
                            mode='undirected',
                            diag=FALSE,
                            add.colnames=FALSE)

start_time <- Sys.time()
res = GGMM(data, true_graph, M=1, iteration = 100)
end_time <- Sys.time()
saveRDS(res, file='psi_p200n100.rds')
end_time - start_time
res = readRDS('psi_p200n100.rds')


plot(res$RecPre, type='l')
lines(res$RecPre, col='blue')
legend('bottomleft', legend = c('Hybrid-learner', 'psi-learner'), col = c('black', 'blue'), lty = c(1,1),
       cex =1.5,
       #title = 'At random',
       box.lwd = 0)
names(res)

res$RecPre
k = nrow(res$RecPre)
FPR = res$RecPre$[,2]
TPR = res$RecPre[,1]
0.5*t(abs(FPR[2:k] - FPR[2:k -1]))%*% (TPR[2:k] + TPR[2:k -1])
res$label


alpha2=0.5
roc_curve<-function(alpha2) {
    res= equSAR(data, ALPHA1 = 0.05, iteration=100,ALPHA2=alpha2)
    psi_score = data.table(res$score)
    colnames(psi_score)<-c('orig', 'dest', 'score')

    z<-psi_score$score
    q<-pnorm(-abs(z), log.p=TRUE)
    q<-q+log(2.0)
    s<-qnorm(q,log.p=TRUE)
    s<-(-1)*s
    psi_score[, z:=s]
 
    psi_hypotheiss =  pcorselR(psi_score[, c(1,2,4)], ALPHA2=0.05)
    psi_score[, p_thres:=psi_hypotheiss]
    psi_score[, alpha2:=alpha2]
    psi_score[, est_g:= z>= 1*p_thres]
    psi_score
}

area_under_curve_stats(psi_score, 0.5)

alpha2=seq(0.1,0.9, by=0.1)
res = lapply(alpha2, function(r) roc_curve(r))


roc_dt = data.table(t(sapply(1:length(res),
                function(i) {
                    d = res[[i]]
                    a = alpha2[i]
                    area_under_curve_stats(d, a)
                })))

roc_dt
roc_dt[, plot(x = TPR, y = PPV,
     xlim=c(0,1),
     ylim=c(0,1),
     type='l', xlab='recall', ylab='precision')]


roc_dt[, plot(x = FPR, y =TPR,
     xlim=c(0,1),
     ylim=c(0,1),
     type='l', xlab='FPR', ylab='TPR')]

roc_dt$TPR

res= equSAR(data, ALPHA1 = 0.5, iteration=100,ALPHA2=0.1)

psi_score = data.table(res$score)
colnames(psi_score)<-c('orig', 'dest', 'score')

psi_score[, p:=2*pnorm(abs(score))-1]

psi_score[, hist(p)]

ed = cbind(as_edgelist(g), 1L)
colnames(ed)<-c('orig', 'dest', 'true_edge')

freq = merge(psi_score, data.table(ed), all.x=TRUE)
freq[is.na(true_edge)]$true_edge <-0L
freq[true_edge==1, hist(p)]

roc_plot(freq)
pres_recall(freq)


plotGraph(res$Adj)
dt=res[[1]]

area_under_curve_stats<-function(dt, alpha2=0.1) {

    ed = cbind(as_edgelist(g), 1L)
    colnames(ed)<-c('orig', 'dest', 'true_edge')
    m = length(E(g))
    n = length(V(g))
    n = n*(n-1)/2
    freq = merge(dt, data.table(ed), all.x=TRUE)
    freq[is.na(true_edge)]$true_edge <-0L
    freq
   
    t = freq[ , .(
        TP=sum(est_g*true_edge),
        FP = sum(est_g*(1-true_edge)),
        FN = m - sum(est_g*true_edge),
        TN = n - sum(est_g*(1-true_edge)))]
    
    
    t[, .(alpha2, TP, FP, FN, TN, FPR = FP/(n-m), TPR = TP/m, PPV=TP/(TP+FP))]

}


pres_recall<-function(dt) {
    prec = 1000
    a = 0:prec/prec
    m = length(E(g))
    n = length(V(g))
    n = n*(n-1)/2
    

    dt[ ,p_thres:= round(p, 4)]
    t = dt[ , .(
        TP=sum(true_edge),
        FP = sum(1-true_edge),
        FN = m - sum(true_edge),
        TN = n - sum(1-true_edge)), by = p_thres]
    
    t = t[order(p_thres), .(p_thres,TP = cumsum(TP),
          FP = cumsum(FP),
          FN = cumsum(FN),
          TN = cumsum(TN)
          )]
    t
    t = t[, .(p_thres, TP, FP, FN, TN, FPR = FP/(n-m), TPR = TP/m, PPV=TP/(TP+FP))]
    t
    a= t[plot(x = TPR, y =PPV, xlim=c(0,1), ylim=c(0,1), type='l', xlab='recall', ylab='precision')]
    FPR = t$FPR
    TPR = t$TPR
    PPV = t$PPV

    k = nrow(t)
        
    auc =  0.5*t(abs(FPR[2:k] - FPR[2:k -1]))%*% (TPR[2:k] + TPR[2:k -1])
    auc= auc + t(abs(1 - FPR[k]))%*%(1+TPR[k])*0.5
    round(100*auc,2)
}



result <- SimHetDat(n = 100, p = 200, M = 3, mu = 0.5, type = "band")
Est <- GGMM(result$data, result$A, M = 3, iteration = 30, warm = 20)
## plot network by our estimated adjacency matrix.
plotGraph(Est$Adj)
## plot the Recall-Precision curve
plot(Est$RecPre[,1], Est$RecPre[,2], type="l", xlab="Recall", ylab="Precision")  


data(SR0)
U <- psical(SR0, ALPHA1=0.05,iteration=50)

dim(SR0)
?SR0


data.table(U)
?pnorm

z<-U[,3]
q<-pnorm(-abs(z), log.p=TRUE)
q<-q+log(2.0)
s<-qnorm(q,log.p=TRUE)
s<-(-1)*s
U<-cbind(U[,1:2],s)
res = GGMM(data, adjmat, M=1)
names(res)
plot(res$RecPre, type='l')
lines(res$RecPre, col='blue')
names(res)
res$BIC
res$label

pdf('psi_learn_graph.pdf')
plotGraph(res$Adj)
dev.off()

plotGraph(as.matrix(true_graph))
