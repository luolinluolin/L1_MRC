#!/bin/bash

base=$PWD

source /etc/profile

source ../oranenv.sh

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