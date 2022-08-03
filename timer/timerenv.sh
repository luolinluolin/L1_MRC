
platform=$1
#---------------used NIC------------
MRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)/../

source $MRC_DIR/var/var.sh $platform

env_file=$MRC_DIR/var/env.sh

echo "------------env--------------"
source $env_file $ORANISA


echo ORANISA=$ORANISA
echo WORK_DIR=$WORK_DIR
echo timer_test_cases=${timer_test_cases}
echo case_dir=${case_dir}
echo sdk_results_dir=$sdk_results_dir
echo timer_results_dir=$timer_results_dir
echo ANALYSE_IP_FOLDER=${ANALYSE_IP_FOLDER}