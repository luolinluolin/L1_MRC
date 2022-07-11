#!/bin/bash
base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source ${base}/../oranvar.sh
#data_nic=enp34s0f0
data_nic=$DU_NIC_PORT
NID=` ethtool -i ${data_nic}|grep bus-info|cut -c16-26|awk -F: '{print $1}' `

if [ ! $NID ]; then
echo "pls config DU_NIC_PORT in mrc.conf correctly"
exit 0
fi

echo "this is NIC NID number ==${NID}"
echo 6 > /sys/bus/pci/devices/0000\:${NID}\:00.0/sriov_numvfs

ip link set ${data_nic} vf 1 mac 00:11:22:33:00:10 vlan 1
ip link set ${data_nic} vf 0 mac 00:11:22:33:00:00 vlan 2

ip link set ${data_nic} vf 3 mac 00:11:22:33:00:30 vlan 4
ip link set ${data_nic} vf 2 mac 00:11:22:33:00:20 vlan 3

ip link set ${data_nic} vf 5 mac 00:11:22:33:00:50 vlan 6
ip link set ${data_nic} vf 4 mac 00:11:22:33:00:40 vlan 5

ip link  show

# bind dpdk
vf_dev=lspci |grep "Ethernet Adaptive Virtual" |head -5|awk '{print $1}'
d0=`echo $vf_dev|sed -n '1p'`
d1=`echo $vf_dev|sed -n '2p'`
d2=`echo $vf_dev|sed -n '3p'`
d3=`echo $vf_dev|sed -n '4p'`
d4=`echo $vf_dev|sed -n '5p'`
d5=`echo $vf_dev|sed -n '6p'`

dpdk=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/dpdk.sh
sed -i "s#\(ethDevice0=\)\S*#\1$d0#" $dpdk
sed -i "s#\(ethDevice1=\)\S*#\1$d1#" $dpdk
sed -i "s#\(ethDevice2=\)\S*#\1$d2#" $dpdk
sed -i "s#\(ethDevice3=\)\S*#\1$d3#" $dpdk
sed -i "s#\(ethDevice4=\)\S*#\1$d4#" $dpdk
sed -i "s#\(ethDevice5=\)\S*#\1$d5#" $dpdk

sed -i "s#\(igbuioMode=\)\S*#\10#" $dpdk
$dpdk
