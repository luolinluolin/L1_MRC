#!/bin/bash

#######################################################################
#
# <COPYRIGHT_TAG>
#
#######################################################################

source ./timerenv.sh
TIMER_DIR=$PWD

# This script takes as an argument an expression that is passed to the --gtest_filter.
# To run all functional tests this script should be run as follows: ./run_all_tests *Check*
if [ $# -ne 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./test_sdk_perf.sh  cslsp prod_r21.11
         example : ./test_sdk_perf.sh  iclsp prod_r21.11
         example : ./test_sdk_perf.sh  icld prod_r21.11
     "
   exit 0
fi


platform=$1
test_ver=$2

base=$PWD

sdk_results=$sdk_results_dir/$test_ver/$platform


testfolder=${WIRELESS_SDK}/${SDK_BUILD_DIR}/test/phy/
if [ ! -d $sdk_results ]; then
  mkdir $sdk_results
fi

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
