#!/bin/bash

if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./do.sh  cslsp prod_r21.11
         example : ./do.sh  iclsp prod_r21.11
     "
   exit 0
fi

platform=$1
version=$2

base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

ru_dir=$base/../ru
$ru_dir/kill.sh
kill -9 $(ps -aux|grep ptp|awk '{print $2}')
ssh $RU_IP "$ru_dir/kill.sh; exit"

source $base/../oranenv.sh


############
cd $base;./nic_vf_du.sh

sleep 5
###########
cd $base;../../setup/mbc_vc_setup.sh MBC

sleep 2
###########
cd $base;./ptp_screen_du.sh

#############
# cd $base;./build.sh
sleep 3
# sed -i "s#\(^igbuioMode=\)\S*#\11#"  $base/flexran_l1_sw/bin/nr5g/gnb/l1/dpdk.sh
sed -i "s#\(^igbuioMode=\)\S*#\11#"  $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/dpdk.sh
###########
# setup ru
ru_dir=$base/../ru
ssh $RU_IP "$ru_dir/do.sh; exit"
#########
cd $base
find ./sub* -name *.log |xargs rm -rf
cd $base;./execute.sh $platform $version
