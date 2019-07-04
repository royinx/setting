## Setting 
```
docker run --runtime=nvidia \
           --name=daytabase_cu9.1 \
           --privileged \
           -dit \
           -v ~/Desktop/python:/py/ \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY=unix$DISPLAY \
           -v /dev/video0:/dev/video0 \
           -v /dev/video1:/dev/video1 \
           daytabase_cu9.1 bash
```
