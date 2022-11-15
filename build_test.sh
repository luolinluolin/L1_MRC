#!/bin/bash


if [ $# -lt 3 ] || [ $1 = "-h" ];then
    echo "
         example : ./timer_perf.sh  cslsp prod_r21.11 prod_r21.11 (build_noclean|build|pull|build_nopull)
         example : ./timer_perf.sh  iclsp prod_r21.11 prod_r21.11 (build_noclean|build|pull|build_nopull)
         example : ./timer_perf.sh  icld prod_r21.11 prod_r21.11 (build_noclean|build|pull|build_nopull)
     "
   exit 0
fi
platform=$1
flexran_version=$2
dpdk_version=$3
build_option=$4

if [ ! $build_option ];then
    build_option=build
fi

base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

cd $base
echo "./setup.sh $build_option $flexran_version $dpdk_version"
./setup.sh $build_option $flexran_version $dpdk_version

cd $base
#./rct_test.sh $platform $flexran_version

cd $base
./timer_perf.sh $platform $flexran_version
