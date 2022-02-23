#!/bin/bash

base=$PWD

# kill -9 $(ps -aux|grep ptp|awk '{print $2}')
cd $base; screen -d -m bash -c "./ptp.sh client ptp4l"
cd $base; screen -d -m bash -c "./ptp.sh client phc2sys"

# ps -ef|grep ptp4l |grep -Ev "SCREEN|grep"
# if [ $? -eq 0 ]
# then
#    echo "ptp4l is running"
# else
#   cd $base; screen -d -m bash -c "./ptp.sh client ptp4l"
# fi



# ps -ef|grep phc2sys |grep -Ev "SCREEN|grep"
# if [ $? -eq 0 ]
# then
#    echo "phc2sys is running"
# else
#    cd $base; screen -d -m bash -c "./ptp.sh client phc2sys"
# fi
