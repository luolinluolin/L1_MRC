#!/bin/bash
testmac_cfg=$1
phy_cfg=$2
ru_cfg=$3

base=$PWD

mac0="phystart 4 0 1000000"
mac1="setcore 0xF81F0"


PCIE_BUS=` lspci |grep -E "${NIC}" |head -1|awk '{print $1}'|awk -F: '{print $1}' `
DEVICE_ID=`lspci |grep -E "Intel Corporation Ethernet Adaptive Virtual Function" |head -1|awk '{print $1}'|awk -F:  '{print $2}'|awk -F. '{print $1}'`
if [ ! $PCIE_BUS ]; then
echo "pls config NIC in mrc.conf correctly"
exit 0
fi

testmac_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/testmac/
dpdk_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/
################## test mac cfg ##################
context=`cat $testmac_cfg|grep ebbu_pool_num_context|awk '{print $3}'`
sed -i "s#\(ebbu_pool_max_context_fetch[ \t]\)\S*#\1$context#" $testmac_cfg
sed -i "s#.*phystart.*#$mac0#"     $testmac_cfg
#sed -i "s#\(setcore \)\S*#$mac1#"  $testmac_cfg
# cd $base
# cp $testmac_cfg $testmac_path/

################## phy cfg ##################
sed -i 's/<dpdkBasebandFecMode>.*<\/dpdkBasebandFecMode>/<dpdkBasebandFecMode>1<\/dpdkBasebandFecMode>/g'  $phy_cfg
# deviceid=`lspci |grep 0d5d |awk '{print $1}'|sed -n '1p'`
deviceid1=`lspci |grep acc |awk '{print $1}'|sed -n '2p'`
sed -i "s#<dpdkBasebandDevice>.*<\/dpdkBasebandDevice>#<dpdkBasebandDevice>0000:${deviceid}<\/dpdkBasebandDevice>#g"  $phy_cfg
######### 
##########xrancfg_sub6_oru.xml
vf_dev=lspci |grep "Ethernet Adaptive Virtual" |head -5|awk '{print $1}'
d0=`echo $vf_dev|sed -n '1p'`
d1=`echo $vf_dev|sed -n '2p'`
d2=`echo $vf_dev|sed -n '3p'`
d3=`echo $vf_dev|sed -n '4p'`
d4=`echo $vf_dev|sed -n '5p'`
d5=`echo $vf_dev|sed -n '6p'`

sed -i "s#<PciBusAddoRu0Vf0>.*<\/PciBusAddoRu0Vf0>#<PciBusAddoRu0Vf0>${d0}<\/PciBusAddoRu0Vf0>#g"  $ru_cfg
sed -i "s#<PciBusAddoRu0Vf1>.*<\/PciBusAddoRu0Vf1>#<PciBusAddoRu0Vf1>${d1}<\/PciBusAddoRu0Vf1>#g"  $ru_cfg
sed -i "s#<PciBusAddoRu1Vf0>.*<\/PciBusAddoRu1Vf0>#<PciBusAddoRu1Vf0>${d2}<\/PciBusAddoRu1Vf0>#g"  $ru_cfg
sed -i "s#<PciBusAddoRu1Vf1>.*<\/PciBusAddoRu1Vf1>#<PciBusAddoRu1Vf1>${d3}<\/PciBusAddoRu1Vf1>#g"  $ru_cfg
sed -i "s#<PciBusAddoRu2Vf0>.*<\/PciBusAddoRu2Vf0>#<PciBusAddoRu2Vf0>${d4}<\/PciBusAddoRu2Vf0>#g"  $ru_cfg
sed -i "s#<PciBusAddoRu2Vf1>.*<\/PciBusAddoRu2Vf1>#<PciBusAddoRu2Vf1>${d5}<\/PciBusAddoRu2Vf1>#g"  $ru_cfg

dst0="00:11:22:33:00:01"
dst1="00:11:22:33:00:11"
dst2="00:11:22:33:00:21"
dst3="00:11:22:33:00:31"
dst4="00:11:22:33:00:41"
dst5="00:11:22:33:00:51"

sed -i "s#<oRuRem0Mac0>.*<\/oRuRem0Mac0>#<oRuRem0Mac0>${dst0}<\/oRuRem0Mac0>#g"  $ru_cfg
sed -i "s#<oRuRem0Mac1>.*<\/oRuRem0Mac1>#<oRuRem0Mac1>${dst1}<\/oRuRem0Mac1>#g"  $ru_cfg
sed -i "s#<oRuRem1Mac0>.*<\/oRuRem1Mac0>#<oRuRem1Mac0>${dst0}<\/oRuRem1Mac0>#g"  $ru_cfg
sed -i "s#<oRuRem1Mac1>.*<\/oRuRem1Mac1>#<oRuRem1Mac1>${dst1}<\/oRuRem1Mac1>#g"  $ru_cfg
sed -i "s#<oRuRem2Mac0>.*<\/oRuRem2Mac0>#<oRuRem2Mac0>${dst0}<\/oRuRem2Mac0>#g"  $ru_cfg
sed -i "s#<oRuRem2Mac1>.*<\/oRuRem2Mac1>#<oRuRem2Mac1>${dst1}<\/oRuRem2Mac1>#g"  $ru_cfg

####################################
##
