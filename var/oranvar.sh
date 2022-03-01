
platform=$1

MRC_VAR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$MRC_VAR_DIR/mrc.conf

echo '-----------oran.conf------------------'
cat $cfg_file

export NIC=`sed '/^nic_name=/!d;s/.*=//' $cfg_file`
export ORANISA=`sed '/^isa=/!d;s/.*=//' $cfg_file`
export ANALYSE_IP=`sed '/^analyse_ip=/!d;s/.*=//' $cfg_file`
#---------------RU------------
RU_NIC_PORT=`sed '/^ru_nic_port=/!d;s/.*=//' $cfg_file`
RU_PTP_PORT=`sed '/^ru_ptp_port=/!d;s/.*=//' $cfg_file`
RU_IP=`sed '/^ru_ip=/!d;s/.*=//' $cfg_file`

#---------------DU------------
DU_NIC_PORT=`sed '/^du_nic_port=/!d;s/.*=//' $cfg_file`
DU_PTP_PORT=`sed '/^du_ptp_port=/!d;s/.*=//' $cfg_file`
WORK_DIR=`sed '/^work_dir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`

source $MRC_VAR_DIR/test_case.sh

if [ $platform = "cslsp" ]
then
   echo "------------casecade lake sp test $oran_csl_sp_case------------------"
   test_cases=$oran_csl_sp_case
fi

if [ $platform = "iclsp" ]
then
   echo "------------ice lake sp test $oran_icl_sp_case------------------"
   test_cases=$oran_icl_sp_case
fi

export PTP_DIR=`sed '/^ptp_dir=/!d;s/.*=//' $cfg_file`

export pipline_results_dir=$MRC_VAR_DIR/../$RESULT_SUDIR/oran/
