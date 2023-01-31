
source("workflow/scripts/utils/add_timeout.R")
library("R.utils") 
library(RBGL)
library(pcalg)


data(gmInt)

# x <- gmInt$x

# imat <- matrix(0, dim(x)[1], length(gmInt$targets))

# for (i in 1:nrow(x)){
#     c <- gmInt$target.index[[i]]    
#     imat[i, c] <- 1
# }

# p <- dim(x)[2]

# imat <- imat[, 2:length(gmInt$targets)]

# #print(imat)
# print(colnames(gmInt$x))

# print(gmInt$targets)

# colnames(imat) <- c("Ctrl", "V5") #lapply(gmInt$targets, 1,  function(i){ colnames(gmInt$x)[i] })

# data <- gmInt$x

# data <- cbind(data, imat)

# print(data[1:3, ])

# write.csv(data, file = "gmint.csv", row.names = FALSE, quote = FALSE)

filename <- file.path(snakemake@output[["adjmat"]])
filename_data <- snakemake@input[["data"]]
seed <- as.integer(snakemake@wildcards[["replicate"]])

myalg <- function() {
    # Here is where you should put your algorithm.
    myparam1 <- snakemake@wildcards[["myparam1"]]
    myparam2 <- snakemake@wildcards[["myparam2"]]

    idata <- read.csv(filename_data, check.names = FALSE)
    
    p <- length(unique(colnames(idata)))
    n <- nrow(idata)

    n_intvars <- length(colnames(idata)) - length(unique(colnames(idata)))
    print(p)

    # Get interventional targets
    # The right half of the dataset defines the
    
    start <- proc.time()[1]

    # This is a very fast and bad algorithm.
    
    print(ncol(idata))

    data <- idata[, 1:p]
    imat <- idata[, (p+1):ncol(idata)]

    print(colnames(imat))


    ivar2ind <- function(targets, ivar) {
        i <- 1
        print("ivar")
        print(ivar)
        print("targets")
        for(t in targets) {
            print(t)

            if (all.equal(t, ivar) ==  TRUE) {
                return(i)
            }
            i = i + 1
        }
    }

    targets <- list(as.integer(0)) # means observational (has index 1 here)
    #for (i in 1:n_intvars){
    #    targets[[i]] <- colnames(imat)[i]
    #}
    print(colnames(imat))
    print(colnames(data))
    print(colnames(imat)[1])
    print(which(colnames(imat)[2] == colnames(data)))
    #eturn(1)
    #print(targets)
    target.index <- c()
    
    for (r in seq(n)){
        # get 1 from tmp
        ivars <- c()
        for (c in 1:n_intvars) {
            if (imat[r, c] == 1) {                
                cind = which(colnames(imat)[c] == colnames(data))
                print("colnums")
                print(cind)
                ivars <- c(ivars, cind) # index of the ivar
                #ivars <- c(ivars, c+1) # index of the ivar

            }
        }
        # ivars is a potential target.

        ivars <- as.integer(ivars)
        
        if(length(ivars) == 0){
            ivars <- as.integer(0)
        }

        #print(ivar2ind(targets, ivars))

        if(ivars == as.integer(0)){
            target_ind = 1    
        }
        else if (ivars %in% targets){
            target_ind <- ivar2ind(targets, ivars) 
                        
        } else {            
            targets <- append(targets, ivars)
            target_ind <- length(targets)
        }

        target.index[r] <- target_ind
    }
    
    
    targets[[1]] <- integer(0)

    print(target.index)
    
    #set.seed(seed)
    #print(gmInt$targets)

    #targets[[1]] -> integer(0)
    print(targets)

    

    ## Define the score (BIC)
    score <- new("GaussL0penIntScore", data, targets, target.index, nodes = colnames(data))
    ## Estimate the essential graph
    gies.fit <- gies(score, labels = colnames(data))

    
    print(as(gies.fit$essgraph, "matrix"))

    print(as(gies.fit$repr, "matrix"))

    #graph <- gies.fit@graph

    adjmat <- as(gies.fit$essgraph, "matrix")
    
    totaltime <- proc.time()[1] - start
    colnames(adjmat) <- names(data) # Get the labels from the data
    write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
    write(totaltime, file = snakemake@output[["time"]])
    # Write the true number of c.i. tests here if possible.
    cat("None", file = snakemake@output[["ntests"]], sep = "\n") 
}


add_timeout(myalg)