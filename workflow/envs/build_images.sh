#!/bin/bash

# ARCH should be arm64 or amd64
ARCH=$1
FLAGS=

#images=(rblip:1.1 athomas_jtsamplers:4347c64 bdgraph:2.72 causal-learn:0.1.3.4 dualpc:585751b rgraphstuff pcalg:2.7-8 bnlearn:4.8.3 bidag:2.1.4 causalcmd:1.9.0 benchpress:2.1.0 causaldag:0.1a163 gcastle:1.0.3 sandbox datascience-python)
# gobnilp:4347c64 snakemake:v7.32.3)

docker build . -f Dockerfile.rblip -t bpimages/rblip:1.1-$ARCH $FLAGS
docker build . -f Dockerfile.jtsamplers -t bpimages/athomas_jtsamplers:4347c64-$ARCH $FLAGS
docker build . -f Dockerfile.bdgraph -t bpimages/bdgraph:2.72-$ARCH $FLAGS
docker build . -f Dockerfile.causallearn -t bpimages/causal-learn:
docker build . -f Dockerfile.rblip -t bpimages/rblip:1.1-$ARCH $FLAGS
docker build . -f Dockerfile.jtsamplers -t bpimages/bdgraph:2.72-$ARCH $FLAGS
docker build . -f Dockerfile.bdgraph -t bpimages/bdgraph:2.72-$ARCH $FLAGS
docker build . -f Dockerfile.causallearn -t bpimages/causal-learn:0.1.3.4-$ARCH $FLAGS
docker build . -f Dockerfile.dualpc -t bpimages/dualpc:585751b-$ARCH $FLAGS
docker build . -f Dockerfile.rgraphstuff -t bpimages/rgraphstuff-$ARCH $FLAGS
docker build . -f Dockerfile.pcalg -t bpimages/pcalg:2.7-8-$ARCH $FLAGS
docker build . -f Dockerfile.bnlearn -t bpimages/bnlearn:4.8.3-$ARCH $FLAGS
docker build . -f Dockerfile.bidag -t bpimages/bidag:2.1.4-$ARCH $FLAGS
docker build . -f Dockerfile.causalcmd -t bpimages/causalcmd:1.9.0-$ARCH $FLAGS
docker build . -f Dockerfile.benchpress -t bpimages/benchpress:2.1.0-$ARCH $FLAGS
docker build . -f Dockerfile.causaldag -t bpimages/causaldag:0.1a163-$ARCH $FLAGS
docker build . -f Dockerfile.gcastle -t bpimages/gcastle:1.0.3-$ARCH $FLAGS
docker build . -f Dockerfile.sandbox -t bpimages/sandbox-$ARCH $FLAGS
docker build . -f Dockerfile.datascience-python -t bpimages/datascience-python-$ARCH $FLAGS
#docker build ../rules/structure_learnin_algorithms/gobnilp/ -f ../rules/structure_learnin_algorithms/gobnilp/Dockerfile -t bpimages/gobnilp:4347c64-$ARCH $FLAGS

# docker build . -f ../rules/structure_learnin_algorithms/athomas_jtsamplers/Dockerfile -t bpimages/athomas_jtsamplers:4347c64-$ARCH $FLAGS

git clone https://github.com/snakemake/snakemake.git && \
cd snakemake && \
git checkout tags/v7.32.3 && \
docker build . -t bpimages/snakemake:v7.32.3-$ARCH $FLAGS && \
cd - && \
rm -rf snakemake


# Push the images
docker push bpimages/rblip:1.1-$ARCH 
docker push bpimages/athomas_jtsamplers:4347c64-$ARCH
docker push bpimages/bdgraph:2.72-$ARCH
docker push bpimages/causal-learn:0.1.3.4-$ARCH
docker push bpimages/dualpc:585751b-$ARCH
docker push bpimages/rgraphstuff-$ARCH
docker push bpimages/pcalg:2.7-8-$ARCH
docker push bpimages/bnlearn:4.8.3-$ARCH
docker push bpimages/bidag:2.1.4-$ARCH
docker push bpimages/causalcmd:1.9.0-$ARCH
docker push bpimages/benchpress:2.1.0-$ARCH
docker push bpimages/causaldag:0.1a163-$ARCH
docker push bpimages/gcastle:1.0.3-$ARCH
docker push bpimages/sandbox-$ARCH
docker push bpimages/datascience-python-$ARCH
docker push bpimages/gobnilp:4347c64-$ARCH
docker push bpimages/snakemake:v7.32.3-$ARCH

