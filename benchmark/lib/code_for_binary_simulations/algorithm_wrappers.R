source("lib/code_for_binary_simulations/make_var_names.R")
source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
source("lib/code_for_binary_simulations/make_name.R")

runItsearch <- function(data, dag, MAP, replicate, title) {
    n <- numNodes(dag)
    sample_size <- dim(data)[1]
    true_nedges <- sum(dag2adjacencymatrix(dag))

    myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))

    # True graph
    truescore <- DAGscore(n, myscore, dag2adjacencymatrix(dag))
    scoresdf_truegraph <- data.frame(logscore = truescore, 
                                    algo = "TRUE", 
                                    ss = dim(data)[1], 
                                    replicate = replicate,
                                    time = 0) # Should add dag name

    # Iterative search
    print("Runnning iterative search algorithm")
    starttime <- Sys.time()
    itsearch_res <- iterativeMCMCsearch(n, myscore, chainout = TRUE, MAP = MAP) 
    endtime <- Sys.time()
    totaltime <- endtime - starttime

    # Score dataframe
    # Should add dataset name here which can be tracked to the dag
    # and the parameters in the database
    scoresdf_itsearch <- data.frame(logscore = itsearch_res$max$score, 
                                    algo = title, 
                                    ss = sample_size / n, 
                                    replicate = replicate, 
                                    time = totaltime) 

    # Extend iterations.check table by FPRn (TODO: if dag exists)
    tmp <- iterations.check(itsearch_res, dag)
    tmp <- cbind(tmp, tmp[, "FP"] / true_nedges) # 2 is FP
    colnames(tmp)[6] <- "FPRn" # it happened to be column 6
    n_iterations <- nrow(tmp)
    iterations.check_extended <- tmp

    # ROC dataframe
    ROCdf_itsearch <- data.frame(TPR = iterations.check_extended[[n_iterations, "TPR"]],
                                FPRn = iterations.check_extended[[n_iterations, "FPRn"]],
                                threshold = NaN,
                                algorithm = title,
                                ss = sample_size / n,
                                replicate = replicate)

    # SHD dataframe
    SHDdf_itsearch <- data.frame(SHD = iterations.check_extended[[n_iterations, "SHD"]],
                                algorithm = title,
                                ss = sample_size / n,
                                replicate = replicate,
                                time = totaltime)

    #write.csv(scoresdf_itsearch, file = file.path(dir, "scores_itsearch.csv"), row.names = FALSE)
    #write.csv(SHDdf_itsearch, file = file.path(dir, "SHD_itsearch.csv"), row.names = FALSE)
    #write.csv(ROCdf_itsearch, file = file.path(dir, "ROC_itsearch.csv"), row.names = FALSE)
    return(list("scores"=scoresdf_itsearch, 
                "SHD"=SHDdf_itsearch,
                "ROC"=ROCdf_itsearch, 
                "itsearch_res"=itsearch_res))
}

runOrderMCMC <- function(data, dag, replicate, itsearch_res, title) {
    #
    # Order MCMC
    #
    print("Runnning ordermcmc algorithm with startspace from iterative search")
    sample_size <- dim(data)[1]
    n <- dim(data)[2]
    true_nedges <- sum(dag2adjacencymatrix(dag))
    myscore <- scoreparameters(n, "bde", data, bdepar = list(chi = 1, edgepf = 1))
    startspace <- itsearch_res$endspace
    starttime <- Sys.time()
    order_mcmc_res <- orderMCMC(n, myscore, startspace = startspace, MAP = FALSE, chainout = TRUE) 
    endtime <- Sys.time()
    totaltime <- endtime - starttime
    order_mcmc_res

    # DAG obtained from order MCMC with the space definced by the iterativeMCMCSearch

    # Score
    # Scode the median thresholded graph
    dag_thresh <- dag.threshold(n, order_mcmc_res$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5) # incidence is a chain of adjacency matrices
    medianscore <- ifelse(is.DAG(dag_thresh), DAGscore(n, myscore, dag_thresh), 10) # it is called median score since pbarrier = 0.5 

    scoresdf_order_mcmc <- scoredf <- data.frame(logscore = medianscore,
                                                algo = title,
                                                ss = sample_size / n,
                                                replicate = replicate,
                                                time = totaltime)
    # ROC
    # Extend the sample.check output by TPR and FPRn
    tmp <- sample.check(n, order_mcmc_res$chain$incidence, dag, pdag = TRUE)
    tmp <- cbind(tmp, 
                tmp[, "TP"] / true_nedges, 
                tmp[, "FP"] / true_nedges)
    colnames(tmp)[c(5, 6)] <- c("TPR", "FPRn")
    sample.check_extended <- tmp
    sample.check_extended
    ROCdf_order_mcmc <- data.frame(TPR = sample.check_extended[, "TPR"],
                                FPRn = sample.check_extended[, "FPRn"],
                                threshold = sample.check_extended[, "post.thr."],
                                algorithm = title,
                                ss = sample_size / n,
                                replicate = replicate)

    # SHD
    SHDdf_order_mcmc <- data.frame(SHD = data.frame(sample.check_extended)[[nrow(sample.check_extended), "SHD"]],
                                algorithm = title,
                                ss = sample_size / n,
                                replicate = replicate,
                                time = totaltime)

    #write.csv(scoresdf_order_mcmc, file = file.path(dir, "scores_order_mcmc.csv"), row.names = FALSE)
    #write.csv(SHDdf_order_mcmc, file = file.path(dir, "SHD_order_mcmc.csv"), row.names = FALSE)
    #write.csv(ROCdf_order_mcmc, file = file.path(dir, "ROC_order_mcmc.csv"), row.names = FALSE)
    return(list("scores" = scoresdf_order_mcmc,
                "SHD" = SHDdf_order_mcmc,
                "ROC" = ROCdf_order_mcmc))
}

