library(BDgraph)

## sim data
p = 50
n = 100
K= matrix(0, p, p)
K[cbind(1:(p-1), 2:p)]<-0.5
K[cbind(1:(p-2), 3:p)]<-0.25
K = K + t(K)
diag(K)<-1
set.seed(1)
data <- bdgraph.sim(
    n = n,
    p = p,
    graph = 'fixed',
    K = K,
)
names(data)
adjmat = data$G
colnames(adjmat) <- 1:p - 1

folder = 'graphs/'
filename = paste0(folder, 'adjmat_autoregg.csv')
write.table(adjmat,
  file = filename,
  row.names = FALSE, quote = FALSE, col.names = TRUE, sep = ","
  )


filename = paste0(folder, 'seed_1_autoregg.csv')
dd = data$data
colnames(dd) <- 1:p -1
write.table(dd,
  file = filename,
  row.names = FALSE, quote = FALSE, col.names = TRUE, sep = ","
)
dd




