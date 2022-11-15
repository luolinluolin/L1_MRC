#!/bin/bash
SETUP_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

if [ $# -ne 3 ];then
   echo "
     ./setup.sh pull flexran_branch(prod_r21.11) dpdk_branch(prod_21_11)    (pull code and no build)
     ./setup.sh build flexran_branch(prod_r21.11) dpdk_branch(prod_21_11)   (pull code and build with clean)
     ./setup.sh build_noclean flexran_branch(prod_r21.11) dpdk_branch(prod_21_11) (pull code and increasement build)
     ./setup.sh build_nopull flexran_branch(prod_r21.11) dpdk_branch(prod_21_11)  (no pull code and clean build)
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
if [ $OPTION != "build_nopull" ]; then
  $SETUP/pull.sh $flexran_branch $dpdk_branch
fi

sed -i "s/\/\/phydi_init_mlog_stats/phydi_init_mlog_stats/" $FLEXRAN_L1_SW//source/nr5g/gnb_main/gnb_main.c
sed -i "s/SAMPLEAPP=0/SAMPLEAPP=1/" ${XRAN_DIR}/build.sh

if [ $OPTION = "build" ]
then

  echo "---------build sdk--------------"
  cd $WIRELESS_SDK
  ./create-makefiles-linux.sh
  cd $DIR_WIRELESS_SDK
  make -j32
  make install

  echo "---------build dpdk--------------"
  cd $SETUP_DIR
  $SETUP/meson_build.sh

  echo "---------build flexran--------------"
  cd $SETUP_DIR
  source $SETUP/setupenv.sh 
  cd $FLEXRAN_L1_SW
  ./flexran_build.sh -r 5gnr -m bbu -m wls -m mlog -m cpa -m xran -m l1app -m testmac -m testapp


elif [ $OPTION = "build_noclean" ]
then

  echo "---------build dpdk--------------"
  cd $RTE_SDK/build
  ninja
  
  echo "---------build flexran--------------"
  cd $SETUP_DIR
  source $SETUP/setupenv.sh
  cd $FLEXRAN_L1_SW
  ./flexran_build.sh -r 5gnr -m all -c
elif [ $OPTION = "build_nopull" ]
then

  echo "---------build dpdk--------------"
  rm -rf $RTE_SDK/build
  cd $SETUP_DIR
  $SETUP/meson_build.sh
  cd $RTE_SDK/build
  ninja
  
  echo "---------build flexran--------------"
  cd $SETUP_DIR
  source $SETUP/setupenv.sh
  cd $FLEXRAN_L1_SW
  ./flexran_build.sh -r 5gnr -m all
else 
  echo "wrong build option, pls input build or build_noclean"
  exit
fi

#cd $SETUP_DIR
#echo "---------bind MBC--------------"
#$SETUP/mbc_vc_setup.sh MBC
