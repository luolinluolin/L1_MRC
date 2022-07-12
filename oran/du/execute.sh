#!/bin/bash
if [ $# -lt 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./execute.sh  cslsp prod_r21.11 sub3_mu0_10mhz_4x4
         example : ./execute.sh  iclsp prod_r21.11 sub3_mu0_10mhz_4x4
     "
   exit 0
fi

platform=$1
version=$2
manually_case=$3

du_dir=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
ru_dir=$du_dir/../ru
source $du_dir/../oranenv.sh

killall=$du_dir/../../kill.sh
$killall


echo "---platform: $platform----"
echo "---version: $version----"
echo "-------test_cases: $test_cases---------------"

pipline_result=$pipline_results_dir/$platform/$version
if [ ! -d $pipline_result ]; then
  mkdir -p $pipline_result
fi
l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
echo "---------l1_dir: $l1_dir--------------"


run() {
  case=$1
  # phy_cfg=$2
  # ru_cfg=$3
  echo "---------cfg_dir: $cfg_dir--------------"
  cfg_dir=$l1_dir/orancfg/$case/gnb/
  testmac_cfg=`find $cfg_dir -name "testmac_*_oru.cfg"`
  phy_cfg=`find $cfg_dir -name "phycfg*.xml"`
  ru_cfg=`find $cfg_dir -name "xrancfg*.xml"`

  ./update_conf.sh $testmac_cfg $phy_cfg $ru_cfg

  rm -rf $du_dir/*.log

  ./l1_5.ex $du_dir $cfg_dir&

  sleep 20

  l1_sw=$FLEXRAN_L1_SW
  l2_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/testmac
  ./l2_5.ex $du_dir $l2_dir $testmac_cfg

  # ./kill.ex $work_path

  echo "this DU run script  is done "
}

run_all () {
  for i in $test_cases 
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
    run $i &
    echo "-----------------launch ru--------------------"
    l1_ru_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/orancfg/$i/oru/

    num=1
    sleep 40

    NUM=100
    # while [ $num -le $NUM ]
    # do
    #   echo $num
    #         num=$(( $num + 1 ))
    #         sleep 1

    #       testflag=`grep 'nMLogDelay == 0' l1_5g.log`
    #       if [ ! $testflag ]
    #       then
    #             echo "will start RU($RU_IP) DIR(${ru_dir}/${i}) server to test....."
    #             echo "waitting DU start up daemon......"
    #       else
    #             echo "will start RU($RU_IP) DIR(${ru_dir}/${i}) server to test....."
    #           ##### config remote ru ######
    ssh $RU_IP "source /etc/profile; cd $ru_dir; source ../oranenv.sh; cd $base/../ru/; ./setup.sh; cd ${ru_dir}; ./execute_ru.ex $l1_ru_dir ${i} ${ru_dir}"
              # num=$(( $num + $NUM ))
    #       fi

    # done


    log_dir=${pipline_result}/${i}
    if [ ! -d $log_dir ]; then
        mkdir -p $log_dir
    else
        rm -rf $log_dir/*
    fi
    /usr/bin/mv -f $l1_dir/l1mlog* ${log_dir}
    /usr/bin/mv -f $l1_dir/l1_mlog_stats.txt ${log_dir}

    echo "------------cp $l1_dir/l1_mlog_stats.txt to --------------" 
    echo "------------$log_dir --------------" 

    mv $du_dir/l1_5g.log ${log_dir}
    mv $du_dir/l2_5g.log ${log_dir}

    $du_dir/../../utils/scptodst.sh $ANALYSE_IP $pipline_result
  #############################

  done

  ssh $RU_IP "$killall; exit"
  echo "execute.sh script is done"
}


run_one() {
  
  i=$manually_case

  echo "-----------revomve src old file-----------------"
  result=$l1_dir/l1_mlog_stats.txt
  if [ -f result ]
  then
    rm -rf result
    rm -rf l1mlog*
  fi

  echo "-----------------launch du--------------------"
  run $i 
  log_dir=${pipline_result}/${i}
  if [ ! -d $log_dir ]; then
      mkdir -p $log_dir
  else
      rm -rf $log_dir/*
  fi
  /usr/bin/mv -f $l1_dir/l1mlog* ${log_dir}
  /usr/bin/mv -f $l1_dir/l1_mlog_stats.txt ${log_dir}

  echo "------------cp $l1_dir/l1_mlog_stats.txt to --------------" 
  echo "------------$log_dir --------------" 

  mv $du_dir/l1_5g.log ${log_dir}
  mv $du_dir/l2_5g.log ${log_dir}

  echo "execute.sh script is done"
}


if [ "$manually_case" != "" ]; then 
  run_one
else
  run_all
fi