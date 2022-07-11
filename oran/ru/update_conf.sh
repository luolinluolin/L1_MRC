#!/bin/bash
runsh=$1\run_o_ru.sh
rucfg=$2

base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
# base=$PWD


PCIE_BUS=` lspci |grep -E "${NIC}" |head -1|awk '{print $1}'|awk -F: '{print $1}' `
DEVICE_ID=`lspci |grep -E "Intel Corporation Ethernet Adaptive Virtual Function" |head -1|awk '{print $1}'|awk -F:  '{print $2}'|awk -F. '{print $1}'`
if [ ! $PCIE_BUS ]; then
echo "pls config RU NIC in mrc.conf correctly"
exit 0
fi

vf_dev=lspci |grep "Ethernet Adaptive Virtual" |head -5|awk '{print $1}'
d0=`echo $vf_dev|sed -n '1p'`
d1=`echo $vf_dev|sed -n '2p'`
d2=`echo $vf_dev|sed -n '3p'`
d3=`echo $vf_dev|sed -n '4p'`
d4=`echo $vf_dev|sed -n '5p'`
d5=`echo $vf_dev|sed -n '6p'`
####################################

sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.0/$d0/" ${runsh}
sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.1/$d1/" ${runsh}

sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.2/$d2/" ${runsh}
sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.3/$d3/" ${runsh}

sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.4/$d4/" ${runsh}
sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.5/$d5/" ${runsh}
####################################
