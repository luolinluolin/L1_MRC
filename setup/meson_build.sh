#! /bin/bash
#sleep 5

echo "------------build base dpdk20.11 avx512-------------------"
cd $RTE_SDK; meson build;cd build; ninja
