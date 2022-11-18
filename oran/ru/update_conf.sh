#!/bin/bash
runsh=$1/run_o_ru.sh
ru_cfg=$1/usecase_ru.cfg

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


dst0="00:11:22:33:00:00"
dst1="00:11:22:33:00:10"
dst2="00:11:22:33:00:20"
dst3="00:11:22:33:00:30"
dst4="00:11:22:33:00:40"
dst5="00:11:22:33:00:50"

sed -i "s#oXuRem0Mac0=.*#oXuRem0Mac0=${dst0}#g"  $ru_cfg
sed -i "s#oXuRem0Mac1=.*#oXuRem0Mac1=${dst1}#g"  $ru_cfg
sed -i "s#oXuRem1Mac0=.*#oXuRem1Mac0=${dst2}#g"  $ru_cfg
sed -i "s#oXuRem1Mac1=.*#oXuRem1Mac1=${dst3}#g"  $ru_cfg
sed -i "s#oXuRem2Mac0=.*#oXuRem2Mac0=${dst4}#g"  $ru_cfg
sed -i "s#oXuRem2Mac1=.*#oXuRem2Mac1=${dst5}#g"  $ru_cfg