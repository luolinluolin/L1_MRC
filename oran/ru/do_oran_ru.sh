#! /bin/bash
if [ $# -ne 1 ] || [ $1 = "-h" ];then
    echo "
         example : ./do_oran_ru.sh  orancfg/sub3_mu0_10mhz_4x4
     "
   exit 0
fi

case=$1

base=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${base}/../oranenv.sh
work_path=$base

killall=$base/../../kill.sh
$killall

#cd $work_path/; ./nic_vf_ru.sh 
#cd $work_path/;source ./setup/env.sh $ORANISA;cd $work_path/flexran_l1_sw/bin/nr5g/gnb/l1/orancfg/sub6_mu1_100mhz_4x4/oru; ./dpdk.sh 
cd $work_path/; rm -rf *.log 

ru_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/$case/oru/

#####setup####
# cd $base
# ./setup.sh


########## run ru ###########
sysctl -w kernel.sched_rt_runtime_us=-1
cd $work_path; ./execute_ru.ex $ru_dir $case $work_path

echo "this RU script is done"
