library(dplyr, warn.conflicts = FALSE)
library("rjson")
library(argparser)

p <- arg_parser("A program for combining roc data from differents sources.")
p <- add_argument(p, "--filename", help = "Filename")
p <- add_argument(p, "--config_filename", help = "Filename config file")
p <- add_argument(p, "--algorithms", help = "Algorithms", nargs=Inf)
argv <- parse_args(p)

config <- fromJSON(file = argv$config_filename)

toplot <- data.frame()
# argv$algorithms is a list of paths such as results/order_mcmc.csv.
# This loop gets the active algorithms from the filenames. It is a bit ugly.
active_algorithms <- c()
for (file in argv$algorithms){
    active_algorithms <- c(active_algorithms, tools::file_path_sans_ext(basename(file)))
}

active_algorithms <- unique(active_algorithms)

rocalgs <- config$benchmark_setup$evaluation$roc

for (algorithm in active_algorithms){
    # This reads all ids of one algorithm so that the same coud be read more than once. 
    # The problem is that the curve variable is needed.
    # It is fixed by running the distinct funtion in the end...
    ROCdf <- read.csv(file.path("results/output/roc/", paste(algorithm ,".csv", sep = ""))) 
    unique_ids <- ROCdf %>% distinct(id)
    
    for(params_id in unique_ids$id){

        # Find curve param
        # Finds the varying curve automatically as the one which is an array.
        curve_param <- NULL
        for(a in config$resources$structure_learning_algorithms[[algorithm]]){
            if (a$id == params_id) {             
                curve_param <- names(a)[[2]] # Since 1 use to be id :)
                for (key in names(a)){
                    if (is.vector(a[[key]]) && key != "mcmc_seed" && key != "id"){ 
                        if (length(a[[key]]) > 1) {
                            curve_param <- key
                            break
                        }
                    }
                }
            }
        }

        sumROC = ROCdf %>%
        filter(id == params_id) %>% # Extract only the rows for the actual id 
        group_by(id, adjmat, bn, data, !!as.symbol(curve_param)) %>% 
        summarise(  SHD_pattern_mean = mean(SHD_pattern),
                    TPR_pattern_mean = mean(TPR_pattern), 
                    
                    TPR_pattern_median = median(TPR_pattern), 
                    FPRn_pattern_median = median(FPRn_pattern), 
                    TPR_pattern_q1 = quantile(TPR_pattern, probs = c(0.05)), 
                    TPR_pattern_q3 = quantile(TPR_pattern, probs = c(0.95)),

                    TPR_skel_median = median(TP_skel / true_n_edges_skel), 
                    FPRn_skel_median = median(FP_skel / true_n_edges_skel), 
                    TPR_skel_q1 = quantile(TP_skel / true_n_edges_skel, probs = c(0.05)), 
                    TPR_skel_q3 = quantile(TP_skel / true_n_edges_skel, probs = c(0.95)),

                    FPRp_skel_mean = mean(FPR_skel), 
                    FPR_skel_q1 = quantile(FPR_skel, probs = c(0.05)), 
                    FPR_skel_q3 = quantile(FPR_skel, probs = c(0.95)),
                    
                    FNR_skel_mean = mean(FNR_skel), 
                    FNR_skel_q1 = quantile(FNR_skel, probs = c(0.05)), 
                    FNR_skel_q3 = quantile(FNR_skel, probs = c(0.95)),

                    time_mean = mean(time),
                    logscore_mean = mean(logscore),
                    N = n(),
                    curve_vals=mean(!!as.symbol(curve_param)))
        sumROC["labels"] <- NA
        toplot <- dplyr::bind_rows(toplot, sumROC)
    }
}

toplot <- toplot %>% distinct()

write.csv(toplot,  argv$filename)

