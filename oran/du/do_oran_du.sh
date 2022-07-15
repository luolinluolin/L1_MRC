#!/bin/bash
base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./do_oran_du.sh  cslsp prod_r21.11
         example : ./do_oran_du.sh  iclsp prod_r21.11
     "
   exit 0
fi

platform=$1
version=$2

killall=$base/../../kill.sh
$killall
#####setup####
cd $base
./setup.sh

#########
cd $base
find ./sub* -name *.log |xargs rm -rf
cd $base;./execute.sh $platform $version

$killall