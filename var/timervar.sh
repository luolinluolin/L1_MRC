
MRC_VAR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
cfg_file=$MRC_VAR_DIR/mrc.conf

echo'-----------timer.conf------------------'

ORANISA=`sed '/^isa=/!d;s/.*=//' $cfg_file`
WORK_DIR=`sed '/^work_dir=/!d;s/.*=//' $cfg_file`
RESULT_SUDIR=`sed '/^result_subdir=/!d;s/.*=//' $cfg_file`

pipline_results_dir=$TIMER_DIR/../$RESULT_SUDIR/pipline_results/timer
sdk_results_dir=$TIMER_DIR/../$RESULT_SUDIR/sdk_results


# source $MRC_VAR_DIR/icx.sh