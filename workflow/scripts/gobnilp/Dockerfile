from ubuntu


#from scipoptsuite/scipoptsuite:7.0.2

# Install prerequisities

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libboost-all-dev
RUN apt install -y libgmp3-dev
RUN apt install -y zlib1g-dev
RUN apt install -y libreadline-dev
RUN apt -y install gfortran
RUN apt install cmake -y
RUN apt install -y build-essential

COPY SCIPOptSuite-7.0.1-Linux.sh .
RUN chmod 755 SCIPOptSuite-7.0.1-Linux.sh 
#RUN DEBIAN_FRONTEND=noninteractive ./SCIPOptSuite-7.0.1-Linux.sh


# # Install Blas
# WORKDIR /myappdir
# COPY OpenBLAS-0.3.15.tar.gz .
# RUN tar zxvf OpenBLAS-0.3.15.tar.gz
# WORKDIR /myappdir/OpenBLAS-0.3.15 
# RUN make 
# RUN make install PREFIX=/blasdir

# RUN apt install pkg-config -y
# RUN apt install libgsl-dev -y
# RUN apt install -y bliss
# RUN apt install -y cliquer

# # Install scipoptsuite
# WORKDIR /myappdir
# COPY scipoptsuite-7.0.1.tgz .
# RUN tar xvf scipoptsuite-7.0.1.tgz
# RUN rm scipoptsuite-7.0.1.tgz
# WORKDIR /myappdir/scipoptsuite-7.0.1
# #RUN make
# RUN make install INSTALLDIR="/myappdir/local/src/scipoptsuite-7.0.1/scip"


# WORKDIR /myappdir/scipoptsuite-7.0.1/build

# RUN cmake CMAKE_INSTALL_PREFIX="/myappdir/local/src/scipoptsuite-7.0.1/scip" .. 
# RUN make
# # optional: run a quick check on some instances
# RUN make check
# # optional: install scip executable, library, and headers
# RUN make install 






# RUN apt install git -y

# # # Install Gobnilp
# WORKDIR /myappdir
# RUN git clone https://bitbucket.org/jamescussens/gobnilp.git
# WORKDIR /myappdir/gobnilp/
#RUN ./configure.sh /usr/include/scip /blasdir
#RUN make
# LOP/src/cons_lop.c
# #RUN apt-get -y install build-essential "liblapack*" "libblas*"
# #RUN apt-get -y install "openmpi*" "libopenmpi*"
