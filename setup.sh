#!/bin/bash
SETUP_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

if [ $# -ne 3 ];then
   echo "
     ./setup.sh pull flexran_branch(prod_r21.11) dpdk_branch(prod_21_11)
     ./setup.sh build flexran_branch(prod_r21.11) dpdk_branch(prod_21_11)
     "
   exit 0
fi

OPTION=$1
flexran_branch=$2
dpdk_branch=$3


BASE=$PWD
SETUP=./setup


echo "---------source gcc--------------"
#$SETUP/gcc.sh

echo "---------source env--------------"
source $SETUP/setupenv.sh 

echo "---------update repo--------------"
$SETUP/pull.sh $flexran_branch $dpdk_branch

if [ $OPTION = "build" ]
then
  echo "---------build dpdk--------------"
  # cd $RTE_SDK
  # if [ -d build ]
  #   then
  #   rm -rf build
  # fi

  cd $SETUP_DIR
  $SETUP/meson_build.sh

  sed -i "s/\/\/phydi_init_mlog_stats/phydi_init_mlog_stats/" $FLEXRAN_L1_SW//source/nr5g/gnb_main/gnb_main.c
  sed -i "s/SAMPLEAPP=0/SAMPLEAPP=1/" ${XRAN_DIR}/build.sh

  echo "---------build flexran--------------"
  cd $SETUP_DIR
  source $SETUP/setupenv.sh 
  cd $FLEXRAN_L1_SW
  ./flexran_build.sh -r 5gnr -m all

fi


echo "---------build sdk--------------"

cd $WIRELESS_SDK
./create-makefiles-linux.sh
cd $DIR_WIRELESS_SDK
make -j32
make install

#cd $SETUP_DIR
#echo "---------bind MBC--------------"
#$SETUP/mbc_vc_setup.sh MBC
