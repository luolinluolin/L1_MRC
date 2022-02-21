
ORAN_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$ORAN_DIR/oran.conf

echo'-----------oran.conf------------------'
cat $cfg_file

export NIC=`sed '/^nic_name=/!d;s/.*=//' $cfg_file`
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