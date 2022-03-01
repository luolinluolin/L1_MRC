
platform=$1

MRC_VAR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$MRC_VAR_DIR/mrc.conf

echo '-----------timer.conf------------------'

ANALYSE_IP=`sed '/^analyse_ip=/!d;s/.*=//' $cfg_file`
ORANISA=`sed '/^isa=/!d;s/.*=//' $cfg_file`
WORK_DIR=`sed '/^work_dir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`

source $MRC_VAR_DIR/test_case.sh

if [ $platform = "cslsp" ]
then
   echo "------------casecade lake sp test $timer_cslsp_case------------------"
   test_cases=$timer_cslsp_case
   case_dir=cascade_lake-sp
fi

if [ $platform = "iclsp" ]
then
   echo "------------ice lake sp test $timer_iclsp_case------------------"
   test_cases=$timer_iclsp_case
   case_dir=icelake-sp
fi

if [ $platform = "icld" ]
then
   echo "------------ice lake d test $timer_icld_case------------------"
   test_cases=$case_icld
   case_dir=icelake-d
fi

pipline_results_dir=$MRC_VAR_DIR/../$RESULT_SUDIR/timer
sdk_results_dir=$MRC_VAR_DIR/../$RESULT_SUDIR/sdk_results

