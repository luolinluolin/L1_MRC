#!/bin/bash


./update_conf.sh
BASE=$PWD
l1_sw=$FLEXRAN_L1_SW

rm -rf $BASE/*.log

./l1_5.ex $BASE $l1_sw&

sleep 20

./l2_5.ex $BASE $l1_sw

# ./kill.ex $work_path

echo "this DU run script  is done "
