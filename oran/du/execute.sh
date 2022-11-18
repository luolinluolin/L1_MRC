#!/bin/bash
if [ $# -lt 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./execute.sh  cslsp prod_r21.11 orancfg/sub3_mu0_10mhz_4x4
         example : ./execute.sh  iclsp prod_r21.11 orancfg/sub3_mu0_10mhz_4x4
     "
   exit 0
fi

platform=$1
test_ver=$2
manually_case=$3

du_dir=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
ru_dir=$du_dir/../ru
source $du_dir/../oranenv.sh ${platform}

killall=$du_dir/../../kill.sh
$killall


echo "---platform: $platform----"
echo "---test_ver: $test_ver----"
echo "-------oran_test_cases: $oran_test_cases---------------"

pipline_result=$oran_results_dir/$platform/$test_ver
if [ ! -d $pipline_result ]; then
  mkdir -p $pipline_result
fi
l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
echo "---------l1_dir: $l1_dir--------------"


store_result() {
  case=$1

  log_dir=${pipline_result}/${case}
  if [ ! -d $log_dir ]; then
      mkdir -p $log_dir
  else
      rm -rf $log_dir/*
  fi
  /usr/bin/mv -f $l1_dir/PhyStats* ${log_dir}
  /usr/bin/mv -f $l1_dir/l1mlog* ${log_dir}
  /usr/bin/mv -f $l1_dir/l1_mlog_stats.txt ${log_dir}

  echo "------------cp $l1_dir/l1_mlog_stats.txt to --------------" 
  echo "------------$log_dir --------------" 

  mv $du_dir/l1_5g.log ${log_dir}/l1_log.txt
  mv $du_dir/l2_5g.log ${log_dir}/l2_log.txt

}

run() {
  case=$1
  # phy_cfg=$2
  # ru_cfg=$3
  echo "---------cfg_dir: $cfg_dir--------------"
  cfg_dir=$l1_dir/$case/gnb/
  testmac_cfg=`find $cfg_dir -name "testmac_*_oru.cfg"`
  if [ ! $testmac_cfg ]; then
  testmac_cfg=`find $cfg_dir -name "testmac_*.cfg"`
  fi
  phy_cfg=`find $cfg_dir -name "phycfg*.xml"`
  ru_cfg=`find $cfg_dir -name "xrancfg*oru.xml"`
  echo "-----------oran config ru_cfg: $ru_cfg-----------"
  echo "-----------oran config phy_cfg: $phy_cfg-----------"
  echo "-----------oran config testmac_cfg: $testmac_cfg-----------"

  ./update_conf.sh $testmac_cfg $phy_cfg $ru_cfg

  rm -rf $du_dir/*.log

  ./l1_5.ex $du_dir $cfg_dir&

  sleep 10

  l1_sw=$FLEXRAN_L1_SW
  l2_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/testmac
  ./l2_5.ex $du_dir $l2_dir $testmac_cfg

  # ./kill.ex $work_path

  echo "this DU run script  is done "
}

run_all () {
  for test_case in $oran_test_cases 
  do
    # i=sub3_mu0_10mhz_4x4
    # i=sub3_mu0_20mhz_4x4
    # i=sub3_mu0_20mhz_sub3_mu1_20mhz_4x4
    # i=sub6_mu1_100mhz_4x4

    # i=sub3_mu0_20mhz_sub6_mu1_100mhz_4x4

    # i=sub6_mu1_100mhz_32x32

    echo "-----------revomve src old file-----------------"
    result=$l1_dir/l1_mlog_stats.txt
    if [ -f result ]
    then
      rm -rf result
      rm -rf l1mlog*
    fi

    echo "-----------------launch du--------------------"
    run orancfg/$test_case&

    echo "-----------------launch ru--------------------"
    sleep 30
    l1_ru_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/orancfg/$test_case/oru/
    ssh $RU_IP "source /etc/profile; cd $ru_dir; cd ${ru_dir}; ./execute_ru.ex $l1_ru_dir ${test_case} ${ru_dir}"

    ${du_dir}/../../utils/store_result.sh $du_dir $l1_dir $pipline_result/${test_case}

  done

  ssh $RU_IP "$killall; exit"
  echo "execute.sh script is done"
}


run_one() {
  
  test_case=$manually_case

  echo "-----------revomve src old file-----------------"
  result=$l1_dir/l1_mlog_stats.txt
  if [ -f result ]
  then
    rm -rf result
    rm -rf l1mlog*
  fi

  echo "-----------------launch du--------------------"
  run $test_case 

  ${du_dir}/../../utils/store_result.sh $du_dir $l1_dir $pipline_result/${test_case}

  echo "execute.sh script is done"
}

if [ "$manually_case" != "" ]; then 
  run_one
else
  run_all
fi

$du_dir/../../utils/scp_to_dst.sh $ANALYSE_IP_FOLDER/oran/${platform} $pipline_result/..