FROM continuumio/miniconda3

WORKDIR /myappdir

RUN conda update -n base -c defaults conda

RUN conda install -c bioconda bioconductor-rgraphviz
RUN conda install -c bioconda bioconductor-graph # not neded
RUN conda install -c bioconda bioconductor-rbgl
## On OSX the following is needed
#if (!requireNamespace("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install(version = "3.10")
#BiocManager::install(c("gRbase", "RBGL", "Rgraphviz", "gRain"))

# This is also needed 
# install.packages('IRkernel')
# IRkernel::installspec()  # to register the kernel in the current R installation

#RUN echo "install.packages(\"tidyverse\", repos=\"https://cran.rstudio.com\")" | R --no-save 
RUN echo "install.packages(\"ggplot2\", repos=\"https://cran.rstudio.com\")" | R --no-save 
RUN echo "install.packages(\"gRbase\", dependencies=TRUE, repos=\"https://cran.rstudio.com\");" | R --no-save 
# Warning: dependencies ‘graph’, ‘Rgraphviz’, ‘RBGL’ are not available

RUN echo "install.packages(\"pcalg\", repos=\"https://cran.rstudio.com\")" | R --no-save
RUN echo "install.packages(\"BiDAG\", repos=\"https://cran.rstudio.com\")" | R --no-save
RUN echo "install.packages(\"bnlearn\", repos=\"https://cran.rstudio.com\")" | R --no-save
RUN echo "install.packages(\"r.blip\", repos=\"https://cran.rstudio.com\")" | R --no-save
# For the R version of GOBNILP
RUN echo "install.packages(\"reticulate\", repos=\"https://cran.rstudio.com\")" | R --no-save
# Tidyvese may be replaced by r-ggplot2 since it is very big.
# Also, it seems like the containers had to be rebuilt each time after I added this.
#RUN echo "install.packages(\"r-ggplot2\", repos=\"https://cran.rstudio.com\")" | R --no-save 

RUN echo "install.packages(\"stringr\", repos=\"https://cran.rstudio.com\")" | R --no-save
RUN echo "install.packages(\"reshape\", repos=\"https://cran.rstudio.com\")" | R --no-save
RUN echo "install.packages(\"gridExtra\", repos=\"https://cran.rstudio.com\")" | R --no-save
RUN echo "install.packages(\"argparser\", repos=\"https://cran.rstudio.com\")" | R --no-save

# Running R-banchmarks
RUN mkdir /myappdir/benchmark
WORKDIR /myappdir/benchmark

# ADD data.csv .
# ADD dag.rds .
ADD scripts scripts
ADD lib lib
#ADD example_run.sh .
#RUN chmod 755 example_run.sh