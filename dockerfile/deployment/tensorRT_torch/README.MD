`docker build -t trt_deployment_torch tensorRT_torch`

```
docker run --runtime=nvidia \
           --name=trt_deployment_torch \
           --shm-size 8G \
           --privileged \
           -dit \
           -v ~/Desktop/python:/py/ \
           trt_deployment_torch bash
```
