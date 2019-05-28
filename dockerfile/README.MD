# Common Docker command

#### Build images with dockerfile

```
$PATH_DIR=~/setting/dockerfile/all_in_one
docker build -t $DOCKER_IMG_NAME $DOCKERFILE_DIR
```


## Building a container

#### Common flag for `docker run` command

`--privileged` give all capabilities to container, allow it access the webcam and other devices

(don't call this flag if the sources is not reliable, some special case like docker in docker, or Raspberry PI may allowed)

`--rm` container autoremove when container exited.

`--restart=always` container will restart when container exited by unexpected system errors. [reference](https://docs.docker.com/engine/reference/run/#restart-policies---restart/)


#### Standard form for 
For new install developer framework:
Using deepo as backbone, will be better for development

```
docker build -t deepo all_in_one/

docker run --runtime=nvidia \
           --name=deepo \
           --shm-size 8G \
           --privileged \
           -dit \
           -v ~/Desktop/python:/py/ \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY=unix$DISPLAY \
           -v /dev/video0:/dev/video0 \
           -v /dev/video1:/dev/video1 \
           deepo bash
```

or 
```
docker pull ufoym/deepo
```

Some older version code here 
use for specify the dependency version in `dockerfile`


#### Pytorch 1.0.0-dev , CUDA 10
``` pytorch 1.0.0
docker run --runtime=nvidia \
           --name=torch_cu10 \
           --privileged \
           -dit \
           -v ~/Desktop/python:/py/ \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY=unix$DISPLAY \
           -v /dev/video0:/dev/video0 \
           -v /dev/video1:/dev/video1 \
           ufoym/deepo:pytorch bash
```

#### Supplement 
`xhost +local:docker` : Display show to GUI

`jupyter notebook --ip=0.0.0.0 --port=$PORT` : most of the dockerfile preinstalled a jupyter notebook

