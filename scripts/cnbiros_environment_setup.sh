#!/usr/bin/env bash

################################################################################
# SETUP ROS ENVIRONMENT
################################################################################
# 
# The script is meant to setup the main ROS environment variables
# (ROS_MASTER_URI, ROS_IP, ROS_HOSTNAME). It is expected to be placed in
# $HOME/.cnbiros/scripts/ folder and to have execution permissions. Please
# modify the following argument accordingly to your network setup (hostname must
# be present in '/etc/hosts configuration file'.
#
################################################################################

# Arguments to be set
ROS_MASTER_MACHINE=bci
ROS_LOCAL_MACHINE=robot
ROS_WORKSPACE_CURRENT=$HOME/cnbiros_ws/

# Source for the current workspace
source $ROS_WORKSPACE_CURRENT/devel/setup.bash

# Exporting ROS_MASTER_URI and ROS_IP environment variables
export ROS_HOSTNAME=$ROS_LOCAL_MACHINE
export ROS_IP=$(getent hosts $ROS_LOCAL_MACHINE | awk '{print $1}')
export ROS_MASTER_URI=http://$ROS_MASTER_MACHINE:11311

exec "$@"
