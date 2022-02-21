
if [ $# -ne 3 ] || [ $1 = "-h" ];then
    echo "
         example : ./L1_MRC/test_pipline_perf.sh  cslsp prod_r21.11 [timer oran]
         example : ./L1_MRC/test_pipline_perf.sh  iclsp prod_r21.11 [timer oran]
         example : ./L1_MRC/test_pipline_perf.sh  icld prod_r21.11 [timer oran]
     "
   exit 0
fi

platform=$1
test_ver=$2
test_mode=$3

l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
l2_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/testmac	
echo "--------$l1_dir---------------"
echo "--------$l2_dir---------------"

csl_sp_dir=cascade_lake-sp
icl_sp_dir=icelake-sp
icl_d_dir=icelake-d

case_sp=(
icxsp_mu0_10mhz_4x4_hton.cfg
icxsp_mu0_20mhz_4x4_hton.cfg
icxsp_mu0_20mhz_4x4_hton_multi_numerology.cfg
icxsp_mu1_100mhz_4x4_hton.cfg
icxsp_mu1_100mhz_mmimo_32x32_hton.cfg
icxsp_mu1_100mhz_mmimo_64x64_8stream_hton.cfg
icxsp_mu3_100mhz_2x2_hton.cfg
)

case_icl_sp=(
icxsp_mu1_100mhz_mmimo_64x64_16stream_hton.cfg
)

case_icl_d=(
icxd_mu1_100mhz_2x2_hton.cfg
icxd_mu1_100mhz_4x4_hton.cfg
icxd_mu3_100mhz_hton.cfg
)

pipline_results=$PWD/L1_MRC/pipline_results/

test_perf() {
    case_dir=$1
    test_cases=$2
    pipline_result=$pipline_results$case_dir/$test_ver/$test_mode
    if [ ! -d $pipline_result ]; then
        mkdir -p $pipline_result
    fi 

    cd $l1_dir
    if [ -f l1_mlog_stats.txt ]
    then
        rm -rf l1_mlog_stats.txt
    fi 

    for test_case in ${test_cases[*]}
    do
        echo "---------------------------run testcase $test_case-------------------------------------"
        cd $l1_dir
        ./l1.sh -e&
        sleep 10
        cd $l2_dir
        ./l2.sh --testfile=./$case_dir/$test_case&
        sleep 600
        ps -aux|grep testmac|awk '{print $2}'|xargs kill -9
        ps -aux|grep l1app|awk '{print $2}'|xargs kill -9
    done
    
    echo "-----------copy result to $pipline_results--------------" 
    cd $l1_dir
    cp l1_mlog_stats.txt $pipline_results
}

if [ $platform = "cslsp" ]
then
   echo "------------casecade lake sp test------------------"
   test_perf $csl_sp_dir $case_sp
fi

if [ $platform = "iclsp" ]
then
   echo "------------ice lake sp test------------------"
   test_perf $icl_sp_dir $case_sp
   test_perf $icl_sp_dir $case_icl_sp
fi

if [ $platform = "icld" ]
then
   echo "------------ice lake d test------------------"
   test_perf $icl_d_dir $case_icl_d
fi