# Create the manifests
docker manifest create bpimages/rblip:1.1 --amend bpimages/rblip:1.1-amd64 --amend bpimages/rblip:1.1-arm64
docker manifest create bpimages/athomas_jtsamplers:4347c64 --amend bpimages/athomas_jtsamplers:4347c64-amd64 --amend bpimages/athomas_jtsamplers:4347c64-arm64
docker manifest create bpimages/bdgraph:2.72 --amend bpimages/bdgraph:2.72-amd64 --amend bpimages/bdgraph:2.72-arm64
docker manifest create bpimages/causal-learn:0.1.3.4 --amend bpimages/causal-learn:0.1.3.4-amd64 --amend bpimages/causal-learn:0.1.3.4-arm64
docker manifest create bpimages/dualpc:585751b --amend bpimages/dualpc:585751b-amd64 --amend bpimages/dualpc:585751b-arm64
docker manifest create bpimages/rgraphstuff --amend bpimages/rgraphstuff-amd64 --amend bpimages/rgraphstuff-arm64
docker manifest create bpimages/pcalg:2.7-8 --amend bpimages/pcalg:2.7-8-amd64 --amend bpimages/pcalg:2.7-8-arm64
docker manifest create bpimages/bnlearn:4.8.3 --amend bpimages/bnlearn:4.8.3-amd64 --amend bpimages/bnlearn:4.8.3-arm64
docker manifest create bpimages/bidag:2.1.4 --amend bpimages/bidag:2.1.4-amd64 --amend bpimages/bidag:2.1.4-arm64
docker manifest create bpimages/causalcmd:1.9.0 --amend bpimages/causalcmd:1.9.0-amd64 --amend bpimages/causalcmd:1.9.0-arm64
docker manifest create bpimages/benchpress:2.1.0 --amend bpimages/benchpress:2.1.0-amd64 --amend bpimages/benchpress:2.1.0-arm64
docker manifest create bpimages/causaldag:0.1a163 --amend bpimages/causaldag:0.1a163-amd64 --amend bpimages/causaldag:0.1a163-arm64
docker manifest create bpimages/gcastle:1.0.3 --amend bpimages/gcastle:1.0.3-amd64 --amend bpimages/gcastle:1.0.3-arm64
docker manifest create bpimages/sandbox --amend bpimages/sandbox-amd64 --amend bpimages/sandbox-arm64
docker manifest create bpimages/datascience-python --amend bpimages/datascience-python-amd64 --amend bpimages/datascience-python-arm64
#docker manifest create bpimages/gobnilp:4347c64 --amend bpimages/gobnilp:4347c64-amd64 --amend bpimages/gobnilp:4347c64-arm64
docker manifest create bpimages/snakemake:v7.32.3 --amend bpimages/snakemake:v7.32.3-amd64 --amend bpimages/snakemake:v7.32.3-arm64

# Push the manifests
docker manifest push bpimages/rblip:1.1
docker manifest push bpimages/athomas_jtsamplers:4347c64
docker manifest push bpimages/bdgraph:2.72
docker manifest push bpimages/causal-learn:0.1.3.4
docker manifest push bpimages/dualpc:585751b
docker manifest push bpimages/rgraphstuff
docker manifest push bpimages/pcalg:2.7-8
docker manifest push bpimages/bnlearn:4.8.3
docker manifest push bpimages/bidag:2.1.4
docker manifest push bpimages/causalcmd:1.9.0
docker manifest push bpimages/benchpress:2.1.0
docker manifest push bpimages/causaldag:0.1a163
docker manifest push bpimages/gcastle:1.0.3
docker manifest push bpimages/sandbox
docker manifest push bpimages/datascience-python
#docker manifest push bpimages/gobnilp:4347c64
docker manifest push bpimages/snakemake:v7.32.3

