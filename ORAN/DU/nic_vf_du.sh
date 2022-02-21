#!/bin/bash

source ../oranvar.sh
#data_nic=enp34s0f0
data_nic=$DU_NIC_PORT
NID=` ethtool -i ${data_nic}|grep bus-info|cut -c16-26|awk -F: '{print $1}' `
echo "this is NIC NID number ==${NID}"
echo 6 > /sys/bus/pci/devices/0000\:${NID}\:00.0/sriov_numvfs

ip link set ${data_nic} vf 1 mac 00:11:22:33:00:10 vlan 1
ip link set ${data_nic} vf 0 mac 00:11:22:33:00:00 vlan 2

ip link set ${data_nic} vf 3 mac 00:11:22:33:00:30 vlan 1
ip link set ${data_nic} vf 2 mac 00:11:22:33:00:20 vlan 2

ip link set ${data_nic} vf 5 mac 00:11:22:33:01:10 vlan 1
ip link set ${data_nic} vf 4 mac 00:11:22:33:01:00 vlan 2

ip link  show
