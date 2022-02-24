#! /bin/bash

#######################################################################
#
# <COPYRIGHT_TAG>
#
#######################################################################

if [ -z "$RTE_SDK" ]
then
    echo "## ERROR: Please make sure environment variable RTE_SDK is set to valid DPDK path."
    echo "       To fix, please do: export RTE_SDK=path_to_dpdk_folder    before running this script"
    exit 1
fi

if [ -z "$RTE_SDK_KMOD" ]
then
    echo "## ERROR: Please make sure environment variable RTE_SDK_KMOD is set to valid DPDK KMOD path."
    echo "       To fix, please do: export RTE_SDK_KMOD=path_to_dpdk_folder    before running this script"
    exit 1
fi


# Set all the PCIE address for devices to load. If it is left blank, then things are not loaded
ethDevice0=0000:51:01.0
ethDevice1=0000:51:01.1
ethDevice2=0000:51:01.2
ethDevice3=0000:51:01.3
ethDevice4=0000:51:01.4
ethDevice5=0000:51:01.5
ethDevice6=
ethDevice7=
ethDevice8=
ethDevice9=
ethDevice10=
ethDevice11=
ethDevice12=
ethDevice13=
ethDevice14=
ethDevice15=
fecDevice0=0000:8b:00.0
fecDevice1=

if [ ${RTE_SDK} == '' ]; then
    echo RTE_SDK is not set. Please set this to valid DPDK path
    exit -1
fi

#
# Unloads igb_uio.ko.
#
remove_igb_uio_module()
{
    echo "Unloading any existing DPDK UIO module"
    /sbin/lsmod | grep -s igb_uio > /dev/null
    if [ $? -eq 0 ] ; then
        sudo /sbin/rmmod igb_uio
    fi
}

#
# Loads new igb_uio.ko (and uio module if needed).
#
load_igb_uio_module()
{
    if [ ! -f $RTE_SDK_KMOD/linux/igb_uio/igb_uio.ko ];then
        echo "## ERROR: Target does not have the DPDK UIO Kernel Module."
        echo "       To fix, please try to rebuild target."
        return
    fi

    remove_igb_uio_module

    /sbin/lsmod | grep -s uio > /dev/null
    if [ $? -ne 0 ] ; then
        if test -f /lib/modules/$(uname -r)/kernel/drivers/uio/uio.ko -o -f /lib/modules/$(uname -r)/kernel/drivers/uio/uio.ko.xz ; then
            echo "Loading uio module"
            sudo /sbin/modprobe uio
        fi
    fi

    # UIO may be compiled into kernel, so it may not be an error if it can't
    # be loaded.

    echo "Loading DPDK UIO module"
    sudo /sbin/insmod $RTE_SDK_KMOD/linux/igb_uio/igb_uio.ko
    if [ $? -ne 0 ] ; then
        echo "## ERROR: Could not load kmod/igb_uio.ko."
        quit
    fi
}

#
# Unloads VFIO modules.
#
remove_vfio_module()
{
    echo "Unloading any existing VFIO module"
    /sbin/lsmod | grep -s vfio > /dev/null
    if [ $? -eq 0 ] ; then
        sudo /sbin/rmmod vfio-pci
        sudo /sbin/rmmod vfio_iommu_type1
        sudo /sbin/rmmod vfio
    fi
}

#
# Loads new vfio-pci (and vfio module if needed).
#
load_vfio_module()
{
    remove_vfio_module


    echo "Loading VFIO module"
    /sbin/lsmod | grep -s vfio_pci > /dev/null
    if [ $? -ne 0 ] ; then
        sudo /sbin/modprobe -v vfio-pci
    fi

    # make sure regular users can read /dev/vfio
    echo "chmod /dev/vfio"
    sudo chmod a+x /dev/vfio
    if [ $? -ne 0 ] ; then
        echo "FAIL"
        quit
    fi
    echo "OK"

    # check if /dev/vfio/vfio exists - that way we
    # know we either loaded the module, or it was
    # compiled into the kernel
    if [ ! -e /dev/vfio/vfio ] ; then
        echo "## ERROR: VFIO not found!"
    fi
}

# Use IGB_UIO. Change this to 0 for VFIO-PCI
igbuioMode=0
echo igbuioMode=0

$RTE_SDK/usertools/dpdk-devbind.py --status

