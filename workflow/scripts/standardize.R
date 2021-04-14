input_filename <- snakemake@input[["data"]]
output_filename <- snakemake@output[["data"]]
data <- read.csv(input_filename)
data_scaled <- scale(data)

if(as.logical(snakemake@wildcards[["standardized"]]) == TRUE){
    write.table(data_scaled, file = output_filename, row.names = FALSE, quote = FALSE, col.names=TRUE, sep=",")
} else {
    write.table(data, file = output_filename, row.names = FALSE, quote = FALSE, col.names=TRUE, sep=",")
}