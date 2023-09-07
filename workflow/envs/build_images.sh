#!/usr/local/bin/bash
# Using bash 5

# ARCH should be arm64 or amd64
ARCH=$1
DOCKER_REPO=bpimages

#images=(rblip:1.1 athomas_jtsamplers:4347c64 bdgraph:2.72 causal-learn:0.1.3.4 dualpc:585751b rgraphstuff pcalg:2.7-8 bnlearn:4.8.3 bidag:2.1.4 causal-cmd:1.9.0 benchpress:2.1.0 causaldag:0.1a163 gcastle:1.0.3 sandbox datascience-python)
# gobnilp:4347c64 snakemake:v7.32.3)

# associate array
declare -A image_versions
image_versions[rblip]=1.1
image_versions[athomas_jtsamplers]=4347c64
image_versions[bdgraph]=2.72
image_versions[causal-learn]=0.1.3.4
image_versions[dualpc]=585751b
image_versions[rgraphstuff]=1.0
image_versions[pcalg]=2.7-8
image_versions[bnlearn]=4.8.3
image_versions[bidag]=2.1.4
image_versions[causal-cmd]=1.9.0
image_versions[benchpress]=2.1.0
image_versions[causaldag]=0.1a163
image_versions[gcastle]=1.0.3
image_versions[sandbox]=1.0
image_versions[datascience-python]=1.0
image_versions[trilearn]=2.0.2
#image_versions[gobnilp]=4347c64
#image_versions[snakemake]=v7.32.3

# Build the image for amd64 and arm64 and push them to dockerhub and create the manifest and push it
# Run this twice or so as some packages depend on rgraphstuff and pcalg e.g.
for image in "${!image_versions[@]}"; do    
    ver=${image_versions[$image]}
    echo "Building $DOCKER_REPO/$image:$ver-$ARCH for $1"

    if [ $image = snakemake ]; then
      git clone https://github.com/snakemake/snakemake.git && \
      cd snakemake && \
      git checkout tags/v7.32.3 && \
      docker build . -t $DOCKER_REPO/$image:$ver-$ARCH $FLAGS && \
      cd - && \
      rm -rf snakemake
    
    else
    
      docker build . -f Dockerfile.$image -t $DOCKER_REPO/$image:$ver-$ARCH $FLAGS
    
    fi
    docker push $DOCKER_REPO/$image:$ver-$ARCH
    docker manifest create $DOCKER_REPO/$image:$ver --amend $DOCKER_REPO/$image:$ver-amd64 --amend $DOCKER_REPO/$image:$ver-arm64
    docker manifest push $DOCKER_REPO/$image:$ver

done

exit 0


# docker build . -f Dockerfile.rblip -t $DOCKER_REPO/rblip:1.1-$ARCH $FLAGS
# docker build . -f Dockerfile.jtsamplers -t $DOCKER_REPO/athomas_jtsamplers:4347c64-$ARCH $FLAGS
# docker build . -f Dockerfile.bdgraph -t $DOCKER_REPO/bdgraph:2.72-$ARCH $FLAGS
# docker build . -f Dockerfile.causallearn -t $DOCKER_REPO/causal-learn:0.1.3.4-$ARCH $FLAGS
# docker build . -f Dockerfile.rblip -t $DOCKER_REPO/rblip:1.1-$ARCH $FLAGS
# docker build . -f Dockerfile.jtsamplers -t $DOCKER_REPO/bdgraph:2.72-$ARCH $FLAGS
# docker build . -f Dockerfile.bdgraph -t $DOCKER_REPO/bdgraph:2.72-$ARCH $FLAGS
# docker build . -f Dockerfile.dualpc -t $DOCKER_REPO/dualpc:585751b-$ARCH $FLAGS
# docker build . -f Dockerfile.rgraphstuff -t $DOCKER_REPO/rgraphstuff-$ARCH $FLAGS
# docker build . -f Dockerfile.pcalg -t $DOCKER_REPO/pcalg:2.7-8-$ARCH $FLAGS
# docker build . -f Dockerfile.bnlearn -t $DOCKER_REPO/bnlearn:4.8.3-$ARCH $FLAGS
# docker build . -f Dockerfile.bidag -t $DOCKER_REPO/bidag:2.1.4-$ARCH $FLAGS
# docker build . -f Dockerfile.causal-cmd -t $DOCKER_REPO/causal-cmd:1.9.0-$ARCH $FLAGS
# docker build . -f Dockerfile.benchpress -t $DOCKER_REPO/benchpress:2.1.0-$ARCH $FLAGS
# docker build . -f Dockerfile.causaldag -t $DOCKER_REPO/causaldag:0.1a163-$ARCH $FLAGS
# docker build . -f Dockerfile.gcastle -t $DOCKER_REPO/gcastle:1.0.3-$ARCH $FLAGS
# docker build . -f Dockerfile.sandbox -t $DOCKER_REPO/sandbox-$ARCH $FLAGS
# docker build . -f Dockerfile.datascience-python -t $DOCKER_REPO/datascience-python-$ARCH $FLAGS
# docker build . -f Dockerfile.trilearn -t $DOCKER_REPO/trilearn:2.0.2-$ARCH $FLAGS
# #docker build ../rules/structure_learnin_algorithms/gobnilp/ -f ../rules/structure_learnin_algorithms/gobnilp/Dockerfile -t $DOCKER_REPO/gobnilp:4347c64-$ARCH $FLAGS

