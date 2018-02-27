#!/usr/bin/env bash

ROS_MASTER_MACHINE=bci
ROS_LOCAL_MACHINE=robot

REDTEXT='\033[0;31m'
NOCOLOR='\033[0m'

# Checking for the existance of the provided hostnames
if grep -q "$ROS_MASTER_MACHINE" /etc/hosts; then
	is_master_machine_set=1
fi

if grep -q "$ROS_LOCAL_MACHINE" /etc/hosts; then
	is_local_machine_set=1
fi

if [ -z $is_master_machine_set ]; then
	echo -e "${REDTEXT}[cnbiros-remote] Warning: '$ROS_MASTER_MACHINE' not set in '/etc/hosts'${NOCOLOR}"
fi

if [ -z $is_local_machine_set ]; then
	echo -e "${REDTEXT}[cnbiros-remote] Warning: '$ROS_LOCAL_MACHINE' not set in '/etc/hosts'{$NOCOLOR}"
fi

# Source for the current workspace
source $ROS_WORKSPACE_CURRENT/devel/setup.bash

# Exporting ROS_MASTER_URI and ROS_IP environment variables
ROS_HOSTNAME=$ROS_LOCAL_MACHINE
ROS_IP=$(getent hosts $ROS_LOCAL_MACHINE | awk '{print $1}')
ROS_MASTER_URI=http://$ROS_MASTER_MACHINE:11311

echo $ROS_HOSTNAME " - " $ROS_IP " - " $ROS_MASTER_URI
