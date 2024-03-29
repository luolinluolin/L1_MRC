
platform=$1

#---------------used NIC------------
MRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)/..

source $MRC_DIR/var/var.sh ${platform}

env_file=$MRC_DIR/var/env.sh

echo "------------env--------------"
source $env_file $ORANISA


echo ORANISA=$ORANISA
echo NIC=$NIC
echo RU_NIC_PORT=$RU_NIC_PORT
echo RU_PTP_PORT=$RU_PTP_PORT
echo RU_IP=$RU_IP
echo DU_NIC_PORT=$DU_NIC_PORT
echo DU_PTP_PORT=$DU_PTP_PORT
echo WORK_DIR=$WORK_DIR
echo oran_results_dir=$oran_results_dir
echo ANALYSE_IP_FOLDER=$ANALYSE_IP_FOLDER
# source /opt/intel/oneapi/setvars.sh
# export PATH=$PATH:/opt/intel/oneapi/compiler/2022.0.1/linux/bin-llvm/