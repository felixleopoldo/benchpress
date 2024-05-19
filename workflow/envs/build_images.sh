#!/usr/local/bin/bash
# Using bash 5

# ARCH should be arm64 or amd64
# The script will build the images for both architectures and push them to dockerhub
# Example usage:
# 1. run on amd64 machine as
# ./build_images.sh -a amd64 -r bpimages -i athomas_jtsamplers -v 76ad20e
# 2. run on arm64 machine as
# ./build_images.sh -a arm64 -r bpimages -i athomas_jtsamplers -v 76ad20e

unset -v FLAGS
unset -v ARCH
unset -v DOCKER_REPO
unset -v IMAGE
unset -v VERSION

while getopts ":r:a:i:v:f" opt; do
  case ${opt} in
    f ) # process option f
      FLAGS="--no-cache"
      ;;
    a ) # process option a
      ARCH=$OPTARG
      ;;
    r ) # process option r
      DOCKER_REPO=$OPTARG
      ;;
    i ) # process option i
      IMAGE=$OPTARG
      ;;
    v ) # process option v
      VERSION=$OPTARG
      ;;
    \? ) echo "Usage: cmd [-f] [-a] [-r] [-i] [-v]"
      ;;
  esac
done

# Mandatory arguments
shift $((OPTIND -1))

if [ -z "$VERSION" ] || [ -z "$IMAGE" ] || [ -z "$ARCH" ] || [ -z "$DOCKER_REPO" ]; then
    echo "Missing mandatory arguments"  
    echo "a): architecture (amd64 or arm64)"
    echo "r): docker repo"
    echo "i): image name"
    echo "v): version"    
    echo "Usage: cmd [-f] -a [...] -r [...] -i [...] -v [...]"
    echo "Example: ./build_images.sh -a amd64 -r bpimages -i athomas_jtsamplers -v 76ad20e"
    exit 1
fi

# Build the image for amd64 and arm64 and push them to dockerhub and create the manifest and push it
# Run this twice or so as some packages depend on rgraphstuff and pcalg e.g.

echo "Building $DOCKER_REPO/$IMAGE:$VERSION-$ARCH for $1"

if [ $IMAGE = "snakemake" ]; then
    # Special treatment for the snakemake image
    git clone https://github.com/snakemake/snakemake.git && \
    cd snakemake && \
    git checkout tags/$VERSION && \
    docker build . -t $DOCKER_REPO/$IMAGE:$VERSION-$ARCH $FLAGS && \
    cd - && \
    rm -rf snakemake    
elif [[ -f "../rules/structure_learning_algorithms/$IMAGE/Dockerfile" ]]; then
    # If the module has a Dockerfile, use it.
    docker build ../rules/structure_learning_algorithms/$IMAGE -f ../rules/structure_learning_algorithms/$IMAGE/Dockerfile -t $DOCKER_REPO/$IMAGE:$VERSION-$ARCH $FLAGS
else
    # Use the corresponding Dockerfile in the workflow/envs folder
    docker build . -f Dockerfile.$IMAGE -t $DOCKER_REPO/$IMAGE:$VERSION-$ARCH $FLAGS
fi
docker push $DOCKER_REPO/$IMAGE:$VERSION-$ARCH

# Create the manifest and push it. (This will only work if both architectures have been built for)
docker manifest create $DOCKER_REPO/$IMAGE:$VERSION  --amend $DOCKER_REPO/$IMAGE:$VERSION-amd64 --amend $DOCKER_REPO/$IMAGE:$VERSION-arm64
docker manifest push $DOCKER_REPO/$IMAGE:$VERSION
