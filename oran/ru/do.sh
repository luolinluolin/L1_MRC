#!/bin/bash

CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
base=$CURRENT_DIR

source /etc/profile

ru_dir=$base/../ru
$ru_dir/kill.sh

source $base/../oranenv.sh

###########################
cd $base;./nic_vf_ru.sh
sleep 3

###########################
cd $base;rm -rf $base/dpdk.sh;cp $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/dpdk.sh .; ./update_dpdk_ru.sh
cd $base; source ../oranenv.sh;./dpdk.sh
sleep 3

#########################
cd $base;./ptp_screen_ru.sh
sleep 3

###########################
# cd $base;./build.sh
# sleep 3

###########################
cd $base
find ./sub* -name *.log |xargs rm -rf