# # docker build . -f ../rules/structure_learnin_algorithms/athomas_jtsamplers/Dockerfile -t $DOCKER_REPO/athomas_jtsamplers:4347c64-$ARCH $FLAGS



# # Push the image_versions
# docker push $DOCKER_REPO/rblip:1.1-$ARCH
# docker push $DOCKER_REPO/athomas_jtsamplers:4347c64-$ARCH
# docker push $DOCKER_REPO/bdgraph:2.72-$ARCH
# docker push $DOCKER_REPO/causal-learn:0.1.3.4-$ARCH
# docker push $DOCKER_REPO/dualpc:585751b-$ARCH
# docker push $DOCKER_REPO/rgraphstuff-$ARCH
# docker push $DOCKER_REPO/pcalg:2.7-8-$ARCH
# docker push $DOCKER_REPO/bnlearn:4.8.3-$ARCH
# docker push $DOCKER_REPO/bidag:2.1.4-$ARCH
# docker push $DOCKER_REPO/causal-cmd:1.9.0-$ARCH
# docker push $DOCKER_REPO/benchpress:2.1.0-$ARCH
# docker push $DOCKER_REPO/causaldag:0.1a163-$ARCH
# docker push $DOCKER_REPO/gcastle:1.0.3-$ARCH
# docker push $DOCKER_REPO/sandbox-$ARCH
# docker push $DOCKER_REPO/datascience-python-$ARCH
# docker push $DOCKER_REPO/gobnilp:4347c64-$ARCH
# docker push $DOCKER_REPO/snakemake:v7.32.3-$ARCH
# docker push $DOCKER_REPO/trilearn:2.0.2-$ARCH

