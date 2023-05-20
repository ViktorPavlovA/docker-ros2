
xhost local:root


XAUTH=/tmp/.docker.xauth


docker run -it \
    --name=r2_pathplanning_container \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --runtime=nvidia \
    haiderabbasi333/ros2-pathplanning-course:2 \
    sudo apt install snapd\
    sudo snap install --classic code\
    
    bash

echo "Done."

