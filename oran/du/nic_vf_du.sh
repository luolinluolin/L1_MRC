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

dpdk=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/dpdk.sh
sed -i "s#\(ethDevice0=\)\S*#\1$d0#" $dpdk
sed -i "s#\(ethDevice1=\)\S*#\1$d1#" $dpdk
sed -i "s#\(ethDevice2=\)\S*#\1$d2#" $dpdk
sed -i "s#\(ethDevice3=\)\S*#\1$d3#" $dpdk
sed -i "s#\(ethDevice4=\)\S*#\1$d4#" $dpdk
sed -i "s#\(ethDevice5=\)\S*#\1$d5#" $dpdk

sed -i "s#\(igbuioMode=\)\S*#\10#" $dpdk
$dpdk
