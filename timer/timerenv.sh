
platform=$1
#---------------used NIC------------
MRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)/../

source $MRC_DIR/var/timervar.sh $platform

env_file=$MRC_DIR/var/env.sh

echo "------------env--------------"
source $env_file $ORANISA


echo ORANISA=$ORANISA
echo WORK_DIR=$WORK_DIR
echo test_cases=$test_cases
echo case_dir=$case_dir
echo sdk_results_dir=$sdk_results_dir
echo pipline_results_dir=$pipline_results_dir