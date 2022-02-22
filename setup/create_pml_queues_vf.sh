source /home/sam/flexran_v21.03/env 
modprobe uio
insmod $RTE_SDK_KMOD/linux/igb_uio/igb_uio.ko
cd $RTE_SDK/
export PCI_ADDR=$(lspci -vd8086:d5c | awk '{print $1}' | head -1)
./usertools/dpdk-devbind.py -b igb_uio ${PCI_ADDR}
echo 0 >> /sys/bus/pci/devices/0000\:${PCI_ADDR}/max_vfs
echo 1 >> /sys/bus/pci/devices/0000\:${PCI_ADDR}/reset
echo 2 >> /sys/bus/pci/devices/0000\:${PCI_ADDR}/max_vfs
export VFS=$(lspci -vd8086:d5d | grep d5d | awk '{print $1}' | tr '\n' ' ')
export VF_PCI_ADDR=$(lspci -vd8086:d5d | awk '{print $1}' | head -1)
modprobe vfio_pci
./usertools/dpdk-devbind.py -b vfio-pci $VFS
cd bbdev_pf_config_app/
./pf_bb_config ACC100 -c acc100/acc100_config_vf_5g.cfg
sleep 3
cd $RTE_SDK/app/test-bbdev/
./test-bbdev.py -e="-c 0xff0 -w$VFS" -n 60 -b 24 -l 4 -c validation -v ./test_vectors/ldpc_dec_HARQ_1_0.data

