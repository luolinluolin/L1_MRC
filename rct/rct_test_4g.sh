if [ $# -ne 3 ] || [ $1 = "-h" ];then
    echo "
         example : ./rct_test_4g.sh  cslsp prod_r21.11 ldpc_option(software_ldpc|hardware_ldpc)
         example : ./rct_test_4g.sh  iclsp prod_r21.11 ldpc_option(software_ldpc|hardware_ldpc)
         example : ./rct_test_4g.sh  icld prod_r21.11 ldpc_option(software_ldpc|hardware_ldpc)
     "
   exit 0
fi
platform=$1
test_ver=$2
ldpc_option=$3

RCT_CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${RCT_CURRENT_DIR}/../timer/timerenv.sh	

/usr/bin/cp -rf $FLEXRAN_L1_SW/build/lte/testapp/linux/lte_testapp $DIR_WIRELESS_TEST_4G

l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
timer_cfg=${l1_dir}/phycfg_timer.xml
sed -i 's/<CEInterpMethod>.*<\/CEInterpMethod>/<CEInterpMethod>2<\/CEInterpMethod>/g' ${timer_cfg}
sed -i 's/<PuschLinearInterpEnable>.*<\/PuschLinearInterpEnable>/<PuschLinearInterpEnable>1<\/PuschLinearInterpEnable>/g' ${timer_cfg}
sed -i 's/<PuschLinearInterpGranularityAll>.*<\/PuschLinearInterpGranularityAll>/<PuschLinearInterpGranularityAll>5<\/PuschLinearInterpGranularityAll>/g' ${timer_cfg}
sed -i 's/<prachThresholdMethod>.*<\/prachThresholdMethod>/<prachThresholdMethod>1<\/prachThresholdMethod>/g' ${timer_cfg}

if [ "$software_ldpc" == "software_ldpc" ]; then
  sed -i "s#<dpdkBasebandFecMode>.*<\/dpdkBasebandFecMode>#<dpdkBasebandFecMode>0<\/dpdkBasebandFecMode>#g"  ${cfg}
fi

store_result=$RESULT_DIR/rct4g/$platform/$test_ver/${ldpc_option}
if [ ! -d $store_result ]; then
    mkdir -p $store_result
else
    rm -rf $store_result/*
fi 

export CPA_DIR="$FLEXRAN_L1_SW/libs/cpa"
cd $DIR_WIRELESS_TEST_4G
rm -rf $DIR_WIRELESS_TEST_4G/results
./c_master.sh rctul 5
./c_master.sh rctul 10
./c_master.sh rctul 20


echo "mv $DIR_WIRELESS_TEST_4G/results/*  ${store_result}/"
mv $DIR_WIRELESS_TEST_4G/results/*  ${store_result}