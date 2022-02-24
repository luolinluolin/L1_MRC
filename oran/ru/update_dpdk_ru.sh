#!/bin/bash

base=$PWD


PCIE_BUS=` lspci |grep -E $NIC |head -1|awk '{print $1}'|awk -F: '{print $1}' `

d0="0000:${PCIE_BUS}:01.0"
d1="0000:${PCIE_BUS}:01.1"
d2="0000:${PCIE_BUS}:01.2"
d3="0000:${PCIE_BUS}:01.3"
d4="0000:${PCIE_BUS}:01.4"
d5="0000:${PCIE_BUS}:01.5"

####################################
cd $base
##########dpdk.sh

sed -i "s#\(ethDevice0=\)\S*#\1$d0#" ${base}/dpdk.sh
sed -i "s#\(ethDevice1=\)\S*#\1$d1#" ${base}/dpdk.sh
sed -i "s#\(ethDevice2=\)\S*#\1$d2#" ${base}/dpdk.sh
sed -i "s#\(ethDevice3=\)\S*#\1$d3#" ${base}/dpdk.sh
sed -i "s#\(ethDevice4=\)\S*#\1$d4#" ${base}/dpdk.sh
sed -i "s#\(ethDevice5=\)\S*#\1$d5#" ${base}/dpdk.sh


####################################
