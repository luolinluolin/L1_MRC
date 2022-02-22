
MRC_VAR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$MRC_VAR_DIR/mrc.conf

echo'-----------oran.conf------------------'
cat $cfg_file

export NIC=`sed '/^nic_name=/!d;s/.*=//' $cfg_file`
export RU_PCIE_DEVICE_ID=`sed '/^ru_pcie_device_id=/!d;s/.*=//' $cfg_file`
export DU_PCIE_DEVICE_ID=`sed '/^du_pcie_device_id=/!d;s/.*=//' $cfg_file`
export ORANISA=`sed '/^isa=/!d;s/.*=//' $cfg_file`
#---------------RU------------
RU_NIC_PORT=`sed '/^ru_nic_port=/!d;s/.*=//' $cfg_file`
RU_PTP_PORT=`sed '/^ru_ptp_port=/!d;s/.*=//' $cfg_file`
RU_IP=`sed '/^ru_ip=/!d;s/.*=//' $cfg_file`

#---------------DU------------
DU_NIC_PORT=`sed '/^du_nic_port=/!d;s/.*=//' $cfg_file`
DU_PTP_PORT=`sed '/^du_ptp_port=/!d;s/.*=//' $cfg_file`
WORK_DIR=`sed '/^work_dir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`

export pipline_results_dir=$ORAN_DIR/../$RESULT_SUDIR/oran/


# source /opt/intel/oneapi/setvars.sh
# export PATH=$PATH:/opt/intel/oneapi/compiler/2022.0.1/linux/bin-llvm/

# source /opt/intel/oneapi/setvars.sh
# export PATH=$PATH:/opt/intel/oneapi/compiler/2022.0.1/linux/bin-llvm/