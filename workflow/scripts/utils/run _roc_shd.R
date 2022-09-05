### This function extracts directed edges from an EG
EGdedges <- function(incidence) {
  incidence * (1 - t(incidence))
}

### This function extracts the skeleton from an EG
EGskel <- function(incidence) {
  1 * (incidence | t(incidence))
}

### This function compares an estimated EG to the true one

compareEGs <- function(estEG, trueEG) {
  estSkel <- EGskel(estEG) # estimated skeleton
  trueSkel <- EGskel(trueEG) # true skeleton
  P <- sum(trueSkel) / 2 # number of positives
  diffSkel <- estSkel - trueSkel
  extra_edges <- which(diffSkel > 0) # edges in estimated but not true EG
  FP <- length(extra_edges) / 2 # count to FPs
  estEG[extra_edges] <- 0 # remove them from further comparisons
  missing_edges <- which(diffSkel < 0) # edges in true but not estimated EG
  FN <- length(missing_edges) / 2 # count to FNs
  trueEG[missing_edges] <- 0 # remove them from further comparisons
  #  if (sum(EGskel(estEG) != EGskel(trueEG)) > 0){
  #    print("Skeletons should match now!")
  #  }
  # modified graphs have the same skeletons, so now just need to count mismatches
  mismatches <- 1 * (estEG != trueEG)
  wrong_order <- sum(EGskel(mismatches)) / 2 # number of wrongly oriented edges
  FP <- FP + wrong_order / 2 # include half in FP
  FN <- FN + wrong_order / 2 # and half in FN
  SHD <- FP + FN # shd is the sum of errors
  TP <- P - FN # true positives are without false negatives
  # TPR, FPR_P, FPR_N
  if (P == 0) {
    # true graph is empty
    if (FP >= 0) {
      TPR <- 0
      FPR_P <- 1
    } else {
      TPR <- 1
      FPR_P <- 0
    }
  } else {
    # true graph is non-empty
    TPR <- TP / P
    FPR_P <- FP / P
  }
  compEGs <- c(TP, FP, SHD, TPR, FPR_P)
  names(compEGs) <- c("TP", "FP", "SHD", "TPR", "FPR_P")
  return(compEGs)
}
