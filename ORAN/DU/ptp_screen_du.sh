#!/bin/bash

base=$PWD

#cd $base; screen -d -m bash -c "./ptp.sh master phc2sys"
#cd $base; screen -d -m bash -c "./ptp.sh master ptp4l"

ps -ef|grep ptp4l |grep -Ev "SCREEN|grep"
if [ $? -eq 0 ]
then
   echo "phc2sys is running"
else
  cd $base; screen -d -m bash -c "./ptp.sh master phc2sys"
fi


ps -ef|grep ptp4l |grep -Ev "SCREEN|grep"
if [ $? -eq 0 ]
then
   echo "ptp4l is running"
else
  cd $base; screen -d -m bash -c "./ptp.sh master ptp4l"

fi