# Samples and inverts a precision matrics from the G-Wishart distribution.


seed <- as.integer(snakemake@wildcards[["seed"]])
set.seed(seed)

df <- read.csv(snakemake@input[["adjmat"]], header = TRUE, check.names = FALSE)
adjmat <- as.matrix(df)
p <- nrow(adjmat)

K_values <-as.numeric(snakemake@input[['precision_values']])

print("Simulating randam-precision matrix")
if(length(K_values) == 1)
{
    precmat <- 1*(adjmat !=0) * K_values
}

if(length(K_values) > 1)
{
    M = sum(adjmat !=0)
    v = sample.int(length(K_values), M, replace=TRUE)
    precmat<- 1*(adjmat !=0)
    precmat[which(adjmat!=0)] <- K_values[v]    
}


print("Inverting the precision matrix")
covmat <- cov2cor(solve(precmat))
colnames(covmat) <- colnames(df)

filename <- snakemake@output[["params"]]
write.table(covmat,
  file = filename, row.names = FALSE,
  quote = FALSE, col.names = TRUE, sep = ","
)

