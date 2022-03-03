#!/bin/bash

base=$PWD


PCIE_BUS=` lspci |grep -E "${NIC}" |head -1|awk '{print $1}'|awk -F: '{print $1}' `
DEVICE_ID=`lspci |grep -E "Intel Corporation Ethernet Adaptive Virtual Function" |head -1|awk '{print $1}'|awk -F:  '{print $2}'|awk -F. '{print $1}'`

d0="0000:${PCIE_BUS}:$DEVICE_ID.0"
d1="0000:${PCIE_BUS}:$DEVICE_ID.1"
d2="0000:${PCIE_BUS}:$DEVICE_ID.2"
d3="0000:${PCIE_BUS}:$DEVICE_ID.3"
d4="0000:${PCIE_BUS}:$DEVICE_ID.4"
d5="0000:${PCIE_BUS}:$DEVICE_ID.5"
#deviceid="20:00.0"

dst0="00:11:22:33:00:01"
dst1="00:11:22:33:00:11"
dst2="00:11:22:33:00:21"
dst3="00:11:22:33:00:31"
dst4="00:11:22:33:00:41"
dst5="00:11:22:33:00:51"

mac0="phystart 4 0 150000"
mac1="setcore 0xF81F0"


phy_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/orancfg/sub3_mu0_20mhz_sub3_mu1_20mhz_4x4/gnb/
testmac_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/testmac/
dpdk_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/
####################################
testmac_cfg=$phy_path/testmac_clxsp_multi_numerology_oru.cfg
context=`cat $testmac_cfg|grep ebbu_pool_num_context|awk '{print $3}'`
sed -i "s#\(ebbu_pool_max_context_fetch[ \t]\)\S*#\1$context#" $testmac_cfg
cd $base
cp $testmac_cfg $testmac_path/
######### 
##########l1.sh
sed -i '/dpdk.sh/d'   ${phy_path}l1.sh

###########phycfg_xran.xml
# sed -i 's/<dpdkBasebandFecMode>.*<\/dpdkBasebandFecMode>/<dpdkBasebandFecMode>1<\/dpdkBasebandFecMode>/g'  ${phy_path}phycfg_xran.xml
sed -i 's/<dpdkBasebandFecMode>.*<\/dpdkBasebandFecMode>/<dpdkBasebandMode>1<\/dpdkBasebandMode>/g'  ${phy_path}phycfg_xran.xml
# sed -i 's/<dpdkMemorySize>.*<\/dpdkMemorySize>/<dpdkMemorySize>8192<\/dpdkMemorySize>/g'  ${phy_path}phycfg_xran.xml

deviceid=`lspci |grep 0d5d |awk '{print $1}'|sed -n '1p'`
sed -i "s#<dpdkBasebandDevice>.*<\/dpdkBasebandDevice>#<dpdkBasebandDevice>0000:${deviceid}<\/dpdkBasebandDevice>#g"  ${phy_path}phycfg_xran.xml

######### 
##########xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu0Vf0>.*<\/PciBusAddoRu0Vf0>#<PciBusAddoRu0Vf0>${d0}<\/PciBusAddoRu0Vf0>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu0Vf1>.*<\/PciBusAddoRu0Vf1>#<PciBusAddoRu0Vf1>${d1}<\/PciBusAddoRu0Vf1>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu1Vf0>.*<\/PciBusAddoRu1Vf0>#<PciBusAddoRu1Vf0>${d2}<\/PciBusAddoRu1Vf0>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu1Vf1>.*<\/PciBusAddoRu1Vf1>#<PciBusAddoRu1Vf1>${d3}<\/PciBusAddoRu1Vf1>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu2Vf0>.*<\/PciBusAddoRu2Vf0>#<PciBusAddoRu2Vf0>${d2}<\/PciBusAddoRu2Vf0>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu2Vf1>.*<\/PciBusAddoRu2Vf1>#<PciBusAddoRu2Vf1>${d3}<\/PciBusAddoRu2Vf1>#g"  ${phy_path}xrancfg_sub6_oru.xml


sed -i "s#<oRuRem0Mac0>.*<\/oRuRem0Mac0>#<oRuRem0Mac0>${dst0}<\/oRuRem0Mac0>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<oRuRem0Mac1>.*<\/oRuRem0Mac1>#<oRuRem0Mac1>${dst1}<\/oRuRem0Mac1>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<oRuRem1Mac0>.*<\/oRuRem1Mac0>#<oRuRem1Mac0>${dst2}<\/oRuRem1Mac0>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<oRuRem1Mac1>.*<\/oRuRem1Mac1>#<oRuRem1Mac1>${dst3}<\/oRuRem1Mac1>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<oRuRem2Mac0>.*<\/oRuRem2Mac0>#<oRuRem2Mac0>${dst4}<\/oRuRem2Mac0>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<oRuRem2Mac1>.*<\/oRuRem2Mac1>#<oRuRem2Mac1>${dst5}<\/oRuRem2Mac1>#g"  ${phy_path}xrancfg_sub6_oru.xml

########## 
##########dpdk.sh
sed -i "s#\(ethDevice0=\)\S*#\1$d0#" ${dpdk_path}dpdk.sh
sed -i "s#\(ethDevice1=\)\S*#\1$d1#" ${dpdk_path}dpdk.sh
sed -i "s#\(ethDevice2=\)\S*#\1$d2#" ${dpdk_path}dpdk.sh
sed -i "s#\(ethDevice3=\)\S*#\1$d3#" ${dpdk_path}dpdk.sh
sed -i "s#\(ethDevice4=\)\S*#\1$d4#" ${dpdk_path}dpdk.sh
sed -i "s#\(ethDevice5=\)\S*#\1$d5#" ${dpdk_path}dpdk.sh
##
sed -i "s#\(fecDevice0=\)\S*#\10000:${deviceid}#" ${dpdk_path}dpdk.sh

# sed -i "s#\(igbuioMode=\)\S*#\10#" ${dpdk_path}dpdk.sh
####################################
##
sed -i "s#.*phystart.*#$mac0#"     $testmac_path/testmac_clxsp_multi_numerology_oru.cfg
#sed -i "s#\(setcore \)\S*#$mac1#"  $testmac_path/testmac_clxsp_multi_numerology_oru.cfg
