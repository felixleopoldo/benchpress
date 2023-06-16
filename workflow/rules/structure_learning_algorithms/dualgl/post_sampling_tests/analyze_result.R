library(data.table)
library(stringr)
library(igraph)
library(ggplot2)
source('utils.R')
library(BDgraph)
library(equSA)

all.files = dir('../graphs/', full.names=TRUE)

sub_sample<-function(N, ratio = ceiling(N/1e4)) {
    m<-floor(N/ratio)
    m0<-N-m*ratio
    s<-sample.int(ratio,m,replace=TRUE)
    s
    for(i in 1:length(s)) s[i]<-s[i]+(i-1)*ratio
    if(m0>0) {
        s0<-sample.int(m0,1)+length(s)*ratio
        s<-c(s,s0)
    }
    s
}

z<-function(lambda, n, m, delta= 1) {
    ## returns a normalized z
    gamma1<-function(x) lgamma((delta + x-1)/2) - lgamma((delta+x - 2)/2)
    ## L = lambda/(sqrt(n+1) * gamma1(m+2))
    L = (2/n) * (gamma1(n+m) - gamma1(m) - log(1+n) + log(lambda))
    sL = sqrt(1-pmin(exp(L),1-1e-8))
    z = 0.5*log((1+ sL)/(1-sL))
    z * sqrt(n - m -1)
}

z_tild <-function(z) {
    q<-pnorm(-abs(z), log.p=TRUE)
    q<-q+log(2.0)
    s<-qnorm(q,log.p=TRUE)
    (-1) * s   
}



## Loading data
get_graph_filenames('auto')
data =get_graph_data('auto')
true_graph = data[[1]]
dt = data[[2]]
n = dim(data[[3]])[1]
p = dim(data[[3]])[2]
g = graph_from_adjacency_matrix(as.matrix(true_graph),
                            mode='undirected',
                            diag=FALSE,
                            add.colnames=FALSE)
g
colnames(dt)<-c('index', 'score', 'added', 'removed', 'code', 'delta', 'm')
dt[, unique(code)]

#dt = dt[code %in% c(0,9,5)][m>0]
## 9 failed disconnect, 5 failed connect, 0 success One-pair JT sampler
## 6 faild connection, 4 fails disconnection, 0 sucess, Guidici Green
dt = dt[code %in% c(0,6,4)][m>0]


dt

dt_heat = dt[code ==0]

dt_heat = merge(rbind(dt_heat[removed=='[]',as.list(fix_edges(added, 'add')), index],
                      dt_heat[added=='[]', as.list(fix_edges(removed, 'remove')), index]),
                dt_heat, by = 'index')
m = max(dt_heat$index)

dt_heat = merge(dt_heat[, .SD[1] , by =edge],
                dt_heat[order(index)][, sum(index) ,by=list(edge, move)][, .(p= abs(diff(V1))/m) ,by=edge],
                by = 'edge')
dt_heat = dt_heat[order(index)]
dt_heat$orig = as.numeric(dt_heat$orig)
dt_heat$dest = as.numeric(dt_heat$dest)
dt_heat
                                        #dt= dt[1000000:2979654]

a = rbind(dt[removed=='[]',as.list(fix_edges(added, 'add')), index],
          dt[added=='[]', as.list(fix_edges(removed, 'remove')), index])

dt = merge(a, dt, by ='index')


dt[, B := ifelse(move=='remove', exp(delta), exp(-delta))]
dt

dt[, z:=z(B, n, m)]
dt[, zt:=z_tild(z)]
dt[is.nan(z)]
dt[, hist(z)]


dt[order(zt)]

dt$orig = as.numeric(dt$orig)
dt$dest = as.numeric(dt$dest)


ed = cbind(as_edgelist(g)-1, 1L)
colnames(ed)<-c('orig', 'dest', 'true_edge')
dt = merge(dt, data.table(ed), all.x=TRUE, by = c('orig','dest'))
dt[is.na(true_edge)]$true_edge <-0L

dt
dt_max = dt[dt[, .I[zt == max(zt)][1], by=edge]$V1]

dt_max=dt[, .(orig=orig[1], dest=dest[1],zt= mean(zt), true_edge=true_edge[1]), by = edge]
dt_max
s = sub_sample(nrow(dt), 10)
length(sub_sample(nrow(dt), 10))
dt[order(zt)][s, pcorselR(cbind(orig, dest, zt), ALPHA2=0.05,GRID=2,iteration=100)]

