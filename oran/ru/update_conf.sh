#!/bin/bash
runsh=$1/run_o_ru.sh
rucfg=$2

base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
# base=$PWD


PCIE_BUS=` lspci |grep -E "${NIC}" |head -1|awk '{print $1}'|awk -F: '{print $1}' `
DEVICE_ID=`lspci |grep -E "Intel Corporation Ethernet Adaptive Virtual Function" |head -1|awk '{print $1}'|awk -F:  '{print $2}'|awk -F. '{print $1}'`
if [ ! $PCIE_BUS ]; then
echo "pls config RU NIC in mrc.conf correctly"
exit 0
fi

vf_dev=(`lspci |grep "Ethernet Adaptive Virtual" |head -6|awk '{print $1}'`)
d0=0000:${vf_dev[0]}
d1=0000:${vf_dev[1]}
d2=0000:${vf_dev[2]}
d3=0000:${vf_dev[3]}
d4=0000:${vf_dev[4]}
d5=0000:${vf_dev[5]}
echo "d0: $d0" 
echo "d1: $d1" 
echo "d2: $d2" 
echo "d3: $d3" 
echo "d4: $d4" 
echo "d5: $d5" 
if [ $d0 == "" ]; then
  echo "pls using setup.sh in current dir to setup your nic"
  exit 0
fi
####################################

echo "-----${runsh}"
sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.0/$d0/" ${runsh}
sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.1/$d1/" ${runsh}

sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.2/$d2/" ${runsh}
sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.3/$d3/" ${runsh}

sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.4/$d4/" ${runsh}
sed -i "s/0000:[0-9a-z]\{2\}:[0-9a-z]\{2\}.5/$d5/" ${runsh}
####################################
