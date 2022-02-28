

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
dpdk_path=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/
deviceid=`lspci |grep 0d5d |awk '{print $1}'|sed -n '1p'`

if [ ! -n "$deviceid" ]; then
  echo "-------pls setup vf mode MBC------"
  exit 0
fi
sed -i "s#\(fecDevice0=\)\S*#\10000:${deviceid}#" ${dpdk_path}dpdk.sh
sed -i "s#\(^igbuioMode=\)\S*#\11#"  ${dpdk_path}dpdk.sh
sed -i "s#<dpdkBasebandDevice>.*<\/dpdkBasebandDevice>#<dpdkBasebandDevice>0000:${deviceid}<\/dpdkBasebandDevice>#g"  ${dpdk_path}phycfg_timer.xml


case_csl_sp=$timer_case_csl_sp
case_icl_sp=$timer_case_icl_sp
case_icl_d=$timer_case_icl_d

test_perf() {
    case_dir=$1
    test_cases=$2
    pipline_result=$pipline_results_dir/$platform/$test_ver/
    if [ ! -d $pipline_result ]; then
        mkdir -p $pipline_result
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
        if [ -f dst_result ]
        then
            rm -rf dst_result
        fi
        mv $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/l1_mlog_stats.txt $dst_result
    done
    
}

if [ $platform = "cslsp" ]
then
   echo "------------casecade lake sp test------------------"
   test_perf cascade_lake-sp "${case_csl_sp}"
   $CURRENT_DIR../utils/scptodst.sh $ANALYSE_IP cascade_lake-sp
fi

if [ $platform = "iclsp" ]
then
   echo "------------ice lake sp test $case_icl_sp------------------"
   test_perf icelake-sp "${case_icl_sp}"
   $CURRENT_DIR../utils/scptodst.sh $ANALYSE_IP icelake-sp
fi

if [ $platform = "icld" ]
then
   echo "------------ice lake d test------------------"
   test_perf icelake-d "${case_icl_d}"
   $CURRENT_DIR../utils/scptodst.sh $ANALYSE_IP icelake-d
fi

