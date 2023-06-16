library(BDgraph)
library(igraph)
## sim data
p = 20
n = 2000
K= matrix(0, p, p)

K[cbind(2:p-1, 2:p)]<- 0.5
K[cbind(3:p-2, 3:p)]<- 0.25
diag(K) <- 1
K = (K + t(K))/2


sim_analytical_edge <-function(K, i, j,  nS = 4) {
    p = dim(K)[1]
    res = sapply(1:10000, function(x){ 
        U = c(1:p)[sample.int(p, nS)]
        U = setdiff(U, c(i,j))
        analytical_partial_cor(K, i, j, U)[1,2]
    })
    res
}
K
res = sim_analytical_edge(K, 1, 2, 4)

a = sapply(1:length(res), function(i)
{
    r = res[i]
    y = res[-i]
    ## (1-r^2)/(1-y^2)
    1 + (y^2 - r^2)/(1-y^2)
})

hist(a)
sum(a-1)


head(K)

set.seed(1)
data <- bdgraph.sim(
    n = n,
    p = p,
    graph = 'fixed',
    K = K,
)

#data = rmvnorm(n, 0, solve(K))

names(data)
adjmat = data$G
colnames(adjmat) <- 1:p - 1

data = data$data


library(igraph)
g <- graph_from_adjacency_matrix(adjmat, mode='undirected')
plot(g)

Rsquared<-function(data, i, j, S) {
    d = lm(data[,i]~data[, S])
    dj = lm(data[,i]~data[, c(j,S)])
    Rj = summary(dj)$r.squared
    R = summary(d)$r.squared
    (1- Rj)/(1-R)
}

partial_cor<-function(data, x, y,S) {
    ex = lm(data[,x]~data[, S]-1)$residual
    ey = lm(data[,y]~data[, S]-1)$residual
    
    N = nrow(data)
    a = N * t(ex) %*% ey
    b = N * t(ex) %*% ex
    c = N * t(ey) %*% ey
    c(a/sqrt(b * c))
    
}
plot(g)

partial_cor(data, 1, 2, c(4:12))

S = solve(K)
A = diag(1/sqrt(diag(S)))
R = A%*% S %*% A
head(S)
head(R)
head(K)
R[4,5]
R[3,4]
R[i,j]


sim_per_edge <-function(i, j) {
    offset = c(-2, -1, 1, 2)
    v = i - offset
    u = j - offset
    u = u[u>0]
    v = v[v>0]
    U = setdiff(union(u, v), c(i,j))
    full.r  = partial_cor(data, i, j, U)
    rm1 = sapply(1:1000, function(x) {
        x = sample.int(length(U), 1)
        U1 = U[-x]
        r = partial_cor(data, i, j, U1)
        variance.r(r, U1)
    })
    
    
    rm2 = sapply(1:1000, function(x) {
        x = sample.int(length(U), 2)
        U1 = U[-x]
        r = partial_cor(data, i, j, U1)
        variance.r(r, U1)
    })

    
    rm3 = sapply(1:1000, function(x) {
        x = sample.int(length(U), 3)
        U1 = U[-x]
        r = partial_cor(data, i, j, U1)
        variance.r(r, U1)
    })

}                                        #


sim_per_edge <-function(i, j) {
    offset = c(-2, -1, 1, 2)
    v = i - offset
    u = j - offset
    u = u[u>0]
    v = v[v>0]
    U = setdiff(union(u, v), c(i,j))
    full.r  = partial_cor(data, i, j, U)
    v.r = 1- full.r^2

    
    rm1 = sapply(1:1000, function(x) {
        x = sample.int(p, 10)
        x = setdiff(x, c(i,j))
        s = length(intersect(U, x))
        r = partial_cor(data, i, j, x)
       c(v = 1-r^2, s = s)
    })
    rm1 = t(rm1)
    list(vfull = v.r,
         vpartial = unlist(rm1[,1]),
         s = unlist(rm1[,2])
         )
    
}


a = order(res$vpartial)
par(mfrow = c(1,2))
plot(res$vpartial[a])
abline(h=res$vfull)
plot(res$s[a])


res = sim_per_edge(5,6)
names(res)
dt = data.table(cbind(res$vfull/res$vpartial, res$s))

dt[, hist(0.5*log(V1), breaks=50)]

boxplot(V1~V2, data = dt)

