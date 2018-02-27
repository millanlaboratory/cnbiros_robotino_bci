#!/usr/bin/env bash

ROS_MASTER_MACHINE=bci
ROS_LOCAL_MACHINE=robot
ROS_WORKSPACE_CURRENT=$HOME/cnbiros_ws/

# Source for the current workspace
source $ROS_WORKSPACE_CURRENT/devel/setup.bash

# Export again the ROS environment variables
export ROS_MASTER_URI=http://$ROS_MASTER_MACHINE:11311
export ROS_HOSTNAME=$ROS_LOCAL_MACHINE
export ROS_IP=$(getent hosts $ROS_HOSTNAME | awk '{print $1}')

# LOCAL
if [ -d "$HOME/Local" ] ; then
export PATH="$HOME/Local/bin:$PATH"
export LIBRARY_PATH=$HOME/Local/lib/
export LD_LIBRARY_PATH=$HOME/Local/lib:$LD_LIBRARY_PATH
export CPATH=$HOME/Local/include/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/Local/include/
fi


exec "$@"