thresh = 2.76
dt[zt>thresh][ ,.(TP=mean(true_edge),FP = mean(1-true_edge)), by = edge][,.(TP=sum(TP),FP = sum(FP))]

dt_max[, p:= 1-pnorm(zt)]
dt_max
roc_plot(dt_max)
roc_plot(dt_max, add=TRUE)

dt[, .N, by=edge][N==1]

dt[, unique(edge)]

dt_max[order(zt)][, pcorselR(cbind(orig, dest, zt), ALPHA2=0.05,GRID=4, iteration=100)]

dt_max[zt>2.5][ ,.(TP=mean(true_edge),FP = mean(1-true_edge)), by = edge][,.(TP=sum(TP),FP = sum(FP))]

E(g)

dt[true_edge==1][, 1 ,by = edge][, sum(V1)]

dt_max[, hist(zt, breaks=100)]
dt_max[true_edge==1, hist(zt, add=TRUE, col='blue', breaks=50)]


11dt[abs(zt)<Inf, max(zt), by=edge][, hist(V1, breaks=100)]

dt[true_edge==1][abs(zt)<Inf, max(zt), by=edge][ , hist(V1, add=TRUE, col='blue', breaks=100)]

g

dt[zt == -Inf]

freq1 = dt[, .(N=.N,
              accepted_raw= sum(code==0),
              sum_B = sum(B),
              sum2_B = sum(B^2),
              prog_p = list(cumsum(code==0)/1:.N),
              prog_N = list(1:.N),
              prog_B = list(cumsum(min(B,1))/1:.N),
              sum_z = sum(z),
              sum_p = sum(p),
              zl = list(z),
              pl = list(p)), list(edge, move, orig, dest)]

freq1[, accepted:=ifelse(move =='add', N - accepted_raw, accepted_raw)]
freq1[, accepted_raw:=NULL]

freq1[order(N)]
g
freq1
#freq[, accepted:=accepted_raw]
freq1[edge =='1-2'][2][,hist(unlist(pl), xlim=c(0,1))]
freq1[edge =='1-4'][1][,hist(unlist(pl), add =TRUE, col='red', breaks=50)]



prob = freq1[,
            .(N = sum(N),
              count = sum(accepted),
              #p = sum(accepted)/ sum(N),
              mu_B = sum(sum_B)/sum(N),
              var_B = sum(sum2_B)/sum(N) - (sum(sum_B)/sum(N))^2,
              z = sum(sum_z)/sum(N),
              p = sum(sum_p)/sum(N),
              var_p = (sum(sum_p)/sum(N))*(1-sum(sum_p)/sum(N))/sum(N)
              ),
            list(edge, orig, dest)]


prob[, lwr := p - 1.95*sqrt(p*(1-p)/N)]
prob[, upr := p + 1.95*sqrt(p*(1-p)/N)]

prob[, lwr_B := mu_B - 1.95*sqrt(var_B)]
prob[, upr_B := mu_B + 1.95*sqrt(var_B)]


prob$orig = as.numeric(prob$orig)
prob$dest = as.numeric(prob$dest)

ed = cbind(as_edgelist(g)-1, 1L)
colnames(ed)<-c('orig', 'dest', 'true_edge')

freq = merge(prob, data.table(ed), all.x=TRUE)
dt_heat=  merge(dt_heat, data.table(ed), all.x=TRUE)
dt_heat[is.na(true_edge)]$true_edge <-0L
freq[is.na(true_edge)]$true_edge <-0L


freq[true_edge==0, hist(p, xlim=c(0,1), breaks=100, xlab='p-value')]
freq[true_edge==1, hist(p, xlim=c(0,1), alpha = 0.3, col = 'blue', add= TRUE, breaks=100)]



pn <- ggplot(freq, aes(x= N, y = p)) +
    geom_point(aes(color=as.factor(true_edge), shape=as.factor(true_edge)))+
    #ggtitle("Scatter of acceptance probability") +
    labs(color = "true G", shape = 'true G') + 
    ylab("Empirical rejection probability") +
    xlab("Number time an edge is attempted") 

pn


ph <- ggplot(freq, aes(x = p, color=as.factor(true_edge))) +
    geom_density() +
    ggtitle("histogram of acceptance probability") +
     labs(color = "true G")

ph2 <- ggplot(freq, aes(x = p))+
    geom_density() +
    ggtitle("histogram of acceptance probability")

