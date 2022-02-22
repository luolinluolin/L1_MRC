#! /bin/bash

work_path=$PWD
l1sw=$FLEXRAN_L1_SW

#cd $work_path/; ./nic_vf_ru.sh 
#cd $work_path/;source ./setup/env.sh $ORANISA;cd $work_path/flexran_l1_sw/bin/nr5g/gnb/l1/orancfg/sub6_mu1_100mhz_4x4/oru; ./dpdk.sh 
cd $work_path/; rm -rf *.log 
cd $work_path/; ./update_ru.sh $l1sw
sleep 2

source /etc/profile
cd $work_path;source ../../oranenv.sh; cd $FLEXRAN_L1_SW/bin/nr5g/gnb/l1/orancfg/sub3_mu0_20mhz_4x4/oru/;sh ./run_o_ru.sh  |tee $work_path/samppe.log &

i=0
while [ ${i} -le 10 ]
do
  i=` expr ${i} + 1 `
  sleep 10
done


sh $work_path/../kill.sh
echo "this RU script is done"
