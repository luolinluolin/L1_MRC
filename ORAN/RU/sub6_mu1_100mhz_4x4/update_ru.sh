#!/bin/bash

base=$PWD


PCIE_BUS=` lspci |grep -E "40GbE" |head -1|awk '{print $1}'|awk -F: '{print $1}' `

d0="0000:${PCIE_BUS}:02.0"
d1="0000:${PCIE_BUS}:02.1"
d2="0000:${PCIE_BUS}:02.2"
d3="0000:${PCIE_BUS}:02.3"
d4="0000:${PCIE_BUS}:02.4"
d5="0000:${PCIE_BUS}:02.5"

####################################
cd $base
rm -rf samppe.log
ru_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/orancfg/sub6_mu1_100mhz_4x4/oru

# $ru_path/config_file_o_ru.dat
##########

sed -i "s#0000:21:02.0#$d0#" ${ru_path}/run_o_ru.sh
sed -i "s#0000:21:02.1#$d1#" ${ru_path}/run_o_ru.sh

####################################
