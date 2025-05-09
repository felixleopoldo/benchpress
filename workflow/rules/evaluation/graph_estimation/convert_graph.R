# Using pcalg package to convert graphs
library(pcalg)
library(bnlearn)

#########
## this function takes as parameter the adjacency matrix of a pdag (or cpdag)
## and returns the pattern of this pdag in the Meek sense, that is,
## it returns the adjacency matrix of the graph with the
## same skeleton where the only oriented
## edges are the v-structures (can be easily modified to work for MAGs/PAGs)
## this is from the PC-alg package.
getPattern <- function(amat) {

  ## makes the whole graph undirected
  amat <- t(amat)

  tmp <- amat + t(amat)
  tmp[tmp == 2] <- 1

  ## find all v-structures i -> k <- j s.t. i not adj to k
  ## and make only those edges directed
  for (i in 1:(length(tmp[1, ]) - 1)) {
    for (j in (i + 1):length(tmp[1, ])) {
      if ((amat[j, i] == 0) & (amat[i, j] == 0) & (i != j)) {
        ## if i no adjacent with j in G
        ## finds all k such that i -> k is in G
        possible.k <- which(amat[, i] != 0 & amat[i, ] == 0)

        if (length(possible.k) != 0) {
          ## if there are any such k's then check whether j -> k for any of them
          for (k in 1:length(possible.k)) {
            if ((amat[possible.k[k], j] == 1) & (amat[j, possible.k[k]] == 0)) {
              ## if j -> k add the v-struc orientation to tmp
              tmp[i, possible.k[k]] <- 0
              tmp[j, possible.k[k]] <- 0
            }
          }
        }
      }
    }
  }

  t(tmp)
}

# Check if filename is an empty file
is_empty <- file.info(snakemake@input[["filename"]])$size == 0

orig_adjmat <- NULL

if(is_empty){
  print("The input file is empty so writing an empty file. This could be because the algorithm was timed out.")
  file.create(snakemake@output[["filename"]])
  quit()
}

# Read in the graph
orig_df <- read.csv(snakemake@input[["filename"]], check.names = FALSE)
orig_adjmat <- as.matrix(orig_df)
colnames(orig_adjmat) <- names(orig_df)
    
# Check the graph type from output keyword
if (snakemake@params[["output_graph_type"]] == "cpdag"){
 
    # Check if a DAG. If so convert to a CDPAG and write to file, 
    # otherwise write an empty file.

    # If already a CDPAG, write to file diectly.
    if (pcalg::isValidGraph(t(orig_adjmat), type = "cpdag", verbose = FALSE)){
        
        #print("Already a CPDAG. Writing to file.")
        write.csv(orig_adjmat, file = snakemake@output[["filename"]], row.names = FALSE, quote = FALSE)

    }  else if (pcalg::isValidGraph(t(orig_adjmat), type = "dag", verbose = FALSE)){

        # Convert to graph object
        graph <- as(orig_adjmat, "graphNEL")            
        cpdag <- dag2cpdag(graph)
        cpdag_adjmat <- as(cpdag, "matrix")  
        colnames(cpdag_adjmat) <- names(orig_df)
        write.csv(cpdag_adjmat, file = snakemake@output[["filename"]], row.names = FALSE, quote = FALSE)

    } else {

        #print("Not a DAG nor CPDAG, so cannot convert to CPDAG. Writing empty file.")
        file.create(snakemake@output[["filename"]])
    }

} else if (snakemake@params[["output_graph_type"]] == "pattern"){
    if (isSymmetric(unname(orig_adjmat)) ||
        isValidGraph(orig_adjmat, type = "dag", verbose = FALSE) ||
        isValidGraph(orig_adjmat, type = "cpdag", verbose = FALSE)) {
        
        pattern <- getPattern(orig_adjmat)
        colnames(pattern) <- names(orig_df)
        write.csv(pattern, file = snakemake@output[["filename"]], row.names = FALSE, quote = FALSE)
    } else {
        file.create(snakemake@output[["filename"]])
    }

} else if (snakemake@params[["output_graph_type"]] == "skeleton"){
    skeleton <- orig_adjmat + t(orig_adjmat)
    colnames(skeleton) <- names(orig_df)
    write.csv(skeleton, file = snakemake@output[["filename"]], row.names = FALSE, quote = FALSE)
} 