#!/bin/bash
SETUP_CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

source ${SETUP_CURRENT_DIR}/../timer/timerenv.sh

accid=`lspci |grep acc |awk '{print $7}'|sed -n '1p'`
if [ $accid = "0d5c" ]; then
  ACC=ACC100
elif [ $accid = "57c0" ]; then
  ACC=ACC200
else
  echo "error pls modified this script to support this acc, or there is no acc in this server pls check."
fi

BASE=${WORK_DIR}/..
dpdk_v=$RTE_SDK
echo "dpdk dir $dpdk_v"
echo "work dir $BASE"

if [ ! -d   $FLEXRAN_L1_SW ];then
   echo "!!!!!!!!!!please check  phy folder !!!!!!!!!!!!!"
   echo "folder: "$FLEXRAN_L1_SW
   exit 0
fi
export   http_proxy=http://proxy-prc.intel.com:911/
export   ftp_proxy=ftp://proxy-prc.intel.com:911/
export   https_proxy=https://proxy-prc.intel.com:911/

#######################################################################################
tool_dir=/opt/flexran_cfg_tool
if [ ! -d $tool_dir ];then
  mkdir $tool_dir
fi

cd $tool_dir
#cd $BASE_FLEXRAN; rm -rf pf-bb-config dpdk-kmods
if [ ! -d pf-bb-config ];then
  git clone https://github.com/intel/pf-bb-config.git
fi

if [ ! -d inih ];then
  git clone https://github.com/benhoyt/inih
fi

bbdev_config=${dpdk_v}/bbdev_pf_config_app
cp -R ${tool_dir}/inih/ ${bbdev_config}
cd ${tool_dir}/inih/; meson build; cd build; ninja; cp -rf lib* ${bbdev_config}/inih/
#cd ${bbdev_config}/inih/extra;make -f Makefile.static clean;make -f Makefile.static;sudo cp -rf libinih.a ../
cd ${bbdev_config}; make clean;make

#######################################################################################
echo "-------------install igb uio---------------"
sh ${SETUP_CURRENT_DIR}/igb_uio_install.sh $tool_dir
#######################################################################################

## create vf 

if [ $ACC = "VC" ]
then
   deviceid=`lspci |grep 0d8f |awk '{print $1}'`
elif [[ ${ACC} == *"ACC"* ]]
then  
  cd $RTE_SDK/
  deviceid=`lspci |grep acc |awk '{print $1}'|sed -n '1p'`
  echo "-----bind device $deviceid"
  ./usertools/dpdk-devbind.py -b igb_uio ${deviceid}
  echo "create vf ......................."
  echo 0 >> /sys/bus/pci/devices/0000\:${deviceid}/max_vfs
  echo 1 >> /sys/bus/pci/devices/0000\:${deviceid}/reset
  echo 2 >> /sys/bus/pci/devices/0000\:${deviceid}/max_vfs
  VFS=`lspci |grep acc |awk '{print $1}' | sed -n '2,3p'| tr '\n' ' '`
  VF_deviceid=`lspci |grep acc |awk '{print $1}'`

  dpdk_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
  deviceid1=`lspci |grep acc |awk '{print $1}'|sed -n '2p'`
  deviceid2=`lspci |grep acc |awk '{print $1}'|sed -n '3p'`
  echo "****deviceid: ${deviceid1}"
  echo "****deviceid: ${deviceid2}"
  echo "---set variable vf MBC----"
  if [ $1 = "PF" ]; then
  sed -i "s#\(^igbuioMode=\)\S*#\11#"  ${dpdk_path}/dpdk.sh
  sed -i "s#\(fecDevice0=\)\S*#\10000:${deviceid}#" ${dpdk_path}/dpdk.sh
  else
  sed -i "s#\(^igbuioMode=\)\S*#\10#"  ${dpdk_path}/dpdk.sh
  sed -i "s#\(fecDevice0=\)\S*#\10000:${deviceid1}#" ${dpdk_path}/dpdk.sh
  sed -i "s#\(fecDevice1=\)\S*#\10000:${deviceid2}#" ${dpdk_path}/dpdk.sh
  fi

  ${dpdk_path}/dpdk.sh
else
 echo "error input correct ACC name"
fi

echo "********************dpdk version === $dpdk_v**************************"
cd $dpdk_v;./usertools/dpdk-devbind.py -b igb_uio ${deviceid}

#######################################################################################
#######################################################################################

cd $BASE
phy_config=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/phycfg_timer.xml

$SETUP_CURRENT_DIR/../utils/change_phy_cfg.sh $phy_config $1
##############################


##############################

#######################################################################################
if [ $1 = "VC" ]
then
   echo "start to bind VC card driver"
   cd $BASE/pf-bb-config/;./pf_bb_config  FPGA_5GNR 1 -c ./fpga_5gnr/fpga_5gnr_config.cfg
elif [ ${ACC}="ACC"* ]
then  
  echo "start to bind MBC card driver"
  deviceid1=`lspci |grep acc |awk '{print $1}'|sed -n '2p'`
  if [ ${ACC} = "ACC100" ]; then
    if [ $1 = "PF" ]; then
    echo "cd ${bbdev_config};./pf_bb_config ACC100 -c ./acc100/acc100_config_pf_5g.cfg"
    cd ${bbdev_config};./pf_bb_config ACC100 -c ./acc100/acc100_config_pf_5g.cfg
    else
    echo "cd ${bbdev_config};./pf_bb_config ACC100 -c ./acc100/acc100_config_1vf_5g.cfg"
    cd ${bbdev_config};./pf_bb_config ACC100 -c ./acc100/acc100_config_1vf_5g.cfg
    fi
  elif [ ${ACC} = "ACC200" ]; then
    echo "cd ${bbdev_config};./pf_bb_config ACC200 -c ./acc200/acc200_config_vf_5g.cfg"
    cd ${bbdev_config};./pf_bb_config ACC200 -c ./acc200/acc200_config_vf_5g.cfg
  fi
else
 echo "input correct value"
fi
#######################################################################################

cd $dpdk_v;./usertools/dpdk-devbind.py -s

