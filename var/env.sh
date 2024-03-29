



if [ $# -lt 1 ];then
    echo "
         example: source ./setup/env.sh snc
         default : source ./setup/env.sh avx512
     "
    ISA=avx512
else
    ISA=$1
fi

#original_name='change'
if [ "${original_name}" == "" ]; then
githubpre=/networking.wireless.flexran
export flexran_l1_sw=$githubpre.flexran-l1-sw
export flexran_l1_5g_test=$githubpre.flexran-l1-5g-test
export flexran_l1_4g_test=$githubpre.flexran-l1-4g-test
export wireless_sdk=$githubpre.wireless-sdk
export wireless_convergence_l1=$githubpre.wireless-convergence-l1
export wireless_dpdk_ae=$githubpre.wireless-dpdk-ae
export flexran_xran=$githubpre.flexran-xran
else
line='-'
export flexran_l1_sw=flexran${line}l1${line}sw
export flexran_l1_5g_test=flexran${line}l1${line}5g${line}test
export flexran_l1_4g_test=flexran${line}l1${line}4g${line}test
export wireless_sdk=wireless${line}sdk
export wireless_convergence_l1=wireless${line}convergence${line}l1
export wireless_dpdk_ae=wireless${line}dpdk${line}ae
export flexran_xran=flexran${line}xran
fi

BASE=$WORK_DIR
# BASE=/home/luolin/master


export WIRELESS_SDK_TOOLCHAIN=icx
#ISA=avx512
#################################################
export RTE_SDK=$BASE$wireless_dpdk_ae
export FLEXRAN_L1_SW=$BASE$flexran_l1_sw
export WIRELESS_SDK=$BASE$wireless_sdk
export WIRELESS_CONVERGENCE_L1=$BASE$wireless_convergence_l1

export XRAN_DIR=$BASE$flexran_xran
export DIR_WIRELESS_TEST_4G=$BASE$flexran_l1_4g_test
export DIR_WIRELESS_TEST_5G=$BASE$flexran_l1_5g_test
export DIR_WIRELESS_FW=$WIRELESS_CONVERGENCE_L1/framework

export SDK_BUILD_DIR=build-$ISA-$WIRELESS_SDK_TOOLCHAIN
export GTEST_ROOT=/opt/gtest/gtest-1.7.0
export DIR_WIRELESS_SDK=$WIRELESS_SDK/$SDK_BUILD_DIR
export FLEXRAN_SDK=${DIR_WIRELESS_SDK}/install
export DIR_WIRELESS_SDK_ROOT=$WIRELESS_SDK
export WIRELESS_SDK_TARGET_ISA=$ISA
export RTE_TARGET=x86_64-native-linuxapp-$WIRELESS_SDK_TOOLCHAIN
export ROE_DIR=$FLEXRAN_L1_SW/libs/roe
export RPE_DIR=$FLEXRAN_L1_SW/libs/ferrybridge
export CPA_DIR=$FLEXRAN_L1_SW/libs/cpa
export DIR_WIRELESS_TABLE_5G=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/table
export MLOG_DIR=$FLEXRAN_L1_SW/libs/mlog
export MESON_BUILD=1 

export RTE_SDK_KMOD=$FLEXRAN_L1_SW/../dpdk-kmods
export PKG_CONFIG_PATH=$DIR_WIRELESS_SDK/pkgcfg:$PKG_CONFIG_PATH

echo RTE_SDK=${RTE_SDK}
echo FLEXRAN_L1_SW=${FLEXRAN_L1_SW}
echo WIRELESS_SDK=${WIRELESS_SDK}
echo RTE_TARGET=${RTE_TARGET}
echo WIRELESS_SDK_TARGET_ISA=${WIRELESS_SDK_TARGET_ISA}
echo RPE_DIR=${RPE_DIR}
echo ROE_DIR=${ROE_DIR}
echo CPA_DIR=${CPA_DIR}
echo XRAN_DIR=${XRAN_DIR}
echo DIR_WIRELESS_SDK_ROOT=${DIR_WIRELESS_SDK_ROOT}
echo DIR_WIRELESS_FW=${DIR_WIRELESS_FW}
echo DIR_WIRELESS_TEST_4G=${DIR_WIRELESS_TEST_4G}
echo DIR_WIRELESS_TEST_5G=${DIR_WIRELESS_TEST_5G}
echo SDK_BUILD=${SDK_BUILD}
echo DIR_WIRELESS_SDK=${DIR_WIRELESS_SDK}
echo FLEXRAN_SDK=${FLEXRAN_SDK}
echo DIR_WIRELESS_TABLE_5G=${DIR_WIRELESS_TABLE_5G}
echo GTEST_ROOT=${GTEST_ROOT}
echo RTE_SDK_KMOD=${RTE_SDK_KMOD}


#scl enable devtoolset-8 bash

alias l1sw="cd $FLEXRAN_L1_SW"
alias xran="cd $XRAN_DIR"
alias master="cd $FLEXRAN_L1_SW/../"
alias test="cd $DIR_WIRELESS_TEST_5G"
MRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)/../
alias mrc="cd ${MRC_DIR}"
alias ru="cd ${MRC_DIR}/oran/ru"
alias du="cd ${MRC_DIR}/oran/du"
alias phy="cd $FLEXRAN_L1_SW"
alias sdk="cd $DIR_WIRELESS_SDK_ROOT"
alias l1="cd $FLEXRAN_L1_SW/bin/nr5g/gnb/l1"
alias l2="cd $FLEXRAN_L1_SW/bin/nr5g/gnb/testmac"
alias buildphy="../../../../build/nr5g/gnb/l1app/build_phy.sh SUB6 BBDEV_FEC_ACCL_NR5G"
alias testcase="cd $DIR_WIRELESS_TEST_5G/ul/mu1_100mhz"

source /opt/intel/oneapi/setvars.sh
export PATH=$PATH:/opt/intel/oneapi/compiler/2022.0.2/linux/bin-llvm/
source /opt/rh/devtoolset-8/enable

cmake_dir=/opt/cmake-3.10.3/bin/
if [ -d $cmake_dir ]
then
  export PATH=$cmake_dir:$PATH
fi
CMAKE_EXIST=`which cmake`
if [[ "$CMAKE_EXIST" = "" ]]
then
  echo "cmake is not exist, pls install"
  exit
else
  echo "cmake at: $CMAKE_EXIST"
fi


export WORK_DIR=$BASE
