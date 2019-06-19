`docker build -t trt_deployment tensorRT`

```
docker run --runtime=nvidia \
           --name=trt_deployment \
           --shm-size 8G \
           --privileged \
           -dit \
           -v ~/Desktop/python:/py/ \
           trt_deployment bash
```
