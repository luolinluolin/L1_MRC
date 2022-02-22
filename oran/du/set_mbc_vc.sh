#!/bin/bash

BASE=$PWD
dpdk_v=$BASE/wireless_dpdk_ae


if [ $# -ne 1 ];then
   echo "!!!!!!!!!!please input correct parmeter !!!!!!!!!!!!!"
    echo "
         example : ./mbc_vc_setup.sh  VC
     "
   exit 0
fi



echo $@ |grep -Ew "VC|MBC"  >/dev/null
if [  $? -ne 0 ]
then
   echo "!!!!!!!!!!please input correct parmeter !!!!!!!!!!!!!"
    echo "
         example : ./mbc_vc_setup.sh  VC
         or
         example : ./mbc_vc_setup.sh  MBC
     "
   exit 0
fi

if [ ! -d   $BASE/flexran_l1_sw ];then
   echo "!!!!!!!!!!please check  phy folder !!!!!!!!!!!!!"
   
   exit 0
fi

#######################################################################################

if [ $1 = "VC" ]
then
   deviceid=`lspci |grep 0d8f |awk '{print $1}'`
elif [ $1 = "MBC" ]
then  
  deviceid=`lspci |grep 0d5c |awk '{print $1}'`
else
 echo "input correct value"
fi


#######################################################################################
#######################################################################################
cd $BASE
bbdev_config=$BASE/flexran_l1_sw/bin/nr5g/gnb/l1/phycfg_timer.xml

echo "----------dpdkbasebanddevice old value--------------------"
grep  dpdkBasebandDevice $bbdev_config
#deviceid=`lspci |grep 0d5c |awk '{print $1}'`
echo "-------HW vc card pci device id is $deviceid------------"
sed -i "s#<dpdkBasebandDevice>.*<\/dpdkBasebandDevice>#<dpdkBasebandDevice>0000:${deviceid}<\/dpdkBasebandDevice>#g"  $bbdev_config
echo "----------dpdkbasebanddevice new value-------------------"
grep  dpdkBasebandDevice $bbdev_config
echo "----------dpdkbasebanddevice new value-------------------"


echo " ----------phycfg_timer.xml BBDEV original paramter value ------------"
sed -i 's/<dpdkBasebandFecMode>.*<\/dpdkBasebandFecMode>/<dpdkBasebandFecMode>1<\/dpdkBasebandFecMode>/g' $bbdev_config
echo " -----------change phycfg_timer.xml dpdkBasebandFecMode  paramter value to test BBDEV model--------------"
grep  dpdkBasebandFecMode $bbdev_config
echo "----------------------------------------------------------------------"

##############################

if [ ! -f /opt/dpdk-kmods/linux/igb_uio/igb_uio.ko ]
then
   echo "........start to build igb ko file ...."
   cd /opt/dpdk-kmods/linux/igb_uio/; make clean;make
fi

if [ `lsmod |awk '{print $1}'|grep igb_uio|wc -l` -eq 0 ]
then
    modprobe uio
    insmod  /opt/dpdk-kmods/linux/igb_uio/igb_uio.ko
fi

##############################

cp -R /opt/inih/ /opt/pf-bb-config/
cd  /opt/pf-bb-config/inih/extra;make -f Makefile.static clean;make -f Makefile.static;sudo cp -rf libinih.a ../
export INIH_PATH=/opt/pf-bb-config/inih

echo "********************dpdk version === $dpdk_v**************************"
cd $dpdk_v;./usertools/dpdk-devbind.py -b igb_uio ${deviceid}
cd  /opt/pf-bb-config/; make clean;make
##############################

#######################################################################################
if [ $1 = "VC" ]
then
   echo "start to bind vc card driver"
   cd /opt/pf-bb-config/;./pf_bb_config  FPGA_5GNR 1 -c ./fpga_5gnr/fpga_5gnr_config.cfg
elif [ $1 = "MBC" ]
then  
  echo "start to bind vc card driver"
  cd /opt/pf-bb-config/;./pf_bb_config ACC100 -c ./acc100/acc100_config_5g.cfg
else
 echo "input correct value"
fi
#######################################################################################
echo "..............check dpdk binding status .................."
cd $dpdk_v;./usertools/dpdk-devbind.py -s

