#! /bin/bash

work_path=$PWD

cd $work_path/; rm -rf *.log 
cd $work_path/; ./update_ru.sh
sleep 2
 source /etc/profile
cd $work_path/../;source ./setup/env.sh $ORANISA; cd $work_path//bin/nr5g/gnb/l1/orancfg/sub3_mu0_20mhz_4x4/oru/;sh ./run_o_ru.sh  |tee $work_path/samppe.log &

i=0
while [ ${i} -le 20 ]
do
  i=` expr ${i} + 1 `
  sleep 10
done

sh $work_path/../kill.sh
echo "this RU script is done"
