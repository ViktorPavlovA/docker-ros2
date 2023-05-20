# Сборка контейнера

## Версия ROS - Noetic

### *  Без визуализации

**Содержимое контейнера**

*Скачка образа с образа:*

`FROM osrf/ros:noetic-desktop-full`

*Обновление и установка зависимостей:*

`RUN apt-get update
RUN apt-get install -y git && apt-get install -y python3-pip
RUN mkdir -p ~/catkin_ws/src && \
    cd ~/catkin_ws/src/`

*Обновление и установка зависимостей:*

`RUN apt-get update
RUN apt-get install -y git && apt-get install -y python3-pip
RUN mkdir -p ~/catkin_ws/src && \
    cd ~/catkin_ws/src/`

*Установка сторинего пакета, чтобы проверить работу:*

Установка Gazebo

`RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-gazebo-* \
    python-is-python3 \
    nano \
    less \
    xterm`

`RUN git clone https://github.com/noshluk2/ros1_wiki && \
    cd ~/catkin_ws`
    
*Сигнал о завершение установки:*

`RUN echo "ALL Done"`

### *  С визуализацией

