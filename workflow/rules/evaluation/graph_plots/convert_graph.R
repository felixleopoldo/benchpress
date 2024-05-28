# Using pcalg package to convert graphs
library(pcalg)

# Read in the graph
orig_df <- read.csv(snakemake@input[["filename"]], check.names = FALSE)

orig_adjmat <- as.matrix(orig_df)
colnames(orig_adjmat) <- names(orig_df)

# Check if a DAG. If so convert to a CDPAG and write to file, 
# otherwise write an empty file.

# If already a CDPAG, write to file diectly.
if (pcalg::isValidGraph(t(orig_adjmat), type = "cpdag", verbose = FALSE)){
    
    print("Already a CPDAG. Writing to file.")
    write.csv(orig_adjmat, file = snakemake@output[["filename"]], row.names = FALSE, quote = FALSE)

}  else if (pcalg::isValidGraph(t(orig_adjmat), type = "dag", verbose = FALSE)){

    # Convert to graph object
    graph <- as(orig_adjmat, "graphNEL")    
    print("Converting DAG to CPDAG.")
    cdpag <- dag2cpdag(graph)
    adjmat <- as(cdpag, "matrix")  
    colnames(adjmat) <- names(orig_df)
    write.csv(adjmat, file = snakemake@output[["filename"]], row.names = FALSE, quote = FALSE)

} else {

    print("Not a DAG nor CPDAG. Writing empty file.")
    write("", file = snakemake@output[["filename"]])
}
