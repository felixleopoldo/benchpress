library(argparser)
library(dplyr)

p <- arg_parser("A program for joining csv files.")
p <- add_argument(p, "--files", help = "Files", nargs=Inf)
p <- add_argument(p, "--algorithm", help = "Algorithm name")
p <- add_argument(p, "--filename", help = "Output filename")
argv <- parse_args(p)
directory <- "simresults"
#filenames <- list.files(pattern = "csv", path = file.path(directory,"result", "algorithm=", argv$algorithm), recursive = TRUE)
#print(filenames)
df <- data.frame()

#for (filename in filenames) {
#  tmpdf <- read.csv(file.path(directory,"result", "algorithm=", argv$algorithm, filename)) 
#  #tmpdf["plus1it"] <- na_if(tmpdf["plus1it"], "None")
#  #tmpdf["posterior"] <- na_if(tmpdf["posterior"], "None")
#  tmpdf <- na_if(tmpdf, "None")
#  df <- dplyr::bind_rows(df, tmpdf)
#}

for (filename in argv$files) {
  #print(filename)
  tmpdf <- read.csv(filename)
  #print(tmpdf)
  tmpdf <- na_if(tmpdf, "None")
  #tmpdf["plus1it"] <- na_if(tmpdf["plus1it"], "None")
  #tmpdf["posterior"] <- na_if(tmpdf["posterior"], "None")
  
  if("plus1it" %in% colnames(tmpdf)) {
      tmpdf["plus1it"] <- as.numeric(tmpdf["plus1it"])
  }
  if("posterior" %in% colnames(tmpdf)) {
      tmpdf["posterior"] <- as.numeric(tmpdf["posterior"])
  }
  #print(str(tmpdf))
  #print("Ny rad")
  df <- dplyr::bind_rows(df, tmpdf)
}
print(df)
write.csv(df, file=argv$filename, row.names=FALSE)