ph3 <- ggplot(freq, aes(x= true_edge, y=p, color=as.factor(true_edge))) +
    geom_boxplot()+
    labs(color = "true G") +
    ylab('p-value')
ph3

plwr <- ggplot(freq, aes(x= true_edge, y=lwr, color=as.factor(true_edge))) +
    geom_boxplot() +
    ggtitle("empirical lower bound of acceptance probability")+
     labs(color = "true G")

pupr <- ggplot(freq, aes(x= true_edge, y=upr, color=as.factor(true_edge))) +
    geom_boxplot() +
    ggtitle("empirical upr bound of   acceptance probability") +
     labs(color = "true G")

plwrd <- ggplot(freq, aes(x = lwr)) +
    geom_density() +
    ggtitle("histogram of lower bound of  p")


puprd <- ggplot(freq, aes(x = upr))+
    geom_density() +
    ggtitle("histogram of upper bound of p")

multiplot(pn, ph, ph2, ph3,plwr, pupr, plwrd, puprd, cols=3)


bn <- ggplot(freq, aes(x= N, y = var_B)) +
    geom_point(aes(color=as.factor(true_edge), shape=as.factor(true_edge))) +
    ggtitle('Likelihood ratio versis number of observations') +
     labs(color = "true G", shape = 'true G')

bh <- ggplot(freq, aes(x = mu_B, color=as.factor(true_edge))) +
    geom_density() +
    ggtitle("histogram of likelihood ratio") +
    labs(color = "true G")

bh2 <- ggplot(freq, aes(x = mu_B))+
    geom_density() +
    ggtitle("histogram of likelihood ratio")

bh3 <- ggplot(freq, aes(x= true_edge, y=mu_B, color=as.factor(true_edge))) +
    geom_boxplot()+
    ggtitle("boxplotof likelihood ratio") +
     labs(color = "true G")

blwr <- ggplot(freq, aes(x= true_edge, y=lwr_B, color=as.factor(true_edge))) +
    geom_boxplot() +
    ggtitle("empirical lower bound of  likelihood ratio")+
     labs(color = "true G")

bupr <- ggplot(freq, aes(x= true_edge, y=upr_B, color=as.factor(true_edge))) +
    geom_boxplot() +
    ggtitle("empirical upr bound of  likelihood ratio")+
     labs(color = "true G")

blwrd <- ggplot(freq, aes(x = lwr_B))+
    geom_density() +
    ggtitle("empirical lower bound of  likelihood ratio")
    

buprd <- ggplot(freq, aes(x = upr_B))+
    geom_density() +
    ggtitle("empirical upper bound of  likelihood ratio")

varB <- ggplot(freq, aes(x= true_edge, y=sqrt(var_B), color=as.factor(true_edge))) +
    geom_boxplot() +
    labs(color = "true G")

multiplot(bn, bh, bh2, bh3, blwr, bupr, blwrd, buprd, varB, cols=3)



countN <- ggplot(freq, aes(x= count, y = N)) +
    geom_point(aes(color=as.factor(true_edge), shape=as.factor(true_edge))) +
    #ggtitle('Likelihood ratio versis number of observatixons') +
    labs(color = "true G", shape = 'true G') +
    ylab('Number of times attempted') +
    xlab('Number of times accepted')

countN

NB <- ggplot(freq, aes(x= mu_B, y = N)) +
    geom_point(aes(color=as.factor(true_edge), shape=as.factor(true_edge))) +
    ggtitle('Likelihood ratio versus attempted') +
    labs(color = "true G", shape = 'true G')

countB <- ggplot(freq, aes(x= mu_B, y = count)) +
    geom_point(aes(color=as.factor(true_edge), shape=as.factor(true_edge))) +
    ggtitle('Likelihood ratio versus accepted') +
    labs(color = "true G", shape = 'true G')

Np <- ggplot(freq, aes(x= p, y = N)) +
    geom_point(aes(color=as.factor(true_edge), shape=as.factor(true_edge))) +
    ggtitle('Likelihood ratio versus attempted') +
    labs(color = "true G", shape = 'true G')

countp <- ggplot(freq, aes(x= p, y = count)) +
    geom_point(aes(color=as.factor(true_edge), shape=as.factor(true_edge))) +
    ggtitle('Likelihood ratio versus accepted') + 
    labs(color = "true G", shape = 'true G')

multiplot(NB, countB, Np, countp, countN, cols=2)


