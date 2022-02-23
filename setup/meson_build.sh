#! /bin/bash
#sleep 5

echo "------------build base dpdk20.11 avx512-------------------"
cd $RTE_SDK; meson build;cd build ; meson configure -Dflexran_sdk=$WIRELESS_SDK/build-$ISA-icx/install/lib_; ninja
