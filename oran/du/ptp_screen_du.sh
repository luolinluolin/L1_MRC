#!/bin/bash

base=$PWD

# kill -9 $(ps -aux|grep ptp|awk '{print $2}')
# ps -aux|grep ptp|awk '{print $2}'|xargs kill -9

sleep 4

cd $base; screen -d -m bash -c "./ptp.sh master phc2sys"
cd $base; screen -d -m bash -c "./ptp.sh master ptp4l"

# ps -ef|grep ptp4l |grep -Ev "SCREEN|grep"
# if [ $? -eq 0 ]
# then
#    echo "phc2sys is running"
# else
#   cd $base; screen -d -m bash -c "./ptp.sh master phc2sys"
# fi


# ps -ef|grep ptp4l |grep -Ev "SCREEN|grep"
# if [ $? -eq 0 ]
# then
#    echo "ptp4l is running"
# else
#   cd $base; screen -d -m bash -c "./ptp.sh master ptp4l"

# fi
