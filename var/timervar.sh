
MRC_VAR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$MRC_VAR_DIR/mrc.conf

echo '-----------timer.conf------------------'

export ANALYSE_IP=`sed '/^analyse_ip=/!d;s/.*=//' $cfg_file`
ORANISA=`sed '/^isa=/!d;s/.*=//' $cfg_file`
WORK_DIR=`sed '/^work_dir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`


source $MRC_VAR_DIR/test_case.sh
# timer_case_csl_sp=`sed '/^timer_case_csl_sp=/!d;s/.*=//' $cfg_file`
# timer_case_icl_sp=`sed '/^timer_case_icl_sp=/!d;s/.*=//' $cfg_file`
# timer_case_icl_d=`sed '/^timer_case_icl_d=/!d;s/.*=//' $cfg_file`

timer_case_csl_sp=$timer_csl_sp_case
timer_case_icl_sp=$timer_icl_sp_case
timer_case_icl_d=$timer_icl_d_case


export pipline_results_dir=$MRC_VAR_DIR/../$RESULT_SUDIR/timer
export sdk_results_dir=$MRC_VAR_DIR/../$RESULT_SUDIR/sdk_results

