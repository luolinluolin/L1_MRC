#!/bin/bash

if [ $# -lt 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./do_pipline_perf.sh  cslsp prod_r21.11
         example : ./do_pipline_perf.sh  iclsp prod_r21.11
         example : ./do_pipline_perf.sh  icld prod_r21.11
     "
   exit 0
fi

platform=$1
test_ver=$2
test_one_case=$3


TIMER_CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
$TIMER_CUR_DIR/../kill.sh

source $TIMER_CUR_DIR/timerenv.sh
l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
l2_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/testmac	
echo "--------$l1_dir---------------"
echo "--------$l2_dir---------------"

################################# change phy config ############################
timer_cfg=${l1_dir}/phycfg_timer.xml
echo "---------------------------------${TIMER_CUR_DIR}/../utils/change_phy_cfg.sh ${timer_cfg}"
${TIMER_CUR_DIR}/../utils/change_phy_cfg.sh ${timer_cfg}

#-----setup MBC-----
$TIMER_CUR_DIR/../setup/mbc_vc_setup.sh MBC


rm -rf $timer_results_dir/l2_failed.txt
pipline_result=$timer_results_dir/$platform/$test_ver
if [ ! -d $pipline_result ]; then
    mkdir -p $pipline_result
fi 

test_perf() {
    case_dir=$1
    test_cases=$2


    echo "--------------------------- testcases $test_cases-------------------------------------"
    for test_case in ${test_cases}
    do
        echo "---------------------------run testcase $test_case-------------------------------------"
        rm -rf $TIMER_CUR_DIR/*.log
        $TIMER_CUR_DIR/../kill.sh
        kill -9 $(ps -ef |grep -E 'l1.ex|l2.ex|expect'  |awk '{print$2}')
        cd $l1_dir
        if [ -f l1_mlog_stats.txt ]
        then
            rm -rf l1_mlog_stats.txt
        fi        

        cd $TIMER_CUR_DIR 
        ./run.sh $TIMER_CUR_DIR ./$case_dir/$test_case.cfg $timer_results_dir


        ${TIMER_CUR_DIR}/../utils/store_result.sh $TIMER_CUR_DIR $l1_dir $pipline_result/${test_case}
    done
    
}


if [ "$test_one_case" != "" ]
then
    echo "------------timer_test_cases $test_one_case"
    test_perf $case_dir "${test_one_case}"
else
    echo "------------timer_test_cases $timer_test_cases"
    test_perf $case_dir "${timer_test_cases}"
fi
$TIMER_CUR_DIR/../utils/scp_to_dst.sh ${ANALYSE_IP_FOLDER}/timer/${platform} $pipline_result/../

$TIMER_CUR_DIR/../kill.sh
