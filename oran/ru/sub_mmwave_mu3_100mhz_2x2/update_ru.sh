#!/bin/bash

base=$PWD


PCIE_BUS=` lspci |grep -E "${NIC}" |head -1|awk '{print $1}'|awk -F: '{print $1}' `
DEVICE_ID=`lspci |grep -E "Intel Corporation Ethernet Adaptive Virtual Function" |head -1|awk '{print $1}'|awk -F:  '{print $2}'|awk -F. '{print $1}'`
if [ ! $PCIE_BUS ]; then
echo "pls config NIC in mrc.conf correctly"
exit 0
fi

d0="0000:${PCIE_BUS}:$DEVICE_ID.0"
d1="0000:${PCIE_BUS}:$DEVICE_ID.1"
d2="0000:${PCIE_BUS}:$DEVICE_ID.2"
d3="0000:${PCIE_BUS}:$DEVICE_ID.3"
d4="0000:${PCIE_BUS}:$DEVICE_ID.4"
d5="0000:${PCIE_BUS}:$DEVICE_ID.5"
d6="1"
d7="1"
####################################
cd $base
rm -rf samppe.log
ru_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/orancfg/mmwave_mu3_100mhz_2x2/oru

##########

sed -i "s#0000:21:02.0#$d0#" ${ru_path}/run_o_ru.sh
sed -i "s#0000:21:02.1#$d1#" ${ru_path}/run_o_ru.sh


####################################