pn <- ggplot(freq, aes(x= N, y = z)) +
    geom_point(aes(color=as.factor(true_edge), shape=as.factor(true_edge)))+
    ggtitle("Scatter of acceptance probability") +
    labs(color = "true G", shape = 'true G')

ph <- ggplot(freq, aes(x = z, color=as.factor(true_edge))) +
    geom_density() +
    ggtitle("histogram of acceptance probability") +
     labs(color = "true G")

ph2 <- ggplot(freq, aes(x = z))+
    geom_density() +
    ggtitle("histogram of acceptance probability")

ph3 <- ggplot(freq, aes(x= true_edge, y=z, color=as.factor(true_edge))) +
    geom_boxplot()+
     labs(color = "true G")


plwr <- ggplot(freq, aes(x= true_edge, y=lwr, color=as.factor(true_edge))) +
    geom_boxplot() +
    ggtitle("empirical lower bound of acceptance probability")+
     labs(color = "true G")

pupr <- ggplot(freq, aes(x= true_edge, y=upr, color=as.factor(true_edge))) +
    geom_boxplot() +
    ggtitle("empirical upr bound of   acceptance probability") +
     labs(color = "true G")

plwrd <- ggplot(freq, aes(x = lwr)) +
    geom_density() +
    ggtitle("histogram of lower bound of  p")


puprd <- ggplot(freq, aes(x = upr))+
    geom_density() +
    ggtitle("histogram of upper bound of p")

multiplot(pn, ph, ph2, ph3,plwr, pupr, plwrd, puprd, cols=3)



roc_plot<-function(dt1, add = FALSE) {
    prec = 1000
    a = 0:prec/prec
    num_true_edges = length(E(g))
    n = length(V(g))
    num_total_edges = n*(n-1)/2
    
    dt1[ ,p_thres:= round(p, 2)]

    t = dt1[, .(
        TP=sum(true_edge),
        FP = sum(1-true_edge),
        FN = num_true_edges - sum(true_edge),
        TN = num_total_edges - sum(1-true_edge)), by = p_thres]

    
    t = t[order(p_thres)][,
                          .(p_thres,TP = cumsum(TP),
                            FP = cumsum(FP),
                            FN = cumsum(FN),
                            TN = cumsum(TN)
                            )]
    

    t = t[, .(p_thres, TP, FP, FN, TN, FPR = FP/(num_total_edges-num_true_edges), TPR = TP/num_true_edges, PPV=TP/(TP+FP))]

    if(add) {
        a= t[lines(y = TPR,
                   x =FPR,
                   xlim=c(0,1),
                   ylim=c(0,1),
                   type='l',
                   xlab='recall', ylab='precision',
                   cex.lab=1.2,
                   cex.axis=1.2,
                   axes=TRUE)]
    }else {
        a= t[plot(y = TPR, x =FPR, xlim=c(0,1), ylim=c(0,1), type='l', xlab='recall', ylab='precision', cex.lab=1.2, cex.axis=1.2, axes=TRUE)]
    }
    #a= t[plot(x = FPR, y = TPR, xlim=c(0,1), ylim=c(0,1), type='l')]
    FPR = t$FPR
    TPR = t$TPR

    k = nrow(t)
        
    auc =  0.5*t(abs(FPR[2:k] - FPR[2:k -1]))%*% (TPR[2:k] + TPR[2:k -1])
    auc= auc + t(abs(1 - FPR[k]))%*%(1+TPR[k])*0.5
    round(100*auc,2)
}

## 93.4 AUC

roc_plot(dt_heat)

#pdf('pred_seq_random_2.pdf', height = 7, width = 14)
par(mar = c(5,5,0,0)+0.1)
roc_plot(freq)

freq
freq[z>2.2][ ,.(TP=sum(true_edge),FP = sum(1-true_edge))]

freq[lwr_B < 0.1][ ,.(TP=sum(true_edge),FP = sum(1-true_edge))]

freq[p < 0.025][ ,.(TP=sum(true_edge),FP = sum(1-true_edge))]

freq[, hist( (1- pnorm(p/sqrt(var_p))))]
freq[ 2*(1-pt((p)/sqrt(var_p), N-1)) >.08][ ,.(TP=sum(true_edge),FP = sum(1-true_edge))]





## number decomposbale
library(data.table)
a= fread('decom.txt', sep='|')
a[,V1:=NULL]
a[,V4:=NULL]


a[, num:=2^(V2*(V2-1)/2)]
a$V3= as.numeric(a$V3)
a[, plot(V2, log(V3/num))]
