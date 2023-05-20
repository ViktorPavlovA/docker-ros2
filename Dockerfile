#FROM althack/ros2:galactic-gazebo-nvidia-2022-06-01
FROM althack/ros2:galactic-cuda-gazebo-nvidia-2022-08-01


RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository  ppa:deadsnakes/ppa
# Install py39 from deadsnakes repository
RUN apt-get install -y python3.9
# Install pip from standard ubuntu packages
RUN apt-get install -y python3-pip




RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-gazebo-* \
    python-is-python3 \
    nano \
    less \
    xterm
    
    
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

# Add `colcon_cd` to your shell startup script
# https://docs.ros.org/en/galactic/Tutorials/Configuring-ROS2-Environment.html#add-colcon-cd-to-your-shell-startup-script
RUN echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc \
    && echo "export _colcon_cd_root=${ros_ws}" >> ~/.bashrc


#FROM pytorch/pytorch



RUN echo "DONE"
