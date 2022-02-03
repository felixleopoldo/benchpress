library(GGally)

myFun <- function(n = 5000) {
  a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

filename <- myFun(n=1) # temporary filemane
filename <- filename[1] 
png(file=filename, width = 1200, height = 1200)

df <- read.csv(snakemake@input[["data"]], check.names=FALSE)[-1,]

datatype <- class(df[1,1])
if (datatype == "integer")  {
    df <- df[-1,]
    df[] <- lapply( df, factor) 
    ggpairs(df, upper = list(continuous = ggally_density, combo = ggally_box_no_facet))
} else {
    ggpairs(df, diag=list(continuous="bar"), alpha=0.8)
}
dev.off()
file.copy(filename, snakemake@output[["filename"]])
unlink(filename)