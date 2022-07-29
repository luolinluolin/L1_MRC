#!/bin/bash
if [ $# -lt 2 ] || [ $1 = "-h" ];then
    echo "
         example : ./rct_test.sh  cslsp prod_r21.11
         example : ./rct_test.sh  iclsp prod_r21.11
         example : ./rct_test.sh  icld prod_r21.11
     "
   exit 0
fi
platform=$1
test_ver=$2

# acc
./rct/rct_test.sh ${platform} ${test_ver}

# soft ldpc
./rct/rct_test.sh ${platform} ${test_ver} soft_ldpc