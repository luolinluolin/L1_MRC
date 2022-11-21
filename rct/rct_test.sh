if [ $# -ne 3 ] || [ $1 = "-h" ];then
    echo "
         example : ./rct_test.sh  cslsp prod_r21.11 ldpc_option(software_ldpc|hardware_ldpc)
         example : ./rct_test.sh  iclsp prod_r21.11 ldpc_option(software_ldpc|hardware_ldpc)
         example : ./rct_test.sh  icld prod_r21.11 ldpc_option(software_ldpc|hardware_ldpc)
     "
   exit 0
fi
platform=$1
test_ver=$2
ldpc_option=$3

RCT_CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${RCT_CURRENT_DIR}/../timer/timerenv.sh	


${RCT_CURRENT_DIR}/../kill.sh

${RCT_CURRENT_DIR}/../setup/mbc_vc_setup.sh

l1_dir=$FLEXRAN_L1_SW/bin/nr5g/gnb/l1
timer_cfg=${l1_dir}/phycfg_timer.xml
sed -i 's/<CEInterpMethod>.*<\/CEInterpMethod>/<CEInterpMethod>2<\/CEInterpMethod>/g' ${timer_cfg}
sed -i 's/<PuschLinearInterpEnable>.*<\/PuschLinearInterpEnable>/<PuschLinearInterpEnable>1<\/PuschLinearInterpEnable>/g' ${timer_cfg}
sed -i 's/<PuschLinearInterpGranularityAll>.*<\/PuschLinearInterpGranularityAll>/<PuschLinearInterpGranularityAll>5<\/PuschLinearInterpGranularityAll>/g' ${timer_cfg}
sed -i 's/<prachThresholdMethod>.*<\/prachThresholdMethod>/<prachThresholdMethod>1<\/prachThresholdMethod>/g' ${timer_cfg}

echo "----configure dpdkBasebandFecMode "
if [ "$ldpc_option" == "software_ldpc" ]; then
  sed -i "s#<dpdkBasebandFecMode>.*<\/dpdkBasebandFecMode>#<dpdkBasebandFecMode>0<\/dpdkBasebandFecMode>#g"  ${timer_cfg}
fi

store_result=$RESULT_DIR/rct/$platform/$test_ver/${ldpc_option}
if [ ! -d $store_result ]; then
    mkdir -p $store_result
else
    rm -rf $store_result/*
fi 

export CPA_DIR="$FLEXRAN_L1_SW/libs/cpa"
cd $DIR_WIRELESS_TEST_5G
rm -rf $DIR_WIRELESS_TEST_5G/results
./c_master.sh rctul 1 0 5 
./c_master.sh rctul 1 0 10 
./c_master.sh rctul 1 0 20 
./c_master.sh rctul 1 1 10 
./c_master.sh rctul 1 1 20 
./c_master.sh rctul 1 1 40
./c_master.sh rctul 1 1 100

echo "mv $DIR_WIRELESS_TEST_5G/results/*  ${store_result}/"
mv $DIR_WIRELESS_TEST_5G/results/*  ${store_result}

$RCT_CURRENT_DIR/../utils/scp_to_dst.sh ${ANALYSE_IP_FOLDER}/rct/${platform} $store_result/../*
