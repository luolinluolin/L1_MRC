#!/bin/bash

base=$PWD

source ../oranenv.sh


############
# cd $base;./nic_vf_du.sh

sleep 5
###########
# cd $base;./mbc_vc_setup.sh MBC

sleep 2
###########
# cd $base;./ptp_screen_du.sh

#############
# cd $base;./build.sh
sleep 3
# sed -i "s#\(^igbuioMode=\)\S*#\11#"  $base/flexran_l1_sw/bin/nr5g/gnb/l1/dpdk.sh
sed -i "s#\(^igbuioMode=\)\S*#\11#"  $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/dpdk.sh
###########
cd $base
find ./sub* -name *.log |xargs rm -rf
cd $base;./execute.sh
