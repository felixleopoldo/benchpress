#!/usr/local/bin/bash
# Using bash 5

# ARCH should be arm64 or amd64
ARCH=$1
DOCKER_REPO=bpimages

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

    if [ $image = "snakemake" ]; then
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