dt[, all(V1 < 1+sqrt(log(max(p,n))/n))]


dt[, prod(V1)]

boxplot(cbind(res$w1*res$vfull/res$rm1,
              res$w2*res$vfull/res$rm2,
              res$w3*res$vfull/res$rm3))




metric<-function(data, x, y, S, Z) {

    A = partial_cor(data, x,y, S)
    B = partial_cor(data, x,y, Z)
    (A^2 - B^2)/(1-A^2)
    
}

res = sapply(1:1000, function(r) {

    d <- bdgraph.sim(
    n = 1000000,
    p = p,
    graph = 'fixed',
    K = K,
    )
    
    data = d$data
    metric(data, 1, 2, 3, 4)
}
)

hist(res)

dim(data)
plot(graph_from_adjacency_matrix(1*(K>0)))

cor(data[,c(1,2)])
partial_cor(data, 1, 2, 3)
partial_cor(data, 1, 2, c(3, 4))

b1 = partial_cor(data, 2, 4, 3)
b2 = partial_cor(data, 1, 4, 3)
b = partial_cor(data, 1, 4, 3) * partial_cor(data, 2, 4, 3)

a = partial_cor(data, 1, 2, 3)


(a-b)/sqrt((1-b1^2)*(1-b2^2))


1/sqrt((1-b1^2)*(1-b2^2))


abs(partial_cor(data, 1, 2, c(3, 4))) >= abs(a-b)

S = solve(K)

S[c(1,4), c(1,4)] - S[c(1,4), 3]%*% solve(S[3,3]) %*% S[3,c(1,4)]

solve(S[3,3])

S[c(1,4), 3] %*% t(S[3,c(1,4)])*0.8571


b2

1- partial_cor(data, 1, 4, c(3))^2

Rsquared(data, 1, 4, c(3))

partial_cor(data, 1, 2, c(3))
partial_cor(data, 1, 2, c(4)) 

partial_cor(data, 1, 2, c(3,4))
sqrt(1-Rsquared(data, 1, 2, c(3,4)))

cor(data[,c(1,2)])
K


S = solve(K)
S
A = diag(1/sqrt(diag(S)))
A
A %*% S %*% A


r = rbeta(n, 1, 1)

hist(sqrt(n)*0.5*log((1+r)/(1-r)))




p = 2
n = 1000
K= matrix(0, p, p)
K[1,2]= K[2,1] = 0.1
diag(K) <- 1
K = (K + t(K))/2

x = sapply(1:10000, function(x) {
    data = rmvnorm(n, 0, solve(K))
    cor(data)[1,2]
    })

fisher<-function(x) 0.5*(log(1+x) - log(1-x)) *sqrt((n-2))
fisher1<-function(x) (log(1+x) - log(1-x)) *sqrt((n-2))

B = numeric(n)+1
B[sample.int(n, n/2)]= -1
B
hist(fisher(x) - fisher(-K[1,2]), freq=FALSE)
lines(density(rnorm(10000,0,1)))


hist(fisher(B*x^2) - fisher(K[1,2]^2), freq=FALSE)
lines(density(rnorm(10000,0,1)))



hist(fisher1(x^2) - fisher1(K[1,2]^2), freq=FALSE)
lines(density(rnorm(10000,0,1)))

names(data)
adjmat = data$G
colnames(adjmat) <- 1:p - 1

data = data$data




x = seq(0,0.99, 0.1)
plot(x, fisher(x^2))



n = 1000
r = rbeta(n 0.3, 0.5)

fisherZ <- function(r) (0.5*(log(1+r^2) - log(1 - r^2)))

fisherZZ <- function(r) {
    w = runif(length(r))< 0.5
    w = ifelse(w, 1, -1)
    Z = (0.5*(log(1+w*r^2) - log(1 - w*r^2)))
    }

hist(fisherZ(r))
hist(fisherZZ(r))




p = 4
n = 20000
K= matrix(0, p, p)

ed = matrix(c(1,2,2,4,4,3,3,1,1,4), byrow=TRUE, ncol=2)
ed
K[ed]<- -0.5
diag(K) <- 1
K = (K + t(K))/2
K

set.seed(1)
data <- bdgraph.sim(
    n = n,
    p = p,
    graph = 'fixed',
    K = K,
)

