#!/bin/bash

#######################################################################
#
# <COPYRIGHT_TAG>
#
#######################################################################

platform=$1
test_ver=$2

CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
# This script takes as an argument an expression that is passed to the --gtest_filter.
# To run all functional tests this script should be run as follows: ./run_all_tests *Check*
if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./do_sdk_perf.sh  cslsp prod_r21.11
         example : ./do_sdk_perf.sh  iclsp prod_r21.11
         example : ./do_sdk_perf.sh  icld prod_r21.11
     "
   exit 0
fi


source $CURRENT_DIR/timerenv.sh


echo "---------------sdk_results_dir $sdk_results_dir-----------"
sdk_results=$sdk_results_dir/$platform/$test_ver/

if [ ! -d $sdk_results ]; then
    mkdir -p $sdk_results
fi 

testfolder=${WIRELESS_SDK}/${SDK_BUILD_DIR}/test/phy/

cd $testfolder
for test_dir in test_*
do
	echo "-----$testfolder${test_dir}-----"
	cd $testfolder${test_dir}
	./unittests --gtest_filter=*Perf*
	echo "----$sdk_results-----"
        cp test_results.xml $sdk_results/$test_dir.xml
	cd ..
done

$CURRENT_DIR../utils/scptodst.sh $ANALYSE_IP $sdk_results

cd -
