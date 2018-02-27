#!/usr/bin/env bash

ROS_WORKSPACE_CURRENT=/mnt/data/cnbiros_ws/

# Source for the current workspace
source $ROS_WORKSPACE_CURRENT/devel/setup.bash

exec "$@"
