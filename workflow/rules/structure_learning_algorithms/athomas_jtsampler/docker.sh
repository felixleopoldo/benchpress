docker build -t athomas_jtsampler . 
docker run -it athomas_jtsampler  bash
docker build -t hallawalla/athomas_jtsampler:1.3 . --no-cache
docker push hallawalla/athomas_jtsampler:1.3
