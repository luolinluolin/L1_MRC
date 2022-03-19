source ../timer/timerenv.sh	

l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
timer_cfg=${l1_dir}/phycfg_timer.xml

sed -i 's/<CEInterpMethod>.*<\/CEInterpMethod>/<CEInterpMethod>2<\/CEInterpMethod>/g' ${timer_cfg}
sed -i 's/<PuschLinearInterpEnable>.*<\/PuschLinearInterpEnable>/<PuschLinearInterpEnable>1<\/PuschLinearInterpEnable>/g' ${timer_cfg}
sed -i 's/<prachThresholdMethod>.*<\/prachThresholdMethod>/<prachThresholdMethod>1<\/prachThresholdMethod>/g' ${timer_cfg}

export CPA_DIR="$FLEXRAN_L1_SW/libs/cpa"
cd $DIR_WIRELESS_TEST_5G
./c_master.sh rctul 1 0 5 
./c_master.sh rctul 1 0 10 
./c_master.sh rctul 1 0 20 
./c_master.sh rctul 1 1 10 
./c_master.sh rctul 1 1 20 
./c_master.sh rctul 1 1 40
./c_master.sh rctul 1 1 100