analytical_partial_cor <-function(K, i, j, S) {
    Sigma = solve(K)
    ij = c(i,j)
    Sigmaij = Sigma[ij, ij]
    
    if (length(S)>0){
        B = Sigma[ij, S] %*% solve(Sigma[S,S]) %*% Sigma[S,ij]
    }else {
        B = 0
    }
    A  = Sigmaij - B        
    C = diag(sqrt(1/diag(A)))
    C%*% A %*% C
}

sample_partial_cor <-function(K, i, j, S) {
    Sigma = solve(K)
    ij = c(i,j)
    Sigmaij = Sigma[ij, ij]
    
    B = Sigma[ij, S] %*% solve(K[S,S]) %*% t(Sigma[ij,S])
    A  = Sigmaij - B
    C = diag(sqrt(1/diag(A)))
    C%*% A %*% C
}


#data = rmvnorm(n, 0, solve(K))

names(data)
g <- graph_from_adjacency_matrix(data$G, mode='undirected')
data = data$data


plot(g)

r1 = partial_cor(data, 1, 2, 4); r1
r2 = partial_cor(data, 1, 2, 3); r2

(1-r1^2) /(1-r2^2)

p1 = analytical_partial_cor(K, 1, 2, 4);p1[1,2]
p2 = analytical_partial_cor(K, 1, 2, 3);p2[1,2]

(1 - p1^2)/(1-p2^2)

1 + 2*sqrt(log(max(n,p))/n)

partial_cor(data, 1, 20 ,c(2:10) )

plot(g)


sample_data <- function(K, n) {
    p = dim(K)[1]
    data <- bdgraph.sim(
        n = n,
        p = p,
        graph = 'fixed',
        K = K,
        )
     adjmat = data$G
     data$data
}

x = seq(0, 1, 0.01)
p1 = sapply(1:1000, function(x) partial_cor(sample_data(K, 100), 1, 20, c(2:3)))
hist(p1^2, breaks=50, freq=FALSE)
lines(x, dbeta(x, 0.5, (100 - 2-2)/2), col = 'red', lwd=3)


p1 = sapply(1:1000, function(x) partial_cor(sample_data(K,20), 1, 20, c(2:19)))
hist(p1^2, breaks=50, freq=FALSE)

lines(x, dbeta(x, 0.5, (30 - 17-2)/2), col = 'red', lwd=3)


data = data$data

S = t(data) %*% data/n
analytical_partial_cor(K, 1, 20, c(2:18))
analytical_partial_cor(solve(S), 1, 20, c(2:18))

partial_cor(data, 1, 20, c(2:18))
pcor.test_local(data, 1, 20, c(2:18))

pcor

library(ppcor)
pcor(data[,-19])$estimate[1,19]
pcor(data[,c(1,20,2:18)])$estimate[1,2]

pcor.test_local<-function(data, i, j, S) {
    pcor.test(data[,i], data[,j], data[, S])
    
}

pcor.test




## testing path weights


p = 4
K= matrix(0, p, p)
ed = matrix(c(1,2,2,4,4,3,3,1,1,4), byrow=TRUE, ncol=2)
ed
K[ed]<- -0.5
diag(K) <- 1
K = (K + t(K))/2
K


library(igraph)
g <- graph_from_adjacency_matrix(1*(abs(K)>0), mode='undirected')
plot(g)

i = 1
j = 2

Omega = solve(K)

path_weights<-function(Omega, K,  path) {
    p = dim(Omega)[1]
    m = length(path)
    x = path[1]
    y = path[m]
    rho = sapply(2:m, function(i){
        V = c(1:p)[-c(path[i-1], path[i])]
        analytical_partial_cor(K, path[i-1], path[i], V)[1,2]
        
    })
    det = det(Omega[path, path])
    list(rhos= rho, det = det, w =  prod(rho) * det, path = path)
    
}


paths = list(c(1,2), c(1,4,2), c(1, 3, 4, 2))

res = lapply(paths, function(pa) path_weights(Omega, K, pa))
res

plot(g)
sum(sapply(res, function(x) x$w))

analytical_partial_cor(K, i, j, c(1:p)[-c(i,j)])
analytical_partial_cor(K, 2,3, c(1,4))

K
solve(K)


set.seed(1)
data <- bdgraph.sim(
    n = 20000,
    p = p,
    graph = 'fixed',
    K = K,
)

partial_cor(data$data,1, 2, c(4))
analytical_partial_cor(K, 1, 2, 4)









