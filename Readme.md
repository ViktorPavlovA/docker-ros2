# Сборка контейнера

## Версия ROS2 - Galactic

### *  C визуализацией

**Необходимо установить зависимости Nvidia**
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#installing-on-ubuntu-and-debian

`DIST=$(. /etc/os-release; echo $ID$VERSION_ID)`

`sudo curl -s -L https://nvidia.github.io/libnvidia-container/gpgkey |   sudo apt-key add -`

`sudo curl -s -L https://nvidia.github.io/libnvidia-container/$DIST/libnvidia-container.list |   sudo tee /etc/apt/sources.list.d/libnvidia-container.list`


`sudo apt-get update`

`sudo apt-get install nvidia-container-toolkit`

**ИЛИ**

`sudo apt-get update&& sudo apt-get install -y nvidia-container-toolkit-base`

docker run --rm --gpus=all --env NVIDIA_DISABLE_REQUIRE=1 -it nvidia/cuda:11.2.0-cudnn8-devel-ubuntu20.04 nvidia-smi



**Содержимое контейнера**

*Скачка образа с dockerhub:*

`FROM althack/ros2:galactic-cuda-gazebo-nvidia-2022-08-01`

*Обновление и установка зависимостей:*

`RUN apt-get update`
`RUN apt-get install -y software-properties-common`
`RUN add-apt-repository  ppa:deadsnakes/ppa`
*Install py39 from deadsnakes repository*
`RUN apt-get install -y python3.9`
*Install pip from standard ubuntu packages*
`RUN apt-get install -y python3-pip`

*Установка пакетов gazebo и дополнителного софта для работы*

RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-gazebo-* \
    python-is-python3 \
    nano \
    less \
    xterm

*Для ROS2*

`RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc`

RUN echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc \
    && echo "export _colcon_cd_root=${ros_ws}" >> ~/.bashrc`
    
*Сигнал о завершение установки:*

`RUN echo "ALL Done"`


**Создание образа**

*запуск из корня с `dockerfile`

`docker build . -t ros_gazebo_gpu:latest`

здесь `-t <имя_любое>`

**Запуск**

запускать будем из корня для этого с помощью `./run_files/run_docker.bash` 

Для открытия дополнительного терминала контейнера пропишем команду.

`docker exec -it ros_gpu2 bash`

Здесь имя которое мы назначили в `run_docker.bash`.

`--name=ros_gpu2 \` - вот это, можно любое

