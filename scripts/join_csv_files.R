#library(argparser)
library(dplyr)
library(stringr)

#p <- arg_parser("A program for joining csv files.")
#p <- add_argument(p, "--files", help = "Files", nargs=Inf)
#p <- add_argument(p, "--filename1", help = "First file")
#p <- add_argument(p, "--filename2", help = "Second file")
#argv <- parse_args(p)

df <- data.frame()

fix_columns <- function(df){
  df <- na_if(df, "None")

  if("plus1it" %in% colnames(df)) {
      df["plus1it"] <- as.numeric(df["plus1it"])
  }
  if("posterior" %in% colnames(df)) {
      df["posterior"] <- as.numeric(df["posterior"])
  }
  return(df)
}

for (filename in snakemake@input[["res"]]) {
  print(filename)
  tmpdf <- read.csv(filename)  
  tmpdf <- fix_columns(tmpdf)
  df <- dplyr::bind_rows(df, tmpdf)
}

#df1 <- read.csv(argv$filename1)
#df2 <- read.csv(argv$filename2)

#df1 <- fix_columns(df1)
#df2 <- fix_columns(df2)

#df <- dplyr::bind_rows(df1, df2)

output = snakemake@output[[1]]



write.csv(df, file=output, row.names=FALSE)

# This removes the seed from the adjmat and bn columns to enable proper grouping 
# when plotting. Otherwise every seed gets its own group which is not meaningful.
system(paste("sed --in-place 's/\\/seed=[0-9]\\+//g' ", output, delimiter=""))