runBlip <- function(data, dag, replicate, blip_max_time, title) {
    sample_size <- dim(data)[1]
    n <- dim(data)[2]
    true_nedges <- sum(dag2adjacencymatrix(dag))
    # Blip
    print("Runnning Blip")
    res <- data.frame(matrix(ncol = 8, nrow = 1))
    colnames(res) <- c("TP", "FP", "SHD", "TPR", "FPRn", "score", "bnscore", "time")

    # Transform data to blip compatible format
    varnames <- varnames.make(n)
    datadf <- matrixToDataframe(data, varnames = varnames)

    time <- blip_max_time
    blipfit <- blip.learn(datadf, time = blip_max_time, scorefunction = "bdeu", verbose = 0)
    print("done")
    blipadj <- bnfit2matrix(blipfit)
    blipadj <- rearrangeMatrix(blipadj, varnames)
    compres <- compareDAGs(adjacency2dag(blipadj), dag)
    names(compres) <- c("SHD", "TP", "FP")
    
    res["TP"] <- compres["TP"]
    res["FP"] <- compres["FP"]
    res["SHD"] <- compres["SHD"]
    res["TPR"] <- compres["TP"] / true_nedges
    res["FPRn"] <- compres["FP"] / true_nedges
    res["time"] <- time
    bnblip <- as.bn(modelstring(blipfit))

    #res["score"] <- bnlearn::score(bnblip, data, type = "bde")

    myscore_tmp <- scoreparameters(ncol(data), "bdecat", data, bdecatpar = list(chi = 1, edgepf = 1))
    res["score"] <- DAGscore(ncol(data), myscore_tmp, blipadj) # this was bnscore, dont know why...

    res["ss"] <- sample_size / n
    res["replicate"] <- replicate
    res["algo"] <- title
    res
    res[["score"]]
    # All tihs information is anyway stored in the above table
    # For TPR and SHD, the true graph is needed. But not for score.
    # we might put all in one dataframe instead
    # Is each row corersponding to one graph?
    # Threshold is not relevant in some cases.
    # - Then it can be none, eg. or 1, so that just nothing is thresholded.
    # For TPR, each dot in the diagram is a threshold


    scoresdf_blip <- data.frame(logscore = res[["score"]], # 3 is ? and 6 is the score column
                                algo = title,
                                ss = sample_size / n,
                                replicate = replicate,
                                time = res[["time"]]) # 3 is ? and 8 is the time column

    ROCdf_blip <- data.frame(TPR = res[["TPR"]], # shold be for all times
                            FPRn = res[["FPRn"]],
                            threshold = NaN, #?is this correct?
                            algorithm = title,
                            ss = sample_size / n,
                            replicate = replicate)

    SHDdf_blip <- data.frame(SHD = res[["SHD"]],
                            algorithm = title,
                            ss = sample_size / n,
                            replicate = replicate,
                            time = time)

    return(list("scores" = scoresdf_blip,
                "ROC" = ROCdf_blip,
                "SHD" = SHDdf_blip))
}
