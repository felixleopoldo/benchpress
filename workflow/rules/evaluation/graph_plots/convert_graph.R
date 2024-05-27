# Using pcalg package to convert graphs
library(pcalg)


# Read in the graph
orig_adjmat <- read.csv(snakemake@input[["filename"]], check.names = FALSE)

# Convert to graph object
graph <- as(orig_adjmat, "graphNEL")

# Check if a DAG. If so convert to a CDPAG and writ to file, 
# otherwise write an empty file.

if (isDAG(graph)) {
  cdpag <- dag2cpdag(graph)
  
  adjmat <- as(cdpag, "matrix")
  
  colnames(adjmat) <- names(orig_adjmat)
  print(adjmat)
  write.csv(adjmat, file = snakemake@output[["filename"]], row.names = FALSE, quote = FALSE)
} else {
  write("", file = snakemake@output[["filename"]])
}

# Convert to cod