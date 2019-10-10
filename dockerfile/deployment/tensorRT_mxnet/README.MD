`docker build -t trt_mxnet:6.0 -f Dockerfile .`

```
docker run --runtime=nvidia \
           --name=trt_mxnet \
           --shm-size 8G \
           --privileged \
           -dit \
           -v ~/Desktop/python:/py/ \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY=unix$DISPLAY \
           trt_mxnet:6.0 bash
```
