

if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./do_pipline_perf.sh  cslsp prod_r21.11
         example : ./do_pipline_perf.sh  iclsp prod_r21.11
         example : ./do_pipline_perf.sh  icld prod_r21.11
     "
   exit 0
fi

platform=$1
test_ver=$2
test_mode=$3


CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
$CURRENT_DIR/../kill.sh

source $CURRENT_DIR/timerenv.sh
l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
l2_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/testmac	
echo "--------$l1_dir---------------"
echo "--------$l2_dir---------------"
#-----setup MBC-----
$CURRENT_DIR/../setup/mbc_vc_setup.sh MBC
dpdk_path=$l1_dir
deviceid=`lspci |grep 0d5d |awk '{print $1}'|sed -n '1p'`

if [ ! -n "$deviceid" ]; then
  echo "-------pls setup vf mode MBC------"
  exit 0
fi
sed -i "s#\(fecDevice0=\)\S*#\10000:${deviceid}#" ${dpdk_path}/dpdk.sh
sed -i "s#\(^igbuioMode=\)\S*#\11#"  ${dpdk_path}/dpdk.sh
sed -i "s#<dpdkBasebandDevice>.*<\/dpdkBasebandDevice>#<dpdkBasebandDevice>0000:${deviceid}<\/dpdkBasebandDevice>#g"  ${dpdk_path}/phycfg_timer.xml

test_perf() {
    case_dir=$1
    test_cases=$2
    pipline_result=$pipline_results_dir/$platform/$test_ver
    if [ ! -d $pipline_result ]; then
        mkdir -p $pipline_result
    fi 
    pipline_log_dir=$pipline_results_dir/$platform/$test_ver/log
    if [ ! -d $pipline_log_dir ]; then
        mkdir -p $pipline_log_dir
    fi 

    echo "--------------------------- testcases $test_cases-------------------------------------"
    for test_case in ${test_cases}
    do
        echo "---------------------------run testcase $test_case-------------------------------------"
        rm -rf $CURRENT_DIR/*.log
        $CURRENT_DIR/../kill.sh
        kill -9 $(ps -ef |grep -E 'l1.ex|l2.ex|expect'  |awk '{print$2}')
        cd $l1_dir
        if [ -f l1_mlog_stats.txt ]
        then
            rm -rf l1_mlog_stats.txt
        fi        

        # ./l1.sh -e&
        # sleep 10
        # cd $l2_dir
        # ./l2.sh --testfile=./$case_dir/$test_case.cfg&
        # sleep 600

        # cd $CURRENT_DIR
        # chmod +x l1.ex l2.ex
        # ./l1.ex $CURRENT_DIR $FLEXRAN_L1_SW&

        # sleep 20

        # ./l2.ex 

        cd $CURRENT_DIR 
        ./run.sh $CURRENT_DIR ./$case_dir/$test_case.cfg

        echo "-----------copy result to $pipline_result--------------" 
        dst_result=$pipline_result/$test_case.txt
        if [ -f $dst_result ]
        then
            rm -rf $dst_result
        fi
        echo "mv $l1_dir/l1_mlog_stats.txt $dst_result"
        mv $l1_dir/l1_mlog_stats.txt $dst_result

        log_dir=$pipline_log_dir/${test_case}
        if [ ! -d $log_dir ]; then
            mkdir -p $log_dir
        else
            rm -rf $log_dir/*
        fi
        /usr/bin/mv -f $l1_dir/l1mlog* ${log_dir}

        l1_log=$pipline_log_dir/l1_${test_case}.txt
        l2_log=$pipline_log_dir/l2_${test_case}.txt
        if [ -f $l1_log ]
        then
            rm -rf $l1_log
        fi
        if [ -f $l2_log ]
        then
            rm -rf $l2_log
        fi
        /usr/bin/mv -f $CURRENT_DIR/l1_5g.log $l1_log
        /usr/bin/mv -f $CURRENT_DIR/l2_5g.log $l2_log
    done
    
}

echo "------------test_cases $test_cases"
test_perf $case_dir "${test_cases}"