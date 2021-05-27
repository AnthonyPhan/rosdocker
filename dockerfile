FROM ros:melodic

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

RUN apt-get update && apt-get install -q -y --no-install-recommends \
      ros-melodic-gazebo-* \
      ros-melodic-teleop-twist-keyboard \
      ros-melodic-joint-state-controller \
      ros-melodic-velocity-controllers \
      ros-melodic-gazebo-ros-control \
      ros-melodic-robot-state-publisher \
      ros-melodic-joint-state-publisher-gui \
      ros-melodic-roslint \
      ros-melodic-pcl-ros \
      ros-melodic-webots-ros \
      ros-melodic-xacro \
      ros-melodic-rviz \ 
      ros-melodic-moveit \
      libasio-dev \
      python3-dev python3-setuptools python3-pip python3-yaml \
      git \
      #other
      && rm -rf /var/lib/apt/lists/*

#RUN git clone https://github.com/blueprint-lab/Blueprint_Lab_Software.git /ros_ws
RUN mkdir ros_ws
COPY ./README.md /ros_ws
RUN echo 'source /opt/ros/melodic/setup.bash; source /ros_ws/devel/setup.bash' >> ~/.bashrc 
WORKDIR /ros_ws