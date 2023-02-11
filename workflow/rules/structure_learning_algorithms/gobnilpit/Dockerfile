# ubuntu jammy
FROM ubuntu 

RUN apt update -y
ENV DEBIAN_FRONTEND noninteractive

# Install prerequisities
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libboost-all-dev
RUN apt install -y libgmp3-dev
RUN apt install -y zlib1g-dev
RUN apt install -y libreadline-dev
RUN apt -y install gfortran
RUN apt install cmake -y
RUN apt install -y build-essential
RUN apt install -y wget

# Install Blas
WORKDIR /myappdir
RUN wget https://github.com/xianyi/OpenBLAS/releases/download/v0.3.21/OpenBLAS-0.3.21.tar.gz 
RUN tar zxvf OpenBLAS-0.3.21.tar.gz
RUN rm OpenBLAS-0.3.21.tar.gz 
WORKDIR /myappdir/OpenBLAS-0.3.21 
RUN make 
RUN make install PREFIX=/blasdir
RUN apt install pkg-config -y
RUN apt install libgsl-dev -y
RUN apt install -y bliss
RUN apt install -y cliquer
RUN apt install -y liblapack3 libopenblas0 libtbb2

# Install scipoptsuite from source (make sure that scipoptsuite-8.0.0.tgz is downloaded first)
WORKDIR /myappdir
COPY scipoptsuite-8.0.0.tgz .
RUN tar xvf scipoptsuite-8.0.0.tgz
RUN rm scipoptsuite-8.0.0.tgz
WORKDIR /myappdir/scipoptsuite-8.0.0
RUN make
RUN make install INSTALLDIR="/myappdir/local/src/scipoptsuite-8.0.0/scip"

# Install Gobnilp
RUN apt install -y git 
WORKDIR /myappdir
RUN git clone https://bitbucket.org/jamescussens/gobnilp.git
WORKDIR /myappdir/gobnilp/
RUN git checkout 4347c64
RUN ./configure.sh /myappdir/scipoptsuite-8.0.0/scip/ /blasdir
RUN make
WORKDIR /myappdir/itgobnilp

# Install R stuff. R itself may already be installed.
RUN apt install r-base -y
RUN R -e "if (!requireNamespace(\"BiocManager\", quietly = TRUE)) {install.packages(\"BiocManager\", repo=\"http://cran.rstudio.com/\")}" --no-save 
RUN R -e "BiocManager::install()"  --no-save 
RUN R -e "BiocManager::install(c(\"gRbase\", \"RBGL\", \"Rgraphviz\", \"gRain\"))" --no-save 
RUN apt install libcurl4-openssl-dev -y 
RUN R -e "install.packages(\"pcalg\", repos=\"https://cran.rstudio.com\")"
RUN R -e "install.packages(\"R.utils\", repos=\"https://cran.rstudio.com\")"
RUN R -e "install.packages(\"BiDAG\")" --no-save

COPY export_to_gobnilp_score_tables.R export_to_gobnilp_score_tables.R
