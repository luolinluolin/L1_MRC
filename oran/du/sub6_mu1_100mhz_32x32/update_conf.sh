#!/bin/bash

base=$PWD


PCIE_BUS=` lspci |grep -E "${NIC}" |head -1|awk '{print $1}'|awk -F: '{print $1}' `


d0="0000:${PCIE_BUS}:$DU_PCIE_DEVICE_ID.0"
d1="0000:${PCIE_BUS}:$DU_PCIE_DEVICE_ID.1"
d2="0000:${PCIE_BUS}:$DU_PCIE_DEVICE_ID.2"
d3="0000:${PCIE_BUS}:$DU_PCIE_DEVICE_ID.3"
d4="0000:${PCIE_BUS}:$DU_PCIE_DEVICE_ID.4"
d5="0000:${PCIE_BUS}:$DU_PCIE_DEVICE_ID.5"
#deviceid="20:00.0"

dst0="00:11:22:33:00:02"
dst1="00:11:22:33:00:12"
dst2="00:11:22:33:00:22"
dst3="00:11:22:33:00:32"

mac0="phystart 4 0 350000"
mac1="setcore 0xF81F0"

xRANThread="10, 96, 0"
xRANWorker="0x800, 96, 0"

phy_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/orancfg/sub6_mu1_100mhz_32x32/gnb/
testmac_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/testmac/
dpdk_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/
####################################
cd $base
cp $phy_path/testmac_icxsp_mu1_100mhz_32x32_hton_oru.cfg $testmac_path/
#########
##########l1.sh
sed -i '/dpdk.sh/d'   ${phy_path}l1.sh

###########phycfg_xran.xml
sed -i 's/<dpdkBasebandFecMode>.*<\/dpdkBasebandFecMode>/<dpdkBasebandFecMode>1<\/dpdkBasebandFecMode>/g'  ${phy_path}phycfg_xran.xml
# sed -i 's/<dpdkMemorySize>.*<\/dpdkMemorySize>/<dpdkMemorySize>8192<\/dpdkMemorySize>/g'  ${phy_path}phycfg_xran.xml

deviceid=`lspci |grep 0d5c |awk '{print $1}'`
sed -i "s#<dpdkBasebandDevice>.*<\/dpdkBasebandDevice>#<dpdkBasebandDevice>0000:${deviceid}<\/dpdkBasebandDevice>#g"  ${phy_path}phycfg_xran.xml

#########
##########xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu0Vf0>.*<\/PciBusAddoRu0Vf0>#<PciBusAddoRu0Vf0>${d0}<\/PciBusAddoRu0Vf0>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu0Vf1>.*<\/PciBusAddoRu0Vf1>#<PciBusAddoRu0Vf1>${d1}<\/PciBusAddoRu0Vf1>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu0Vf2>.*<\/PciBusAddoRu0Vf2>#<PciBusAddoRu0Vf2>${d2}<\/PciBusAddoRu0Vf2>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<PciBusAddoRu0Vf3>.*<\/PciBusAddoRu0Vf3>#<PciBusAddoRu0Vf3>${d3}<\/PciBusAddoRu0Vf3>#g"  ${phy_path}xrancfg_sub6_oru.xml


sed -i "s#<oRuRem0Mac0>.*<\/oRuRem0Mac0>#<oRuRem0Mac0>${dst0}<\/oRuRem0Mac0>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<oRuRem0Mac1>.*<\/oRuRem0Mac1>#<oRuRem0Mac1>${dst1}<\/oRuRem0Mac1>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<oRuRem0Mac2>.*<\/oRuRem0Mac2>#<oRuRem0Mac2>${dst2}<\/oRuRem0Mac2>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<oRuRem0Mac3>.*<\/oRuRem0Mac3>#<oRuRem0Mac3>${dst3}<\/oRuRem0Mac3>#g"  ${phy_path}xrancfg_sub6_oru.xml

sed -i "s#<xRANThread>.*<\/xRANThread>#<xRANThread>${xRANThread}<\/xRANThread>#g"  ${phy_path}xrancfg_sub6_oru.xml
sed -i "s#<xRANWorker>.*<\/xRANWorker>#<xRANWorker>${xRANWorker}<\/xRANWorker>#g"  ${phy_path}xrancfg_sub6_oru.xml
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
####################################
##
sed -i "s#.*phystart.*#$mac0#"     $testmac_path/testmac_icxsp_mu1_100mhz_32x32_hton_oru.cfg
# sed -i "s#\(setcore \)\S*#$mac1#"  $testmac_path/testmac_icxsp_mu1_100mhz_32x32_hton_oru.cfg
