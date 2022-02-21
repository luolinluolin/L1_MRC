#!/bin/bash

base=$PWD
l1sw=$1

echo "--------------------------------------------$l1sw"

NIC_40=` lspci |grep -E "${NIC}" |head -1|awk '{print $1}'|awk -F: '{print $1}' `

d0="0000:${NIC_40}:01.0"
d1="0000:${NIC_40}:01.1"
d2="0000:${NIC_40}:01.2"
d3="0000:${NIC_40}:01.3"
d4="0000:${NIC_40}:01.4"
d5="0000:${NIC_40}:01.5"

####################################
cd $base
rm -rf samppe.log
ru_path=$l1sw/bin/nr5g/gnb/l1/orancfg/sub3_mu0_10mhz_4x4/oru

##########

sed -i "s#0000:17:02.0#$d0#" ${ru_path}/run_o_ru.sh
sed -i "s#0000:17:02.1#$d1#" ${ru_path}/run_o_ru.sh

####################################
