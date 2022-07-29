#!/bin/bash

if [ $# -ne 3 ] || [ $1 = "-h" ];then
    echo "
         example : ./timer_perf.sh  cslsp prod_r21.11 prod_r21.11
         example : ./timer_perf.sh  iclsp prod_r21.11 prod_r21.11
         example : ./timer_perf.sh  icld prod_r21.11 prod_r21.11
     "
   exit 0
fi
platform=$1
flexran_version=$2
dpdk_version=$3

base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

cd $base
./setup.sh build $flexran_version $dpdk_version

cd $base
./timer_perf.sh $platform $flexran_version
