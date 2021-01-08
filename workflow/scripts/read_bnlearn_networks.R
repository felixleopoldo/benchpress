library(bnlearn)
library(graph)

asia <- readRDS("standard_graphs/bayesian_networks/asia.rds")
asiagnel <- as.graphNEL(asia)
adjmat <- as(asiagnel, "matrix")
write.csv(adjmat, file = "asiaadjmat.csv", row.names = FALSE, quote = FALSE)

adjmat
asia
data <- rbn(asia, n=3)
data
numdata <- data.matrix(data)

is(numdata)
numdataframe <- data.frame(numdata)
is(numdataframe)


print(header)
