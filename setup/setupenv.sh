#---------------used NIC------------
MRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)/../

source $MRC_DIR/var/var.sh

env_file=$MRC_DIR/var/env.sh

echo "------------env--------------"
source $env_file $ORANISA


echo ORANISA=$ORANISA
echo WORK_DIR=$WORK_DIR

echo "------------WORK_DIR $WORK_DIR----------------"
if [ ! -d $WORK_DIR ]; then
    mkdir -p $WORK_DIR
fi 