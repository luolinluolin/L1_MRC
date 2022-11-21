
platform=$1

VAR_CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$VAR_CURRENT_DIR/mrc.conf


echo "----------------common config-----------------"
ANALYSE_IP_FOLDER=`sed '/^analyse_ip=/!d;s/.*=//' $cfg_file`
ORANISA=`sed '/^isa=/!d;s/.*=//' $cfg_file`
LDPC_ACC=`sed '/^acc=/!d;s/.*=//' $cfg_file`
WORK_DIR=`sed '/^work_dir=/!d;s/.*=//' $cfg_file`
RESULT_DIR=`sed '/^result_dir=/!d;s/.*=//' $cfg_file`

echo '-----------oran.conf------------------'
export NIC=`sed '/^nic_name=/!d;s/.*=//' $cfg_file`
#---------------RU------------
RU_NIC_PORT=`sed '/^ru_nic_port=/!d;s/.*=//' $cfg_file`
RU_PTP_PORT=`sed '/^ru_ptp_port=/!d;s/.*=//' $cfg_file`
RU_IP=`sed '/^ru_ip=/!d;s/.*=//' $cfg_file`

#---------------DU------------
DU_NIC_PORT=`sed '/^du_nic_port=/!d;s/.*=//' $cfg_file`
DU_PTP_PORT=`sed '/^du_ptp_port=/!d;s/.*=//' $cfg_file`
PTP_DIR=`sed '/^ptp_dir=/!d;s/.*=//' $cfg_file`

#---------------store dir----------------
timer_results_dir=$RESULT_DIR/timer
sdk_results_dir=$RESULT_DIR/sdk_results
oran_results_dir=$RESULT_DIR/oran


source $VAR_CURRENT_DIR/test_case.sh

echo '-----------timer.conf------------------'
if [ $platform = "cslsp" ]
then
   echo "------------casecade lake sp test $timer_cslsp_case------------------"
   timer_test_cases=$timer_cslsp_case
   case_dir=cascade_lake-sp
   echo "------------casecade lake sp test $oran_cslsp_case------------------"
   oran_test_cases=$oran_cslsp_case
fi

if [ $platform = "iclsp" ]
then
   echo "------------ice lake sp test $timer_iclsp_case------------------"
   timer_test_cases=$timer_iclsp_case
   case_dir=icelake-sp
   echo "------------ice lake sp test $oran_iclsp_case------------------"
   oran_test_cases=$oran_iclsp_case
fi

if [ $platform = "icld" ]
then
   echo "------------ice lake d test $timer_icld_case------------------"
   timer_test_cases=$timer_icld_case
   case_dir=icelake-d
fi

if [ $platform = "spreec" ]
then
   echo "------------spr eec test $timer_spreec_case------------------"
   timer_test_cases=$timer_spreec_case
   case_dir=spr-sp-eec
   echo "------------ice lake sp test $oran_spreec_case------------------"
   oran_test_cases=$oran_spreec_case
fi

if [ $platform = "sprmcc" ]
then
   echo "------------spr mcc test $timer_spreec_case------------------"
   timer_test_cases=$timer_sprmcc_case
   case_dir=spr-sp-mcc
fi