#!/bin/bash

du_dir=$PWD
ru_dir=$du_dir/../ru
source ../../var/oranvar.sh


# for i in `ls -d ./sub*`
# do
  i=sub3_mu0_10mhz_4x4
  # i=sub3_mu0_20mhz_4x4
  # i=sub3_mu0_20mhz_sub3_mu1_20mhz_4x4
  i=sub6_mu1_100mhz_4x4
  echo "-----------do test case ${i}-----------------"
  $ru_dir/kill.sh
  ssh $RU_IP "$ru_dir/kill.sh; exit"

  echo "-----------revomve src old file-----------------"
  result=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1/l1_mlog_stats.txt
  if [ -f result ]
  then
    rm -rf result
  fi

  
  sleep 2

  cd $du_dir/${i}/;./run.sh  &

	num=1

	while [ $num -le 50 ]
	do
	  echo $num
       	  num=$(( $num + 1 ))
          sleep 1

	grep nMLogDelay l1_5g.log
        if [ $? -eq  0 ]
         then
              echo "will start RU($RU_IP) DIR(${ru_dir}/${i}) server to test....."
              echo "waitting DU start up daemon......"
         else
              echo "will start RU($RU_IP) DIR(${ru_dir}/${i}) server to test....."
    	      ssh $RU_IP "source /etc/profile; cd $ru_dir; source ../oranenv.sh; cd ${ru_dir}/${i}/; chmod +x execute_ru.ex; ./execute_ru.ex ${ru_dir}/${i} $FLEXRAN_L1_SW"
	 fi

	done

  result_dir=$pipline_results_dir$i
  echo "------------cp $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/l1_mlog_stats.txt to --------------" 
  echo "------------$result_dir --------------" 
  if [ ! -d $result_dir ]; then
    mkdir -p $result_dir
  fi
  echo "-----------revomve dst old file-----------------"
  result=$result_dir/l1_mlog_stats.txt
  if [ -f result ]
  then
    rm -rf result
  fi

  cp -rf $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/l1_mlog_stats.txt $result_dir


#############################

# done

ssh $RU_IP "$ru_dir/kill.sh"
echo "execute.sh script is done"

