
xhost local:root


XAUTH=/tmp/.docker.xauth


docker run -it \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    --name=ros_gpu2 \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --gpus all \
    ros_gazebo_gpu:latest
    
    bash
echo "Done."

