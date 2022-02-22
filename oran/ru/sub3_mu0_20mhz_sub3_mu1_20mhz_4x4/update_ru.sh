#!/bin/bash

base=$PWD


PCIE_BUS=` lspci |grep -E "${NIC}" |head -1|awk '{print $1}'|awk -F: '{print $1}' `

d0="0000:${PCIE_BUS}:$RU_PCIE_DEVICE_ID.0"
d1="0000:${PCIE_BUS}:$RU_PCIE_DEVICE_ID.1"
d2="0000:${PCIE_BUS}:$RU_PCIE_DEVICE_ID.2"
d3="0000:${PCIE_BUS}:$RU_PCIE_DEVICE_ID.3"
d4="0000:${PCIE_BUS}:$RU_PCIE_DEVICE_ID.4"
d5="0000:${PCIE_BUS}:$RU_PCIE_DEVICE_ID.5"

####################################
cd $base
rm -rf samppe.log
ru_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/orancfg/sub3_mu0_20mhz_sub3_mu1_20mhz_4x4/oru

# $ru_path/config_file_o_ru.dat
##########

sed -i "s/0000:[0-9]\{2\}:[0-9]\{2\}.0/$d0/" ${ru_path}/run_o_ru.sh
sed -i "s/0000:[0-9]\{2\}:[0-9]\{2\}.1/$d1/" ${ru_path}/run_o_ru.sh

sed -i "s/0000:[0-9]\{2\}:[0-9]\{2\}.2/$d2/" ${ru_path}/run_o_ru.sh
sed -i "s/0000:[0-9]\{2\}:[0-9]\{2\}.3/$d3/" ${ru_path}/run_o_ru.sh


####################################
