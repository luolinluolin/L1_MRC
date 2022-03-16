#!/bin/bash

platform=$1
version=$2

du_dir=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
ru_dir=$du_dir/../ru
source $du_dir/../../var/oranvar.sh $platform



echo "---platform: $platform----"
echo "---version: $version----"
echo "-------test_cases: $test_cases---------------"


pipline_result=$pipline_results_dir/$platform/$version
if [ ! -d $pipline_result ]; then
  mkdir -p $pipline_result
fi
l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1

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

  echo "-----------do test case ${i}-----------------"
  $ru_dir/kill.sh
  ssh $RU_IP "$ru_dir/kill.sh; exit"
  
  sleep 2

  echo "-----------------launch du--------------------"
  cd $du_dir/${i}/;./run.sh  &
  echo "-----------------launch ru--------------------"

	num=1
  sleep 40

  NUM=1000
	while [ $num -le $NUM ]
	do
	  echo $num
       	  num=$(( $num + 1 ))
          sleep 1

	      testflag=`grep 'nMLogDelay == 0' l1_5g.log`
        if [ ! $testflag ]
         then
              echo "will start RU($RU_IP) DIR(${ru_dir}/${i}) server to test....."
              echo "waitting DU start up daemon......"
         else
              echo "will start RU($RU_IP) DIR(${ru_dir}/${i}) server to test....."
    	      ssh $RU_IP "source /etc/profile; cd $ru_dir; source ../oranenv.sh; cd ${ru_dir}/${i}/; chmod +x execute_ru.ex; ./execute_ru.ex ${ru_dir}/${i} $FLEXRAN_L1_SW"
       	    num=$(( $num + $NUM ))
	      fi

	done


  log_dir=$pipline_log_dir/${i}
  if [ ! -d $log_dir ]; then
      mkdir -p $log_dir
  else
      rm -rf $log_dir/*
  fi
  /usr/bin/mv -f $l1_dir/l1mlog* ${log_dir}
  /usr/bin/mv -f $l1_dir/l1_mlog_stats.txt ${log_dir}

  echo "------------cp $l1_dir/l1_mlog_stats.txt to --------------" 
  echo "------------$log_dir --------------" 

  l1_log=$pipline_log_dir/l1_${i}.txt
  l2_log=$pipline_log_dir/l2_${i}.txt
  if [ -f $l1_log ]
  then
    rm -rf $l1_log
  fi
  if [ -f $l2_log ]
  then
    rm -rf $l2_log
  fi
  mv $du_dir/${i}/l1_5g.log $l1_log
  mv $du_dir/${i}/l2_5g.log $l2_log

  $du_dir/../../utils/scptodst.sh $ANALYSE_IP $pipline_result
#############################

done

ssh $RU_IP "$ru_dir/kill.sh"
echo "execute.sh script is done"

