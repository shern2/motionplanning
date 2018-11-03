#!/bin/bash
source /opt/ros/kinetic/setup.bash
export ROS_PACKAGE_PATH=/home/ss/work/motionplanning/:$ROS_PACKAGE_PATH
roscd autocar/scripts/highway/
PATH=/opt/ros/kinetic/bin:/home/ss/bin:/home/ss/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
python generate_launch_ss.py ./dataTest.json
python generate_world_ss.py ./dataTest.json
