library(pcalg)
library(MASS)
d <- getwd()
setwd("/dual_pc/dualPC-main")
source("dualPC.R")
setwd(d)

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["replicate"]])
alpha <- as.numeric(snakemake@wildcards[["alpha"]])
skeleton <- as.logical(snakemake@wildcards[["skeleton"]])
pattern_graph <- as.logical(snakemake@wildcards[["pattern_graph"]])
max_ord <- NULL

if (snakemake@wildcards[["max_ord"]] != "None") {
  max_ord <- as.integer(snakemake@wildcards[["max_ord"]])
}

wrapper <- function() {
  data <- read.csv(filename_data, check.names = FALSE)
  n <- nrow(data)
  set.seed(seed)
  cor_mat <- cor(data)
  start <- proc.time()[1]
  adjmat <- dual_pc(cor_mat,
    n,
    alpha = alpha,
    skeleton = skeleton,
    max_ord = max_ord,
    pattern_graph = pattern_graph
  )

  totaltime <- proc.time()[1] - start

  colnames(adjmat) <- names(data)
  write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
  write(totaltime, file = snakemake@output[["time"]])
}

if (snakemake@wildcards[["timeout"]] == "None") {
  wrapper()
} else {
  res <- NULL
  tryCatch(
    {
      res <- withTimeout(
        {
          wrapper()
        },
        timeout = snakemake@wildcards[["timeout"]]
      )
    },
    TimeoutException = function(ex) {
      message(paste("Timeout after ", snakemake@wildcards[["timeout"]],
        " seconds. Writing empty graph and time files.",
        sep = ""
      ))
      file.create(filename)
      cat("None", file = snakemake@output[["time"]], sep = "\n")
    }
  )
}
