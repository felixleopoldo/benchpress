
makeFileName <- function(basename, letterseq, numberseq, formattxt = NULL) {
  return(paste(basename, paste(letterseq, numberseq, sep = "", collapse = ""), formattxt, sep = ""))
}
