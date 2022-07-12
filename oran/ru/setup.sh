#!/bin/bash

base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source /etc/profile

killall=$base/../../kill.sh
$killall

source $base/../oranenv.sh

###########################
sh $base/../../setup/igb_uio_install.sh
cd $base;./nic_vf_ru.sh
sleep 3

###########################
# cd $base;./build.sh
# sleep 3

###########################
cd $base
find ./sub* -name *.log |xargs rm -rf
