#!/bin/bash
BASE=$FLEXRAN_L1_SW/../
dpdk_v=$RTE_SDK
CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

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

if [ ! -d   $FLEXRAN_L1_SW ];then
   echo "!!!!!!!!!!please check  phy folder !!!!!!!!!!!!!"
   echo "folder: "$FLEXRAN_L1_SW
   exit 0
fi


export   http_proxy=http://proxy-prc.intel.com:911/
export   ftp_proxy=ftp://proxy-prc.intel.com:911/
export   https_proxy=https://proxy-prc.intel.com:911/

cd $BASE
#cd $BASE_FLEXRAN; rm -rf pf-bb-config dpdk-kmods
git clone https://github.com/intel/pf-bb-config.git
git clone http://dpdk.org/git/dpdk-kmods
#######################################################################################

if [ $1 = "VC" ]
then
   deviceid=`lspci |grep 0d8f |awk '{print $1}'`
elif [ $1 = "MBC" ]
then  
#   deviceid=`lspci |grep 0d5c |awk '{print $1}'`

  deviceid=`lspci |grep 0d5d |awk '{print $1}'|sed -n '1p'`
  if [ ! -n "$deviceid" ]; then
    echo "---------create vf MBC---------"
    $CURRENT_DIR/create_pml_queues_vf.sh
    deviceid=`lspci |grep 0d5d |awk '{print $1}'|sed -n '1p'`
  fi
  if [ ! -n "$deviceid" ]; then
    echo "----error create vf MBC failed----"
    exit 0;
  fi
  sed -i "s#\(^igbuioMode=\)\S*#\10#"  $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/dpdk.sh
  $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/dpdk.sh
else
 echo "input correct value"
fi


#######################################################################################
#######################################################################################
cd $BASE
bbdev_config=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/phycfg_timer.xml

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

if [ ! -f $BASE/dpdk-kmods/linux/igb_uio/igb_uio.ko ]
then
   echo "........start to build igb ko file ...."
   cd $BASE/dpdk-kmods/linux/igb_uio/; make clean;make
fi

if [ `lsmod |awk '{print $1}'|grep igb_uio|wc -l` -eq 0 ]
then
    modprobe uio
    insmod  $BASE/dpdk-kmods/linux/igb_uio/igb_uio.ko
fi

##############################

cp -R /opt/inih/ $BASE/pf-bb-config/
cd $BASE/pf-bb-config/inih/extra;make -f Makefile.static clean;make -f Makefile.static;sudo cp -rf libinih.a ../
export INIH_PATH=$BASE/pf-bb-config/inih

echo "********************dpdk version === $dpdk_v**************************"
cd $dpdk_v;./usertools/dpdk-devbind.py -b igb_uio ${deviceid}
cd $BASE/pf-bb-config/; make clean;make
##############################

#######################################################################################
if [ $1 = "VC" ]
then
   echo "start to bind VC card driver"
   cd $BASE/pf-bb-config/;./pf_bb_config  FPGA_5GNR 1 -c ./fpga_5gnr/fpga_5gnr_config.cfg
elif [ $1 = "MBC" ]
then  
  echo "start to bind MBC card driver"
  cd $BASE/pf-bb-config/;./pf_bb_config ACC100 -c ./acc100/acc100_config_vf_5g.cfg
else
 echo "input correct value"
fi
#######################################################################################

cd $dpdk_v;./usertools/dpdk-devbind.py -s

