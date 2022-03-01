
platform=$1

MRC_VAR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$MRC_VAR_DIR/mrc.conf

echo '-----------timer.conf------------------'

export ANALYSE_IP=`sed '/^analyse_ip=/!d;s/.*=//' $cfg_file`
ORANISA=`sed '/^isa=/!d;s/.*=//' $cfg_file`
WORK_DIR=`sed '/^work_dir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`

source $MRC_VAR_DIR/test_case.sh

if [ $platform = "cslsp" ]
then
   echo "------------casecade lake sp test $timer_csl_sp_case------------------"
   test_cases=$timer_csl_sp_case
   case_dir=cascade_lake-sp
fi

if [ $platform = "iclsp" ]
then
   echo "------------ice lake sp test $timer_icl_sp_case------------------"
   test_cases=$timer_icl_sp_case
   case_dir=icelake-sp
fi

if [ $platform = "icld" ]
then
   echo "------------ice lake d test $timer_icl_d_case------------------"
   test_cases=$case_icl_d
   case_dir=icelake-d
fi

export pipline_results_dir=$MRC_VAR_DIR/../$RESULT_SUDIR/timer
export sdk_results_dir=$MRC_VAR_DIR/../$RESULT_SUDIR/sdk_results

