library(bnlearn)
library(graph)

filename <- "standard_graphs/bayesian_networks/asia"
asia <- readRDS(paste(filename, ".rds", sep = ""))
asiagnel <- as.graphNEL(asia)
adjmat <- as(asiagnel, "matrix")
write.csv(adjmat, file = paste(filename, ".csv", sep = ""), row.names = FALSE, quote = FALSE)