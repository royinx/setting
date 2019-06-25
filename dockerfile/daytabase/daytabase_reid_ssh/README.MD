CUDA	10.0

cudnn	7

python	3.7

keras latest(2.2.4)

tensorflow latest(1.13.1)

pytorch 1.1.0

torchvision 0.3.0

apex

Xorg


### Server:
11G is using the VRAM from GPU, adjust the size to your GPU

`docker build -t daytabase_gui_ssh daytabase_reid_ssh`
```
docker run --runtime=nvidia \
           --name=daytabase_gui_ssh \
           --shm-size 11G \
           --privileged \
           -dit \
           -v ~/Documents:/py/ \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY=unix$DISPLAY \
           -v /dev/video0:/dev/video0 \
           -v /dev/video1:/dev/video1 \
           -p 53022:22 \
           -p 2234:2233 \
           daytabase_gui_ssh bash
```

### Client:
`ssh -X -p 53022 keras@<ip>` pw:keras
