
#---------------used NIC------------
MRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)/../

source $MRC_DIR/var/timervar.sh

env_file=$MRC_DIR/var/env.sh

echo "------------env--------------"
source $env_file $ORANISA


echo ORANISA=$ORANISA
echo WORK_DIR=$WORK_DIR
echo timer_case_csl_sp=$timer_case_csl_sp
echo timer_case_icl_sp=$timer_case_icl_sp
echo timer_case_icl_d=$timer_case_icl_d