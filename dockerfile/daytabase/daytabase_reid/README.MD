CUDA	10.0

cudnn	7

python	3.7

keras latest(2.2.4)

tensorflow latest(1.13.1)

pytorch 1.1.0

torchvision 0.3.0

apex

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
           -v /dev/video0:/dev/video0 \
           -v /dev/video1:/dev/video1 \
           -p 52022:22 \
           -p 2233:2233 \
           daytabase_gui bash
```
