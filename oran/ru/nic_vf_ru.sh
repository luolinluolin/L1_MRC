#!/bin/bash


source ../../var/oranvar.sh
data_nic=$RU_NIC_PORT

NID=` ethtool -i ${data_nic}|grep bus-info|cut -c16-26|awk -F: '{print $1}' `

echo "this is NIC NID number ==${NID}"

echo 0 > /sys/bus/pci/devices/0000\:${NID}\:00.0/sriov_numvfs
sleep 2
echo 6 > /sys/bus/pci/devices/0000\:${NID}\:00.0/sriov_numvfs

ip link set ${data_nic} vf 0 mac 00:11:22:33:00:01 vlan 1
ip link set ${data_nic} vf 1 mac 00:11:22:33:00:11 vlan 2

ip link set ${data_nic} vf 2 mac 00:11:22:33:00:21 vlan 3
ip link set ${data_nic} vf 3 mac 00:11:22:33:00:31 vlan 4

ip link set ${data_nic} vf 4 mac 00:11:22:33:00:41 vlan 5
ip link set ${data_nic} vf 5 mac 00:11:22:33:00:51 vlan 6

ip link  show

