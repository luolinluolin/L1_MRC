#! /bin/bash

work_path=$PWD
dpdk_path=$work_path/wireless_dpdk_ae
sdk_path=$work_path/wireless_sdk

CPU_FEATURES_DETECT_AVX512=`cat /proc/cpuinfo | grep avx512 | wc -l`
CPU_FEATURES_DETECT_AVX2=`cat /proc/cpuinfo | grep avx2 | grep f16c | grep fma | grep bmi | wc -l`
CPU_FEATURES_DETECT_SSE4_2=`cat /proc/cpuinfo | grep sse4_2 | wc -l`

 if [ $CPU_FEATURES_DETECT_AVX512 -ne 0 ]
   then
        export ISA=avx512
    elif [ $CPU_FEATURES_DETECT_AVX2 -ne 0 ]
    then
        export ISA=avx2
    elif [ $CPU_FEATURES_DETECT_SSE4_2 -ne 0 ]
    then
        export ISA=sse4_2
 fi



if [ "x${ISA}" = "xavx2" ]
then
    echo "------------build base dpdk20.11 ---avx2----------------"
    cd $sdk_path
    ./create-makefiles-linux.sh
    cd build-avx2-icc
    make -j20 libcommon libcrc librate_matching libturbo && make install
    cd $dpdk_path; meson build;cd build ; meson configure -Dflexran_sdk=$sdk_path/build-avx2-icc/install; ninja
fi

sleep 5

if [ "x${ISA}" = "xavx512" ]
then
    echo "------------build base dpdk20.11 avx512-------------------"
    cd $sdk_path
    ./create-makefiles-linux.sh
    cd build-avx512-icc
    make -j20 libcommon libcrc librate_matching libturbo libldpc_encoder_5gnr libldpc_decoder_5gnr librate_dematching_5gnr libLDPC_ratematch_5gnr && make install
    cd $dpdk_path; meson build;cd build ; meson configure -Dflexran_sdk=$sdk_path/build-avx512-icc/install; ninja
fi
