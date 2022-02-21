#!/bin/bash

base=$PWD

source /etc/profile
source ./setup/env.sh $ORANISA


cd $DIR_WIRELESS_FW/enhanced_bbupool/build/;make clean ;make all
sleep 3

cd $XRAN_DIR/; chmod +x build.sh; ./build.sh xclean; ./build.sh SAMPLEAPP
