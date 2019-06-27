## Setting 
11G is using the VRAM from GPU, adjust the size to your GPU
```
docker run --runtime=nvidia \
           --name=daytabase_gui \
           --shm-size 11G \
           --privileged \
           -dit \
           -v ~/Documents:/py/ \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY=unix$DISPLAY \
           daytabase_gui bash
```
