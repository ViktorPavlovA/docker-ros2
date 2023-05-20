# СКАЧИВАНИЕ ОБРАЗА NOETIC
FROM osrf/ros:noetic-desktop-full

RUN apt-get update
RUN apt-get install -y git && apt-get install -y python3-pip
RUN mkdir -p ~/catkin_ws/src && \
    cd ~/catkin_ws/src/

# УСТАНОВКА ЗАВИСИМОСТЕЙ
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-gazebo-* \
    python-is-python3 \
    nano \
    less \
    xterm

RUN git clone https://github.com/noshluk2/ros1_wiki && \
    cd ~/catkin_ws

RUN echo "ALL Done"