#IGB-UIO Mode
if [ "$igbuioMode" -eq "1" ]; then
    load_igb_uio_module
    if [ ! -z "$ethDevice0" ]; then
        driverctl --nosave set-override $ethDevice0 igb_uio
    fi
    if [ ! -z "$ethDevice1" ]; then
        driverctl --nosave set-override $ethDevice1 igb_uio
    fi
    if [ ! -z "$ethDevice2" ]; then
        driverctl --nosave set-override $ethDevice2 igb_uio
    fi
    if [ ! -z "$ethDevice3" ]; then
        driverctl --nosave set-override $ethDevice3 igb_uio
    fi
    if [ ! -z "$ethDevice4" ]; then
        driverctl --nosave set-override $ethDevice4 igb_uio
    fi
    if [ ! -z "$ethDevice5" ]; then
        driverctl --nosave set-override $ethDevice5 igb_uio
    fi
    if [ ! -z "$ethDevice6" ]; then
        driverctl --nosave set-override $ethDevice6 igb_uio
    fi
    if [ ! -z "$ethDevice7" ]; then
        driverctl --nosave set-override $ethDevice7 igb_uio
    fi
    if [ ! -z "$ethDevice8" ]; then
        driverctl --nosave set-override $ethDevice8 igb_uio
    fi
    if [ ! -z "$ethDevice9" ]; then
        driverctl --nosave set-override $ethDevice9 igb_uio
    fi
    if [ ! -z "$ethDevice10" ]; then
        driverctl --nosave set-override $ethDevice10 igb_uio
    fi
    if [ ! -z "$ethDevice11" ]; then
        driverctl --nosave set-override $ethDevice11 igb_uio
    fi
    if [ ! -z "$ethDevice12" ]; then
        driverctl --nosave set-override $ethDevice12 igb_uio
    fi
    if [ ! -z "$ethDevice13" ]; then
        driverctl --nosave set-override $ethDevice13 igb_uio
    fi
    if [ ! -z "$ethDevice14" ]; then
        driverctl --nosave set-override $ethDevice14 igb_uio
    fi
    if [ ! -z "$ethDevice15" ]; then
        driverctl --nosave set-override $ethDevice15 igb_uio
    fi

    if [ ! -z "$fecDevice0" ]; then
        driverctl --nosave set-override $fecDevice0 igb_uio
        echo "8086 0D8F" | tee /sys/bus/pci/drivers/igb_uio/new_id
    fi
    if [ ! -z "$fecDevice1" ]; then
        driverctl --nosave set-override $fecDevice1 igb_uio
        echo "8086 0D8F" | tee /sys/bus/pci/drivers/igb_uio/new_id
    fi
else
    # VFIO-PCIE Mode
    load_vfio_module
    if [ ! -z "$ethDevice0" ]; then
        driverctl --nosave set-override $ethDevice0 vfio-pci
    fi
    if [ ! -z "$ethDevice1" ]; then
        driverctl --nosave set-override $ethDevice1 vfio-pci
    fi
    if [ ! -z "$ethDevice2" ]; then
        driverctl --nosave set-override $ethDevice2 vfio-pci
    fi
    if [ ! -z "$ethDevice3" ]; then
        driverctl --nosave set-override $ethDevice3 vfio-pci
    fi
    if [ ! -z "$ethDevice4" ]; then
        driverctl --nosave set-override $ethDevice4 vfio-pci
    fi
    if [ ! -z "$ethDevice5" ]; then
        driverctl --nosave set-override $ethDevice5 vfio-pci
    fi
    if [ ! -z "$ethDevice6" ]; then
        driverctl --nosave set-override $ethDevice6 vfio-pci
    fi
    if [ ! -z "$ethDevice7" ]; then
        driverctl --nosave set-override $ethDevice7 vfio-pci
    fi
    if [ ! -z "$ethDevice8" ]; then
        driverctl --nosave set-override $ethDevice8 vfio-pci
    fi
    if [ ! -z "$ethDevice9" ]; then
        driverctl --nosave set-override $ethDevice9 vfio-pci
    fi
    if [ ! -z "$ethDevice10" ]; then
        driverctl --nosave set-override $ethDevice10 vfio-pci
    fi
    if [ ! -z "$ethDevice11" ]; then
        driverctl --nosave set-override $ethDevice11 vfio-pci
    fi
    if [ ! -z "$ethDevice12" ]; then
        driverctl --nosave set-override $ethDevice12 vfio-pci
    fi
    if [ ! -z "$ethDevice13" ]; then
        driverctl --nosave set-override $ethDevice13 vfio-pci
    fi
    if [ ! -z "$ethDevice14" ]; then
        driverctl --nosave set-override $ethDevice14 vfio-pci
    fi
    if [ ! -z "$ethDevice15" ]; then
        driverctl --nosave set-override $ethDevice15 vfio-pci
    fi

    if [ ! -z "$fecDevice0" ]; then
        driverctl --nosave set-override $fecDevice0 vfio-pci
        echo "8086 0d90" | tee /sys/bus/pci/drivers/vfio-pci/new_id
    fi
    if [ ! -z "$fecDevice1" ]; then
        driverctl --nosave set-override $fecDevice1 vfio-pci
        echo "8086 0d90" | tee /sys/bus/pci/drivers/vfio-pci/new_id
    fi
fi

$RTE_SDK/usertools/dpdk-devbind.py --status

