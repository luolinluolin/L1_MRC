#! /bin/bash

work_path=$FLEXRAN_L1_SW

#cd $work_path/; ./nic_vf_ru.sh 
#cd $work_path/;source ./setup/env.sh $ORANISA;cd $work_path/flexran_l1_sw/bin/nr5g/gnb/l1/orancfg/sub6_mu1_100mhz_4x4/oru; ./dpdk.sh 
cd $work_path/; rm -rf *.log 
sleep 2
source /etc/profile
cd $work_path/../;source ./setup/env.sh; cd $work_path//bin/nr5g/gnb/l1/orancfg/mmwave_mu3_100mhz_2x2/oru/; ./run_o_ru.sh  |tee $work_path/samppe.log &

i=0
while [ ${i} -le 10 ]
do
  i=` expr ${i} + 1 `
  sleep 10
done

sh $work_path/../kill.sh
echo "this RU script is done"