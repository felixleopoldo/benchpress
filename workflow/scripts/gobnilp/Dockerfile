from ubuntu

# Install prerequisitiesß
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q libboost-all-dev
RUN apt install -y libgmp3-dev
RUN apt install -y zlib1g-dev
RUN apt install -y libreadline-dev
RUN apt -y install gfortran
RUN apt install cmake -y
RUN apt install -y build-essential

# Install Blas
WORKDIR /myappdir
COPY OpenBLAS-0.3.15.tar.gz .
RUN tar zxvf OpenBLAS-0.3.15.tar.gz
WORKDIR /myappdir/OpenBLAS-0.3.15 
RUN make 
RUN make install PREFIX=/blasdir

RUN apt install pkg-config -y
RUN apt install libgsl-dev -y
RUN apt install -y bliss
RUN apt install -y cliquer

# Install scipoptsuite
WORKDIR /myappdir
COPY scipoptsuite-7.0.1.tgz .
RUN tar xvf scipoptsuite-7.0.1.tgz
RUN rm scipoptsuite-7.0.1.tgz
WORKDIR /myappdir/scipoptsuite-7.0.1
RUN make install INSTALLDIR="/myappdir/local/src/scipoptsuite-7.0.1/scip"

# Install Gobnilp
RUN apt install git -y
WORKDIR /myappdir
RUN git clone https://bitbucket.org/jamescussens/gobnilp.git
WORKDIR /myappdir/gobnilp/
RUN ./configure.sh /myappdir/scipoptsuite-7.0.1/scip/ /blasdir
RUN make