# # Create the manifests
# docker manifest create $DOCKER_REPO/rblip:1.1 --amend $DOCKER_REPO/rblip:1.1-amd64 --amend $DOCKER_REPO/rblip:1.1-arm64
# docker manifest create $DOCKER_REPO/athomas_jtsamplers:4347c64 --amend $DOCKER_REPO/athomas_jtsamplers:4347c64-amd64 --amend $DOCKER_REPO/athomas_jtsamplers:4347c64-arm64
# docker manifest create $DOCKER_REPO/bdgraph:2.72 --amend $DOCKER_REPO/bdgraph:2.72-amd64 --amend $DOCKER_REPO/bdgraph:2.72-arm64
# docker manifest create $DOCKER_REPO/causal-learn:0.1.3.4 --amend $DOCKER_REPO/causal-learn:0.1.3.4-amd64 --amend $DOCKER_REPO/causal-learn:0.1.3.4-arm64
# docker manifest create $DOCKER_REPO/dualpc:585751b --amend $DOCKER_REPO/dualpc:585751b-amd64 --amend $DOCKER_REPO/dualpc:585751b-arm64
# docker manifest create $DOCKER_REPO/rgraphstuff --amend $DOCKER_REPO/rgraphstuff-amd64 --amend $DOCKER_REPO/rgraphstuff-arm64
# docker manifest create $DOCKER_REPO/pcalg:2.7-8 --amend $DOCKER_REPO/pcalg:2.7-8-amd64 --amend $DOCKER_REPO/pcalg:2.7-8-arm64
# docker manifest create $DOCKER_REPO/bnlearn:4.8.3 --amend $DOCKER_REPO/bnlearn:4.8.3-amd64 --amend $DOCKER_REPO/bnlearn:4.8.3-arm64
# docker manifest create $DOCKER_REPO/bidag:2.1.4 --amend $DOCKER_REPO/bidag:2.1.4-amd64 --amend $DOCKER_REPO/bidag:2.1.4-arm64
# docker manifest create $DOCKER_REPO/causal-cmd:1.9.0 --amend $DOCKER_REPO/causal-cmd:1.9.0-amd64 --amend $DOCKER_REPO/causal-cmd:1.9.0-arm64
# docker manifest create $DOCKER_REPO/benchpress:2.1.0 --amend $DOCKER_REPO/benchpress:2.1.0-amd64 --amend $DOCKER_REPO/benchpress:2.1.0-arm64
# docker manifest create $DOCKER_REPO/causaldag:0.1a163 --amend $DOCKER_REPO/causaldag:0.1a163-amd64 --amend $DOCKER_REPO/causaldag:0.1a163-arm64
# docker manifest create $DOCKER_REPO/gcastle:1.0.3 --amend $DOCKER_REPO/gcastle:1.0.3-amd64 --amend $DOCKER_REPO/gcastle:1.0.3-arm64
# docker manifest create $DOCKER_REPO/sandbox --amend $DOCKER_REPO/sandbox-amd64 --amend $DOCKER_REPO/sandbox-arm64
# docker manifest create $DOCKER_REPO/datascience-python --amend $DOCKER_REPO/datascience-python-amd64 --amend $DOCKER_REPO/datascience-python-arm64
# #docker manifest create $DOCKER_REPO/gobnilp:4347c64 --amend $DOCKER_REPO/gobnilp:4347c64-amd64 --amend $DOCKER_REPO/gobnilp:4347c64-arm64
# docker manifest create $DOCKER_REPO/snakemake:v7.32.3 --amend $DOCKER_REPO/snakemake:v7.32.3-amd64 --amend $DOCKER_REPO/snakemake:v7.32.3-arm64
# docker manifest create $DOCKER_REPO/trilearn:2.0.2 --amend $DOCKER_REPO/trilearn:2.0.2-amd64 --amend $DOCKER_REPO/trilearn:2.0.2-arm64

# # Push the manifests
# docker manifest push $DOCKER_REPO/rblip:1.1
# docker manifest push $DOCKER_REPO/athomas_jtsamplers:4347c64
# docker manifest push $DOCKER_REPO/bdgraph:2.72
# docker manifest push $DOCKER_REPO/causal-learn:0.1.3.4
# docker manifest push $DOCKER_REPO/dualpc:585751b
# docker manifest push $DOCKER_REPO/rgraphstuff
# docker manifest push $DOCKER_REPO/pcalg:2.7-8
# docker manifest push $DOCKER_REPO/bnlearn:4.8.3
# docker manifest push $DOCKER_REPO/bidag:2.1.4
# docker manifest push $DOCKER_REPO/causal-cmd:1.9.0
# docker manifest push $DOCKER_REPO/benchpress:2.1.0
# docker manifest push $DOCKER_REPO/causaldag:0.1a163
# docker manifest push $DOCKER_REPO/gcastle:1.0.3
# docker manifest push $DOCKER_REPO/sandbox
# docker manifest push $DOCKER_REPO/datascience-python
# #docker manifest push $DOCKER_REPO/gobnilp:4347c64
# docker manifest push $DOCKER_REPO/snakemake:v7.32.3
# docker manifest push $DOCKER_REPO/trilearn:2.0.2

